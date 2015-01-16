require 'open3'

module TeXMath
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
    # Create a new Converter instance.
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
        raise ArgumentError.new(error) unless error.empty?
        return output
      end
    end

    attr_reader :reader, :writer
    
    def reader=(format)
      return @reader = format if READERS.has_key?(format.to_s)
      raise ArgumentError.new("Can't find '#{format}' reader.")
    end

    def writer=(format)
      return @writer = format if WRITERS.has_key?(format.to_s)
      raise ArgumentError.new("Can't find '#{format}' writer.")
    end

    private

    def command
      "#{EXECUTABLE} -f #{@reader} -t #{@writer}"
    end
  end
end
