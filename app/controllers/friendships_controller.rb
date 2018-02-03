class FriendshipsController < ApplicationController
  def index
    @member = Member.find(params[:member_id])
    @members = Member.where.not(id: @member.id)
    @friends = @member.friends
    @not_friends = @members - @friends
  end

  def create
    #Establish a 2 way relationship here
    member = Member.find(params[:member_id])
    friend = Member.find(params[:friend_id])
    @friendship_to = Friendship.new(:member_id => member.id, :friend_id => friend.id)
    @friendship_from = Friendship.new(:member_id => friend.id, :friend_id => member.id)
    ActiveRecord::Base.transaction do
      if @friendship_to.save && @friendship_from.save
        redirect_to :action => "index"
      else
        #Needs error messaging
        redirect_to :action => "index"
      end
    end
    
  end
end
