# MemoryGameApp

This is a fun little memory game made with **SwiftUI**. You will need to flip the cards and match pairs of emojis!

---

## How the Game Works

- Cards start face down. Double-tap a card to flip it.  
- Match two cards with the same emoji to get **2 points**.  
- Pick wrong pairs? You lose **1 point** (the score doesn’t go below 0).  
- Drag cards around for fun—they snap back in place.  
- Flip animations make the cards look 3D.  

---

## Features

- Cards are arranged in a grid that adjusts to screen size.  
- Cards keep the same shape (2:3 ratio).  
- Smooth animations for flipping and dragging.  
- Control panel shows **score**, **moves**, and buttons for **New Game** and **Shuffle**.  
- Shows a “YAY~ You got it!🌷” message when all pairs are matched.

---

## Files in the Project and What They Do

- `Card.swift` ~ Keeps track of a card’s emoji, face-up state, and if it’s matched.
- `CardGameViewModel.swift` ~ Handles game rules, score, and moves.
- `CardView.swift` ~ Shows a card and handles flip and drag animations.
- `ContentView.swift` ~ Main view with the card grid and control panel.
- `ControlPanel.swift` ~ Shows score, moves, buttons, and win message.
- `MemoryGameAppApp.swift` ~ App entry point.

---

## Screenshots
- Screenshot #1
- Screenshot #2
- Screenshot #3
