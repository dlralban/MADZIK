class AddDefaultValueToStatus < ActiveRecord::Migration[7.0]
  def change
    change_column :rentals, :status, :text, default: 'pending'
  end
end
