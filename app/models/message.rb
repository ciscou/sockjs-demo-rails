class Message
  include ActiveModel::Model

  attr_accessor :body

  validates :body, presence: true

  def save
    return false unless valid?

    $redis.rpush 'sockjs-demo:messages', body
    true
  end
end
