//
//  AddCourseView.swift
//  Flashcards App
//
//  Created by Trevor Leimer on 1/10/26.
//

import SwiftUI

struct AddCourseView: View {
    //This generates a box for user to type and maintain the text in place
    @State private var courseTitle: String = "" 
    
    //Lets us dismiss when done entering info
    @Environment(\.dismiss) var dismiss
    
    //Cancel out of the new Course view, back to courses screen
    var onSave: (Course) -> Void
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Course Title", text:$courseTitle)
            }
            .navigationTitle("New Course")
            .toolbar{
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel"){dismiss()}
                }
                ToolbarItem(placement: .confirmationAction){
                    Button("Done"){
                        let newCourse = Course(title: courseTitle, decks: []) // makes newCourse = a Course struct named the input title provided, with a blank decks page This is why it is okay that courseTitle defined in line 12 is okay and not goig to cause an issue. That is local to this page, not the struct
                        
                        onSave(newCourse)//Creates the newCourse object on the screen once saved
                        dismiss()
                    }
                    .disabled(courseTitle.isEmpty) //Does not allow blank course names
                }
            }
        }
    }
}
