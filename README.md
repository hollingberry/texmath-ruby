# texmath-ruby

[![Build Status](https://img.shields.io/travis/hollingberry/texmath-ruby.svg)](https://travis-ci.org/hollingberry/texmath-ruby)
[![Gem Version](https://img.shields.io/gem/v/texmath-ruby.svg)](https://rubygems.org/gems/texmath-ruby)
[![Gem Downloads](https://img.shields.io/gem/dt/texmath-ruby.svg)](https://rubygems.org/gems/texmath-ruby)
[![Code Climate](https://img.shields.io/codeclimate/github/kabisaict/flow.svg)](http://codeclimate.com/github/hollingberry/texmath-ruby)

A Ruby wrapper for [TeXMath](https://github.com/jgm/texmath), the Haskell
library for converting between __LaTeX__, presentation __MathML__, and __OMML__
(Office Math Markup Language).

Why? Several reasons. Browsers like Safari and Firefox have native support for
MathML, but it is easier to write equations in LaTeX. Additionally, math
rendering libraries sometimes demand a specific format. While
[MathJax](https://www.mathjax.org) has support for both LaTeX and MathML input,
Khan Academy's just released a much faster library,
[KaTeX](http://khan.github.io/KaTeX/), that only supports LaTeX markup. This
library provides a simple Ruby interface for solving these sorts of problems.

## Synopsis

```ruby
require 'texmath'

TeXMath.convert('a^2 + b^2 = c^2', :to => :mathml)
  # => '<math display="block" xmlns=...'
```

## Installation

### Installing the Haskell library

If you're running OS X, you can install texmath with
[Homebrew](http://brew.sh):

```shell
$ brew update
$ brew install texmath
```

Otherwise, you'll need to install the [The Haskell
Platform](https://www.haskell.org/platform/) and install texmath with Cabal:

```shell
$ cabal update
$ cabal install texmath -fexecutable
```

### Installing the Ruby wrapper

If you use [Bundler](http://bundler.io), add this line to your
application's Gemfile:

```ruby
gem 'texmath-ruby'
```

And then execute:

```shell
$ bundle
```

Or install it yourself as:

```shell
$ gem install texmath-ruby
```

## Usage

It's not hard to use TeXMath. For example, to convert from TeX to MathML:

```ruby
TeXMath.convert('\sqrt{x^3}', from: :tex, to: :mathml)
  # => '<math display="block" xmlns=...'
```

TeXMath can convert between LaTeX, MathML, and OMML, in any
direction. By default (if either the source or destination format
isn't explicitly specified), TeXMath will try to convert from LaTeX to
MathML. So to convert from LaTeX, the default source format, to OMML:

```ruby
TeXMath.convert('\sqrt{x^3}', to: :omml)
  # => '<m:oMathPara>...'
```

Or from OMML to MathML, the default destination format:

```ruby
TeXMath.convert('<m:oMathPara>...', from: :omml)
  # => '<math display="block" xmlns=...'
```

TeXMath also comes with writers for XHTML and Pandoc's native format.

### Supported formats

|             Format            |    Symbol    |  Reader  |  Writer  |
|-------------------------------|--------------|----------|----------|
| LaTeX                         | `:tex`       | &#10004; | &#10004; |
| MathML                        | `:mathml`    | &#10004; | &#10004; |
| Office Math Markup Language   | `:omml`      | &#10004; | &#10004; |
| TeXMath native                | `:native`    | &#10004; | &#10004; |
| XHTML                         | `:xhtml`     |          | &#10004; |
| Pandoc native                 | `:pandoc`    |          | &#10004; |

## Contributing

1. Fork it ( https://github.com/hollingberry/texmath-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
