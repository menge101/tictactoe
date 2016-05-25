class DummyPlayer

  attr_accessor :board
  attr_reader :name, :letter

  def initialize(board, input)
    @board = board
    @name = "hey"
    @letter = "X"
  end
end
