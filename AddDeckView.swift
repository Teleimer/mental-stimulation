//
//  AddDeckView.swift
//  Flashcards App
//
//  Created by Trevor Leimer on 1/11/26.
//

import SwiftUI

import SwiftUI

struct AddDeckView: View {
    @State private var deckName: String = ""
    @Environment(\.dismiss) var dismiss
    
    // makes optional if cancelled
    var onSave: ((Decks) -> Void)?

    var body: some View {
        NavigationStack {
            Form {
                TextField("Deck Name", text: $deckName)
            }
            .navigationTitle("New Deck")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        // Create the object
                        let newDeck = Decks(title: deckName, cards: [])
                        
                        // Run the save logic safely
                        onSave?(newDeck)
                        
                        // Close the screen
                        dismiss()
                    }
                    .disabled(deckName.isEmpty)
                }
            }
        }
    }
}
