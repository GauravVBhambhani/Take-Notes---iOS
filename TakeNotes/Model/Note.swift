//
//  Note.swift
//  TakeNotes
//
//  Created by Gaurav Bhambhani on 10/30/24.
//

import Foundation

struct Note {
    let id: String
    let name: String
    let description: String?
    let image: String?
    
    init(
        id: String = UUID().uuidString,
        name: String,
        description: String? = nil,
        image: String? = nil
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.image = image
    }
}
