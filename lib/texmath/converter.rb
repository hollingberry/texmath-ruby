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
    # The executable.
    EXECUTABLE = 'texmath'

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
    # @param from [Symbol] the source format
    # @param to [Symbol] the destination format
    def initialize(from: :tex, to: :mathml)
      self.reader = from
      self.writer = to
    end

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
      raise NoExecutableError.new("Can't find the '#{EXECUTABLE}' executable.")
    end

    attr_reader :reader, :writer
    
    def reader=(format)
      return @reader = format if READERS.has_key?(format.to_s)
      raise NoReaderError.new("Can't find '#{format}' reader.")
    end

    def writer=(format)
      return @writer = format if WRITERS.has_key?(format.to_s)
      raise NoWriterError.new("Can't find '#{format}' writer.")
    end

    private

    def command
      "#{EXECUTABLE} -f #{@reader} -t #{@writer}"
    end
  end
end
