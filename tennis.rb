module Tennis

  class Game
    attr_accessor :player1, :player2

    # Instaniates a new Game with two players.
    # Sets players to be each others' opponents.
    #
    # Returns a game and two new player objects.
    def initialize
      @player1 = Player.new
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
    end

    # Records a point for either player.
    # Calls record_won_ball! for whichever player won point
    #
    # Adds to score for player.
    def wins_ball(play)
      if play == 1
        @player1.record_won_ball!
      else
        @player2.record_won_ball!
      end
    end

  end

  class Player
    attr_accessor :points, :opponent

    # Starts player objects out with 0 points and an opponent.
    # 
    # Returns a player.
    def initialize
      @points = 0
      @opponent = opponent
    end

    # Returns opponent.
    # 
    def opponent
      @opponent
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points += 1
    end

    # Returns the String score for the player.
    def score
      return 'love' if @points == 0
      return 'fifteen' if @points == 1
      return 'thirty' if @points == 2
      return 'forty' if @points == 3 
    end

    # Sets advantage when player has 3 pts and is up by 1 pt. 
    #
    def advantage?
      @points > @opponent.points && @points > 3
    end

    # Sets deuce when score is tied at 3 or 4 pts. 
    #
    def deuce?
      @points >= 3 && @points == @opponent.points
    end

    def win?
      case 
      when deuce? 
        if record_won_ball! && advantage?
          return true
        else
        end
      when @points = 4 && @opponent.points = 2 
        return true
      end
    end
  end
end