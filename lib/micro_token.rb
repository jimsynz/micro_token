require "micro_token/version"
require 'securerandom'

module MicroToken
  SIMILAR_CHARS = %w(I l 1 0 O).freeze
  LOWER_ALPHA_CHARS = ('a'..'z').to_a.freeze
  UPPER_ALPHA_CHARS = ('A'..'Z').to_a.freeze
  NUMERIC_CHARS = (0..9).map(&:to_s).freeze
  ALPHA_CHARS = (LOWER_ALPHA_CHARS + UPPER_ALPHA_CHARS).freeze
  ALPHANUMERIC_CHARS = (ALPHA_CHARS + NUMERIC_CHARS).freeze
  VISUALLY_DISTINCT_CHARS = (ALPHANUMERIC_CHARS - SIMILAR_CHARS).freeze

  class << self

    def generate length = 8, format = :alphanumeric
      (1..length).collect { send("generate_#{format}_char") }.join
    end

    private

    def generate_distinct_char
      pick_from(VISUALLY_DISTINCT_CHARS)
    end

    def generate_uppercase_char
      pick_from(UPPER_ALPHA_CHARS)
    end

    def generate_lowercase_char
      pick_from(LOWER_ALPHA_CHARS)
    end

    def generate_alphanumeric_char
      pick_from(ALPHANUMERIC_CHARS)
    end

    def generate_numeric_char
      pick_from(NUMERIC_CHARS)
    end

    def generate_alpha_char
      pick_from(ALPHA_CHARS)
    end

    def rand n
      SecureRandom.random_number(n)
    end

    def pick_from ary
      ary[rand(ary.size)]
    end

  end
end
