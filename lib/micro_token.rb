require "micro_token/version"
require 'securerandom'

module MicroToken
  ALPHA_CHARS = ('a'..'z').to_a + ('A'..'Z').to_a

  def self.generate(length=8,format=:alphanumeric)
    (1..length).collect { self.send("_generate_#{format}_char") }.join
  end

  private

  def self._generate_alphanumeric_char
    (i = rand(62); i += ((i < 10) ? 48 : ((i < 36) ? 55 : 61 ))).chr
  end

  def self._generate_numeric_char
    rand(9)
  end

  def self._generate_alpha_char
    ALPHA_CHARS[rand(ALPHA_CHARS.size)]
  end

  private

  def rand(n)
    SecureRandom.random_number(n)
  end
end

