require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'posts test ' do
    def user_login
      @user=User.find_by_email('testmail@mail.mm')
      if @user.nil?
        @user=User.create!(email: "testmail@mail.mm", password: 'qweqwe', first_name: 'Aaa', last_name: 'Bb2bb', role_id: 2)
      end
      sign_in @user
    end

    it "route edit comment " do
      user_login
      expect(:get => "/comments/1/edit").to route_to(:controller => "comments", :action => "edit", :id => '1')
    end
    it 'not route path' do
      user_login
      comment= FactoryGirl.create(:comment)
      expect(get: '/comments/1/show').not_to be_routable
    end
  end
end


