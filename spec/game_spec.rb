require 'rspec'
require_relative '../lib/game.rb'
require_relative '../lib/ttt_board.rb'
require_relative '../dummy/dummy_player.rb'
require_relative '../dummy/dummy_ui.rb'
require_relative '../lib/human_player.rb'

describe "Game" do

  let(:ttt_board) { TTTBoard.new(3) }
  let(:foo) { DummyPlayer.new(ttt_board, {name: 'foo', letter: 'X'}) }
  let(:bar) { DummyPlayer.new(ttt_board, {name: 'bar', letter: 'O'}) }
  let(:player1) { HumanPlayer.new(ttt_board, {name: 'foo', letter: 'X'}) }
  let(:player2) { HumanPlayer.new(ttt_board, {name: 'bar', letter: 'O'}) }
  let(:ui) { DummyUI.new }
  #let(:game) { Game.new(ttt_board, [player1, player2], ui) }
  let(:game) { Game.new(ttt_board, player1, player2, ui) }

  context "#initialize" do
    it "assigns player 1 as current player and player 2 as next player" do
      foo = DummyPlayer.new(ttt_board, {name: 'foo', letter: 'X'})
      bar = DummyPlayer.new(ttt_board, {name: 'bar', letter: 'O'})
      selection = 2
      game = Game.new(ttt_board, [foo, bar], selection, ui)

      expect(game.current_player).to eq(foo)
      expect(game.next_player).to eq(bar)
    end
  end

  context "#switch_players" do
    it "switches current player to next player" do
      next_player = game.next_player
      game.switch_players

      expect(game.current_player).to eq(next_player)
    end

    it "switches next player to current player" do
      current_player = game.current_player
      game.switch_players

      expect(game.next_player).to eq(current_player)
    end
  end

  context "#player_move" do
    it "switches players after each turn if game is not over" do
      allow(game).to receive(:get_coordinates).and_return([0, 0])
      allow(ttt_board).to receive(:cell_available?).and_return(true)
      allow(player1).to receive(:move).and_return(0, 0, 'X')
      allow(ttt_board).to receive(:win?).and_return(false)
      allow(ttt_board).to receive(:draw?).and_return(false)

      expect(game).to receive(:switch_players)

      game.human_vs_human
    end

    it "prints unavailable cell message if cell is not empty" do
      allow(game).to receive(:get_coordinates).and_return([0, 0])
      allow(ttt_board).to receive(:cell_available?).and_return(false, true)
      allow(ttt_board).to receive(:write_cell).and_return(0, 0, 'X')
      allow(ttt_board).to receive(:win?).and_return(false)
      allow(ttt_board).to receive(:draw?).and_return(false)

      expect(ui).to receive(:unavailable_cell_message)

      game.get_human_move
    end
  end

  context "#play" do
    it "should display the board when game is running" do
      allow(ttt_board).to receive(:win?).and_return(false, true)
      allow(game).to receive(:player_move).and_return(3)

      expect(ttt_board).to receive(:game_grid).twice

      game.play
    end
  end

  context "#get_coordinates" do
    it "returns the correct coordinates for specified cell number and grid size" do
      expect(game.get_coordinates(1)).to eq([0, 0])
      expect(game.get_coordinates(2)).to eq([1, 0])
      expect(game.get_coordinates(3)).to eq([2, 0])
      expect(game.get_coordinates(4)).to eq([0, 1])
      expect(game.get_coordinates(5)).to eq([1, 1])
      expect(game.get_coordinates(6)).to eq([2, 1])
      expect(game.get_coordinates(7)).to eq([0, 2])
      expect(game.get_coordinates(8)).to eq([1, 2])
      expect(game.get_coordinates(9)).to eq([2, 2])
    end

    it "returns the correct coordinates for grid size 4" do
      allow(ttt_board).to receive(:grid_size).and_return(4)

      expect(game.get_coordinates(1)).to eq([0, 0])
      expect(game.get_coordinates(2)).to eq([1, 0])
      expect(game.get_coordinates(3)).to eq([2, 0])
      expect(game.get_coordinates(4)).to eq([3, 0])
      expect(game.get_coordinates(5)).to eq([0, 1])
      expect(game.get_coordinates(6)).to eq([1, 1])
      expect(game.get_coordinates(7)).to eq([2, 1])
      expect(game.get_coordinates(8)).to eq([3, 1])
      expect(game.get_coordinates(9)).to eq([0, 2])
      expect(game.get_coordinates(10)).to eq([1, 2])
      expect(game.get_coordinates(11)).to eq([2, 2])
      expect(game.get_coordinates(12)).to eq([3, 2])
      expect(game.get_coordinates(13)).to eq([0, 3])
      expect(game.get_coordinates(14)).to eq([1, 3])
      expect(game.get_coordinates(15)).to eq([2, 3])
      expect(game.get_coordinates(16)).to eq([3, 3])
    end
  end

  context "#game_over" do
    it "should display the end game board for a win" do
      allow(ttt_board).to receive(:win?).and_return(true)
      expect(ttt_board).to receive(:game_grid)

      game.play
    end

    it "should display the end game board for a draw" do
      allow(ttt_board).to receive(:draw?).and_return(true)
      expect(ttt_board).to receive(:game_grid)

      game.play
    end
  end
end
