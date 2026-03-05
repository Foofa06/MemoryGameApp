import SwiftUI

class CardGameViewModel: ObservableObject {

    @Published var cards: [Card] = []
    @Published var score: Int = 0
    @Published var moves: Int = 0
    @Published var gameOver: Bool = false

    private var firstSelectedCard: Card?

    init() {
        startNewGame()
    }

    func startNewGame() {
        let emojis = ["🐶","🐱","🦊","🐸","🐵","🐼"]

        var newCards: [Card] = []

        for emoji in emojis {
            newCards.append(Card(content: emoji))
            newCards.append(Card(content: emoji))
        }

        cards = newCards.shuffled()
        score = 0
        moves = 0
        gameOver = false
        firstSelectedCard = nil
    }

    func shuffleCards() {
        cards.shuffle()
    }

    func selectCard(_ selectedCard: Card) {
        guard let index = cards.firstIndex(where: { $0.id == selectedCard.id }),
              !cards[index].isFaceUp,
              !cards[index].isMatched else { return }

        cards[index].isFaceUp = true

        if let first = firstSelectedCard {
            moves += 1

            if let firstIndex = cards.firstIndex(where: { $0.id == first.id }) {

                if cards[firstIndex].content == cards[index].content {
                    cards[firstIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                } else {
                    if score > 0 { score -= 1 }

                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.cards[firstIndex].isFaceUp = false
                        self.cards[index].isFaceUp = false
                    }
                }
            }

            firstSelectedCard = nil
        } else {
            firstSelectedCard = cards[index]
        }

        if cards.allSatisfy({ $0.isMatched }) {
            gameOver = true
        }
    }
}