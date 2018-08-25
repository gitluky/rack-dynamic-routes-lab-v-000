require 'pry'
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item_found = Items.all.detect {|item| item.name == item_name}
    end
    if item_found
      resp.write item_found.price
    else
      resp.write "No item found."
      resp.status 404
    end

    resp.finish
  end

end
