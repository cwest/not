class CreateKegVolumes < ActiveRecord::Migration
  def change
    create_table :keg_volumes do |t|
      t.string :name, null: false
      t.decimal :us_gallons
      t.decimal :litres
      t.decimal :imperial_gallons

      t.timestamps null: false
    end
  end
end
