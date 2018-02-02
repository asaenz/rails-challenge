require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @member = Member.new(name: "Example Member", website: "user@example.com")
  end

  test "should be valid" do
    assert @member.valid?    
  end

  test "name should be present" do
    @member.name = "      "
    assert_not @member.valid?
  end

end
