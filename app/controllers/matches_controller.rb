class MatchesController < ApplicationController
  def index
    @matches = Match.search(params[:search])
  end  
    
  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    if @match.save 
      @matches = Match.all
      redirect_to('/matches')
    else 
      render :new, status: :unprocessable_entity, content_type: "text/html"
      headers["Content-Type"] = "text/html"
    end
  end
 
  def create_participate_in_match    
    @user = User.find(params['participate_in_match']['user_id'])
    @match = Match.find(params['participate_in_match']['match_id'])
    
    
    if @match.users.include? @user      
      @match.users.delete(@user)
    else
      @match.users << @user
    end
    redirect_to '/matches/' + @match.id.to_s
  end

  def show
    @match = Match.find(params[:id])
    @user = User.find(session[:user_id])
    
    @join_button_on = true
    if @match.users.include? @user
      @join_button_on = false
    end
  end

  private
  def match_params
    params.require(:match).permit(:name, :description, :address, :privateCourt, :limit, :halfCourt, :level, :starts_at)
  end

end
