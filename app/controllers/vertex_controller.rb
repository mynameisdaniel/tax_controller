class VertexController < ApplicationController
def create
    validate
  end
  
  def validate
    line_xml = %Q|
      <?xml version="1.0" encoding="UTF-8"?>
      <invoice-header>
        <tax-engine-header />
        <invoice-lines>
          <invoice-line>
            <line-num>1</line-num>
            <tax-lines>
              <tax-line>
                <line-num>1</line-num>
                <tax-engine-line>0.00</tax-engine-line>
              </tax-line>
            </tax-lines>
          </invoice-line>
        </invoice-lines>
      </invoice-header>
      |.strip

    hdr_xml = %Q|
      <?xml version="1.0" encoding="UTF-8"?>
      <invoice-header>
        <tax-engine-header>0.00</tax-engine-header>
      </invoice-header>
      |.strip

    qa_xml = %Q|
      <?xml version="1.0" encoding="UTF-8"?>
      <invoice-header>
        <tax-engine-header>0.00</tax-engine-header>
        <invoice-lines>
          <invoice-line>
            <line-num>1</line-num>
            <tax-lines>
              <tax-line>
                <line-num>1</line-num>
                <tax-engine-line>0</tax-engine-line>
              </tax-line>
            </tax-lines>
          </invoice-line>
        </invoice-lines>
      </invoice-header>
      |.strip

    respond_to do |format|
  	  format.xml { render xml: qa_xml, status: :ok }
  	end
  end
end
