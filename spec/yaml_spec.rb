require 'spec_helper'

describe PreferencesBoxer::YamlStore do
  it 'should handle setting yaml file' do
    PreferencesBoxer.store_type = 'Yaml'
    PreferencesBoxer::YamlStore.path = 'spec/settings.yml'
    Settings = PreferencesBoxer::Settings.instance
    Settings.key1.should == 'val1'
  end

  it 'should read a old num setting' do
    Settings.key2.should == 2
  end

  it 'should read a old :sym setting' do
    Settings.key3.should == :val3
  end

  it 'should save a new setting to yaml file' do
    time = Time.now
    Settings.new_key = time
    Settings.new_key.should == time
  end
end