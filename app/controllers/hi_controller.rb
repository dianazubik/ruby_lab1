
class HiController < ApplicationController
  def index
    @stud = 'Діана'
    @message = 'Моє повідомлення прийшло з контролера'
    @current_time = Time.now
  end
end
