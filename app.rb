require 'slack-ruby-bot'

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
end

class GrootBot < SlackRubyBot::Bot
  scan(/\bgroot\b/i) do |client, data, _match|
    message = ['I am groot.', 'I am groot!', 'I am groot?', 'I AM GROOT!'].sample
    client.say(text: message, channel: data.channel)
  end
end

GrootBot.run
