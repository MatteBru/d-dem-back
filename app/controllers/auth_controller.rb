class AuthController < ApplicationController

  def create
    user = User.find_by(username: params[:username])

    if user
      if user.authenticate(params[:password])
      # issue that user a token
        token = issue_token(user)
        render json: { user: UserSerializer.new(user).attributes, jwt: token}
      else
        render json: {errors: {password: 'Incorrect password'}}, status: 401
      end
    else
      render json: {errors: {username: 'That user could not be found.'}}, status: 401
    end
  end

  def show
    # token = request.headers['Authorization']
    # user = User.find_by(id: token)

    # byebug
    if logged_in?
      token = issue_token(current_user)
      render json: {user: UserSerializer.new(current_user).attributes, jwt: token}
      # render json: { id: current_user.id, username: current_user.username }
    else
      render json: {error: 'No user could be found'}, status: 401
    end
  end

end
