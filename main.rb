require "rubocop"
require_relative "lib/board"
require_relative "lib/knight"

knight = Knight.new
p knight.knight_moves([0, 0], [7, 7])
