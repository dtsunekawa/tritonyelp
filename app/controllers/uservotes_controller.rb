class UservotesController < ApplicationController

  def upvote
   
    if Uservote.check_exists( params[:pid] , params[:rid] ) == true
    	flash[:notice] = "you already voted"
    else
       Uservote.upvote(params[:pid],params[:rid])
    end

    redirect_to :controller => 'stores' , :action => :show , :id => params[:sid]
  end


end