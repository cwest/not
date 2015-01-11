module Factory
  # == Factory::WithRoleException
  #
  # Generate an ActiveRecord association extension for +has_many+ associations.
  #
  #   Factory::WithRoleExtension.build(
  #     mapping_association: :organization_users,
  #     role_association:    :organization_role
  #   )
  #
  # DRY implementation of scope extensions for querying roles on +has_many+
  # associations.
  class WithRoleExtension
    # Build a new extension. This is a quick way to create the new +Module+,
    # define its methods, and get a copy of it.
    #
    # ==== Options
    #
    # * +:mapping_association+ - *Required* The association on this model that links it with the +has_many+ model
    #   upstream.
    # * +:role_association+ - *Required* The association on the +:mapping_association+ that connects to the role class.
    # * +:role_class+ - The role class name. If unset it's derived from +:role_association+
    # * +:role_column+ - The column on the role class containing the role name we're looking for. Defaults to +name+.
    #
    # ==== Examples
    #
    #   has_many :organization_users
    #
    #   with_role_extension = proc do
    #     extending Factory::WithRoleExtension.build(
    #       mapping_association: :organization_users,
    #       role_association:    :organization_role
    #     )
    #   end
    #
    #   has_many :organizations, with_role_extension, through: :organization_users
    #
    # Here are examples of its use.
    #
    #   current_user.organizations.owner
    #
    #   current_user.organizations.with_role('manager')
    #
    #   current_user.organizations
    def self.build(options = {})
      builder = new(options)
      builder.define_extension_methods
      builder.extension
    end

    attr_reader :mapping_association, :role_association, :role_class, :role_column, :extension

    # See #build for the details. It passes all options to +new+
    def initialize(options)
      @mapping_association = options.fetch(:mapping_association) do
        fail ArgumentError, 'Required argument `:mapping_association` missing.'
      end
      @role_association = options.fetch(:role_association) do
        fail ArgumentError, 'Required argument `:role_association` missing.'
      end

      @role_class = (options[:role_class] || role_association.to_s.camelcase).constantize
      @role_column = options[:role_column] || :name

      @extension = Module.new
    end

    # Define the +with_role+ scope and all dynamically generated role name
    # methods. After you call this you can access the defined +Module+ via
    # #extension
    def define_extension_methods
      define_with_role
      define_all_roles
    end

    private

    def define_with_role
      builder = self

      extension.send(:define_method, :with_role) do |role_name|
        proxy_association.association_scope
          .joins(builder.mapping_association => builder.role_association)
          .merge(builder.role_class.where(builder.role_column => role_name))
          .distinct
      end
    end

    def define_all_roles
      role_class.pluck(role_column).each do |role_name|
        extension.send(:define_method, role_name) do
          with_role(role_name)
        end
      end
    end
  end
end
