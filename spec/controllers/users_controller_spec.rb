require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #actions" do
    before do
      @user=User.find_by_email('testmail@mail.mm')
      if @user.nil?
        @user=User.create!(email: "testmail@mail.mm", password: 'qweqwe', first_name: 'Aaa', last_name: 'Bb2bb', role_id: 2)
      end
      sign_in @user
    end
    it 'success request user#index by team ?' do
      team=FactoryGirl.create(:team)
      get :index, team_id: team.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'get show ' do
      team=FactoryGirl.create(:team)
      user=FactoryGirl.create(:user , team_id: team.id)
      expect(:get => "/users/#{user.id}").to route_to(:controller => 'users',:action => "show", id: "#{user.id}")
    end

  end
end
