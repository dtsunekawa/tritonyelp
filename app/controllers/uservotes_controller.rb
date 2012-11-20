class UservotesController < ApplicationController

  def upvote
   
    if Uservote.check_exists( params[:pid] , params[:rid] ) == true
    	flash[:notice] = "You already liked that review!"
    else
       Uservote.upvote(params[:pid],params[:rid])
    end

    redirect_to :controller => 'stores' , :action => :show , :id => params[:sid]
  end


end
