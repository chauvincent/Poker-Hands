import UIKit

// ♥️♣️♦️♠️ //

func getBestHand(cardString: [String]) {
    
    guard let cards = cardString.toCardsArray() else { return }
    let hand = HandChecker(cards: cards)
    //hand.handName
   // hand.bestCards
    
}

/*
    let straightFlush = ["J♠️", "4♠️", "J♦️", "6♠️", "K♠️", "2♠️", "3♦️", "3♠️", "5♠️","A♠️"]
    getBestHand(cardString: straightFlush)
*/

let fourOfAKind = ["8♦️", "8♠️", "5♦️", "8♣️", "J♥️", "3♦️", "8♥️"]
getBestHand(cardString: fourOfAKind)

//let cards = ["8♦️", "3♠️", "5♦️", "8♣️", "J♦️", "3♦️", "2♦️"]






