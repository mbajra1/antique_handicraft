class AddDescriptionToHistories < ActiveRecord::Migration
  def change
    add_column :histories, :description, :string
  end
end
