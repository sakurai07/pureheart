class SearchController < ApplicationController
  def result
    if params[:search].present? && params[:search][:hobby].present?
      @user = User.where("hobby_1 like '%#{params[:search][:hobby]}'").order(created_at: :desc)
    else
      @user = User.all.order(created_at: :desc)
    end
  end

  def search
    # @user = User.all.order(created_at: :desc)
    # render :top
    
  end
end
