class ChatGptController < ApplicationController
	require 'net/http'
	require 'json'
  	
  	def index
  	end

  	def generate_response
	    input = params[:input]
	    response = generate_gpt_response(input)
	    render json: { response: response }
	end

  	private

	def generate_gpt_response(input)
	  # Prepare the request payload
	  payload = {
	    "prompt": input,
	    "max_tokens": 50,  # Adjust the desired length of the generated response
	    "temperature": 0.8  # Adjust the temperature to control the randomness of the response
	  }

	  puts payload
	  # Convert the payload to JSON
	  json_payload = payload.to_json
	  puts json_payload

	  # Make a POST request to the GPT-3.5 API
	  uri = URI.parse("https://api.openai.com/v1/engines/davinci-codex/completions")
	  http = Net::HTTP.new(uri.host, uri.port)
	  http.use_ssl = true
	  request = Net::HTTP::Post.new(uri.path,
	                                { 'Content-Type' => 'application/json',
	                                  'Authorization' => 'Bearer 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' })  # Replace YOUR_API_KEY with your actual API key
	  request.body = json_payload

	  response = http.request(request)

	  # Parse the response and extract the generated output
	  parsed_response = JSON.parse(response.body)
	  generated_output = parsed_response['choices'][0]['text']

	  return generated_output
	end
end
