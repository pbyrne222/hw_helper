class Note < ActiveRecord::Base
  belongs_to :problem
  belongs_to :user

  validates :text, presence: true
  validates :user, presence: true
  validates :problem, presence: true

  def send_email
    if self.user != self.problem.user
      UserMailer.new_note(self.id).deliver
    end
  end

end
