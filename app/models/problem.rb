class Problem < ActiveRecord::Base
  belongs_to :user
	has_many :notes

  validates :description, presence: true
  validates :history, presence: true
  validates :user, presence: true

  paginates_per 5

	def open
		where(resolved: :false)
	end

  def close
	  where(resolved: :true)
  end

end
