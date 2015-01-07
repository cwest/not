class CreateOrganizationUsers < ActiveRecord::Migration
  def change
    create_table :organization_users do |t|
      t.references :user, index: true, null: false
      t.references :organization, index: true, null: false
      t.references :organization_role, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :organization_users, :users
    add_foreign_key :organization_users, :organizations
    add_foreign_key :organization_users, :organization_roles
  end
end
