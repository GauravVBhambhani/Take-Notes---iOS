//
//  NotesView.swift
//  TakeNotes
//
//  Created by Gaurav Bhambhani on 10/30/24.
//

import SwiftUI

struct NotesView: View {
    @EnvironmentObject private var authenticationService: AuthenticationService
    @EnvironmentObject private var notesService: NotesService
    @State private var isSavingNote = false

    var body: some View {
        NavigationStack{
            List {
                if notesService.notes.isEmpty {
                    Text("No notes")
                }
                ForEach(notesService.notes, id: \.id) { note in
                    NoteView(note: note)
                }
                .onDelete { indices in
                    for index in indices {
                        let note = notesService.notes[index]
                        Task {
                            await notesService.delete(note)
                        }
                    }
                }
            }
            .navigationTitle("Notes")
            .toolbar {
                Button("Sign Out") {
                    Task {
                        await authenticationService.signOut()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("⨁ New Note") {
                        isSavingNote = true
                    }
                    .bold()
                }
            }
            .sheet(isPresented: $isSavingNote) {
                SaveNoteView()
            }
        }
        .task {
            await notesService.fetchNotes()
        }
    }
}
//
//#Preview {
//    NotesView(notes: [
//        Note(
//            name: "First note",
//            description: "This is an example of a long note description that has \nexplicit line breaks.",
//            image: "mic"
//        ),
//        Note(
//            name: "Second note",
//            description: "This is a short description.",
//            image: "phone"
//        ),
//        Note(
//            name: "Third note"
//        )
//    ])
//}
