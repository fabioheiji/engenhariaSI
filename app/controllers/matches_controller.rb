class MatchesController < ApplicationController
  def index
    @matches = Match.search(params[:search])

    @matches = @matches.filter_by_starts_at(params[:starts_at]) if params[:starts_at].present? 
    @matches = @matches.filter_by_limit(params[:limit]) if params[:limit].present?
    @matches = @matches.filter_by_level(params[:level]) if params[:level].present?
    @matches = @matches.filter_by_half_court(params[:half_court]) if params[:half_court].present?
  end  
    
  def new
    @match = Match.new
  end

  def edit
    if !is_owner?
      redirect_to root_path, status: :forbidden
    end
  end

  def update
    if is_owner?
      if @current_match.update(match_params)
        redirect_to @current_match, notice: 'Partida editada com sucesso!', status: :no_content
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to root_path, status: :forbidden
    end
  end

  def create
    user = User.find(session[:user_id])
    @match = Match.new(match_params)
    @match.user = user
    if @match.save 
      @match.users << user
      @matches = Match.all
      redirect_to matches_path, notice: "Partida criada com sucesso!"
    else 
      render :new, status: :unprocessable_entity, content_type: "text/html"
      headers["Content-Type"] = "text/html"
    end
  end

  def destroy
    @match = Match.find(params[:id])

    if is_owner?
      @match.destroy
      redirect_to root_path, status: :see_other
    else
      redirect_to root_path, status: :forbidden
    end
  end


  def create_participate_in_match   
    @user = User.find(params['participate_in_match']['user_id'])
    @match = Match.find(params['participate_in_match']['match_id'])

    if @match.users.include? @user      
      @match.users.delete(@user)
      redirect_to '/matches/' + @match.id.to_s
    else
      if params['participate_in_match']['privateMatchPassword'] == @match.privateMatchPassword
        @match.users << @user
        redirect_to '/matches/' + @match.id.to_s
      else        
        @msg = 'Senha incorreta! Tente novamente.'
        @join_button_on = true
        render :show, status: :unprocessable_entity, content_type: "text/html"
        headers["Content-Type"] = "text/html"
      end
    end
    
  end

  def show
    @match = Match.find(params[:id])
    @user = User.find(session[:user_id])
    
    @join_button_on = !(@match.users.include? @user)
    @full_match = @match.users.length() === @match.limit.to_i
    @can_kick_players = @match.user_id === @user.id
  end

  def kick_player
    @user = User.find(params['user_id'])
    @match = Match.find(params['match_id'])
    @player = User.find(params['player_id'])

    if @match.users.include? @player      
      @match.users.delete(@player)
    end

    redirect_to '/matches/' + @match.id.to_s
  end

  private
  def match_params
    params.require(:match).permit(:name, :description, :address, :privateCourt, :limit, :halfCourt, :level, :starts_at, :privateMatch, :privateMatchPassword)
  end
end
