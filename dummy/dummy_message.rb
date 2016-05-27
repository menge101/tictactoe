class DummyMessage

  def player_move(name, letter)
    return "space"
  end

  def unavailable_cell
    return "unavailable"
  end

  def game_over(game_state, name)
    return "game over"
  end
end
