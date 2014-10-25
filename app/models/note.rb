class Note < ActiveRecord::Base
  belongs_to :problem
  belongs_to :user

  before_create :authenticate_user!

end
