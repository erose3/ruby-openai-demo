# Write your solution here!

require "openai"
require "dotenv/load"

client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))

message_list = [
  { "role" => "system", "content" => "You are a helpful assistant." }
]

puts "Hello! How can I help you today?"
puts "-" * 50

user_message =""

while user_message != "bye"

  user_message = gets.chomp
  puts "-" * 50

break if user_message == "bye"

message_list.push({ "role" => "user", "content" => user_message })

# Call the API
api_response = client.chat(
  parameters: {
    model: "gpt-3.5-turbo",
    messages: message_list
  }
)

choices = api_response.fetch("choices").at(0)
response = choices.fetch("message").fetch("content")

puts response
puts "-" * 50

message_list.push({ "role" => "assistant", "content" => response })

end
