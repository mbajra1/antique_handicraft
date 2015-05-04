class History < ActiveRecord::Base

  def self.rm_duplicate
    grouped =all.group_by{|history|[history.customer_id,history.product_id]}
    grouped.values.each do |duplicates|
      first_one=duplicates.shift
      duplicates.each{|double| double.destroy}
    end
  end

  #Featured Items
  scope :date_visited, ->(time) { where("date_visited > ?", time).limit(3) }

end
History.rm_duplicate