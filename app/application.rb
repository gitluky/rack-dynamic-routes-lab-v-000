require 'pry'
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    binding.pry
    if req.path.include?("/items/")
      item_name = req.path.gsub("/+items/", "")
    end

  end

end
