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

  def update
    @skill = Skill.find params[:id]
    if @skill.update_attributes skill_params
      render json: @skill
    else
      render "edit"
    end
  end

  def destroy
    Skill.find(params[:id]).destroy
    head :no_content
  end

  private
  def skill_params
    params.require(:skill).permit :name
  end
end
