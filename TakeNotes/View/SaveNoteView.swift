//
//  SaveNoteView.swift
//  TakeNotes
//
//  Created by Gaurav Bhambhani on 10/30/24.
//

import SwiftUI

struct SaveNoteView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var notesService: NotesService
    @State private var name = ""
    @State private var description = ""
    @State private var image = ""

    var body: some View {
        Form {
            Section("Details") {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
            }
            
            Section("Picture") {
                TextField("Image Name", text: $image)
            }
            
            Button("Save Note") {
                let note = Note(
                    name: name,
                    description: description.isEmpty ? nil : description,
                    image: image.isEmpty ? nil : image
                )
                
                Task {
                    await notesService.save(note)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    SaveNoteView()
}
