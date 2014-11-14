module MessagesHelper
  def node_url
    if Rails.env.production?
      'http://sockjs-demo-node.herokuapp.com/broadcast'
    else
      'http://localhost:5000/broadcast'
    end
  end
end
