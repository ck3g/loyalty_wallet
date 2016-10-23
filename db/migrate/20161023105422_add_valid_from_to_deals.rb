class AddValidFromToDeals < ActiveRecord::Migration[5.0]
  def change
    add_column :deals, :valid_from, :datetime
  end
end
