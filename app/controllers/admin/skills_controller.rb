class Admin::SkillsController < Admin::AdminController
  def new
    @skill = Skill.new
  end

  def show
    @skill = Skill.find params[:id]
  end

  def create
    @skill = Skill.create skill_params
    if @skill.save
      flash[:success] = t("skill.success")
      redirect_to [:admin, @skill]
    else
      render "new"
    end
  end

  private
  def skill_params
    params.require(:skill).permit :name
  end
end
