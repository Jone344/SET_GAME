//
//  Game.swift
//  SetStanford2023
//
//  Created by user on 23.10.24.
//

import Foundation

struct Set {
    
    var selectedCards = [Card]()
    var cards: [Card] = Array<Card>()
    var dealedCards: [Card] = Array<Card>()
    var matchedCards = [Card]()
    
    init() {
        self.cards = Set.createDeck()
        deal(numberOfCards: 12)
    }
    
    enum threePositions {
        case lessThanThree
        case match
        case unmatch
    }
    
    mutating func deal3() {
        if dealedCards.contains(where: {$0.isMatched == true}) {
            for cardGame in dealedCards {
                let indexCard = dealedCards.firstIndex(matching: cardGame)!
                
                if cardGame.isMatched == true {
                    
                    if dealedCards.count > 15 { // back from scroll view to regular Grid
                        dealedCards.remove(at: indexCard)
                    } else if !cards.isEmpty {
                        dealedCards[indexCard] = cards[0]
                        cards.removeFirst()
                    } else if cards.isEmpty || dealedCards.count > 15 {
                        dealedCards.remove(at: indexCard)
                    } else if dealedCards.contains(where: {$0.isMatched == true}) && dealedCards.count == 3 {
                        dealedCards.removeAll()
                    }
                }
            }
        } else {
            deal(numberOfCards: 3)
        }
    }
    
    mutating func reset() {
        self.dealedCards.removeAll()
        self.selectedCards.removeAll()
        self.matchedCards.removeAll()
        self.cards = Set.createDeck()
        
        deal(numberOfCards: 12)
    }
    
    mutating func deal(numberOfCards: Int) {
        guard !cards.isEmpty else { return }
        
        for _ in 0..<numberOfCards {
            let randomIndex = Int.random(in: 0..<cards.count)
            dealedCards.append(cards.remove(at: randomIndex))
        }
    }
    
    mutating func choose(card: Card) {
        let index = dealedCards.firstIndex(matching: card)!
        if dealedCards[index].isMatched == true { return }
        
        if dealedCards[index].isSelected == true && selectedCards.count < 3 {
            dealedCards[index].isSelected = false
            selectedCards.removeAll { $0.id == dealedCards[index].id }
            print("\(card.isSelected)")
            print("\(selectedCards.count)")
            //  print("\(selectedCards)")
            
        } else if selectedCards.count <= 3 {
            dealedCards[index].isSelected = true
            selectedCards.append(dealedCards[index])
            print("\(selectedCards.count)")
            //    print("\(selectedCards)")
        }
        
        if selectedCards.count == 4 && match(cards: selectedCards) == .unmatch {
            selectedCards.removeAll()
            
            dealedCards .indices.forEach{dealedCards[$0].isSelected = false}
            dealedCards[index].isSelected = true
            selectedCards.append(dealedCards[index])
            print("selectedCards.count = \(selectedCards.count)")
        }
        
        //        if dealedCards[index].isMatched == true  {
        //            for cardGame in dealedCards {
        //                let indexCard = dealedCards.firstIndex(matching: cardGame)!
        //                if cardGame.isMatched == true {
        //                    if !cards.isEmpty {
        //                        dealedCards[indexCard] = cards[0]
        //                        cards.removeFirst()
        //                    } else if cards.isEmpty {
        //                        dealedCards.remove(at: indexCard)
        //                    }
        //                }
        //            }
        //            dealedCards.indices.forEach{dealedCards[$0].isSelected = false}
        //            selectedCards.removeAll()
        //            selectedCards.append(dealedCards[index])
        //            dealedCards[index].isSelected = true
        //        }
        
        
        for cardGame in dealedCards {
            let indexCard = dealedCards.firstIndex(matching: cardGame)!
            
            if cardGame.isMatched == true {
                
                if dealedCards.count > 15 { // back from scroll view to regular Grid
                    dealedCards.remove(at: indexCard)
                } else if !cards.isEmpty {
                    dealedCards[indexCard] = cards[0]
                    cards.removeFirst()
                } else if cards.isEmpty {
                    dealedCards.remove(at: indexCard)
                } else if dealedCards.contains(where: {$0.isMatched == true}) && dealedCards.count == 3 {
                    dealedCards.removeAll()
                }
            }
        }
        
        if dealedCards.contains(where: {$0.isMatched == true}) {
            print("alot of matches")
        } else {
            print("no matches")
        }
        
        if match(cards: selectedCards) == .match {
            
            for card in selectedCards {
                let index = dealedCards.firstIndex(matching: card)!
                dealedCards[index].isSelected = false
                print("isSelected: \(dealedCards[index].isSelected)")
                dealedCards[index].isMatched = true
                
                print("isMatched: \(dealedCards[index].isMatched)")
                print("selectedCard.count \(selectedCards.count)")
            }
            selectedCards.removeAll()
            
            print("selectedCard.count after removeAll: \(selectedCards.count)")
            print("filter selectedCards:\(dealedCards.filter {$0.isSelected == true}.count)")
        }
        
        
        for unmachedCard in dealedCards {
            let index = dealedCards.firstIndex(matching: unmachedCard)!
            dealedCards[index].isUnmatched = false
        }
        
        if match(cards: selectedCards) == .unmatch {
            print("UNMATCHED")
            for card in selectedCards {
                let index = dealedCards.firstIndex(matching: card)!
                dealedCards[index].isSelected = false
                print("isSelected: \(dealedCards[index].isSelected)")
                dealedCards[index].isUnmatched = true
            }
            selectedCards.removeAll()
        }
    }
    
    func match(cards: [Card]) -> threePositions {
        guard cards.count == 3 else { return .lessThanThree }
        
        if selectedCards[0].amount == selectedCards[1].amount && selectedCards[0].amount == selectedCards[2].amount || selectedCards[0].amount != selectedCards[1].amount && selectedCards[0].amount != selectedCards[2].amount && selectedCards[1].amount != selectedCards[2].amount {
            if selectedCards[0].color == selectedCards[1].color && selectedCards[0].color == selectedCards[2].color || selectedCards[0].color != selectedCards[1].color && selectedCards[0].color != selectedCards[2].color && selectedCards[1].color != selectedCards[2].color {
                if selectedCards[0].shape == selectedCards[1].shape && selectedCards[0].shape == selectedCards[2].shape || selectedCards[0].shape != selectedCards[1].shape && selectedCards[0].shape != selectedCards[2].shape && selectedCards[1].shape != selectedCards[2].shape {
                    if selectedCards[0].fill == selectedCards[1].fill && selectedCards[0].fill == selectedCards[2].fill || selectedCards[0].fill != selectedCards[1].fill && selectedCards[0].fill != selectedCards[2].fill && selectedCards[1].fill != selectedCards[2].fill {
                        print("DOKERMATCH1")
                        return .match
                    }
                }
            }
            print("DOKERMATCH2")
        }
        return .unmatch
    }
    
    struct Card: Identifiable {
        var id = UUID()
            
        var color: Variant
        var amount: Variant
        var shape: Variant
        var fill: Variant
        
        var isSelected: Bool = false
        var isMatched: Bool = false
        var isUnmatched: Bool = false
        
        enum Variant: String, CaseIterable {
            case one, two, three
        }
    }
}

extension Set {
    
    static func createDeck() -> [Card] {
        var id = 0
        var deck = [Card]()
        for color in Card.Variant.allCases {
            for amount in Card.Variant.allCases {
                for shape in Card.Variant.allCases {
                    for fill in Card.Variant.allCases {
                        id += 1
                        deck.append(Card(color: color, amount: amount, shape: shape, fill: fill))
                      //  if deck.count > 12 { break }
                    }
                }
            }
        }
        deck.shuffle()
        return deck
    }
}
