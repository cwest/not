class PeekBar
  def self.available?
    !defined?(Peek).nil?
  end

  def self.enabled?(current_user)
    return false unless available?

    Rails.env.development? || current_user
  end
end
