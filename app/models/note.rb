class Note < ActiveRecord::Base
  belongs_to :problem
  belongs_to :user

  validates :text, presence: true
  validates :user, presence: true
  validates :problem, presence: true

end
