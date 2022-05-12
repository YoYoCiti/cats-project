class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.references :cat, foreign_key: true
      t.references :trait, foreign_key: true

      t.timestamps
    end
  end
end
