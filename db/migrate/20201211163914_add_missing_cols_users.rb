class AddMissingColsUsers < ActiveRecord::Migration[6.0]
  def up
    change_table :users do |t|
      ## Trackable
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip

      ## Confirmable
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      t.integer :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at

      add_index :users, :confirmation_token, unique: true
      add_index :users, :unlock_token, unique: true
    end
  end

  def down
    change_table :users do |t|
      t.remove :sign_in_count,
               :current_sign_in_at,
               :last_sign_in_at,
               :current_sign_in_ip,
               :last_sign_in_ip,
               :confirmation_token,
               :confirmed_at,
               :confirmation_sent_at,
               :unconfirmed_email,
               :failed_attempts,
               :unlock_token,
               :locked_at
    end
  end
end
