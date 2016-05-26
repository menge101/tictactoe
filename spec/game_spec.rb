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
  let(:ui) { DummyUI.new }
  let(:game) { Game.new(ttt_board, [foo, bar], 2, ui) }

  context "#initialize" do
    it "assigns player 1 as current player and player 2 as next player" do
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

    it "switches players after each turn if game is not over" do
      expect(game).to receive(:switch_players)

      game.human_vs_human_move
    end
  end

  context "#play" do
    it "should display the board when game is running" do
      allow(ttt_board).to receive(:win?).and_return(false, true)
      allow(game).to receive(:player_move).and_return(3)

      expect(ttt_board).to receive(:game_grid)

      game.play
    end
  end

  context "#player_move" do
    it "selects human vs computer when selection == 1" do
      selection = 1
      game = Game.new(ttt_board, [foo, bar], selection, ui)

      expect(game).to receive(:human_vs_computer_move)

      game.player_move
    end

    it "selects human vs human when selection == 2" do
      selection = 2
      game = Game.new(ttt_board, [foo, bar], selection, ui)

      expect(game).to receive(:human_vs_human_move)

      game.player_move
    end
  end

  context "#human_move" do
    it "prints the human move message" do
      expect(ui).to receive(:player_move_message)

      game.get_human_move
    end

    it "prints unavailable cell message if cell is not empty" do
      allow(ttt_board).to receive(:cell_available?).and_return(false, true)

      expect(ui).to receive(:unavailable_cell_message)

      game.get_human_move
    end

    it "executes the player's move" do
      allow(ttt_board).to receive(:cell_available?).and_return(true)

      expect(foo).to receive(:move)

      game.get_human_move
    end
  end

  context "#get_coordinates" do
    it "returns the correct coordinates for specified cell number and grid size" do
      [
        [1, [0, 0]],
        [2, [1, 0]],
        [3, [2, 0]],
        [4, [0, 1]],
        [5, [1, 1]],
        [6, [2, 1]],
        [7, [0, 2]],
        [8, [1, 2]],
        [9, [2, 2]]
      ].each do |cell, coordinates|
        expect(game.get_coordinates(cell)).to eq(coordinates)
      end
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

    it "displays the winner message for win" do
      allow(ttt_board).to receive(:win?).and_return(true)

      expect(ui).to receive(:winner)

      game.play
    end

    it "displays the draw message for draw" do
      allow(ttt_board).to receive(:draw?).and_return(true)

      expect(ui).to receive(:draw)

      game.play
    end
  end
end
