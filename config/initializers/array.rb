class Array
  def deep_map(&)
    map do |element|
      if element.is_a?(Array)
        element.deep_map(&)
      else
        yield(element)
      end
    end
  end
end
