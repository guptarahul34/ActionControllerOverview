class HomeController < ApplicationController
  include ActionController::Live
  def index
    # binding.pry
    @cookies_data = cookies.encrypted[:current_user_id]
  end

  

  def stream
    response.headers['Content-Type'] = 'text/event-stream'
    # 10.times {
    #   response.stream.write "hello world\n"
    #   sleep 3
    # }
    User.all.each do |user|
      response.stream.write user.username+"\n"
      sleep 5
    end
  ensure
    response.stream.close
  end

end
