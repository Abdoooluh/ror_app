class AddDeviseToUsersAndVendors < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      unless column_exists?(:users, :encrypted_password)
        t.string :encrypted_password, default: "", null: false
      end
      unless column_exists?(:users, :reset_password_token)
        t.string :reset_password_token
        t.index :reset_password_token, unique: true
      end
      unless column_exists?(:users, :reset_password_sent_at)
        t.datetime :reset_password_sent_at
      end
      unless column_exists?(:users, :remember_created_at)
        t.datetime :remember_created_at
      end
    end

    change_table :vendors do |t|
      unless column_exists?(:vendors, :encrypted_password)
        t.string :encrypted_password, default: "", null: false
      end
      unless column_exists?(:vendors, :reset_password_token)
        t.string :reset_password_token
        t.index :reset_password_token, unique: true
      end
      unless column_exists?(:vendors, :reset_password_sent_at)
        t.datetime :reset_password_sent_at
      end
      unless column_exists?(:vendors, :remember_created_at)
        t.datetime :remember_created_at
      end
    end
  end
end
