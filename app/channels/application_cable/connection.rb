# to run any sort of code before the connection between a user and the server is established
module ApplicationCable
  class Connection < ActionCable::Connection::Base
  end
end
