class ExpensesController < ApplicationController
  def index
  	
  	if params[:concept].present? && params[:category_id].present?
  		
  		search = "%" + params[:concept] + "%"
  		@expenses = Expense.where("concept LIKE ?", search)
  		.where("category_id LIKE ?", params[:category_id]) 

  	elsif params[:concept].present? == true && params[:category_id].present? == false
  		search = "%" + params[:concept] + "%"
  		@expenses = Expense.where("concept LIKE ?", search)

  	elsif params[:concept].present? == false && params[:category_id].present? == true
  		search = "%" + params[:concept] + "%"
  		@expenses = Expense.where("category_id LIKE ?", params[:category_id])
  	else

     @expenses = Expense.order("date DESC")
 	end
  end
end
