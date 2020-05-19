#!/usr/bin/env ruby
# frozen_string_literal: true

require 'bundler/setup'
require 'cryptoexchange'
require 'logger'

logger = Logger.new(STDOUT)
dce = ARGV[0]

begin
  abort 'Enter DCE' if dce.nil? || dce == ''
  pairs = Cryptoexchange::Client.new.pairs(dce)
rescue StandardError => e
  logger.error(e.message)
  logger.error(e.backtrace.join("\n"))
else
  pairs.each { |p| puts "#{p.base}-#{p.target}" }
end
