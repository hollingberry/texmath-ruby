require 'test_helper'
require 'support/formats'

class ConverterTest < Minitest::Test
  include Formats

  TeXMath::Converter::READERS.each_key do |reader|
    TeXMath::Converter::WRITERS.each_key do |writer|
      define_method "test_#{reader}_to_#{writer}" do
        assert_converts reader, writer
      end
    end
  end

  def test_symbol_reader_and_writer
    assert_converts :tex, :mathml
  end

  def test_string_reader_and_writer
    assert_converts 'tex', 'mathml'
  end

  def test_default_reader
    assert_equal :tex, TeXMath::Converter.new(to: :mathml).reader
  end

  def test_default_writer
    assert_equal :mathml, TeXMath::Converter.new(from: :tex).writer
  end

  def test_invalid_input
    assert_raises ArgumentError do
      TeXMath::Converter.new.convert('\sqrt{3')
    end
  end

  def test_executable_not_found
    TeXMath::Converter.const_set(:EXECUTABLE, 'ogremath')
    assert_raises ArgumentError, "Can't find the 'ogremath' executable." do
      TeXMath::Converter.new.convert('\sqrt{3}')
    end
    TeXMath::Converter.const_set(:EXECUTABLE, 'texmath')
  end

  def test_string_reader_not_found
    assert_raises ArgumentError, "Can't find 'pears' reader." do
      TeXMath::Converter.new(from: 'pears', to: :mathml)
    end
  end

  def test_string_writer_not_found
    assert_raises ArgumentError, "Can't find 'pears' writer." do
      TeXMath::Converter.new(from: :tex, to: 'pears')
    end
  end

  def test_symbol_reader_not_found
    assert_raises ArgumentError, "Can't find 'pears' reader." do
      TeXMath::Converter.new(from: :pears, to: :mathml)
    end
  end

  def test_symbol_writer_not_found
    assert_raises ArgumentError, "Can't find 'pears' writer." do
      TeXMath::Converter.new(from: :tex, to: :pears)
    end
  end

  private

  def assert_converts(from, to)
    input, expected_output = send(from), send(to)
    actual_output = TeXMath::Converter.new(from: from, to: to).convert(input)
    assert_equal expected_output, actual_output
  end
end
