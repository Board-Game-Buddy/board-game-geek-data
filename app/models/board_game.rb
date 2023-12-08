class BoardGame < ApplicationRecord
  before_create :zero_to_nil
  before_update :zero_to_nil

  self.per_page = 20
  
  private

  def zero_to_nil
    self.rank = nil if rank.zero?
  end
end