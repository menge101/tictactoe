class Message

  def player_move(name, letter)
    return "#{name} (#{letter}), select a space:"
  end

  def invalid_cell_number
    return "Invalid cell number. Try again"
  end

  def unavailable_cell
    return "Cell is unavailable. Try again"
  end

  def game_over(game_state, name)
    if game_state == :winner
      return "#{name} won!"
    elsif game_state == :draw
      return "Cat's game!"
    end
  end
end
