class FriendshipsController < ApplicationController

  def create

    friend=User.find(params[:friend_id])
    current_user.friendships.build(friend_id: friend.id)

    #Friendship.create(user_id: current_user.id,friend_id: friend.id)
    

    if current_user.save
      flash[:notice]="Following friend"
    else
      flash[:alert]="There was something wrong"
    end

    redirect_to my_friends_path

  end

  def destroy

    friendship=current_user.friendships.where(friend_id: params[:id]).take

    friendship.destroy

    flash[:notice]="Stopped following"

    redirect_to my_friends_path

  end

end
