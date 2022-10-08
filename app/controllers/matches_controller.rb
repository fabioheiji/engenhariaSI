class MatchesController < ApplicationController
    
  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    if @match.save 
      @matches = Match.all
      # redirect_to(id_index_path)
      redirect_to('/matches')
      
    else 
      render 'new'
    end
  end
 
  def show
    puts "Antes"
    puts Match.all
    puts "Depois"
    @matches = Match.all
  end  

  private
  def match_params
    params.require(:match).permit(:name,:description,:address,:privateCourt,:limit,:halfCourt,:level)
  end

    
end
