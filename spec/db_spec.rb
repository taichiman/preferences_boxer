require 'spec_helper'

class BoxerSetting < ActiveRecord::Base
  establish_connection :adapter => 'sqlite3', :database => 'spec/store.db'
  connection.create_table table_name, :force => true do |t|
    t.string :settings
  end
end

describe PreferencesBoxer::StoreStore do

  before :all do 
    PreferencesBoxer.store_type = 'Store'
    Settings = PreferencesBoxer::Settings.instance
    r=BoxerSetting.first
    r.settings[:key1] = 'val1'
    r.save
    puts "create in before | #{BoxerSetting.first.inspect}"
  end
  
  after :all do
    BoxerSetting.destroy_all
  end

  it 'should generate migration' do
    pending
  end

  it 'should read value of a old key' do
    Settings.key1.should == 'val1'
  end

  it 'should save new value' do
    Settings.key_new = 'val_new'
    Settings.key_new.should == 'val_new'
  end

end