class Message
  include ActiveModel::Model

  attr_accessor :body

  validates :body, presence: true

  def save
    return false unless valid?

    $redis.publish 'sockjs-demo:messages', body
    $redis.lpush 'messages', body
    $redis.ltrim 'messages', 0, 9
    true
  end
end
