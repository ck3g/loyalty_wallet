class CreateDeals < ActiveRecord::Migration[5.0]
  def change
    create_table :deals do |t|
      t.references :vendor, foreign_key: true, null: false
      t.string :title, null: false
      t.datetime :valid_till, null: false

      t.timestamps
    end
  end
end
