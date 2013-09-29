class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.decimal :x
      t.decimal :y
      t.references :flat, index: true

      t.timestamps
    end
  end
end
