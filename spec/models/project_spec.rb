require 'rails_helper'

RSpec.describe Project, type: :model do
  it 'get project by name' do
  project1=FactoryGirl.create(:project, name: 'name one')
  project2=FactoryGirl.create(:project, name: 'n two')
    expect(1).to eq(Project.search_by_name('two').count)
  end
end
