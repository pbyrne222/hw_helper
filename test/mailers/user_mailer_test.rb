require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
	test "new_problem" do
    user = users(:one)
    mail = UserMailer.new_problem(user.id)
    assert_equal "New problem created in Homework Helper", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["no-reply@hw_helper.com"], mail.from
    assert_match "New Problem", mail.body.encoded
  end

  test "new_note" do
    user = users(:one)
    mail = UserMailer.new_note(user.id)
    assert_equal "A note was added to your problem in Homework Helper", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["no-reply@hw_helper.com"], mail.from
    assert_match "New Note", mail.body.encoded
  end
end
