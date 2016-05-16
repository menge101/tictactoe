require 'rspec'
require_relative '../lib/game.rb'
require_relative '../lib/board.rb'
require_relative '../dummy/dummy_player.rb'
require_relative '../lib/ui.rb'

describe "Game" do

  let(:board) { Board.new }
  let(:foo) { DummyPlayer.new({name: 'foo', letter: 'X'}) }
  let(:bar) { DummyPlayer.new({name: 'bar', letter: 'O'}) }
  let(:ui) { UI.new(board) }
  let(:game) { Game.new(board, [foo, bar], ui) }

  context "#initialize" do
    it "randomly selects a player as the current player" do
      allow_any_instance_of(Array).to receive(:shuffle).and_return([foo, bar])

      expect(game.current_player).to eq(foo)
    end

    it "selects the remaining player as the next player" do
      allow_any_instance_of(Array).to receive(:shuffle).and_return([foo, bar])

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

  it "declares a win" do
    expect(ui).to receive(:display_board)
    expect(ui).to receive(:winner).once
    expect(game).to receive(:win?).twice.and_return true

    game.play
  end

  it "declares a draw" do
    expect(ui).to receive(:display_board)
    expect(ui).to receive(:draw).once
    expect(game).to receive(:draw?).and_return true

    game.play
  end

  context "#game_outcome" do
    it "concludes win" do
      board.write_cell(0, 0, 'X')
      board.write_cell(0, 1, 'X')
      board.write_cell(0, 2, 'X')

      expect(ui).to receive(:display_board)
      expect(ui).to receive(:winner)

      game.game_over
    end

    it "concludes draw" do
      board.write_cell(0, 0, 'X')
      board.write_cell(0, 1, 'O')
      board.write_cell(0, 2, 'X')
      board.write_cell(1, 0, 'X')
      board.write_cell(1, 1, 'O')
      board.write_cell(1, 2, 'X')
      board.write_cell(2, 0, 'O')
      board.write_cell(2, 1, 'X')
      board.write_cell(2, 2, 'O')

      expect(ui).to receive(:display_board)
      expect(ui).to receive(:draw)

      game.game_over
    end
  end
end
