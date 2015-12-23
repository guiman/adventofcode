require 'digest'

class Checker
  TEMPLATE = "%{key}%{number}"

  def initialize(key)
    @key = key
  end

  def match?(number)
    test = TEMPLATE % { number: number, key: @key }
    if Digest::MD5.hexdigest(test).to_s[0..5] == "000000"
      number
    else
      nil
    end
  end
end
