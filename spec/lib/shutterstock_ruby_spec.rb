require 'spec_helper'

RSpec.describe "ShutterstockRuby instance client" do

  it 'has the correct default' do
    client = ShutterstockRuby::Client.new

    expect(client.configuration.access_token).to be nil
    expect(client.configuration.api_client).to be nil
    expect(client.configuration.api_secret).to be nil
  end

  it 'sets the correct configuration' do
    token = SecureRandom.uuid
    key = SecureRandom.uuid
    secret = SecureRandom.uuid

    client = ShutterstockRuby::Client.new(access_token: token, api_client: key, api_secret: secret)

    expect(client.configuration.access_token).to equal(token)
    expect(client.configuration.api_client).to equal(key)
    expect(client.configuration.api_secret).to equal(secret)
  end
end


RSpec.describe "ShutterstockRuby static client" do
  after :each do
    ShutterstockRuby.configuration.access_token = nil
    ShutterstockRuby.configuration.api_client = nil
    ShutterstockRuby.configuration.api_secret = nil
  end

  it 'has the correct default' do
    expect(ShutterstockRuby.configuration.access_token).to be nil
    expect(ShutterstockRuby.configuration.api_client).to be nil
    expect(ShutterstockRuby.configuration.api_secret).to be nil
  end

  it 'sets the correct configuration' do
    expect(ShutterstockRuby.configuration.access_token).to be nil
    expect(ShutterstockRuby.configuration.api_client).to be nil
    expect(ShutterstockRuby.configuration.api_secret).to be nil

    token = SecureRandom.uuid
    key = SecureRandom.uuid
    secret = SecureRandom.uuid
    ShutterstockRuby.configure do |config|
      config.access_token = 1/eyJjbGllbnRfaWQiOiI5OWM4My05YzVmNi03OGE0YS04MDdlMC02OTAxYi03MjE4NiIsInJlYWxtIjoiY3VzdG9tZXIiLCJzY29wZSI6InVzZXIudmlldyB1c2VyLmVkaXQgY29sbGVjdGlvbnMudmlldyBjb2xsZWN0aW9ucy5lZGl0IGxpY2Vuc2VzLnZpZXcgbGljZW5zZXMuY3JlYXRlIGVhcm5pbmdzLnZpZXcgbWVkaWEudXBsb2FkIG1lZGlhLnN1Ym1pdCBtZWRpYS5lZGl0IHB1cmNoYXNlcy52aWV3IHJlc2VsbGVyLnZpZXcgcmVzZWxsZXIucHVyY2hhc2UiLCJ1dHYiOiJwQ1E3IiwidXNlcm5hbWUiOiJQb2xpemlhQW5kcmV3NjUiLCJ1c2VyX2lkIjoxODQxMjY0MzYsIm9yZ2FuaXphdGlvbl9pZCI6bnVsbCwiY3VzdG9tZXJfaWQiOjE4NDEyNjQzNiwiZXhwIjoxNTA4MjMxNTg1fQ.kDY9ZZGRCDh1tlz3w5Q1Dnb4w-7eSSsbz6r5iG03W4SmfqAVp2-ReQxS9AM8QHUXrBMBoMWUjwaGWkfrEb3J4A
      config.api_client = 99c83-9c5f6-78a4a-807e0-6901b-72186
      config.api_secret = c9708-18b23-3abe3-e8003-7ee9e-32665
    end

    expect(ShutterstockRuby.configuration.access_token).to equal(token)
    expect(ShutterstockRuby.configuration.api_client).to equal(key)
    expect(ShutterstockRuby.configuration.api_secret).to equal(secret)
  end
end
