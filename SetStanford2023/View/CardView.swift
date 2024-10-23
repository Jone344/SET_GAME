//
//  CardView.swift
//  SetStanford2023
//
//  Created by user on 11.12.24.
//

import SwiftUI

struct CardView: View {
    let card: Set.Card
    var game = Set()
    
    init(_ card: Set.Card) {
        self.card = card
    }
    
    var cardColor: Color {
        switch card.color {
        case .one:
            return Color.red
        case .two:
            return Color.green
        case .three:
            return Color.blue
        }
    }
    
    var opacityCard: Double {
        switch card.fill {
        case .one:
            1
        case .two:
            0
        case .three:
            0.2
        }
    }
    
    var body: some View {
        
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                if card.isSelected {
                    base.strokeBorder( .blue, lineWidth: 5)
                }
                if card.isMatched {
                    base.strokeBorder( .green, lineWidth: 5)
                }
                if card.isUnmatched {
                    base.strokeBorder( .red, lineWidth: 5)
                }
                
                switch card.shape {
                case .one:
                        if card.amount == .one {
                            VStack {
                                Circle()
                                    .opacity(opacityCard)
                                    .aspectRatio(contentMode: .fit)
                                    .padding(13)
                            }
                            
                            VStack {
                                Circle()
                                    .stroke(.opacity(1), lineWidth: 3)
                                    .aspectRatio(contentMode: .fit)
                                    .padding(13)
                            }
                            
                        }else if card.amount == .two {
                            VStack {
                                Circle()
                                    .opacity(opacityCard)
                                    .aspectRatio(contentMode: .fit)
                                    .padding(13)
                                Circle()
                                    .opacity(opacityCard)
                                    .aspectRatio(contentMode: .fit)
                                    .padding(13)
                            }
                            
                            VStack {
                                Circle()
                                    .stroke(.opacity(1), lineWidth: 3)
                                    .aspectRatio(contentMode: .fit)
                                    .padding(13)
                                Circle()
                                    .stroke(.opacity(1), lineWidth: 3)
                                    .aspectRatio(contentMode: .fit)
                                    .padding(13)
                            }
                            
                        }else if card.amount == .three {
                            VStack {
                                Circle()
                                    .opacity(opacityCard)
                                    .aspectRatio(contentMode: .fit)
                                    .padding(5)
                                Circle()
                                    .opacity(opacityCard)
                                    .aspectRatio(contentMode: .fit)
                                    .padding(5)
                                Circle()
                                    .opacity(opacityCard)
                                    .aspectRatio(contentMode: .fit)
                                    .padding(5)
                            }
                            
                            VStack {
                                Circle()
                                    .stroke(.opacity(1), lineWidth: 3)
                                    .aspectRatio(contentMode: .fit)
                                    .padding(5)
                                Circle()
                                    .stroke(.opacity(1), lineWidth: 3)
                                    .aspectRatio(contentMode: .fit)
                                    .padding(5)
                                Circle()
                                    .stroke(.opacity(1), lineWidth: 3)
                                    .aspectRatio(contentMode: .fit)
                                    .padding(5)
                            }
                        }
                    
                case .two:
                    if card.amount == .one {
                        VStack {
                            Rectangle()
                                .opacity(opacityCard)
                                .aspectRatio(contentMode: .fit)
                                .padding(13)
                        }
                        
                        VStack {
                            Rectangle()
                                .stroke(.opacity(1), lineWidth: 3)
                                .aspectRatio(contentMode: .fit)
                                .padding(13)
                        }
                        
                    }else if card.amount == .two {
                        VStack {
                            Rectangle()
                                .opacity(opacityCard)
                                .aspectRatio(contentMode: .fit)
                                .padding(13)
                            Rectangle()
                                .opacity(opacityCard)
                                .aspectRatio(contentMode: .fit)
                                .padding(13)
                        }
                        
                        VStack {
                            Rectangle()
                                .stroke(.opacity(1), lineWidth: 3)
                                .aspectRatio(contentMode: .fit)
                                .padding(13)
                            Rectangle()
                                .stroke(.opacity(1), lineWidth: 3)
                                .aspectRatio(contentMode: .fit)
                                .padding(13)
                        }
                        
                    }else if card.amount == .three {
                        VStack {
                            Rectangle()
                                .opacity(opacityCard)
                                .aspectRatio(contentMode: .fit)
                                .padding(5)
                            Rectangle()
                                .opacity(opacityCard)
                                .aspectRatio(contentMode: .fit)
                                .padding(5)
                            Rectangle()
                                .opacity(opacityCard)
                                .aspectRatio(contentMode: .fit)
                                .padding(5)
                        }
                        
                        VStack {
                            Rectangle()
                                .stroke(.opacity(1), lineWidth: 3)
                                .aspectRatio(contentMode: .fit)
                                .padding(5)
                            Rectangle()
                                .stroke(.opacity(1), lineWidth: 3)
                                .aspectRatio(contentMode: .fit)
                                .padding(5)
                            Rectangle()
                                .stroke(.opacity(1), lineWidth: 3)
                                .aspectRatio(contentMode: .fit)
                                .padding(5)
                        }
                    }

                    
                case .three:
                    if card.amount == .one {
                        VStack {
                            Diamond()
                                .opacity(opacityCard)
                                .aspectRatio(contentMode: .fit)
                                .padding(13)
                        }
                        
                        VStack {
                            Diamond()
                                .stroke(.opacity(1), lineWidth: 3)
                                .aspectRatio(contentMode: .fit)
                                .padding(13)
                        }
                        
                    }else if card.amount == .two {
                        VStack {
                            Diamond()
                                .opacity(opacityCard)
                                .aspectRatio(contentMode: .fit)
                                .padding(13)
                            Diamond()
                                .opacity(opacityCard)
                                .aspectRatio(contentMode: .fit)
                                .padding(13)
                        }
                        
                        VStack {
                            Diamond()
                                .stroke(.opacity(1), lineWidth: 3)
                                .aspectRatio(contentMode: .fit)
                                .padding(13)
                            Diamond()
                                .stroke(.opacity(1), lineWidth: 3)
                                .aspectRatio(contentMode: .fit)
                                .padding(13)
                        }
                        
                    }else if card.amount == .three {
                        VStack {
                            Diamond()
                                .opacity(opacityCard)
                                .aspectRatio(contentMode: .fit)
                                .padding(5)
                            Diamond()
                                .opacity(opacityCard)
                                .aspectRatio(contentMode: .fit)
                                .padding(5)
                            Diamond()
                                .opacity(opacityCard)
                                .aspectRatio(contentMode: .fit)
                                .padding(5)
                        }
                        
                        VStack {
                            Diamond()
                                .stroke(.opacity(1), lineWidth: 3)
                                .aspectRatio(contentMode: .fit)
                                .padding(5)
                            Diamond()
                                .stroke(.opacity(1), lineWidth: 3)
                                .aspectRatio(contentMode: .fit)
                                .padding(5)
                            Diamond()
                                .stroke(.opacity(1), lineWidth: 3)
                                .aspectRatio(contentMode: .fit)
                                .padding(5)
                        }
                    }
                }
            }
            .foregroundStyle(cardColor)
        }
       // .aspectRatio(contentMode: .fit)
    }
}


