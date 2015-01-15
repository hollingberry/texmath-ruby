require 'test_helper'

class ConversionTest < Minitest::Test
  def test_latex_to_mathml
    assert_converts :latex, :mathml
  end

  def test_mathml_to_latex
    assert_converts :mathml, :latex
  end

  def test_latex_to_omml
    assert_converts :latex, :omml
  end

  def test_omml_to_latex
    assert_converts :omml, :latex
  end

  def test_mathml_to_omml
    assert_converts :mathml, :omml
  end

  def test_omml_to_mathml
    assert_converts :omml, :mathml
  end

  private

  def assert_converts(from, to)
    input, output = send(from), send(to)
    assert_equal output, TeXMath.convert(input, from: from, to: to)
    assert_equal output, TeXMath.send(from, input).send("to_#{to}")
  end

  def latex
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
