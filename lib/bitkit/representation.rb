# frozen_string_literal: true

module Bitkit
  module Representation
    def self.reset
      @base = :dec
      @prefix = true
      @pad = 0  
    end
    reset

    def self.represent(value, *a)
      return value.__bitkit_real_to_s(*a) if a.length > 0

      case base
      when :dec
        value.__bitkit_real_to_s
      when :hex
        "#{"0x" if prefix?}#{value.__bitkit_real_to_s(16).rjust(pad, '0')}"
      when :bin
        "#{"0b" if prefix?}#{value.__bitkit_real_to_s(2).rjust(pad, '0')}"
      else
        "(unknown base) #{value.__bitkit_real_to_s}"
      end
    end

    class << self
      attr_accessor :base, :pad

      attr_writer :prefix
      def prefix?; @prefix; end
    end
  end
end

# Older Rubies (<2.4) have separate Fixnum and Bignum classes which subclass Integer.
# Newer Rubies (>=2.4) just use Integer, but include the old classes as aliases.
# This causes a warning, so temporarily silence those.
old_verbose = $VERBOSE
$VERBOSE = nil
uses_unified_integer = (Integer == Bignum)
$VERBOSE = old_verbose

if uses_unified_integer
  class Integer
    alias __bitkit_real_to_s to_s
    def to_s(*a)
      Bitkit::Representation.represent(self, *a)
    end
    alias inspect to_s
  end
else
  class Fixnum
    alias __bitkit_real_to_s to_s
    def to_s(*a)
      Bitkit::Representation.represent(self, *a)
    end
    alias inspect to_s
  end

  class Bignum
    alias __bitkit_real_to_s to_s
    def to_s(*a)
      Bitkit::Representation.represent(self, *a)
    end
    alias inspect to_s
  end
end
