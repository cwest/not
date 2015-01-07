class CreateOrganizationRoles < ActiveRecord::Migration
  def change
    create_table :organization_roles do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
