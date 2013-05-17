require 'spec_helper'

describe 'PreferencesBoxer::YamlStore' do
  it 'should transmit additional settings to yaml store class' do
    AdminSettings = PreferencesBoxer.configure do |config|
      config.store_type = 'yaml'
      config.path = 'spec/settings.yml'
    end
    AdminSettings.handler.should == PreferencesBoxer::YamlStore
    AdminSettings.key1.should == 'val1'
    AdminSettings.key2.should_not == 'val1'
  end
end
