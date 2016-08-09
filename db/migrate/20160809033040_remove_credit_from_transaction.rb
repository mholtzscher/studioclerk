class RemoveCreditFromTransaction < ActiveRecord::Migration[5.0]
  def self.up
    remove_column :transactions, :credit
  end

  def self.down
    add_column :transactions, :credit, :boolean
  end
end
