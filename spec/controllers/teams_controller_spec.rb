require 'rails_helper'

RSpec.describe TeamsController, type: :controller do
  describe "GET #index" do
    before do
        @user=User.find_by_email('testmail@mail.mm')
        if @user.nil?
          @user=User.create!(email: "testmail@mail.mm", password: 'qweqwe', first_name: 'Aaa', last_name: 'Bb2bb', role_id: 2)
        end
        sign_in @user
    end

    it "populates an array of teams" do
      team1 = FactoryGirl.create(:team, name: 'random name1')
      team2 = FactoryGirl.create(:team, name: 'random name2')
      get :index
      expect(assigns(:teams)).to match_array([team1,team2])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end
  describe 'Delete ' do
    it "destroy team" do
      @user=User.create!(email: "testmail@mail.mm", password: 'qweqwe', first_name: 'Aaa1', last_name: 'Bb2bb1', role_id: 1)
      sign_in @user
      team1 = FactoryGirl.create(:team, name: 'random name1')
      delete :destroy, id: team1.id
      expect(response).to redirect_to teams_url
    end
  end
end
