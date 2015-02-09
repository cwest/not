class CreateBeerStyles < ActiveRecord::Migration
  def change
    create_table :beer_styles do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
    add_index :beer_styles, :name, unique: true
  end
end
