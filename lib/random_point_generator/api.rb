require 'sinatra/base'
require 'random_point_generator'
require 'rack/cors'

class RandomPointGenerator
  class API < Sinatra::Base
    use Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options]
      end
    end

    # Idea from http://www.recursion.org/2011/7/21/modular-sinatra-foreman
    configure do
      set :app_file, __FILE__
      set :port, ENV['PORT']
    end

    get '/random_point' do
      def string_to_point(value)
        value.split(',').map(&:to_f)
      end

      def sw_point
        if params[:sw_point]
          string_to_point(params[:sw_point])
        end
      end

      def ne_point
        if params[:ne_point]
          string_to_point(params[:ne_point])
        end
      end

      generator = RandomPointGenerator.new(sw_point, ne_point)

      random_point = generator.random_point

      return random_point.to_s
    end

    run! if app_file == $0
  end
end

