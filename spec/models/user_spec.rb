require 'rails_helper'

RSpec.describe User do
  let!(:user1) { User.create(name: 'Employee 1', authorisation: 'employee') }
  let!(:user2) { User.create(name: 'Employee 2', authorisation: 'employee') }
  let!(:user3) { User.create(name: 'Employee 3', authorisation: 'employee') }
  let!(:plan_u1_1) { Plan.create(due_date: Date.today - 1.day, employee: user1, score: 70) }
  let!(:plan_u1_2) { Plan.create(due_date: Date.today + 10.days, employee: user1, score: 50) }
  let!(:plan_u1_3) { Plan.create(due_date: Date.today - 9.day, employee: user1,  score: 40) }
  let!(:plan_u1_4) { Plan.create(due_date: Date.today - 5.days, employee: user1, score: 60) }
  let!(:plan_u2_1) { Plan.create(due_date: Date.today - 1.day, employee: user2,  score: 0) }

  describe '#performances' do
    it 'returns expected hash of plan scores of users' do
      expect(User.performances).to eq(
        {
          "Employee 1"=>{ average_score: 55.0, plan_count: 4 },
          "Employee 2"=>{ average_score: 0.0, plan_count: 1 }
        }
      )
    end
  end
end
