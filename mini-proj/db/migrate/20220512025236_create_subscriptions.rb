class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.references :cat, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    
    add_index :subscriptions, [:cat_id, :user_id], unique: true
  end
end
