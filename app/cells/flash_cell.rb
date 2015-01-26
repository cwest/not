class FlashCell < Cell::ViewModel
  include CellCollection

  def list
    collection { |name, message| { name: name, message: message } }
  end

  def show
    render
  end

  private

  def type
    return 'success' if name == 'notice'
    return 'danger'  if name == 'alert'
    return name      if %w(success info warning danger).include?(name)
    'info'
  end
  alias_method :label, :type

  def alert_class
    "alert-#{type}"
  end

  def label_class
    "label-#{type}"
  end
end
