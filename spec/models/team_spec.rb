require 'rails_helper'

RSpec.describe Team, type: :model do

  it 'a valid factory?' do
    expect(FactoryGirl.create(:team)).to be_valid
  end
end
