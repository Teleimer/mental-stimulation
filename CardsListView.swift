//
//  CardsListView.swift
//  Flashcards App
//
//  Created by Trevor Leimer on 1/10/26.
//

import SwiftUI

struct CardsListView: View {
    var deck: Decks //This is the deck passed from the decks list view
    // Sets default state to not showing the view
    @State private var isShowingAddCardView = false
    var body: some View {
        List(deck.cards){ Card in
            VStack(alignment: .leading){
                Text(Card.term)
                    .font(.headline)
                Text(Card.definition)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .navigationTitle(deck.title)
        .toolbar {
            //establishes add card button in the cards list view
            Button{
                isShowingAddCardView = true //Makes pushing the specified button open the AddCardView
            } label:{
                Image(systemName:"plus")
            }
        }
        //launches AddCardView as overlay on cards list view
        .sheet (isPresented: $isShowingAddCardView) {
            AddCardView { newCard in
                deck.cards.append(newCard)
            }
        }
    }    
}
