class CreateCatPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :cat_posts do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :cat, foreign_key: true

      t.timestamps
    end
    add_index :cat_posts, [:cat_id, :created_at]
  end
end
