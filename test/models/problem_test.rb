require 'test_helper'

class ProblemTest < ActiveSupport::TestCase
   should validate_presence_of(:description)
   should validate_presence_of(:history)
   should validate_presence_of(:user)



end
