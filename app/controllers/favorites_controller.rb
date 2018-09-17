class FavoritesController < ApplicationController
  before_action :require_user_logged_in, only: [:create, :destroy] #お気に入りできるのはログインユーザーのみ
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.like(micropost)
    flash[:success] = 'ポストをお気に入りしました。'
    redirect_to :back
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unlike(micropost)
    flash[:success] = 'ポストのお気に入りを解除しました。'
    redirect_to :back
  end
end
