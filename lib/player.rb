class Player
  attr_accessor :board
  attr_reader :name, :letter

  def initialize(board, input)
    @board = board
    @name = input.fetch(:name)
    @letter = input.fetch(:letter)
  end
end
