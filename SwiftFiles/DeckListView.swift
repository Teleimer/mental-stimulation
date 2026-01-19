//
//  DeckListView.swift
//  Flashcards App
//
//  Created by Trevor Leimer on 1/10/26.
//

import SwiftUI
//Shows all the decks within a specific course.

struct DeckListView: View {
    var course: Course // Data passed from course on the app home screen
    
    //Establishes that base is not to show AddDeckView, but allows us to trigger it later.
    @State private var isShowingAddDeckView = false

    var body: some View {
        VStack {
            //Base case, showing empty decks
            if course.decks.isEmpty {
                ContentUnavailableView {
                    Label("No Decks Yet", systemImage: "square.stack")
                } description: {
                    Text("Add your first deck.")
                }
            } else {
                // Shows existing decks within a course
                List(course.decks) { deck in
                    // Pass the deck directly without a binding for now
                    NavigationLink(destination: CardsListView(deck: deck)) {
                        Text(deck.title)
                    }
                }
            }
        }
        //Inserting button to add deck
        .navigationTitle(course.title)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Add Deck") {
                    //Triggers the switch to flip
                    isShowingAddDeckView = true
                }
            }
        }
        //Once isShowing switch flipped, triggers new page to show as overlay
        .sheet(isPresented: $isShowingAddDeckView) {
            NavigationStack {
                AddDeckView { newDeck in
                    course.decks.append(newDeck)
                }
            }
        }
    }
}
