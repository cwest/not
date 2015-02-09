class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name, null: false
      t.decimal :abv
      t.references :brewery, index: true, null: false
      t.references :beer_style, index: true, null: false

      t.timestamps null: false
    end
    add_index :beers, :name
  end
end
