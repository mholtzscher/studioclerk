class RenameTransactionToCredit < ActiveRecord::Migration[5.0]
  def self.up
    rename_table :transactions, :credits
  end

  def self.down
    rename_table :credits, :transactions
  end
end
