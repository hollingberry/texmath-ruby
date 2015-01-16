require 'texmath/converter'

module TeXMath
  ##
  # An `Expression` is a simple wrapper around a `Converter`, allowing
  # for perhaps a more fluid and object oriented approach to
  # converting math expressions. `Expression` also allows for the
  # shortcut methods like `TeXMath.latex('\sqrt{3}').to_mathml`, which
  # are included from this class.
  class Expression
    ##
    # Create a new Expression.
    # @param expression [String] the math expression to be converted
    # @param format [Symbol] the source format
    def initialize(expression, format: :tex)
      @expression = expression
      @format = format
    end

    class << self
      Converter::READERS.each_key do |reader|
        define_method reader do |expression| 
          new(expression, format: reader)
        end
      end
    end

    Converter::WRITERS.each_key do |writer|
      define_method "to_#{writer}" do
        Converter.new(from: @format, to: writer).convert(@expression)
      end
    end
  end
end
