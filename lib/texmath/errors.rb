module TeXMath
  ##
  # Error raised when the underlying Haskell library writes to
  # /dev/stderr. This usually occurs when the input was malformed.
  class ConversionError < StandardError; end

  ##
  # Error raised when the `texmath` executable can't be found.
  class NoExecutableError < StandardError; end
end
