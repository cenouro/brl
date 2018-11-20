# vim: foldmethod=marker
require "brl/version"
require 'monetize'

module Brl
  class Error < StandardError; end

  ::Money.default_currency = ::Money::Currency.new('BRL')
  ::Money.locale_backend = :currency

  def self.parse_as_rs(str)
    str = remove_thousand_dots(str)
    ::Monetize.parse!(str).format
  end

  def self.parse_as_brl(str)
    str = remove_thousand_dots(str)
    sprintf('%.2f BRL', ::Monetize.parse!(str).amount)
  end

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

