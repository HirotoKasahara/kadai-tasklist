class TasksController < ApplicationController
    before_action :require_user_logged_in
    before_action :set_task,only: [:show,:edit,:update,:destroy]
    
    def index 
        @tasks = current_user.tasks.order(id: :desc)
    end 
    def show
        
    end 
    def new
        @task = Task.new
    end 
    
    def create
        @task = current_user.tasks.build(task_params)
        
        if @task.save
            flash[:success]="タスクを追加しました"
            redirect_to @task
        else
            flash.now[:danger]="追加できませんでした"
            render :new
        end 
    end 
    def edit
       
    end 
    def update
       
        
        if @task.update(task_params)
            flash[:success]="更新しました"
            redirect_to @task
        else
            flash.now[:danger]="更新失敗しました"
            render :edit
        end 
    end 
    def destroy
        
         @task.destroy
        flash[:success]="削除しました"
        redirect_to root_url
    end 
    
    private
    def task_params
        params.require(:task).permit(:content,:status)
    end 
    
    def set_task
        @task = current_user.tasks.find_by(id: params[:id])
    end 
end
