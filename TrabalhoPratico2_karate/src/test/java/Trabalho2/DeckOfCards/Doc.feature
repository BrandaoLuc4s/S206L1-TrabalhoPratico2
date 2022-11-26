Feature: Testando API DeckOfCards

Scenario: Testando o retorno /?deck_count=1
    Given url "https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1"
    When method get
    Then status 200

Scenario: Testando o retorno /?deck_count=999
    Given url "https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=a"
    When method get
    Then status 500