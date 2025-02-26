# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Plan do
  let!(:user) { User.create(name: 'Employee', authorisation: 'employee') }

  let(:archived_plan) { Plan.create(due_date: Date.today - 1.day, employee: user) }
  let(:current_plan) { Plan.create(due_date: Date.today + 10.days, employee: user) }

  let!(:item1) { Item.create(plan: archived_plan, score: 60, description: 'description') }
  let!(:item2) { Item.create(plan: archived_plan, score: 50, description: 'description') }
  let!(:item3) { Item.create(plan: archived_plan, score: 70, description: 'description') }
  let!(:item4) { Item.create(plan: current_plan, score: 0, description: 'description') }
  let!(:item5) { Item.create(plan: current_plan, score: 0, description: 'description') }

  context 'when plan is archived' do
    it 'calculates the average score based on associated items' do
      expect(archived_plan.score).to eq(60)
    end

    it 'plan status returns archived' do
      expect(archived_plan.status).to eq('archived')
    end

    it 'destroys associated items when the plan is destroyed' do
      expect { archived_plan.destroy }.to change(Item, :count).by(-3)
    end
  end

  context 'when plan is current' do
    it 'calculates the average score based on associated items' do
      expect(current_plan.score).to eq(0)
    end

    it 'plan status returns current' do
      expect(current_plan.status).to eq('current')
    end
  end

  describe '#due_in' do
    it 'returns plans due within the next 7 days' do
      plan1 = Plan.create(due_date: Date.today + 1.day, employee: user)
      plan2 = Plan.create(due_date: Date.today + 5.days, employee: user)
      plan3 = Plan.create(due_date: Date.today + 8.days, employee: user)
      plan4 = Plan.create(due_date: Date.today - 1.day, employee: user)

      plans = Plan.due_in(7.days)

      expect(plans).to include(plan1, plan2)
      expect(plans).not_to include(plan3, plan4)
    end

    it 'returns an empty array if no plans are due in the next 7 days' do
      Plan.create(due_date: Date.today + 8.days, employee: user)
      Plan.create(due_date: Date.today + 10.days, employee: user)

      plans = Plan.due_in(7)

      expect(plans).to be_empty
    end
  end

  describe 'when item score change' do
    it 'updates the plan score' do
      current_plan.items.first.update(score: 38)
      expect(current_plan.score).to eq(19)
    end
  end
end
