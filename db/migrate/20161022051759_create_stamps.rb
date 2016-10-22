class CreateStamps < ActiveRecord::Migration[5.0]
  def change
    create_table :stamps do |t|
      t.references :user, foreign_key: true, null: false
      t.references :vendor, foreign_key: true, null: false

      t.timestamps
    end
  end
end
