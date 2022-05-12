class ChangeAgeToBirthdayInCats < ActiveRecord::Migration[5.0]
  def change
    add_column :cats, :birthday, :date
    remove_column :cats, :age

  end
end
