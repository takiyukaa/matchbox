class SkillsController < ApplicationController

  def index
    if params[:query].present?
      @skills = policy_scope(Skill).global_search(params[:query])
    else
      @skills = policy_scope(Skill)
    end
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
  end

  def edit
    @skill = Skill.find(params[:id])
      authorize @skill
  end

  def update
    @skill = Skill.find(params[:id])
    if @skill.update(skill_params)
      redirect_to bookings_path
      authorize @skill
    else
      render :edit
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
      authorize @skill
    @skill.destroy
    redirect_to bookings_path
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :description)
  end
end
