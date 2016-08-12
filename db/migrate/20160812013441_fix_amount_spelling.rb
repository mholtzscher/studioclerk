class FixAmountSpelling < ActiveRecord::Migration[5.0]
  def change
    rename_column :credits, :ammount, :amount
  end
end
