# PreferencesBoxer

This gem stores settings within Yaml file or ActiveRecord::Store

## Installation

Add this line to your application's Gemfile:

    gem 'preferences_boxer'

If you want Yaml store, create yaml file with settings:
<tt> ---</tt>
<tt>site_name: test1</tt>
<tt>owner_name: test2</tt>

Then add to config/envronment.rb :
 <tt> PreferencesBoxer.store_type='Yaml'
PreferencesBoxer::YamlStore.path=Rails.root.join('config/settings.yml')</tt>

else If you want to use AR::Store add
<tt># PreferencesBoxer.store_type='Store'</tt>
then generate setting table
<tt>rails g preferences_boxer</tt>
<tt>rake db:migrate</tt>


Then assign 
<tt>AdminSettings=PreferencesBoxer::Settings.instance</tt>

## Usage

In your application you can save value <tt>AdminSettings.{YOUR KEY}=value</tt> and after can read the value <tt>AdminSettings.{YOUR KEY}</tt>


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
