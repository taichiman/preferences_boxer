require 'spec_helper'

class User < ActiveRecord::Base
  establish_connection :adapter => 'sqlite3', :database => 'spec/store.db'
  connection.create_table table_name, :force => true do |t|
    t.string :name
    t.string :adress
    t.text :settings
  end
end

describe "PreferencesBoxer::DbStore" do
  before :all do
    User.create( name: 'test_name', adress: 'test_adress' )
    User.create( name: 'test_name2', adress: 'test_adress2', settings: { key2: 'val2' } )
    User.create( name: 'test_name3' )
  end

  after :all do
    User.destroy_all
  end

  it 'should transmit additional settings to db store class' do
    AdminSettings = PreferencesBoxer.configure do |config|
      config.store_type = 'db'
      config.source_record = User.find(2)
      config.source_field = :settings
    end
  end

  it 'should set initial preference values to db store class' do
    init_values = {site_name: 'test1', owner_name: 'test2', admin_login: 'root', admin_password: '$2a$10$sd66SJyZxCVjavZ2Cz3s1OsuoFawJ4Pyu/GPc98mj8k0ahSp.feQW'}
    AdminSettings2 = PreferencesBoxer.configure do |config|
      config.store_type = 'db'
      config.source_record = User.find(1)
      config.source_field = :settings
      config.init_values = init_values
    end
    User.find(1).settings.unserialize.should == init_values

    AdminSettings3 = PreferencesBoxer.configure do |config|
      config.store_type = 'db'
      config.source_record = User.find(2)
      config.source_field = :settings
      config.init_values = init_values
    end
    User.find(2).settings.unserialize.should == { key2: 'val2' }
  end

  it 'should get val' do
    AdminSettings.key2.should == 'val2'
    AdminSettings.key2.should_not == 'test_val'
  end

  it 'should set val' do
    AdminSettings.key4 = 'val4'
    AdminSettings.key4.should == 'val4'
    AdminSettings.key4.should_not == 'test_val'
  end
end