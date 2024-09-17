require_relative "board"

# this class will be used tp implement movement of knight on the chess board
class Knight
  def initialize(position = [0, 0])
    @position = position
  end

  def valid_moves(position = @position)
    i, j = position

    moves = [
      [i - 2, j + 1], [i - 2, j - 1],
      [i - 1, j - 2], [i + 1, j - 2],
      [i + 2, j - 1], [i + 2, j + 1],
      [i - 1, j + 2], [i + 1, j + 2]
    ]

    moves.select { |mi, mj| mi.between?(0, 7) && mj.between?(0, 7) }
  end

  def knight_moves(position, target)
    queue = [[position]] # Path tracking, starting with the initial position
    visited = [] # To track visited positions

    until queue.empty?
      path = queue.shift # Dequeue the first path
      current_position = path.last # The current position is the last element in the path

      return path if current_position == target

      # skip is the position has been visited

      next if visited.include?(current_position)

      visited << current_position

      neighbours = valid_moves(current_position)

      # for each valid move add a new path

      neighbours.each do |neighbour|
        queue.push(path + [neighbour]) unless visited.include?(neighbour)
      end
    end
  end
end
