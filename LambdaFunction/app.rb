# frozen_string_literal: true

require "openai"
require "json"

Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each { |f| load(f) }


OpenAI.configure do |config|
  config.access_token = ENV.fetch("OPENAI_API_TOKEN", nil)
end



def lambda_handler(event:, context:) # rubocop:disable Lint/UnusedMethodArgument
  processor = Lambda::Processor.new(event)

  processor.process_event

  # Telegram Webhook requires a 200 response
  {
    statusCode: 200
  }
end
