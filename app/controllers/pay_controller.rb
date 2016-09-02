class PayController < ApplicationController
  before_action :authenticate_user!, except: [:wx_notify]
  skip_before_action :verify_authenticity_token, only: [:wx_notify]

  def wx_pay
    params = {
      body: 'Test Wechat Pay',
      out_trade_no: "trade-#{Time.now.to_i}",
      total_fee: 1,
      spbill_create_ip: request.remote_ip,
      notify_url: Figaro.env.wechat_pay_notify_url,
      trade_type: 'JSAPI',
      openid: current_user.uid
    }

    prepay_result = WxPay::Service.invoke_unifiedorder(params)
    if prepay_result.success?
      js_pay_params = {
        prepayid: prepay_result['prepay_id'],
        noncestr: prepay_result['nonce_str']
      }
      pay_params = WxPay::Service.generate_js_pay_req js_pay_params
      logger.info pay_params
      render json: pay_params
    else
      logger.error prepay_result['return_msg']
      render json: prepay_result
    end
  end

  def wx_notify
    result = Hash.from_xml(request.body.read)['xml']
    logger.info result.inspect
    if WxPay::Sign.verify?(result)
      render xml: { return_code: 'SUCCESS', return_msg: 'OK' }.to_xml(root: 'xml', dasherize: false)
    else
      render xml: { return_code: 'FAIL', return_msg: 'Signature Error' }.to_xml(root: 'xml', dasherize: false)
    end
  end
end
