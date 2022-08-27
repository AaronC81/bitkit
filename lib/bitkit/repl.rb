# frozen_string_literal: true

require 'irb'
require_relative 'representation'

# We specifically check for false, not nil, because nil means default, which could be true
if IRB.conf[:USE_MULTILINE] != false
  puts "Warning: It looks like you are using the multiline IRB editor."
  puts "         Switching number formats could cause formatting issues."
  puts "         Running IRB with --nomultiline is strongly recommended."
end
if IRB.conf[:USE_COLORIZE] != false
  puts "Warning: It looks like you are using IRB with colour enabled."
  puts "         Switching number formats could cause formatting issues."
  puts "         Running IRB with --nocolorize is strongly recommended."
end

def dec!
  Bitkit::Representation.base = :dec
  nil
end

def hex!
  Bitkit::Representation.base = :hex
  nil
end

def bin!
  Bitkit::Representation.base = :bin
  nil
end

def prefix!(value)
  Bitkit::Representation.prefix = value
  nil
end

def pad!(value)
  Bitkit::Representation.pad = value
  nil
end
