class DummyPlayer

  attr_accessor :board, :ui
  attr_reader :name, :letter

  def initialize(board, ui, input)
    @board = board
    @ui = ui
    @name = "hey"
    @letter = "X"
  end

  def move
    "writes value"
  end

  def human_coordinates
    [1, 2]
  end

  def get_cell_number
    3
  end
end
