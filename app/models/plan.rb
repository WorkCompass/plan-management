class Plan < ApplicationRecord
  belongs_to :employee, class_name: "User"
  has_many :items

  class << self
    # Return a list of plans that are due within the specified number of days
    #
    # @param  [Int] days
    # @return [Array]
    def due_in(days)
    end
  end

  # Retrieve the current status of a plan
  #
  # @return [String] "archived" or "current"
  def status
  end
end
