class User < ApplicationRecord
  has_many :plans, foreign_key: :employee_id

  class << self
    # Retrieve the list of user with their plan statistics
    #
    # @return [Hash]
    # {
    #   <user_name> => {
    #     average_score: [Float],
    #     plan_count: [Int]
    #   }
    # }
    def performances
    end
  end
end
