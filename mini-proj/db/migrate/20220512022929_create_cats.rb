class CreateCats < ActiveRecord::Migration[5.0]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :gender
      t.numeric :age
      t.text :description

      t.timestamps
    end
  end
end
