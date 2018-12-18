require 'slack-ruby-bot'
require 'yaml'

Slack.configure do |config|
  config.token = ENV.fetch('SLACK_API_TOKEN')
end

$keywords = {
  'groot' => ['I am groot.', 'I am groot!', 'I am groot?', 'I AM GROOT!']
}
$keywords = YAML.load_file(ARGV[0]) if ARGV[0]

class GrootBot < SlackRubyBot::Bot
  $keywords.each do |keyword, messages|
    messages = [messages] unless messages.is_a?(Array)
    scan(/\b#{keyword}\b/i) do |client, data, _match|
      message = messages.sample
      client.say(text: message, channel: data.channel)
    end
  end
end

GrootBot.run
