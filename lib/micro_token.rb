require "micro_token/version"
require 'securerandom'

module MicroToken
  EXCLUDE_CHARS = [ "I", "l", "1" ]
  LOWER_ALPHA_CHARS = ('a'..'z').to_a
  UPPER_ALPHA_CHARS = ('A'..'Z').to_a
  NUMERIC_CHARS = (0..9).to_a
  ALPHA_CHARS = LOWER_ALPHA_CHARS + UPPER_ALPHA_CHARS - EXCLUDE_CHARS
  ALPHANUMERIC_CHARS = ALPHA_CHARS + NUMERIC_CHARS - EXCLUDE_CHARS

  class << self

    def generate(length=8,format=:alphanumeric)
      (1..length).collect { self.send("_generate_#{format}_char") }.join
    end

    private

    def _generate_uppercase_char
      pick_from(UPPER_ALPHA_CHARS)
    end

    def _generate_lowercase_char
      pick_from(LOWER_ALPHA_CHARS)
    end

    def _generate_alphanumeric_char
      pick_from(ALPHANUMERIC_CHARS)
    end

    def _generate_numeric_char
      pick_from(NUMERIC_CHARS)
    end

    def _generate_alpha_char
      pick_from(ALPHA_CHARS)
    end

    def rand(n)
      SecureRandom.random_number(n)
    end

    def pick_from(ary)
      ary[rand(ary.size)]
    end

  end
end
