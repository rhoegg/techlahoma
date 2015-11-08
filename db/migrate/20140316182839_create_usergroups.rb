class CreateUsergroups < ActiveRecord::Migration
  def change
    create_table :usergroups do |table|

         table.string :name, null: false, :limit => 75
         table.string :blurb, null: false, :limit => 140
         table.string :logo_url

         table.string :location
         table.string :twitter
         table.string :email, null: false, :limit => 75
         table.string :website, null: false, :limit => 75
         table.string :facebook
         table.string :linkedin

         table.timestamps
    end
  end
end
