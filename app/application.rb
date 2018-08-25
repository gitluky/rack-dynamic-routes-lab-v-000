require 'pry'
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item_found = Items.all.detect {|item| item.name == item_name}
      resp.write item_found.price
  end

end
