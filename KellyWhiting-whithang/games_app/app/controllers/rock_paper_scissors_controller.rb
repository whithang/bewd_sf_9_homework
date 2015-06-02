class RockPaperScissorsController < ApplicationController

def new 
    @rock_paper_scissors = rock_paper_scissors

    #this is passing in the array but why is it forgotten later?
  end

  def show
    @items = rock_paper_scissors
    @app_throw_number = @items.sample
    @player_throw_number = params[:id]
    @winner = is_winner?
    binding.pry
  end

  private

  def rock_paper_scissors
    items = ["rock", "paper", "scissors"]
  end

  def is_winner?
    # 0 = rock, 1 = paper, 2 = scissors
      # rock beats scissors, paper beats rock, scissors beats paper
  # binding.pry
    if (@app_throw_number == "rock" && @player_throw_number == "paper")
      return "player"
    elsif (@app_throw_number == "rock" && @player_throw_number == "scissors")
      return "app"
    elsif (@app_throw_number == "paper" && @player_throw_number == "rock")
      return "app"
    elsif (@app_throw_number == "paper" && @player_throw_number == "scissors")
      return "player"
    elsif (@app_throw_number == "scissors" && @player_throw_number == "rock")
      return "player"
    elsif (@app_throw_number == "scissors" && @player_throw_number == "paper")
      return "app"
    else
      return "tie"
    end

  end

end
