class SearchController < ApplicationController
  def result
    if params[:search].present? && params[:search][:hobby].present? && params[:search][:grade].present? && params[:search][:klass].present?
      @user = User.where("id <> #{current_user.id} and (hobby_1 like '%#{params[:search][:hobby]}' or hobby_2 like '%#{params[:search][:hobby]}' or hobby_3 like '%#{params[:search][:hobby]}' or hobby_4 like '%#{params[:search][:hobby]}' or hobby_5 like '%#{params[:search][:hobby]}') and (grade like '%#{params[:search][:grade]}' and klass like '%#{params[:search][:klass]}') ").order(created_at: :desc)
    elsif params[:search].present? && params[:search][:hobby].present? && params[:search][:grade].present?
      @user = User.where("id <> #{current_user.id} and (hobby_1 like '%#{params[:search][:hobby]}' or hobby_2 like '%#{params[:search][:hobby]}' or hobby_3 like '%#{params[:search][:hobby]}' or hobby_4 like '%#{params[:search][:hobby]}' or hobby_5 like '%#{params[:search][:hobby]}') and (grade like '%#{params[:search][:grade]}') ").order(created_at: :desc)
    elsif params[:search].present? && params[:search][:hobby].present? && params[:search][:klass].present?
      @user = User.where("id <> #{current_user.id} and (hobby_1 like '%#{params[:search][:hobby]}' or hobby_2 like '%#{params[:search][:hobby]}' or hobby_3 like '%#{params[:search][:hobby]}' or hobby_4 like '%#{params[:search][:hobby]}' or hobby_5 like '%#{params[:search][:hobby]}') and (klass like '%#{params[:search][:klass]}') ").order(created_at: :desc)
    elsif params[:search].present? && params[:search][:grade].present? && params[:search][:klass].present?#学年と組一致
      @user = User.where("grade = #{params[:search][:grade]} and klass = #{params[:search][:klass]} and id <> #{current_user.id}").order(created_at: :desc)
    elsif params[:search].present? && params[:search][:grade].present?#学年が一致
      @user = User.where("id <> #{current_user.id} and grade like '%#{params[:search][:grade]}'").order(created_at: :desc)
    elsif params[:search].present? && params[:search][:klass].present?#組が一致
      @user = User.where("id <> #{current_user.id} and klass like '%#{params[:search][:klass]}'").order(created_at: :desc)
    elsif params[:search].present? && params[:search][:hobby].present?#趣味一致
      @user = User.where("id <> #{current_user.id} and (hobby_1 like '%#{params[:search][:hobby]}' or hobby_2 like '%#{params[:search][:hobby]}' or hobby_3 like '%#{params[:search][:hobby]}' or hobby_4 like '%#{params[:search][:hobby]}' or hobby_5 like '%#{params[:search][:hobby]}')").order(created_at: :desc) 
    else
      @user = []
      flash.now[:danger] = "検索条件を入力してください"
    end

    @follow = Follow.all
    
  end

  def search
    # @user = User.all.order(created_at: :desc)
    # render :top
  end
end
