class AddPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :colour, :price, :string
  end
end
