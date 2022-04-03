class TasksController < ApplicationController

    def index
        tasks = current_user.tasks
        render json: tasks
    end

    def create
        task = Task.new(task_params)
        task.user = current_user

        if task.save
            render json: task
        else
            render json: {
                error: 'failed to create task',
                },
            status: :unprocessable_entity
        end
    end

    def update
        task = Task.find_by(id: params[:id])
        if task
            task.update(task_params)
            render json: task
        else
            render json: {
                error: 'failed to update task',
                },
            status: :unprocessable_entity
        end

    end

    def destroy
        task = Task.find_by(id: params[:id])
        if task
            task.destroy
            render json: task
        else
            render json: {
                error: 'failed to delete task',
                },
            status: :unprocessable_entity
        end
    end



    private

    def task_params
        params.require(:task).permit(:description, :notes, :goal_id, :completed,)
    end
end
