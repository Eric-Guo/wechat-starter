class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:wx_notify]
  skip_before_action :verify_authenticity_token, only: [:wx_notify]

  def index
  end

  def wx_pay
    params = {
      body: 'Test Wechat Pay',
      out_trade_no: "trade-#{Time.now.to_i}",
      total_fee: 1,
      spbill_create_ip: remote_ip,
      notify_url: Figaro.env.wechat_pay_notify_url,
      trade_type: 'JSAPI',
      openid: current_user.uid
    }
    prepay_result = WxPay::Service.invoke_unifiedorder(params)
    pay_params = {
      appId: Figaro.env.wechat_app_id,
      timeStamp: Time.now.to_i.to_s,
      nonceStr: SecureRandom.uuid.tr('-', ''),
      package: "prepay_id=#{prepay_result['prepay_id']}",
      signType: 'MD5'
    }
    sign = WxPay::Sign.generate(pay_params)
    render json: pay_params.merge({paySign: sign})
  end

  def wx_notify
    result = Hash.from_xml(request.body.read)["xml"]
    puts result.inspect
    if WxPay::Sign.verify?(result)
      render :xml => {return_code: "SUCCESS", return_msg: "OK"}
                    .to_xml(root: 'xml', dasherize: false)
    else
      render :xml => {return_code: "FAIL", return_msg: "Signature Error"}
                    .to_xml(root: 'xml', dasherize: false)
    end
  end

  private
  def remote_ip
    request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip
  end
end
