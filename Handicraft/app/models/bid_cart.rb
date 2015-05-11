class BidCart < ActiveRecord::Base
  has_many :bid_actions, dependent: :destroy
  has_one :bid_winner, dependent: :destroy
end
