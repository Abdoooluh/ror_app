class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name
      t.references :city, null: false, foreign_key: true
      t.string :full_name
      t.string :password_digest
      t.string :email
      t.string :cell_number

      t.timestamps
    end
  end
end
