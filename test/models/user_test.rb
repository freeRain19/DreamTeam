require 'test_helper'

class UserTest < ActiveSupport::TestCase
  describe User do

    before do
      @user = User.new(first_name: "Example User", email: "user@example.com")
    end

    subject { @user }
    describe "when email address is already taken" do
      before do
        user_with_same_email = @user.dup
        user_with_same_email.save
      end
      it { should_not be_valid }
    end
  end
end
