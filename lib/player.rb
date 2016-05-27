class Player
  attr_accessor :board, :ui
  attr_reader :name, :letter

  def initialize(board, ui, input)
    @board = board
    @ui = ui
    @name = input.fetch(:name)
    @letter = input.fetch(:letter)
  end
end
