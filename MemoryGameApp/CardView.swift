//
//  CardView.swift
//  MemoryGameApp
//
//  Created by Fawzia Jassim on 3/4/26.
//


import SwiftUI

struct CardView: View {

    @ObservedObject var viewModel: CardGameViewModel
    let card: Card

    @State private var dragAmount: CGSize = .zero

    var body: some View {

        ZStack {

            CardBack

            CardFront

        }
        .rotation3DEffect(
            .degrees(card.isFaceUp ? 180 : 0),
            axis: (x:0, y:1, z:0)
        )
        .offset(dragAmount)
        .gesture(
            DragGesture()
                .onChanged { value in
                    dragAmount = value.translation
                }
                .onEnded { _ in
                    withAnimation(.spring()) {
                        dragAmount = .zero
                    }
                }
        )
        .onTapGesture(count: 2) {
            withAnimation {
                viewModel.selectCard(card)
            }
        }
        .opacity(card.isMatched ? 0.4 : 1)
    }

    private var CardFront: some View {

        RoundedRectangle(cornerRadius: 15)
            .fill(Color.white)
            .overlay(
                Text(card.content)
                    .font(.largeTitle)
            )
            .shadow(radius: 3)
            .opacity(card.isFaceUp ? 1 : 0)
    }

    private var CardBack: some View {

        RoundedRectangle(cornerRadius: 15)
            .fill(Color.pink.opacity(0.6))
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white, lineWidth: 3)
            )
            .shadow(radius: 3)
            .opacity(card.isFaceUp ? 0 : 1)
    }
}
