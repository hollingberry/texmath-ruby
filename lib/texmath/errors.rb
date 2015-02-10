module TeXMath
  ##
  # A `ConversionError` occurs when the underlying Haskell library
  # writes to STDERR. This usually occurs when there the input was
  # malformed.
  class ConversionError < StandardError; end

  ##
  # A `NoExecutableError` occurs when the `texmath` executable can't
  # be found.
  class NoExecutableError < StandardError; end

  ##
  # A `NoFormatError` occurs when a reader or writer format is
  # specified that doesn't exist.
  class InvalidFormatError < StandardError; end

  ##
  # A `NoReaderError` occurs when a reader format is specified that
  # doesn't exist.
  class InvalidReaderError < InvalidFormatError; end

  ##
  # A `NoWriterError` occurs when a writer format is specified that
  # doesn't exist.
  class InvalidWriterError < InvalidFormatError; end
end
