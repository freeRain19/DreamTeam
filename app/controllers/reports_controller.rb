class ReportsController < ApplicationController

  #before_action :set_team, only: [:show, :edit, :update, :destroy]
  # GET /teams
  # GET /teams.json


  def index
    @models=['task', 'team', 'user', 'project', 'post', 'comment']
    # redirect_to reports_path, notice: 'HI'
    @models.each do |model|
      puts model
    end
    @models
  end

  def search
if params[:team_id].present?
  puts :team_id
end
  end


  # GET /teams/1
  # GET /teams/1.json
  def show

  end

  # GET /teams/new


  # GET /teams/1/edit
  def edit

  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def team_params
    params.require(:team).permit(:name)
  end

  def search_params
    params.require(:reports).permit(:task_id)
  end
end
