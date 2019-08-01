//
//  Concentration .swift
//  Concentration
//
//  Created by Shakaib Akhtar on 31/07/2019.
//  Copyright © 2019 iParagon. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFacedUp {
                    if foundIndex == nil {
                        foundIndex = index
                    }
                    else {
                        foundIndex = nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFacedUp = (index == newValue )
            }
        }
    }
    
    func chooseCard(at index:Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        //TODO: Shuffle the cards
        
        // My Task starts here, Shuffling cards logic
        for _ in 0...cards.count {
            if cards.count >= 4 {
                var swapFromIndex = 0
                var swapToIndex = 0
                
                repeat {
                    swapFromIndex = Int(arc4random_uniform(UInt32(cards.count)))
                    swapToIndex = Int(arc4random_uniform(UInt32(cards.count)))
                } while(swapFromIndex == swapToIndex)
                cards.swapAt(swapFromIndex, swapToIndex)
            }
        }
        // My Task ended here and cards are shuffled
    }
}
