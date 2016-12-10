class MySinatraApp < Sinatra::Base
  get "/sinatra" do
    "Hello from Sinatra"
  end
end

class SinatraMiddleware
  def initialize(app)
    @rails_app = app
  end

  def call(env)
    if env["PATH_INFO"] =~ %r{^/sinatra}
      MySinatraApp.call(env)
    else
      @rails_app.call(env)
    end
  end
end
