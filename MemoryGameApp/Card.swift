//
//  Card.swift
//  MemoryGameApp
//
//  Created by Fawzia Jassim on 3/2/26.
//


import SwiftUI

struct Card: Identifiable {

    let id = UUID()

    var isFaceUp: Bool = false
    var isMatched: Bool = false

    let content: String

    var position: CGFloat = 0
}
