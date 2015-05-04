class BidCart < ActiveRecord::Base
  has_many :bid_actions, dependent: :destroy
end
