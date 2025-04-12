# Write your solution here!

require "openai"
require "dotenv/load"

client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))

puts "Hello! How can I help you today?"
puts "----------------------------------------------"

user_message = gets.chomp

puts "----------------------------------------------"


# Prepare an Array of previous messages
message_list = [
  {
    "role" => "system",
    "content" => "You are a helpful assistant who talks like Shakespeare."
  },
  {
    "role" => "user",
    "content" => "#{user_message}"
  }
]

# Call the API to get the next message from GPT
api_response = client.chat(
  parameters: {
    model: "gpt-3.5-turbo",
    messages: message_list
  }
)

choices = api_response.fetch("choices").at(0)

response = choices.fetch("message").fetch("content")

puts response
