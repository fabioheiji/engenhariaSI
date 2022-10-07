class MatchesController < ApplicationController
    def new
    end

    def create
        @match = Match.new
        @match.save
    end

    def show
        @match = Match.find(params[:id])
    end
    
    private
end
