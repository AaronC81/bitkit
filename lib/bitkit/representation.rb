# frozen_string_literal: true

module Bitkit
  module Representation
    def self.reset
      @base = :dec
      @prefix = true
      @pad = 0  
    end
    reset

    class << self
      attr_accessor :base, :pad

      attr_writer :prefix
      def prefix?; @prefix; end
    end
  end
end

# TODO: might need to patch Bignum and Fixnum on older Rubies
class Integer
  alias __bitkit_real_to_s to_s

  def to_s(*a)
    return __bitkit_real_to_s(*a) if a.length > 0

    repr = Bitkit::Representation
    case repr.base
    when :dec
      __bitkit_real_to_s
    when :hex
      "#{"0x" if repr.prefix?}#{__bitkit_real_to_s(16).rjust(repr.pad, '0')}"
    when :bin
      "#{"0b" if repr.prefix?}#{__bitkit_real_to_s(2).rjust(repr.pad, '0')}"
    else
      "(unknown base) #{__bitkit_real_to_s}"
    end
  end
  alias inspect to_s
end
