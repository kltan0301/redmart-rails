require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
   @user = User.new(name: "Example User", email: "user@example.com", address:"Example Street", cc_number:"1234567", password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    puts @user
    assert @user.valid?
  end

end
