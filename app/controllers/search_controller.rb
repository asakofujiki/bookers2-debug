class SearchController < ApplicationController
  def search
  	if params[:model] == 'user'
	  	if params[:type] == 'perfect_macth'
		  	@users = User.where(name: params[:term])
	    elsif params[:type] == 'part_match'
		  	@users = User.where('name like ?', "%#{params[:term]}%")
		elsif params[:type] == 'foward_match'
			@users = User.where('name like ?', "#{params[:term]}%")
		elsif params[:type] == 'back_match'
			@users = User.where('name like ?', "%#{params[:term]}")
		end
	else params[:model] == 'book'
		if params[:type] == 'perfect_macth'
			@books = Book.where(title: params[:term])
		elsif params[:type] == 'part_match'
			@books = Book.where('title like ?', "%#{params[:term]}%")
		elsif params[:type] == 'foward_match'
			@books = Book.where('title like ?', "#{params[:term]}%")
		elsif params[:type] == 'back_match'
			@books = Book.where('title like ?', "%#{params[:term]}")
		end
	end
  end

end
