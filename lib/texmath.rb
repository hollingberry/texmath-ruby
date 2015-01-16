require 'texmath/converter'
require 'texmath/version'

module TeXMath
  module_function

  def convert(data, options = {})
    Converter.new(options).convert(data)
  end
end
