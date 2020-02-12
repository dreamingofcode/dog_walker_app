class RemoveColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :walkers, :rating, :integer
  end
end
