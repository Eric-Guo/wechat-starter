namespace 'wechat' do
  desc 'show wechat menu'
  task 'menu' => :environment do
    puts Wechat.api.menu
  end

  desc 'create wechat menu'
  task 'menu_create' do
    menu = YAML.load(File.read("#{Rails.root}/config/menu.yaml"))
    puts 'Menu created' if Wechat.api.menu_create(menu)
  end
end
