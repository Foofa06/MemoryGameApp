//
//  ControlPanel.swift
//  MemoryGameApp
//
//  Created by Fawzia Jassim on 3/5/26.
//


import SwiftUI

struct ControlPanel: View {

    @ObservedObject var viewModel: CardGameViewModel

    var body: some View {

        VStack(spacing: 10) {

            HStack {

                Text("🍡 Score: \(viewModel.score)")
                    .font(.headline)

                Spacer()

                Text("🦋 Moves: \(viewModel.moves)")
                    .font(.headline)
            }

            HStack {

                Button("🎀 New Game") {

                    withAnimation(.spring()) {
                        viewModel.startNewGame()
                    }

                }

                Spacer()

                Button("🌸 Shuffle") {

                    withAnimation(.spring()) {
                        viewModel.shuffleCards()
                    }

                }
            }

            if viewModel.gameOver {

                Text("YAY~ You got it!! 🌷")
                    .font(.title)
                    .foregroundColor(.green)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}
