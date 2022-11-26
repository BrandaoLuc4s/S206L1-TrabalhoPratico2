package Trabalho2.DeckOfCards;

import com.intuit.karate.junit5.Karate;

class DocRunner {

    @Karate.Test
    Karate testDeckOfCards() {
        return Karate.run("Doc").relativeTo(getClass());
    }
}
