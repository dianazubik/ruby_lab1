
class ConferenceSessionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conference_session, only: %i[show edit update destroy]

  def index
    @conference_sessions = if current_user.admin?
      ConferenceSession.all
    else
      current_user.conference_sessions
    end
  end

  def show
  end

  def new
    @conference_session = current_user.conference_sessions.new
  end

  def edit
  end

  def create
    @conference_session = current_user.conference_sessions.new(conference_session_params)

    if @conference_session.save
      redirect_to @conference_session,
                  notice: "Виступ успішно створено.",
                  status: :see_other
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @conference_session.update(conference_session_params)
      redirect_to @conference_session,
                  notice: "Виступ успішно оновлено.",
                  status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @conference_session.destroy!

    redirect_to conference_sessions_path,
                notice: "Виступ успішно видалено.",
                status: :see_other
  end

  private

  def set_conference_session
    @conference_session = if current_user.admin?
      ConferenceSession.find(params[:id])
    else
      current_user.conference_sessions.find(params[:id])
    end
  end

  def conference_session_params
    params.expect(conference_session: [
      :title,
      :description,
      :track,
      :conference_day,
      :image
    ])
  end
end
