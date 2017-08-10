class ExpensesController < ApplicationController
  def index
  	if params[:concept] || params[:category_id]
  		search = "%" + params[:concept] + "%"
  		@expenses = Expense.where("concept LIKE ? OR category_id LIKE ?", search, params[:category_id])


  	else
     @expenses = Expense.order("date DESC")
 	end
  end
end
