module CellCollection
  def collection(method = :show)
    rendered = model.collect do |*args|
      args = yield(*args) if block_given?
      cell(controller_path, [args].flatten.first).call(method)
    end

    rendered.join.html_safe
  end
end
