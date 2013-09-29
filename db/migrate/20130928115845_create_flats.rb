class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.string :address
      t.integer :price

      t.timestamps
    end
  end
end
