class Api::V1::DepartmentsController < ApplicationController
    before_action :set_department, only: [:show, :update, :destroy, :students_count]

  def index
    @departments = Department.all

    render json: @departments
  end

  # GET /departments/1
  def show
    if stale?(last_modified: @department.updated_at)
      render json: @department
    end
  end

  def students_count
    render json: {id: @department.id, department_name: @department.d_name, students: @department.students.size}
  end

  # POST /departments
  def create
    @department = Department.new(department_params)

    if @department.save
      render json: @department, status: :created, location: @department
    else 
      render json: @department.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /departments/1
  def update
    if @department.update(department_params)
      render json: @department
    else
      render json: @department.errors, status: :unprocessable_entity
    end
  end

  # DELETE /departments/1
  def destroy
    @department.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def department_params
      params.require(:department).permit(:d_name)
    end
end
