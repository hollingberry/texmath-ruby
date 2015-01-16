# texmath-ruby

A wrapper for [TeXMath](https://github.com/jgm/texmath), a Haskell library for
converting between formats used to represent mathematics.

TeXMath can convert between LaTeX, presentation MathML, and OMML (Office Math
Markup Language). This wrapper uses the command line program for texmath for
all operations (rather than interface directly with the Haskell library) and is
heavily based on [William Melody's
wrapper](https://github.com/alphabetum/pandoc-ruby) for
[Pandoc](https://github.com/jgm/pandoc). In fact, Pandoc and TeXMath were
written by the same author, John MacFarlane.

## Installation

First, make sure [texmath](https://github.com/jgm/texmath) is installed. If you
already have [The Haskell Platform](https://www.haskell.org/platform/), you can
install texmath with Cabal:

```shell
$ cabal install texmath
```

If you use [Bundler](http://bundler.io), then add this line to your
application's Gemfile:

```ruby
gem 'texmath-ruby', require: 'texmath'
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

If everything is installed correctly, using TeXMath is incredibly easy. For
example, converting from LaTeX to MathML looks like this:

```ruby
TeXMath::Converter.new(from: :tex, to: :mathml).convert('\sqrt{3}')
```

Alternatively, you can use an expression for a slightly different approach.

```ruby
TeXMath::Expression.new('\sqrt{3}', format: :tex).to_mathml
```

Both of these examples will return a string of MathML. You can also use
`TeXMath.convert`.

```ruby
TeXMath.convert('\sqrt{x^3}', from: :tex, to: :mathml)
```

Finally, you can use the reader/writer helper methods for maximum readability.

```ruby
TeXMath.tex('\sqrt{x^3}').to_mathml
```

TeXMath can convert between LaTeX, MathML, and OMML, in any direction. By
default (if either the source or destination format isn't explicitly
specified), TeXMath will try to convert from LaTeX to MathML.

```ruby
TeXMath.convert('\sqrt{x^3}')
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/texmath-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
