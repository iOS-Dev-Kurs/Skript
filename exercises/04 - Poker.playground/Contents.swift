//: # Übungsaufgabe 4 - Poker

/// The suit of a playing card
enum Suit: Int, CustomStringConvertible {
    case Diamonds, Hearts, Spades, Clubs
    
    var description: String {
        switch self {
        case .Diamonds: return "♦️"
        case .Hearts: return "♥️"
        case .Spades: return "♠️"
        case .Clubs: return "♣️"
        }
    }

}

/// The rank of a playing card
enum Rank: Int, CustomStringConvertible {
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King, Ace
    
    var description: String {
        switch self {
        case .Two: return "2"
        case .Three: return "3"
        case .Four: return "4"
        case .Five: return "5"
        case .Six: return "6"
        case .Seven: return "7"
        case .Eight: return "8"
        case .Nine: return "9"
        case .Ten: return "10"
        case .Jack: return "J"
        case .Queen: return "Q"
        case .King: return "K"
        case .Ace: return "A"
        }
    }
    
}

/// A playing card
struct Card: CustomStringConvertible {
    
    let suit: Suit
    let rank: Rank
    
    var description: String {
        return suit.description + rank.description
    }
}

extension Card: Equatable {}

func ==(lhs: Card, rhs: Card) -> Bool {
    return lhs.suit == rhs.suit && lhs.rank == rhs.rank
}

/// The rank of a poker hand
enum Ranking: Int, CustomStringConvertible {
    case RoyalFlush, StraightFlush, FourOfAKind, FullHouse, Flush, Straight, ThreeOfAKind, TwoPair, OnePair, HighCard
    
    var description: String {
        switch self {
        case .RoyalFlush: return "Royal Flush"
        case .StraightFlush: return "Straight Flush"
        case .FourOfAKind: return "Four of a Kind"
        case .FullHouse: return "Full House"
        case .Flush: return "Flush"
        case .Straight: return "Straight"
        case .ThreeOfAKind: return "Three of a Kind"
        case .TwoPair: return "Two Pair"
        case .OnePair: return "One Pair"
        case .HighCard: return "High Card"
        }
    }
}

import Foundation

/// A hand of (usually 5) playing cards
struct PokerHand: CustomStringConvertible {
    
    /// The cards held
    let cards: [Card]
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    /// Initializes a hand with five random cards
    init() {
        var cards = [Card]()
        while cards.count < 5 {
            let suit = Suit(rawValue: Int(arc4random_uniform(4)))!
            let rank = Rank(rawValue: Int(arc4random_uniform(13)))!
            let card = Card(suit: suit, rank: rank)
            if !cards.contains(card) {
                cards.append(card)
            }
        }
        self.cards = cards
    }
    
    var description: String {
        return cards.description
    }
    
    /// The ranking of the hand
    var ranking: Ranking {
        if hasFlush && hasStraight {
            if highestCard.rank == .Ace {
                return .RoyalFlush
            }
            return .StraightFlush
        } else if sameKindCount >= 4 {
            return .FourOfAKind
        } else if hasFullHouse {
            return .FullHouse
        } else if hasFlush {
            return .Flush
        } else if hasStraight {
            return .Straight
        } else if sameKindCount >= 3 {
            return .ThreeOfAKind
        } else if pairCount >= 2 {
            return .TwoPair
        } else if pairCount >= 1 {
            return .OnePair
        } else {
            return .HighCard
        }
    }
    
    /// Whether all cards have the same suit
    var hasFlush: Bool {
        let suit = cards.first!.suit
        for card in cards {
            if card.suit != suit {
                return false
            }
        }
        return true
    }
    
    /// Whether the cards' ranks form a sequence
    var hasStraight: Bool {
        let sortedCards = cards.sorted { $0.rank.rawValue < $1.rank.rawValue }
        for (i, card) in sortedCards.enumerated() where i > 0 {
            if card.rank.rawValue != sortedCards[i-1].rank.rawValue + 1 {
                return false
            }
        }
        return true
    }
    
    /// Dictionary with the number of cards for each rank
    var kindCounts: [Rank : Int] {
        var kindCounts = [Rank:Int]()
        for card in cards {
            if kindCounts[card.rank] == nil {
                kindCounts[card.rank] = 1
            } else {
                kindCounts[card.rank]! += 1
            }
        }
        return kindCounts
    }
    
    /// Whether the cards form a full house
    var hasFullHouse: Bool {
        var hasThree = false
        var hasTwo = false
        for kindCount in kindCounts.values {
            if kindCount == 2 {
                hasTwo = true
            } else if kindCount == 3 {
                hasThree = true
            }
        }
        return hasTwo && hasThree
    }

    /// Number of Cards of the same rank
    var sameKindCount: Int {
        return kindCounts.values.sorted(by: >).first!
    }
    
    /// Number of pairs
    var pairCount: Int {
        var pairCount = 0
        for kindCount in kindCounts.values {
            if kindCount == 2 {
                pairCount += 1
            }
        }
        return pairCount
    }
    
    /// The highest card
    var highestCard: Card {
        return cards.sorted(by: { $0.rank.rawValue > $1.rank.rawValue }).first!
    }
    
}


//: ## Testing

var rankingCounts = [Ranking : Int]()
let samples = 100
for i in 0...samples {
    let ranking = PokerHand().ranking
    if rankingCounts[ranking] == nil {
        rankingCounts[ranking] = 1
    } else {
        rankingCounts[ranking]! += 1
    }
}

for (ranking, count) in rankingCounts {
    print("The probability of being dealt a \(ranking.description) is \(Double(count) / Double(samples) * 100)%")
}


