//: Poker - noun: a card game played by two or more people who bet on the value of the hands dealt to them.

import UIKit

// ♥️♣️♦️♠️ //

/*
 
 The first challenge for any novice poker player is figuring out how to evaluate any given hand, and understanding how strong it is within the spectrum of all possible hands.

 Your task: write a method that accepts as input an array of 7 arbitrary cards (from a standard 52-card deck) and returns the best 5-card poker hand, as well as the name of that hand


 For example, an input of [8♦ 3♠ 5♦ 8♣ J♦ 3♦ 2♦] should return the output [J♦ 8♦ 5♦ 3♦ 2♦] and "Flush"
 See https://en.wikipedia.org/wiki/List_of_poker_hand_categories for a list and ranking of poker hands
 
*/

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
                   Class Extensions
 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

//extension Array {
//    // Convert string array of card rank and suit to Cards array
//    func toCardsArray() -> [Card]? {
//        var cards: [Card] = []
//        let allowedRank = NSCharacterSet(charactersIn: "1234567890AJKQ")
//        let allowedSuit = NSCharacterSet(charactersIn: "♥️♣️♦️♠️")
//        for element in self {
//            if element is String {
//                let rankChar = String(describing: element).components(separatedBy: allowedRank.inverted).first
//                let suitChar = String(describing: element).components(separatedBy: allowedSuit.inverted).last
//                guard let rank = Rank(string: rankChar!) else { return nil }
//                guard let suit = Suit(string: suitChar!) else { return nil }
//                cards.append(Card(rank: rank, suit: suit))
//            }
//        }
//        return cards
//    }
//}
//
//protocol TargetType {}
//extension Array: TargetType {}
//
//extension Collection where Self:TargetType, Iterator.Element == Card {
//    func sortCardsByRankAscending() -> [Card] { return sorted { l, r in l.rank.rawValue < r.rank.rawValue } }
//    func sortCardsByRankDescending() -> [Card] { return sorted { l, r in l.rank.rawValue > r.rank.rawValue } }
//    func sortCardsBySuitAscending() -> [Card] { return sorted { l, r in l.suit.hashValue < r.suit.hashValue } }
//    func sortCardsBySuitDescending() -> [Card] { return sorted { l, r in l.suit.hashValue > r.suit.hashValue } }
//}

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
        
        let onlySpades = self.cards.filter({ (card) -> Bool in card.suit == Suit.spades })
        let onlyHearts = self.cards.filter({ (card) -> Bool in card.suit == Suit.hearts })
        let onlyDiamond = self.cards.filter({ (card) -> Bool in card.suit == Suit.diamonds })
        let onlyClubs = self.cards.filter({ (card) -> Bool in card.suit == Suit.clubs })
        
        var spadeStraightFlush = self.checkForStraight(cards: onlySpades)
        var heartStraightFlush = self.checkForStraight(cards: onlyHearts)
        var diamondStraightFlush = self.checkForStraight(cards: onlyDiamond)
        var clubStraightFlush = self.checkForStraight(cards: onlyClubs)
        
        var found = false;
        
        if (spadeStraightFlush != nil) {
            self.bestCards = spadeStraightFlush
            found = true
        } else if (heartStraightFlush != nil) {
            self.bestCards = heartStraightFlush
            found = true
        } else if (diamondStraightFlush != nil) {
            self.bestCards = diamondStraightFlush
            found = true
        } else if (clubStraightFlush != nil) {
            self.bestCards = clubStraightFlush
            found = true
        } else {
            return false
        }
        
        if (found) {
            self.handName = "Straight Flush"
            return true
        }
        
        return false;
    }()
    
    
    init(cards: [Card]) {
        self.cards = cards
        print(isStraightFlush)
    }
    
    // Helpers
    
    fileprivate func checkForStraight(cards: [Card]) -> [Card]? {
        if (cards.count < 5) {
            return nil
        }
        
        var sortedCards = cards.sortCardsByRankDescending()
        var set: Set = Set<Int>()
        var bestCards: [Card] = []
        for (index, element) in sortedCards.enumerated() {
            if index + 1 == sortedCards.count {
                break
            }
            let currentRank = element.rank.rawValue
            let nextRank = sortedCards[index + 1].rank.rawValue
            var amount = 0
            if currentRank - nextRank == 1 {
                amount += 1
                set.insert(index)
                set.insert(index + 1)
                if set.count == 5 {
                    for index in set {
                        bestCards.append(sortedCards[index])
                    }
                    return (bestCards.sortCardsByRankDescending())
                }
            } else {
                set.removeAll()
            }
        }
        return (nil);
    }
    
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
                Input and Caller Function
 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

func getBestHand(cardString: [String]) {
    
    guard let cards = cardString.toCardsArray() else { return }
    let hand = HandChecker(cards: cards)
    hand.handName
    hand.bestCards
    
}

let straightFlush = ["J♠️", "4♠️", "J♦️", "6♠️", "K♠️", "2♠️", "3♦️", "3♠️", "5♠️","A♠️"]
//let cards = ["8♦️", "3♠️", "5♦️", "8♣️", "J♦️", "3♦️", "2♦️"]

getBestHand(cardString: straightFlush)






