class GamesController < ApplicationController
  def guess_a_number
    if session[:secret_number].nil?
      session[:secret_number] = rand(1..100)
    end
  end

  def submit_number
    secret_number = session[:secret_number].to_i
    
    if session[:number_of_guesses]
      session[:number_of_guesses] = session[:number_of_guesses].to_i + 1
    else
      session[:number_of_guesses] = 1
    end

    if secret_number > params[:number].to_i
      flash[:warning] = "Too low! Guess higher."
      flash[:info] = "You have made #{session[:number_of_guesses]} guesses so far."
    elsif secret_number < params[:number].to_i
      flash[:warning] = @message = "Too high! Guess lower."
      flash[:info] = "You have made #{session[:number_of_guesses]} guesses so far."
    elsif secret_number == params[:number].to_i
      flash[:success] = "You win! The correct number was indeed #{secret_number}! You got it in #{session[:number_of_guesses]} guesses!"
    end

    redirect_to '/'
  end

  def reset
    session[:secret_number] = rand(1..100)
    session[:number_of_guesses] = 0
    flash[:success] = "New game! Begin playing."
    redirect_to '/'
  end
end
