module NumberHelpers
  def string_to_number(str)
    case str
    when 'no'
      0
    when 'one'
    when 'an'
      1
    else
      str.to_i
    end
  end
end

World(NumberHelpers)
