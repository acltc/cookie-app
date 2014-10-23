class GamesController < ApplicationController
  def guess_a_number

  end

  def submit_number
    secret_number = 45

    if cookies[:number_of_guesses]
      cookies[:number_of_guesses] = cookies[:number_of_guesses].to_i + 1
    else
      cookies[:number_of_guesses] = 1
    end

    if secret_number > params[:number].to_i
      flash[:warning] = "Too low! Guess higher."
      flash[:info] = "You have made #{cookies[:number_of_guesses]} so far."
    elsif secret_number < params[:number].to_i
      flash[:warning] = @message = "Too high! Guess lower."
      flash[:info] = "You have made #{cookies[:number_of_guesses]} so far."
    elsif secret_number == params[:number].to_i
      flash[:success] = "You win! The correct number was indeed #{secret_number}!"
    end

    redirect_to '/'
  end
end
