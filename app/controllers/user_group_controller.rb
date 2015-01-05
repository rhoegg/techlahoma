class UserGroupController < ApplicationController

  def index
    @groups = Usergroup.all.sort_by{|word| word.name.downcase}
  end
end
