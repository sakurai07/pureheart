class SearchController < ApplicationController
  def result
    if params[:search].present? && params[:search][:hobby].present?
      @user = User.where("hobby_1 like '%#{params[:search][:hobby]}'").order(created_at: :desc)
    elsif params[:search].present? && params[:search][:grade].present? && params[:search][:klass].present?
      @user = User.where("grade == #{params[:search][:grade]} and klass == #{params[:search][:klass]}").order(created_at: :desc)
      # if params[:search].present? && params[:search][:grade].present?
      #   @user = User.where("grade like '%#{params[:search][:grade]}'").order(created_at: :desc)
      # # elsif params[:search].present? && params[:search][:klass].present?
      # #   @user = User.where("klass like '%#{params[:search][:klass]}'").order(created_at: :desc)
      # end
    else
      @user = User.all.order(created_at: :desc)
    end
  end

  def search
    # @user = User.all.order(created_at: :desc)
    # render :top
    
  end
end
