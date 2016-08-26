namespace 'wechat' do
  desc 'show wechat menu'
  task 'menu' => :environment do
    puts Wechat.api.menu
  end

  desc 'create wechat menu'
  task 'menu_create' => :environment do
    menu = YAML.load(File.read("#{Rails.root}/config/menu_#{Rails.env}.yaml"))
    puts 'Menu created' if Wechat.api.menu_create(menu)
  end
end
