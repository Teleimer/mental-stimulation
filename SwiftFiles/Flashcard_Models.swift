//
//  Flashcard_Models.swift
//  Flashcards App
//
//  Created by Trevor Leimer on 1/10/26.
//
//  Creates Structs and Functions necessary for the project

import Foundation


@Observable
class Course: Identifiable {
    let id = UUID() // Must be 'let id', not 'var id'
    var title: String
    var decks: [Decks]
    
    init(title: String, decks: [Decks]) {
        self.title = title
        self.decks = decks
    }
}

@Observable
class Decks: Identifiable {
    let id = UUID()
    var title: String
    var cards: [Card]
    
    init(title: String, cards: [Card]) {
        self.title = title
        self.cards = cards
    }
}
//1. Top Level Organization -- Courses -- Each Course can have Many
//Decks for that specific Course.
//struct Course : Identifiable {
  //  let id = UUID() //Automatically creates a unique ID, Need to use this to allow for different levels of the app
 //   var title: String
    //Title of the specific Course
  //  var decks: [Decks]
    // Array of Decks struct that will be attributed to a specific course
//}

//2. Mid Level Organization -- Deck -- Each Deck can be named to a specific section/topic/etc
//Contains an array of individual cards

//struct Decks : Identifiable {
  //  let id = UUID() //Same as above
   // var title: String
    //var cards: [Card]
    
//}


//3. Low Level Oraganization -- Card -- Each Card is given a term and a definition for that term
struct Card : Identifiable{
    let id = UUID() //Again, same as above.
    var term: String // The front of the card
    var definition: String // The back of the Flashcard
}



