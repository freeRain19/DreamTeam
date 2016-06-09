require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'get_complete task' do
    task1=FactoryGirl.create(:task, status: 'complete')
    task2=FactoryGirl.create(:task, status: 'starting')
    expect(task1).to eq(Task.get_complete(true,[task1,task2])[0])
  end
end
