require 'rails_helper'

RSpec.describe BoardGamesService, type: :service do
  describe '#get_board_games' do
    it 'fetches board games from the API' do
      stub_request(:get, "https://boardgamegeek.com/xmlapi2/thing?id=123,456").
        to_return(status: 200, body: '<items><item id="123">...</item><item id="456">...</item></items>', headers: { 'Content-Type' => 'application/xml' })

      service = BoardGamesService.new
      result = service.get_board_games("123,456")

      expect(result).to be_a(Hash)
      expect(result['items']).to be_a(Hash)
      expect(result['items']['item']).to be_an(Array)
      expect(result['items']['item'].count).to eq(2)
    end
  end
end