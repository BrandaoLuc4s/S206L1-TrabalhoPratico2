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

Scenario: Testando se o retorno ?count=2, apresenta falha ao valor da carta ser 0.
    Given url url_base
    And path '/eyppf3xmx62n/draw/?count=2'
    When method get
    Then status 200
    And def cards = response.cards.image
    And print cards
    
