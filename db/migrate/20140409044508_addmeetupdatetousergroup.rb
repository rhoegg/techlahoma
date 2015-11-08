class Addmeetupdatetousergroup < ActiveRecord::Migration
  def change
	change_table :usergroups do |table|
		table.string :meetupdate
	end
  end
end
