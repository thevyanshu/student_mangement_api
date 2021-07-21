class TeachersController < ApplicationController
    before_action :set_teacher, only: %i[ show edit update destroy ]
    before_action :authenticate_user!, except: [:show, :index]

    def index
        @teachers = Teacher.all.paginate(page: params[page], per_page: 15)
    end

    def show
        @subject = Subject.find(@teacher.subject_id)
    end
    
    def new
        @teacher = Teacher.new
    end

    def edit
    end

    
    def create
        @teacher = Teacher.new(teacher_params)

        respond_to do |format|
        if @teacher.save
            format.html { redirect_to @teacher, notice: "teacher was successfully enrolled." }
            format.json { render :show, status: :created, location: @teacher }
        else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @teacher.errors, status: :unprocessable_entity }
        end
        end
    end

    def update
        respond_to do |format|
        if @teacher.update(teacher_params)
            format.html { redirect_to @teacher, notice: "teacher was successfully updated." }
            format.json { render :show, status: :ok, location: @teacher }
        else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @teacher.errors, status: :unprocessable_entity }
        end
        end
    end


    def destroy
        respond_to do |format|
            if @teacher.destroy
                format.html { redirect_to teachers_url, notice: "teacher was removed destroyed." }
                format.json { head :no_content }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @teacher.errors, status: :unprocessable_entity }
            end
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_teacher
        @teacher = Teacher.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def teacher_params
        params.require(:teacher).permit(:id_number, :name, :subject_id )
        end
end
