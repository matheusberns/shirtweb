# frozen_string_literal: true

class ChatsController < ApplicationController
  def show
    @messages = Message.all
  end
end
