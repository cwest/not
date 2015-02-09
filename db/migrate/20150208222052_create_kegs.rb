class CreateKegs < ActiveRecord::Migration
  def change
    create_table :kegs do |t|
      t.datetime :tapped_at
      t.datetime :kicked_at
      t.references :keg_volume, index: true, null: false
      t.references :beer, index: true, null: false
      t.references :venue, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :kegs, :keg_volumes
    add_foreign_key :kegs, :beers
    add_foreign_key :kegs, :venues
  end
end
