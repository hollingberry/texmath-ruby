module TeXMath
  ##
  # Error raised when the underlying Haskell library writes to
  # /dev/stderr. This usually occurs when the input was malformed.
  class ConversionError < StandardError; end

  ##
  # Error raised when the `texmath` executable can't be found.
  class NoExecutableError < StandardError; end

  ##
  # Error raised when an invalid reader or writer format is specified.
  class InvalidFormatError < StandardError; end

  ##
  # Error raised when an invalid reader format is specified.
  class InvalidReaderError < InvalidFormatError; end

  ##
  # Error raised when an invalid writer format is specified.
  class InvalidWriterError < InvalidFormatError; end
end
