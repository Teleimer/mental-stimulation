//
//  Untitled.swift
//  Flashcards App
//
//  Created by Trevor Leimer on 1/11/26.
//

var course: Course
@State private var isShowingAddDeckView = false

var body: some View {
    // Breaking the recursion loop by using a unique name
    @Bindable var bindableCourse = course
    
    VStack {
        if course.decks.isEmpty {
            ContentUnavailableView {
                Label("No Decks Yet", systemImage: "square.stack")
            } description: {
                Text("Add your first deck to start studying.")
            }
        } else {
            List($bindableCourse.decks) { $deck in
                NavigationLink(destination: CardsListView(deck: $deck)) {
                    Text(deck.title)
                }
            }
        }
    } // Closes VStack
    .navigationTitle(bindableCourse.title)
    .toolbar {
        ToolbarItem(placement: .primaryAction) {
            Button("Add Deck") {
                isShowingAddDeckView = true
            }
        }
    }
    .sheet(isPresented: $isShowingAddDeckView) {
        AddDeckView { newDeck in
            bindableCourse.decks.append(newDeck)
        }
    }
} // Closes body
} // Closes struct
