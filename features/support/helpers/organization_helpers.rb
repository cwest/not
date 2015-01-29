module OrganizationHelpers
  def clear_organizations
    Organization.destroy_all
  end

  def create_organization
    org = new_organization
    visit new_organization_path
    fill_in 'organization_name', with: org[:name]
    click_button 'Create Organization'
    org
  end

  def find_organization(where)
    Organization.where(where).first
  end

  def new_organization
    Fabricate.to_params(:organization)
  end
end

World(OrganizationHelpers)
