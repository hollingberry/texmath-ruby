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
    # @option options [String] :executable ('texmath') the executable path
    # @option options [Symbol] :from (:tex) the source format
    # @option options [Symbol] :to (:mathml) the destination format
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
        raise ConversionError, error unless error.empty?
        return output.strip
      end
    rescue Errno::ENOENT
      raise NoExecutableError, "Can't find the '#{executable}' executable."
    end

    attr_reader :reader, :writer

    def reader=(format)
      return @reader = format if READERS.key?(format.to_s)
      raise ArgumentError, "Can't find '#{format}' reader."
    end

    def writer=(format)
      return @writer = format if WRITERS.key?(format.to_s)
      raise ArgumentError, "Can't find '#{format}' writer."
    end

    private

    def command
      "#{executable} -f #{reader} -t #{writer}"
    end
  end
end
