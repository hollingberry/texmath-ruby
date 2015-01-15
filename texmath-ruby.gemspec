$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

require 'texmath/version'

Gem::Specification.new do |spec|
  spec.name          = 'texmath-ruby'
  spec.version       = TeXMath::VERSION
  spec.authors       = ['Casper Hollingberry']
  spec.email         = ['hollingberry7@gmail.com']
  spec.summary       = 'Convert math markup between LaTeX, MathML, and OMML.'
  spec.description   = 'Convert math markup between LaTeX, MathML, and OMML using Ruby. A wrapper for TeXMath, a Haskell library written by the creator of Pandoc.'
  spec.homepage      = 'http://github.com/hollingberry/texmath-ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(/^test/)
  spec.require_paths = ['lib']
end
