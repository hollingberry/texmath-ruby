require 'texmath/errors'
require 'open3'

module TeXMath
  ##
  # A `Converter` represents a single `texmath` command to which data
  # can be piped. For example, a `Converter` that converts LaTeX to
  # MathML can be reused for different input expressions, although all
  # would have to be valid LaTeX.
  class Converter
    ##
    # The available readers and their corresponding names.
    READERS = {
      'tex' => 'LaTeX',
      'mathml' => 'MathML',
      'omml' => 'Office Math Markup Language',
      'native' => 'texmath native'
    }

    ##
    # The available writers and their corresponding names.
    WRITERS = {
      'tex' => 'LaTeX',
      'mathml' => 'MathML',
      'omml' => 'Office Math Markup Language',
      'xhtml' => 'XHTML',
      'pandoc' => 'pandoc native',
      'native' => 'texmath native'
    }

    ##
    # Create a new Converter.
    # @param executable [String] the executable path
    # @param from [Symbol] the source format (defaults to `:tex`)
    # @param to [Symbol] the destination format (defaults to `:mathml`)
    def initialize(options = {})
      @executable = options.fetch(:executable, 'texmath')
      self.reader = options.fetch(:from, :tex)
      self.writer = options.fetch(:to, :mathml)
    end

    attr_reader :executable

    ##
    # Convert `data` between formats.
    # @return [String] the converted data
    def convert(data)
      Open3.popen3(command) do |stdin, stdout, stderr| 
        stdin.puts(data)
        stdin.close
        output = stdout.read
        error = stderr.read
        raise ConversionError.new(error) unless error.empty?
        return output.strip
      end
    rescue Errno::ENOENT
      raise NoExecutableError.new("Can't find the '#{executable}' executable.")
    end

    attr_reader :reader, :writer

    def reader=(format)
      return @reader = format if READERS.key?(format.to_s)
      raise InvalidReaderError.new("Can't find '#{format}' reader.")
    end

    def writer=(format)
      return @writer = format if WRITERS.key?(format.to_s)
      raise InvalidWriterError.new("Can't find '#{format}' writer.")
    end

    private

    def command
      "#{executable} -f #{reader} -t #{writer}"
    end
  end
end
