class AddTechnicalDescriptionToProduct < ActiveRecord::Migration
  def change
    add_column :products, :technical_description, :string
  end
end
