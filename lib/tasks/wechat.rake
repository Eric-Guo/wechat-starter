namespace 'wechat' do
  desc 'show access token'
  task 'access_token' => :environment do
    puts Wechat.api.access_token.token
  end

  desc 'show wechat menu'
  task 'menu' do
    puts Wechat.api.menu
  end

  desc 'create wechat menu'
  task 'menu_create' do
    menu = YAML.load(File.read("#{Rails.root}/config/menu.yaml"))
    puts 'Menu created' if Wechat.api.menu_create(menu)
  end
end
