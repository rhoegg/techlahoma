class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |table|
      table.integer :user_id
      table.string :provider
      table.string :uid
      table.string :name

      table.timestamps
    end
  end
end
