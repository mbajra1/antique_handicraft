class Search < ActiveRecord::Base

  CATEGORY = %w[Thangka Artifact Jewellery]

  def find_products
    #Product.all.select(:conditions)
    @products ||= Product.where({:conditions => conditions}).all
  end

  private
  def keyword_conditions
    ["products.name LIKE ?", "%#{keywords}%"] unless keywords.blank?
  end

  def minimum_price_conditions
    ["products.price >= ?", minimum_price] unless minimum_price.blank?
  end

  def maximum_price_conditions
    ["products.price <= ?", maximum_price] unless maximum_price.blank?
  end

  def category_conditions
    ["products.category = ?", category_id] unless category_id.blank?
  end

  def conditions
    [conditions_clauses.join(' AND '), *conditions_options]
  end

  def conditions_clauses
    conditions_parts.map { |condition| condition.first }
  end

  def conditions_options
    conditions_parts.map { |condition| condition[1..-1] }.flatten
  end

  def conditions_parts
    private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
  end

end
