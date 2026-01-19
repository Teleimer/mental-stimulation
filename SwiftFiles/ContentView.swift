//
//  ContentView.swift
//  Flashcards App
//
//  Created by Trevor Leimer on 1/10/26.
//

import SwiftUI

struct ContentView: View {
    // 1. Declare the variable WITHOUT assigning it data here
    @State private var myCourses: [Course]
    @State private var isShowingAddCourseView = false
    
    // 2. Use an init() to create the data once when the app starts
    init() {
        let course1 = Course(title: "CS 271", decks: [
            Decks(title: "Module 1", cards: [
                Card(term: "Register", definition: "A unit that stores information")
            ])
        ])
        
        let course2 = Course(title: "CS 162", decks: [])
        
        // This ensures the objects are created in memory only once
        _myCourses = State(initialValue: [course1, course2])
    }

    var body: some View {
        NavigationStack {
            List(myCourses) { course in
                NavigationLink(course.title) {
                    DeckListView(course: course)
                }
            }
            .navigationTitle("Courses") //Creates standard banner at the top of the app
            .toolbar {
                Button {
                    isShowingAddCourseView = true //Describes the function of the button: to show the add course view
                } label: {
                    Image(systemName: "plus") //Assignnes a core image to the button that creates this function
                }
            }
            //.sheet allows you to show a new screen on top of the one that you are currently in. You are navigating within the course-view page, and opening up the add course page, within that environment
            .sheet(isPresented: $isShowingAddCourseView){
                //isPresented tells the app what screen it should actually be showing
                //Below designates naming and storage of the new file that is being created within AddCourseView
                AddCourseView { newCourse in
                    myCourses.append(newCourse)
                }
            }
        }
    }
}
