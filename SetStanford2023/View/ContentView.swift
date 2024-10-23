//
//  ContentView.swift
//  SetStanford2023
//
//  Created by user on 23.10.24.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel: ViewModel

    var cards: some View {
        Grid (viewModel.dealedCards) { card in
            CardView(card)
               // .padding(max(0, CGFloat(-self.viewModel.cards.count) + 24))
                .onTapGesture {
                    var transaction = Transaction(animation: .easeInOut(duration: 0.5))
                    transaction.disablesAnimations = true
                    withAnimation {
                        withTransaction(transaction) {
                            viewModel.choose(card: card)
                        }
                    }
                }
                .padding(5)
                .aspectRatio(2.3/3, contentMode: .fit) // keep same aspect ratio
        }
    }

    var scrollCards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 95))]) {
           ForEach(viewModel.dealedCards.indices, id: \.self) { index in
                CardView(viewModel.dealedCards[index])
                   .aspectRatio(2.3/3, contentMode: .fit)
                   .onTapGesture {
                       var transaction = Transaction(animation: .easeInOut(duration: 0.5))
                       transaction.disablesAnimations = true
                       withAnimation {
                           withTransaction(transaction) {
                               viewModel.choose(card: viewModel.dealedCards[index])
                           }
                       }
                   }
                   .padding(5)
           }
        }
    }

    var discardDeck: some View {
        ZStack {
               ForEach(viewModel.discardPile.indices, id: \.self) { index in
                    CardView(viewModel.discardPile[index])
                       .aspectRatio(2.3/3, contentMode: .fit)
                       .onTapGesture {
                           var transaction = Transaction(animation: .easeInOut(duration: 0.5))
                           transaction.disablesAnimations = true
                           withAnimation {
                               withTransaction(transaction) {
                                   viewModel.choose(card: viewModel.discardPile[index])
                               }
                           }
                       }
                       .padding(5)
               }
        }
        .frame(width: 40, height: 70)
    }

    var body: some View {
        discardDeck
        //////////////
        if viewModel.dealedCards.count > 15 {
            ScrollView {
                scrollCards
            }.padding(5)
        } else {
            cards
        }

        HStack(spacing:250) {
            Button("Deal") {
                viewModel.deal3()
            }.opacity(viewModel.cards.isEmpty ? 0 : 1)

            Button("Reset") {
                viewModel.reset()
            }
        }
    }
}

#Preview {
    ContentView(viewModel: ViewModel())
}






