class BrandCell < Cell::ViewModel
  def show
    render
  end

  def logo
    render
  end

  def name
    render
  end

  private

  def brand_style_class
    parts = [controller_path, action_name, model || 'default']
    parts[1] = nil if parts[1] == 'show'
    parts.compact.join('-')
  end
end
