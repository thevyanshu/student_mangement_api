class Api::V1::StudentsController < ApplicationController
    before_action :set_student, :set_department, only: [:show, :update, :destroy]
    before_action :authenticate_user!, except: [:show, :index]

    def index
        @students = Student.where("department_id = #{:department_id}")
        render json: @students
    end

    def show
        @students = Student.where("department_id = #{:department_id}")
        render json: @student 
    end
    
    def edit
    end

    
    def create
        @student = Student.new(student_params)
        if @student.save
            render json: @student, status: :created, location: @student
        else 
            render json: @student.errors, status: :unprocessable_entity
        end    
    end

    def update
        if @student.update(student_params)
            render json: @student
        else
      r     ender json: @student.errors, status: :unprocessable_entity
        end
    end


    def destroy
        @student.destroy
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_student
            @student = Student.find(params[:id])
        end

        def set_department
            @department = Department.find(params[:department_id])
        end
        # Only allow a list of trusted parameters through.
        def student_params
        params.require(:student).permit(:roll_no, :name, :department_id)
        end
end

