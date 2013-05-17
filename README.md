# PreferencesBoxer

This gem stores settings within Yaml file or ActiveRecord::Store

## Installation

Add this line to your application's Gemfile:

    gem 'preferences_boxer'

If you want Yaml store, create yaml file with settings:
<tt> ---</tt>
<tt>site_name: test1</tt>
<tt>owner_name: test2</tt>

Then add to config/initializers/preferences.rb :
 <tt>AdminSettings = PreferencesBoxer.configure do |config|
   PreferencesBoxer.store_type='yaml'
   config.path = Rails.root.join('config/settings.yml')
 end</tt>

else If you want to use AR::Store add
<tt>AdminSettings = PreferencesBoxer.configure do |config|
  config.store_type = 'db'
  config.source_record = Person.find(1)
  config.source_field = :url
  config.init_values = {site_name: 'test1', owner_name: 'test2', admin_login: 'root', admin_password: '$2a$10$sd66SJyZxCVjavZ2Cz3s1OsuoFawJ4Pyu/GPc98mj8k0ahSp.feQW'}
end</tt>


Then assign 
<tt>AdminSettings=PreferencesBoxer::Settings</tt>

## Usage

In your application you can save value <tt>AdminSettings.{YOUR KEY}=value</tt> and after can read the value <tt>AdminSettings.{YOUR KEY}</tt>


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
