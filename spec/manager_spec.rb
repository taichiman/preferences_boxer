require 'spec_helper'

describe PreferencesBoxer do
  # it 'should manage config settings to right store class 1' do
  #   AdminSettings = PreferencesBoxer.configure do |config|
  #     config.store_type = 'yaml'
  #   end
  #   AdminSettings.handler.should == PreferencesBoxer::YamlStore
  # end

  # it 'should manage config settings to right store class 2' do
  #   AdminSettings = PreferencesBoxer.configure do |config|
  #     config.store_type = 'db'
  #   end
  #   AdminSettings.handler.should == PreferencesBoxer::DbStore
  # end

  it 'should transmit additional settings to right store class' do
    AdminSettings = PreferencesBoxer.configure do |config|
      config.store_type = 'yaml'
      config.path = 'spec/settings.yml'
    end
    AdminSettings.handler.should == PreferencesBoxer::YamlStore
    AdminSettings.key1.should == 'val1'
    AdminSettings.key2.should_not == 'val1'
  end

end
