class CreateInstruments < ActiveRecord::Migration[7.0]
  def change
    create_table :instruments do |t|
      t.string :name
      t.text :description
      t.string :address
      t.float :price
      t.boolean :available
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
