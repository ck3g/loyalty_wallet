class CreateVendors < ActiveRecord::Migration[5.0]
  def change
    create_table :vendors do |t|
      t.references :user, foreign_key: true, null: false
      t.string :name, null: false
      t.string :address

      t.timestamps
    end
  end
end
