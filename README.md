# texmath-ruby

[![Build Status](https://img.shields.io/travis/hollingberry/texmath-ruby.svg)](https://travis-ci.org/hollingberry/texmath-ruby)
[![Gem Version](https://img.shields.io/gem/v/texmath-ruby.svg)](https://rubygems.org/gems/texmath-ruby)
[![Gem Downloads](https://img.shields.io/gem/dt/texmath-ruby.svg)](https://rubygems.org/gems/texmath-ruby)

A Ruby wrapper for [TeXMath](https://github.com/jgm/texmath), the Haskell
library for converting between __LaTeX__, presentation __MathML__, and __OMML__
(Office Math Markup Language).

## Example

```ruby
require 'texmath'

TeXMath.convert('a^2 + b^2 = c^2', :from => :tex, :to => :mathml)
  # => '<math display="block" xmlns=...'
```

See the [source](lib/texmath/converter.rb#L11-L29) for a list of the supported
math markup formats.

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
