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
      render json: @skill
    else
      render "new"
    end
  end

  def index
    @skills = Skill.paginate page: params[:page]
  end

  def edit
    @skill = Skill.find params[:id]
  end

  def update
    @skill = Skill.find params[:id]
    if @skill.update_attributes skill_params
      flash[:success] = t "skill.update"
      redirect_to [:admin, @skill]
    else
      render "edit"
    end
  end

  def destroy
    Skill.find(params[:id]).destroy
    flash[:success] = t "skill.delete"
    redirect_to admin_skills_url
  end

  private
  def skill_params
    params.require(:skill).permit :name
  end
end
