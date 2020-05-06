class SearchController < ApplicationController
  def search
  	@book = Book.new
  	if params[:model] == 'user'
	  	if params[:type] == 'perfect_match'
		  	@users = User.where(name: params[:term])
	    elsif params[:type] == 'part_match'
		  	@users = User.where('name like ?', "%#{params[:term]}%")
		elsif params[:type] == 'foward_match'
			@users = User.where('name like ?', "#{params[:term]}%")
		elsif params[:type] == 'back_match'
			@users = User.where('name like ?', "%#{params[:term]}")
		end
		render 'users/index'
	else params[:model] == 'book'
		if params[:type] == 'perfect_match'
			@books = Book.where(title: params[:term])
		elsif params[:type] == 'part_match'
			@books = Book.where('title like ?', "%#{params[:term]}%")
		elsif params[:type] == 'foward_match'
			@books = Book.where('title like ?', "#{params[:term]}%")
		elsif params[:type] == 'back_match'
			@books = Book.where('title like ?', "%#{params[:term]}")
		end
		render 'books/index'
	end
  end

end
