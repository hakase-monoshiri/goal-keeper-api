class GoalsController < ApplicationController

    def index
        goals = current_user.goals
        render json: {
            goals: goals.map{ |goal|

                {
                id: goal.id,
                name: goal.name,
                description: goal.description,
                percent_complete: goal.percent_complete,
                completed: goal.completed,
                archived: goal.archived,
                tasks: goal.tasks
                }
            },
        }

    end

    def show 
        goal = Goal.find_by(id: params[:id])
        render json: {
            id: goal.id,
            name: goal.name,
            description: goal.description,
            percent_complete: goal.percent_complete,
            completed: goal.completed,
            archived: goal.archived,
            tasks: goal.tasks
        }
    end

    def create
        goal = Goal.new(goals_params)
        goal.user = current_user

        if goal.save
            render json: goal
        else
            render json: {
                error: 'failed to create goal',
                },
            status: :unprocessable_entity
        end
    end

    def destroy 
        goal = Goal.find_by(id: params[:id])
        if goal
            goal.destroy
            render json: goal
        else
            render json: {
                error: 'failed to delete goal',
                },
            status: :unprocessable_entity
        end
    end

    private 

    def goals_params
        params.require(:goal).permit(:name, :description, :completed, :archived, :user_id)
    end

end
