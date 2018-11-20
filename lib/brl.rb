require "brl/version"
require 'monetize'

module Brl
  class Error < StandardError; end

  def self.remove_thousand_dots(str)
    str = str.to_s

    a = str.split('.')
    if a.size == 1
      a[0]
    else
      [a[0...-1].join(''), a[-1]].join('.')
    end
  end
end
