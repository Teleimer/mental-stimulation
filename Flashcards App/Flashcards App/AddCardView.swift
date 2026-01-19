//
//  AddCardView.swift
//  Flashcards App
//
//  Created by Trevor Leimer on 1/10/26.
//

import SwiftUI

struct AddCardView: View {
    //Erstablish vars within this view to take input data for the new card
    @State private var definedTerm: String = ""
    @State private var definedDefinition: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var onSave: (Card) -> Void
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Term To Define", text: $definedTerm)
                TextField("Definition", text: $definedDefinition)
            }
            .navigationTitle("Add Card")
            .toolbar {
                ToolbarItem(placement: .cancellationAction){ // Places the item specified in the next rows at the toolbar button that is associated with the cancel action location on the default toolbar. the { at the end is then the button or function that will be plaed at that location
                    Button("Cancel"){
                        dismiss()//Creates a button, with the name in "" that performs {function}
                    }
                }
                    ToolbarItem(placement: .confirmationAction){
                        Button("Done"){
                            let newCard = Card(term: definedTerm, definition: definedDefinition)
                            onSave(newCard)
                            dismiss()
                        }
                        
                    }
                }
            }
        }
    }

