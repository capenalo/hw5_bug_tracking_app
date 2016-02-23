require 'test_helper'

class BugTest < ActiveSupport::TestCase
  
  def setup
    @bug = Bug.create(title: "a bug title", 
                      description: "This is the actual text of a bug. It can be rather long")
  end
  
  
  test "bug must be valid" do
    assert @bug.valid?
  end
  
  test "Title must be present" do
    @bug.title = ""
    assert_not @bug.valid?
  end
  
  test "Description must be present" do
    @bug.description = ""
    assert_not @bug.valid?
  end

  test "Issue_type must be valid" do
    invalid_issue_types = [-10, -1, 3, 10]
    invalid_issue_types.each do |iit|
      begin
        @bug.issue_type = iit
        assert false, "#{iit} should be invalid"
      rescue
        assert true
      end
    end
  end
  
  test "priority must be valid" do
    invalid_priorities = [-8, -1, 3, 9]
    invalid_priorities.each do |ip|
      begin
        @bug.priority = ip
        assert false, "#{ip} should be invalid"
      rescue
        assert true
      end
    end
  end
  
  test "Status must be valid" do
    invalid_statuses = [-15, -1, 4, 12]
    invalid_statuses.each do |is|
      begin
        @bug.status = is
        assert false, "#{is} should be invalid"
      rescue
        assert true
      end
    end
  end
  
  test "Default issue_type should be feature" do
    assert_equal @bug.issue_type, "feature"
  end
  
  test "Default priority should be medium" do
    assert_equal @bug.priority, "medium"
  end
  
  test "Default status should be open" do
    assert_equal @bug.status, "open"
  end
end
