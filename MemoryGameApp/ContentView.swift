//
//  ContentView.swift
//  MemoryGameApp
//
//  Created by Fawzia Jassim on 2/26/26.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var viewModel = CardGameViewModel()

    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]

    var body: some View {

        GeometryReader { geometry in

            ZStack {

                Color.pink.opacity(0.25)
                    .ignoresSafeArea()

                if geometry.size.width > geometry.size.height {

                    HStack {

                        cardGrid

                        ControlPanel(viewModel: viewModel)
                            .frame(width: 200)
                    }

                } else {

                    VStack {

                        cardGrid

                        ControlPanel(viewModel: viewModel)
                    }
                }
            }
        }
    }

    var cardGrid: some View {

        LazyVGrid(columns: columns) {

            ForEach(viewModel.cards) { card in

                CardView(viewModel: viewModel, card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .padding()
    }
}
