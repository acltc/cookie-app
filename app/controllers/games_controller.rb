class GamesController < ApplicationController
  def guess_a_number

  end

  def submit_number
    secret_number = 45

    if secret_number > params[:number].to_i
      flash[:warning] = "Too low! Guess higher."
    elsif secret_number < params[:number].to_i
      flash[:warning] = @message = "Too high! Guess lower."
    elsif secret_number == params[:number].to_i
      flash[:success] = "You win! The correct number was indeed #{secret_number}!"
    end

    redirect_to '/'
  end
end
