class History < ActiveRecord::Base

  def self.rm_duplicate
    grouped =all.group_by{|history|[history.customer_id,history.product_id]}
    grouped.values.each do |duplicates|
      first_one=duplicates.shift
      duplicates.each{|double| double.destroy}
    end
  end

end
History.rm_duplicate