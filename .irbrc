require 'rubygems'
require 'irb/completion'
require 'wirble'

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 2000

Wirble.init
Wirble.colorize
