require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.create(fname: "Maximun", 
                        lname: "Bugger",
                        email: "maxbug@bugsbugsbugs.com",
                        thumbnail: "mas.png")
  end
  
  test "User must be valid" do
    assert @user.valid?
  end
  
  test "Fname must be present" do
    @user.fname = ""
    assert_not @user.valid?
  end
  
  test "Lname must be present" do
    @user.lname = ""
    assert_not @user.valid?
  end
  
  test "Email must be present" do
    @user.email = ""
    assert_not @user.valid?
  end
  
end
