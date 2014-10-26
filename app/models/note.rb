class Note < ActiveRecord::Base
  belongs_to :problem
  belongs_to :user

  validates :text, presence: true
  validates :user, presence: true
  validates :problem, presence: true


	def save_and_notify
		save
		notify_author
	end


private

	def notify_author
		if different_from_problem_author?
			binding.pry
			#send the email
		end
	end

  def different_from_problem_author?
		self.user != self.problem.user
  end

  def send_email
    if self.user != self.problem.user
      UserMailer.new_note(self.id).deliver
    end
  end

end
