class CreateBoxerSettings < ActiveRecord::Migration
  def change
    create_table :boxer_settings do |t|
      t.string :settings
    end
  end
end