class Note < ActiveRecord::Base
  belongs_to :problem
  belongs_to :user

  before_action :authenticate_user!

end
