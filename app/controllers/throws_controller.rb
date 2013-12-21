class ThrowsController < ApplicationController

  def create
  	#get the throw
  	user_throw = params[:throw]
  	#generate a random throw
  	comp_throw = [:rock, :paper, :scissors].sample
  	#compare the throws
  	status = calc_winner(user_throw, comp_throw)
  	#respond with comp throw and decision
  	render :json => {:game_result => status, :comp_throw => comp_throw}
  end

  private

  def calc_winner(user, comp)
  	play = {
	  :rock     => {:rock => :draw, :paper => 'User loses', :scissors => 'User wins'},
	  :paper    => {:rock => 'User wins', :paper => :draw, :scissors => 'User loses'},
	  :scissors => {:rock => 'User loses', :paper => 'User wins', :scissors => :draw}
	}
	play[user.to_sym][comp.to_sym]
  end

end
