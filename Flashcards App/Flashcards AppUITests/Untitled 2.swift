//
//  Untitled 2.swift
//  Flashcards App
//
//  Created by Trevor Leimer on 1/11/26.
//

struct ContentView: View {
    // Temporary data, just to make sure it works as we build out
    @State private var myCourses=[   //State specifically means to refresh and keep the item updated.
        //Next section creates temporary data
        Course(title:"CS 271", decks:[
            Decks(title: "Module 1", cards: [Card(term: "Register", definition: "A unit that stores information")])
        ]),
        Course(title: "CS 162", decks: [])
    ]
    @State private var isShowingAddCourseView = false
    
    var body: some View{
        NavigationStack{
            List(myCourses) { course in
                NavigationLink(course.title){
                    DeckListView(course: course)
                    // Creates a dropdown Menu
                    //This is the home of Level 2, Decks names and organization will live
                    Text("Decks for \(course.title)")
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
