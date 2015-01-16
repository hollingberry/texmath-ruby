require 'texmath/converter'
require 'texmath/errors'
require 'texmath/expression'
require 'texmath/version'

module TeXMath
  def self.convert(data, options = {})
    Converter.new(options).convert(data)
  end
end
