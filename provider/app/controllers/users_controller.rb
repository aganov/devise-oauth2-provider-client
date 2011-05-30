class UsersController < ApplicationController
  before_filter :authenticate_user!
  def me
    ActiveRecord::Base.include_root_in_json = false
    render :json => current_user
  end
end
