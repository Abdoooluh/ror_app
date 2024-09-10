class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :sku
      t.references :vendor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
