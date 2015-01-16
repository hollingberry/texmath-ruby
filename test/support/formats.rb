module Formats
  def tex
    '\sqrt{x^{3}}'
  end

  def mathml
    <<-XML.gsub(/^      /, '').strip
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
    <<-XML.gsub(/^      /, '').strip
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

  def xhtml
    <<-XML.gsub(/^      /, '').strip
      <html xmlns="http://www.w3.org/1999/xhtml">
        <head>
          <meta content="application/xhtml+xml; charset=UTF-8" http-equiv="Content-Type" />
        </head>
        <body>
          <math display="block" xmlns="http://www.w3.org/1998/Math/MathML">
            <msqrt>
              <msup>
                <mi>x</mi>
                <mn>3</mn>
              </msup>
            </msqrt>
          </math>
        </body>
      </html>
    XML
  end

  def pandoc
    '[Math DisplayMath "\\\\sqrt{x^{3}}"]'
  end

  def native
    '[ESqrt (ESuper (EIdentifier "x") (ENumber "3"))]'
  end
end
