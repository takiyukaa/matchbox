class SkillsController < ApplicationController
  def show
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.user = current_user
    if @skill.save
      # redirect_to bookings_path(current_user)
      redirect_to @skill
    else
      render :new
    end
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :description)
  end
end
