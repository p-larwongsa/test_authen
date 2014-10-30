class Currently < ActiveRecord::Base
  attr_accessible :name, :provider, :uid
  def self.create_with_omniauth(auth)
  	Currently.create!(
  		:provider => auth["provider"],
  		:uid => auth["uid"],
  		:name => auth["info"]["name"]
  		)
  end
end
