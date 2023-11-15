class RelationshipsController < ApplicationController
  def create
    # follower_id: params[:user_id]の記述で、生成する中間テーブルの値を指定（中間テーブルのカラムのfollower_idとparamsに格納されるuser_idが一致するインスタンスを生成）
    follow = current_user.active_relationships.new(follower_id: params[:user_id])
    follow.save
    redirect_to root_path
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_to root_path
  end
end
