class Word
  attr_accessor :score
  attr_accessor :string
  attr_accessor :vowels
  
  def initialize(string)
    @string = sanitize(string)
    score
  end

  def sanitize(string)
    string.gsub(/[,.;!?']/,"")
  end

  def score
    @score ||= vowels.map{ |v| v.size * 2**v.size }.inject(&:+).to_i
  end

  def vowels
    @vowels ||= @string.scan(/([aeiouyåäö]+)/i).flatten
  end
end