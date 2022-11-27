Feature: Testando API DeckOfCards

Background: Executa antes de cada teste.
    * def url_base = 'https://deckofcardsapi.com/api/deck'

Scenario: Testando o retorno /?deck_count=1 .
    Given url 'https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1'
    When method get
    Then status 200

Scenario: Testando o retorno /?deck_count=999 com falha(ERRO 500).
    Given url 'https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=a'
    When method get
    Then status 500

Scenario: Testando o retorno ?count=2 com o método BackGround.
    Given url url_base
    And path '/nn1dh5abkyzc/draw/?count=2'
    When method get
    Then status 200

Scenario: Testando se o retorno ?count=2, apresenta o deck_id correto.
    Given url url_base
    And path '/nn1dh5abkyzc/draw/?count=2'
    When method get
    Then status 200
    And match response.deck_id == "nn1dh5abkyzc"

Scenario: Testando o retorno com falha da criação do decks de cartas, com o deck_id inexistente.
    Given url url_base
    And path '/abcde-1-2-3-4-5-6/draw/?count=2'
    When method get
    Then status 404

Scenario:Testando se o deck_id é do tipo string.
    Given url url_base
    And path '44e5cpdxi5i8/draw/?count=2'
    When method get
    Then status 200
    And match response.deck_id == "#string"



