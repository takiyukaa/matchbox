class SkillsController < ApplicationController
  def show
  end

  def new
    @skill = Skill.new
      authorize @skill
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.user = current_user
    if @skill.save
      redirect_to bookings_path
      authorize @skill
    else
      render :new
    end

    # def show
    #   authorize @skill
    # end
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :description)
  end
end
