require 'rails_helper'

RSpec.describe 'Palindromes API', type: :request do
  it 'evaluates passed phrases' do
    post '/palindromes', params: { phrase: "Dammit I'm mad" }
    parsed_response = JSON.parse(response.body)
    expect(parsed_response['result']).to eq(true)

    post '/palindromes', params: { phrase: "Level" }
    parsed_response = JSON.parse(response.body)
    expect(parsed_response['result']).to eq(true)

    post '/palindromes', params: { phrase: "AnNa." }
    parsed_response = JSON.parse(response.body)
    expect(parsed_response['result']).to eq(true)

    post '/palindromes', params: { phrase: "Monday" }
    parsed_response = JSON.parse(response.body)
    expect(parsed_response['result']).to eq(false)
  end

  it 'returns palindromes only' do
    get '/palindromes'
    parsed_response = JSON.parse(response.body)
    expect(parsed_response).to eq(["Dammit I'm mad", "Level", "AnNa."])
  end
end