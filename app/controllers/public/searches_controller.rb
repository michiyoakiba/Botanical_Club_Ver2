class Public::SearchesController < ApplicationController
    
  def search
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == 'customer'
			@records = Customer.search_for(@content, @method).page(params[:page]).per(5)
		else
			@records = Plant.search_for(@content, @method).page(params[:page]).per(3)
		end
  end
  
end