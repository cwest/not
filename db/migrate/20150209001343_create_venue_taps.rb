class CreateVenueTaps < ActiveRecord::Migration
  def change
    create_table :venue_taps do |t|
      t.integer :number, null: false
      t.references :venue, index: true, null: false
      t.references :keg, index: true

      t.timestamps null: false
    end
    add_foreign_key :venue_taps, :venues
    add_foreign_key :venue_taps, :kegs
  end
end
