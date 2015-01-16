require 'test_helper'

class ConversionTest < Minitest::Test
  def test_tex_to_mathml
    assert_converts :tex, :mathml
  end

  def test_mathml_to_tex
    assert_converts :mathml, :tex
  end

  def test_tex_to_omml
    assert_converts :tex, :omml
  end

  def test_omml_to_tex
    assert_converts :omml, :tex
  end

  def test_mathml_to_omml
    assert_converts :mathml, :omml
  end

  def test_omml_to_mathml
    assert_converts :omml, :mathml
  end

  private

  def assert_converts(from, to)
    input, expected_output = send(from), send(to)
    actual_output = TeXMath.convert(input, from: from, to: to)
    assert_equal expected_output.chomp, actual_output.chomp
    # assert_equal output, TeXMath.send(from, input).send("to_#{to}")
  end

  def tex
    '\sqrt{x^{3}}'
  end

  def mathml
    <<-XML.gsub(/^      /, '')
      <math display="block" xmlns="http://www.w3.org/1998/Math/MathML">
        <msqrt>
          <msup>
            <mi>x</mi>
            <mn>3</mn>
          </msup>
        </msqrt>
      </math>
    XML
  end

  def omml
    <<-XML.gsub(/^      /, '')
      <m:oMathPara>
        <m:oMathParaPr>
          <m:jc m:val="center" />
        </m:oMathParaPr>
        <m:oMath>
          <m:rad>
            <m:radPr>
              <m:degHide m:val="on" />
            </m:radPr>
            <m:deg />
            <m:e>
              <m:sSup>
                <m:e>
                  <m:r>
                    <m:rPr>
                      <m:sty m:val="p" />
                    </m:rPr>
                    <m:t>x</m:t>
                  </m:r>
                </m:e>
                <m:sup>
                  <m:r>
                    <m:rPr>
                      <m:sty m:val="p" />
                    </m:rPr>
                    <m:t>3</m:t>
                  </m:r>
                </m:sup>
              </m:sSup>
            </m:e>
          </m:rad>
        </m:oMath>
      </m:oMathPara>
    XML
  end
end
