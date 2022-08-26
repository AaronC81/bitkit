# frozen_string_literal: true

require_relative 'representation'

def dec!
  Bitkit::Representation.base = :dec
end

def hex!
  Bitkit::Representation.base = :hex
end

def bin!
  Bitkit::Representation.base = :bin
end

def prefix!(value)
  Bitkit::Representation.prefix = value
end

def pad!(value)
  Bitkit::Representation.pad = value
end
