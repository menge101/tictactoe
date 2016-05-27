require 'rspec'
require_relative '../lib/game.rb'
require_relative '../lib/ttt_board.rb'
require_relative '../dummy/dummy_player.rb'
require_relative '../dummy/dummy_ui.rb'

describe "Game" do

  let(:ttt_board) { TTTBoard.new(3) }
  let(:ui) { DummyUI.new }
  let(:foo) { DummyPlayer.new(ttt_board, ui, {name: 'foo', letter: 'X'}) }
  let(:bar) { DummyPlayer.new(ttt_board, ui, {name: 'bar', letter: 'O'}) }
  let(:game) { Game.new(ttt_board, [foo, bar], ui) }

  context "#initialize" do
    it "assigns player 1 as current player and player 2 as next player" do
      expect(game.current_player).to eq(foo)
      expect(game.next_player).to eq(bar)
    end
  end

  context "#play" do
    it "displays the board while the game is running and game over" do
      allow(ttt_board).to receive(:win?).and_return(false, true)

      expect(ttt_board).to receive(:game_grid).twice

      game.play
    end

    it "gets the current player's move" do
      allow(ttt_board).to receive(:win?).and_return(false, true)
      allow(ttt_board).to receive(:game_grid).twice

      expect(foo).to receive(:move)

      game.play
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

  context "#game_over" do
    it "displays the board at the end of the game" do
      allow(ttt_board).to receive(:win?).and_return(true)

      expect(ttt_board).to receive(:game_grid)

      game.play
    end

    it "displays the winning message if a player wins" do
      allow(ttt_board).to receive(:win?).and_return(true)

      expect(ui).to receive(:winner)

      game.play
    end

    it "displays the draw message if game ends in draw" do
      allow(ttt_board).to receive(:draw?).and_return(true)

      expect(ui).to receive(:draw)

      game.play
    end
  end
end
