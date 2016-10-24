//: Poker - noun: a card game played by two or more people who bet on the value of the hands dealt to them.

import UIKit

// ♥️♣️♦️♠️ //

/*
 
 The first challenge for any novice poker player is figuring out how to evaluate any given hand, and understanding how strong it is within the spectrum of all possible hands.

 Your task: write a method that accepts as input an array of 7 arbitrary cards (from a standard 52-card deck) and returns the best 5-card poker hand, as well as the name of that hand


 For example, an input of [8♦ 3♠ 5♦ 8♣ J♦ 3♦ 2♦] should return the output [J♦ 8♦ 5♦ 3♦ 2♦] and "Flush"
 See https://en.wikipedia.org/wiki/List_of_poker_hand_categories for a list and ranking of poker hands
 
*/


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

//let cards = ["8♦️", "3♠️", "5♦️", "8♣️", "J♦️", "3♦️", "2♦️"]






