//: Poker - noun: a card game played by two or more people who bet on the value of the hands dealt to them.

import UIKit

// ♥️♣️♦️♠️ //

/*
 
 The first challenge for any novice poker player is figuring out how to evaluate any given hand, and understanding how strong it is within the spectrum of all possible hands.

 Your task: write a method that accepts as input an array of 7 arbitrary cards (from a standard 52-card deck) and returns the best 5-card poker hand, as well as the name of that hand


 For example, an input of [8♦ 3♠ 5♦ 8♣ J♦ 3♦ 2♦] should return the output [J♦ 8♦ 5♦ 3♦ 2♦] and "Flush"
 See https://en.wikipedia.org/wiki/List_of_poker_hand_categories for a list and ranking of poker hands
 
*/


enum Suit {
    case clubs
    case diamonds
    case hearts
    case spades
    
    init?(string: String) {
        switch string {
        case "♣️" : self = .clubs
        case "♦️" : self = .diamonds
        case "♥️" : self = .hearts
        case "♠️" : self = .spades
        default: return nil
        }
    }
}

enum Rank: Int {
    // Ranked in ascending order
    case two = 2, three, four, five, six, seven, eight, nine, ten
    case jack
    case queen
    case king
    case ace
    
    init?(string: String) {
        if let rank = Int(string), rank >= 2 && rank <= 10 {
            self = Rank.init(rawValue: rank)!
        } else {
            switch string {
            case "J":
                self = Rank.init(rawValue: 11)!
            case "K":
                self = Rank.init(rawValue: 12)!
            case "Q":
                self = Rank.init(rawValue: 13)!
            case "A":
                self = Rank.init(rawValue: 14)!
            default:
                return nil
            }
        }
    }
}

struct Card {
    let rank : Rank
    let suit: Suit
}

extension Array {
    // Convert string array of card rank and suit to Cards array
    func toCardsArray() -> [Card]? {
        var cards: [Card] = []
        let allowedRank = NSCharacterSet(charactersIn: "1234567890AJKQ")
        let allowedSuit = NSCharacterSet(charactersIn: "♥️♣️♦️♠️")
        for element in self {
            if element is String {
                let rankChar = String(describing: element).components(separatedBy: allowedRank.inverted).first
                let suitChar = String(describing: element).components(separatedBy: allowedSuit.inverted).last
                guard let rank = Rank(string: rankChar!) else { return nil }
                guard let suit = Suit(string: suitChar!) else { return nil }
                cards.append(Card(rank: rank, suit: suit))
            }
        }
        return cards
    }
}

protocol TargetType {}
extension Array: TargetType {}

extension Collection where Self:TargetType, Iterator.Element == Card {
    func sortCardsByRankAscending() -> [Card] { return sorted { l, r in l.rank.rawValue < r.rank.rawValue } }
    func sortCardsByRankDescending() -> [Card] { return sorted { l, r in l.rank.rawValue > r.rank.rawValue } }
    func sortCardsBySuitAscending() -> [Card] { return sorted { l, r in l.suit.hashValue < r.suit.hashValue } }
    func sortCardsBySuitDescending() -> [Card] { return sorted { l, r in l.suit.hashValue > r.suit.hashValue } }
}

// Straight Flush
// Four of a kind
// Full House
// Flush
// Straight
// Three of a kind
// Two pair
// One pair
// High Card

class HandChecker {
    var cards: [Card]!
    var handName: String?
    var bestCards: [Card]?
    
    lazy var isStraightFlush: Bool = {

        let onlySpades = self.cards.filter({ (card) -> Bool in
            card.suit == Suit.spades
        })
        self.checkIfCardsInorder(cards: onlySpades)
        
        
        return false;
    }()
    
    
    init(cards: [Card]) {
        self.cards = cards
        print(isStraightFlush)
    }
    
    // Helpers
    fileprivate func checkIfCardsInorder(cards: [Card]) -> Bool
    {
        if (cards.count < 5) {
            return false
        }
        
        var sortedCards = cards.sortCardsByRankDescending()
        var set: Set = Set<Int>()
        for (index, element) in sortedCards.enumerated() {
            if index + 1 == sortedCards.count {
                break
            }
            let currentRank = element.rank.rawValue
            let nextRank = sortedCards[index + 1].rank.rawValue
            let diff = currentRank - nextRank
            var amount = 0
            if diff == 1 {
                amount += 1
                set.insert(currentRank)
                set.insert(nextRank)
                if set.count == 5 {
                    print(set)
                    break;
                }
            } else {
                set.removeAll()
            }
        }

        return false;
    }
    
}

func getBestHand(cardString: [String]) {
    
    guard let cards = cardString.toCardsArray() else { return }
    let hand = HandChecker(cards: cards)
    
    
}

let straightFlush = ["J♠️", "4♠️", "J♦️", "6♠️", "K♠️", "2♠️", "3♦️", "3♠️", "5♠️","A♠️"]
//let cards = ["8♦️", "3♠️", "5♦️", "8♣️", "J♦️", "3♦️", "2♦️"]

getBestHand(cardString: straightFlush)






