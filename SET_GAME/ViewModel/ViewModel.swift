//
//  ViewModel.swift
//  SetStanford2023
//
//  Created by user on 2/15/25.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var model = Set()
    
    var cards: [Set.Card] {
        model.cards
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    var discardPile: [Set.Card] {
        model.discardedCards
    }

    var dealedCards: [Set.Card] {
        model.dealedCards
    }
    
    func choose (card: Set.Card) {
        model.choose(card: card)
    }
    
    func deal3() {
        model.deal3()
    }
    
    func reset() {
        model.reset()
    }
}
