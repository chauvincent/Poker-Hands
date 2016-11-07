import Foundation

public class HandChecker {
    
    public var cards: [Card]!
    public var handName: String?
    public var bestCards: [Card]?
    
    /*      Lazy Inits      */
    public lazy var isStraightFlush: Bool = {
        
        let onlySpades = self.cards.filter({ (card) -> Bool in card.suit == Suit.spades })
        let onlyHearts = self.cards.filter({ (card) -> Bool in card.suit == Suit.hearts })
        let onlyDiamond = self.cards.filter({ (card) -> Bool in card.suit == Suit.diamonds })
        let onlyClubs = self.cards.filter({ (card) -> Bool in card.suit == Suit.clubs })
        
        var spadeStraightFlush = self.checkForStraight(cards: onlySpades)
        var heartStraightFlush = self.checkForStraight(cards: onlyHearts)
        var diamondStraightFlush = self.checkForStraight(cards: onlyDiamond)
        var clubStraightFlush = self.checkForStraight(cards: onlyClubs)
        
        var found = false;
        
        // Check from highest hand to lowest
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
    
    public lazy var isFourOfAKind: Bool = {

        var filteredPairs = self.cards.filterDuplicates(includeElement: {$0.rank != $1.rank})
        
        if (filteredPairs.count == 4) {

            let nonPairs = self.cards.filterDuplicates(includeElement: {$0.rank == $1.rank}).sortCardsByRankDescending()
            let allHighCards = nonPairs.filter({ $0.rank != filteredPairs[0].rank })
            filteredPairs.append(allHighCards[0])
            self.handName = "Four of a Kind"
            self.bestCards = filteredPairs
            return true
        }
        
        return false
    }()
    
    public lazy var isFullHouse: Bool = {
        
        return false
    }()
    
    public lazy var isFlush: Bool = {
        
        return false
    }()
    
    public lazy var isStraight: Bool = {
        
        return false
    }()
    
    public lazy var isThreeOfAkind: Bool = {
        
        return false
    }()
    
    public lazy var isTwoPair: Bool = {
    
        return false
    }()
    
    public lazy var isOnePair: Bool = {
        
        return false
    }()
    
    public lazy var isHighCard: Bool = {
        
        return false
    }()
    
    
    /*       Initializer        */
    public init(cards: [Card]) {
        self.cards = cards
        self.setBestHand()
    }
    

    /*      Helper Methods      */
    fileprivate func setBestHand() {
     
        // From check from Highest Hand to Lowest Hand
        if isStraightFlush {
            
        } else if isFourOfAKind {
            
        } else if isFullHouse {
            
        } else if isFlush {
            
        } else if isStraight {
            
        } else if isThreeOfAkind {
            
        } else if isTwoPair {
            
        } else if isOnePair {
            
        } else if isHighCard {
            
        } else {
            
        }
    }
    
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

