class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.string :category
      t.decimal :price, :precision => 10, :scale => 2

      t.timestamps
    end
  end
end
