Rails.application.config.middleware.insert_before 0, Rack::Cors, debug: true, logger: (-> { Rails.logger }) do
    allow do
      origins 'localhost:3001', '127.0.0.1:3001'
  
      resource '/cors',
        :headers => :any,
        :methods => [:post],
        :max_age => 0
  
      resource '*',
        :headers => :any,
        :methods => [:get, :post, :delete, :put, :patch, :options, :head],
        :max_age => 0
    end
  end
