class BoardGame < ApplicationRecord
  before_create :zero_to_infinity
  before_update :zero_to_infinity
  
  private

  def zero_to_infinity
    self.rank = nil if rank.zero?
  end
end