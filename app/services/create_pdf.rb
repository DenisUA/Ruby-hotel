class CreatePdf
  def initialize(order)
    @order = order
  end

  def make_pdf_from_html
    WickedPdf.new.pdf_from_string(
      ActionController::Base.new.render_to_string(
        template: 'templates/invoice.pdf.slim',
        locals: {
          order: @order
        }
      ),
      pdf: 'invoice',
      layout: 'pdf.slim'
    )
  end
end
