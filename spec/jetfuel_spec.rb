require 'spec_helper'

describe Jetfuel do
  it 'has a version number' do
    expect(Jetfuel::VERSION).not_to be nil
  end

  describe '#shorten' do
    it 'returns a shortened url' do
      shortened = Jetfuel::URL.shorten 'www.google.com'
      expect(shortened[0..-7]).to eq("http://lvh.me:3000/")
    end
  end

  describe '#all' do
    it 'returns 25 most recently shortened urls by default' do
      urls = Jetfuel::URL.all
      expect(urls.count).to eq(25)
    end

    it 'sorts by popularity when given an order parameter' do
      urls = Jetfuel::URL.all(sort_order: 'requests')
      first = urls.first["requests"]
      last = urls.last["requests"]
      expect(first).to be > last
    end

    it 'returns the 2nd page when given a page parameter' do
      urls = Jetfuel::URL.all(page: 2)
      expect(urls.count).to be > 1
    end
  end
end
