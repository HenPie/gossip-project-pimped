class AddIndexToCity < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :city, foreign_key: true, index: true
  end
end
