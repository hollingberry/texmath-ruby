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

    $ cabal install texmath

If you use [Bundler](http://bundler.io), then add this line to your
application's Gemfile:

    gem 'texmath-ruby', require: 'texmath'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install texmath-ruby

## Usage

If everything is installed correctly, using TeXMath is incredibly easy. For
example, converting from LaTeX to MathML looks like this:

```ruby
TeXMath.convert('\sqrt{x^3}', from: :latex, to: :mathml)
```

This will return a string of MathML. You can do the same thing another way:

```ruby
TeXMath.latex('\sqrt{x^3}').to_mathml
```

TeXMath can convert between LaTeX, MathML, and OMML, in any direction. Use
`#to_tex`, `#to_mathml`, or `#to_omml` in any combination you please.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/texmath-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
