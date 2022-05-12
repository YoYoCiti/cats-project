class AddBuddyToCats < ActiveRecord::Migration[5.0]
  def change
    add_reference :cats, :cat, foreign_key: true
  end
end
