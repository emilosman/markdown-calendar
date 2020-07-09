class AddIndexToDate < ActiveRecord::Migration[6.0]
  def change
    add_index :days, :date
  end
end
