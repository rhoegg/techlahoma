class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |table|
      table.string :name

      table.timestamps
    end
  end
end
