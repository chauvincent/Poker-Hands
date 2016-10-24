import Foundation

/*  Suit is ranked in ascending order   */
public enum Suit {
    case clubs
    case diamonds
    case hearts
    case spades
    
    public init?(string: String) {
        switch string {
        case "♣️" : self = .clubs
        case "♦️" : self = .diamonds
        case "♥️" : self = .hearts
        case "♠️" : self = .spades
        default: return nil
        }
    }
}

/*  Enum is ranked in ascending order    */
public enum Rank: Int {
    case two = 2, three, four, five, six, seven, eight, nine, ten
    case jack
    case queen
    case king
    case ace
    
    public init?(string: String) {
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

public struct Card {
    public let rank : Rank
    public let suit: Suit

    public init(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
    
}

