class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :problems
	has_many :notes

  include Gravtastic
  gravtastic  :default => 'identicon',
	            :size => 45

end
