# frozen_string_literal: true

class Message < ApplicationRecord
  after_create_commit { ChatBroadcastJob.perform_later self }
end
