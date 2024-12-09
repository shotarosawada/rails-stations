module Admin
  class SchedulesController < ApplicationController
    
    before_action :set_schedule, only: %i[show edit update destroy]

    # スケジュール一覧表示
    def index
      @movies = Movie.joins(:schedules).distinct
    end

    # スケジュール詳細表示
    def show
    end

    # スケジュール編集フォーム表示
    def edit
    end

    # スケジュール更新処理
    def update
      if @schedule.update(schedule_params)
        redirect_to admin_schedule_path(@schedule), notice: 'スケジュールを更新しました。'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # スケジュール削除処理
    def destroy
      @schedule.destroy
      redirect_to admin_schedules_path, notice: 'スケジュールを削除しました。'
    end

    private

    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    def schedule_params
      params.require(:schedule).permit(:start_time, :end_time)
    end
  end
end