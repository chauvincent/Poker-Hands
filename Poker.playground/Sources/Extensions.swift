import Foundation


public extension Array {

    /* Convert string array of card rank and suit to Cards array */

    public func toCardsArray() -> [Card]? {
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

/* Sort Card Arrays based off Rank or Suit */

public protocol TargetType {}
extension Array: TargetType {}

public extension Collection where Self:TargetType, Iterator.Element == Card {

    public func sortCardsByRankAscending() -> [Card] { return sorted { l, r in l.rank.rawValue < r.rank.rawValue } }
    public func sortCardsByRankDescending() -> [Card] { return sorted { l, r in l.rank.rawValue > r.rank.rawValue } }
    public func sortCardsBySuitAscending() -> [Card] { return sorted { l, r in l.suit.hashValue < r.suit.hashValue } }
    public func sortCardsBySuitDescending() -> [Card] { return sorted { l, r in l.suit.hashValue > r.suit.hashValue } }
}
