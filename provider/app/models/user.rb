class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :oauth2_providable
end
