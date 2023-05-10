class PagesController < ApplicationController
	def index
	end

	def CV
	end

	def preview_pdf
  		@pdf_url = '/path/to/your/pdf/document.pdf'
  		render layout: 'pdf_preview'
	end
	
end
