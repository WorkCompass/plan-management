# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item do
  let!(:user) { User.create(name: 'Employee', authorisation: 'employee') }
  let(:plan) { Plan.create(due_date: Date.today - 1.day, employee: user) }

  it 'raises an error when created without a score' do
    item = Item.new(plan: plan)
    expect(item.save).to be false
    expect(item.errors[:score]).to include("can't be blank")
  end

  it 'raises an error when score is nil' do
    item = Item.new(plan: plan, score: nil)
    expect(item.save).to be false
    expect(item.errors[:score]).to include("can't be blank")
  end

  it 'raises an error when score is negative' do
    item = Item.new(plan: plan, score: -10)
    expect(item.save).to be false
    expect(item.errors[:score]).to include("must be greater than or equal to 0")
  end

  it 'raises an error when description is blank' do
    item = Item.new(plan: plan, score: 10, description: '')
    expect(item.save).to be false
    expect(item.errors[:description]).to include("can't be blank")
  end

  it 'saves successfully' do
    item = Item.new(plan: plan, score: 10, description: 'Item description')
    expect(item.save).to be true
  end
end
