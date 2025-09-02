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
                       .offset(x: CGFloat(index) * 0.4, y: CGFloat(index) * 0.4)
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
                       .aspectRatio(2.3/3, contentMode: .fit)
               }
               .frame(width: 80, height: 140)
        }
        .allowsHitTesting(false)
    }
    
    var deck: some View {
        ZStack {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                    CardBackView()
                       .offset(x: CGFloat(index) * 0.4, y: CGFloat(index) * 0.4)
                       .onTapGesture {
                           var transaction = Transaction(animation: .easeInOut(duration: 0.5))
                           transaction.disablesAnimations = true
                           withAnimation {
                               withTransaction(transaction) {
                                   viewModel.deal3()
                               }
                           }
                       }
                       .padding(5)
                       .aspectRatio(2.3/3, contentMode: .fit)
               }
               .frame(width: 80, height: 140)
        }
    }
    
    var body: some View {
        HStack {
            discardDeck
                .padding(20)
            deck
        }
        if viewModel.dealedCards.count > 15 {
            ScrollView {
                scrollCards
            }.padding(5)
        } else {
            cards
        }

        HStack(spacing: 250) {
            Button("Reset") {
                viewModel.reset()
            }
            shuffle
        }
    }
    
    private var shuffle: some View {
        Button("Shuffle") {
            withAnimation {
                viewModel.shuffle()
            }
        }
    }
}

struct CardBackView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.blue)
        RoundedRectangle(cornerRadius: 12)
            .stroke(.black, lineWidth: 2)
    }
}

#Preview {
    ContentView(viewModel: ViewModel())
}






