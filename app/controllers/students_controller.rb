class StudentsController < ApplicationController
    before_action :set_detail, only: %i[ show edit update destroy ]
    before_action :authenticate_user!, except: [:show, :index]

    def index
        @students = Student.all
    end

    def show
    end

    def new
        @student = Student.new
    end

    def edit
    end

    
    def create
        @student = Student.new(student_params)

        respond_to do |format|
        if @student.save
            format.html { redirect_to @student, notice: "Student was successfully created." }
            format.json { render :show, status: :created, location: @student }
        else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @student.errors, status: :unprocessable_entity }
        end
        end
    end

    def update
        respond_to do |format|
        if @student.update(student_params)
            format.html { redirect_to @student, notice: "Student was successfully updated." }
            format.json { render :show, status: :ok, location: @student }
        else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @student.errors, status: :unprocessable_entity }
        end
        end
    end


    def destroy
        @student.destroy
        respond_to do |format|
        format.html { redirect_to details_url, notice: "Student was successfully destroyed." }
        format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_student
        @student = Student.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def student_params
        params.require(:student).permit(:roll_no, :name, :email, department_attributes: [ :d_id ], subjects_attributes: [ :s_id ] )
        end

end
