class Admin::PositionsController < Admin::AdminController
  def index
    @positions = Position.paginate page: params[:page]
  end

  def show
    @position = Position.find params[:id]
  end

  def new
    @position = Position.new
  end

  def create
    @position = Position.create position_params
    if @position.save
      flash[:success] = t "position.success"
      redirect_to [:admin, @position]
    else
      render "new"
    end
  end

  def edit
    @position = Position.find params[:id]
  end

  def update
    @position = Position.find params[:id]
    if @position.update_attributes position_params
      flash[:success] = t "position.update"
      redirect_to [:admin, @position]
    else
      render "edit"
    end
  end

  def destroy
    Position.find(params[:id]).destroy
    flash[:success] = t "position.delete"
    redirect_to admin_positions_url
  end

  private
  def position_params
    params.require(:position).permit :name, :abbreviation
  end
end
