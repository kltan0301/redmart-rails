require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "testUser", email: "user@gmail.com", address:"teststreet",cc_number:"12345678901112")
  end

  test "should be valid" do
   assert @user.valid?
  end

  test "name should be present" do
   @user.name = "     "
   assert_not @user.valid?
  end

end
