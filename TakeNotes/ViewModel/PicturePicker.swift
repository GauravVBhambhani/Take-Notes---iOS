//
//  PicturePicker.swift
//  TakeNotes
//
//  Created by Gaurav Bhambhani on 10/30/24.
//

import PhotosUI
import SwiftUI

struct PicturePicker: View {
    @State private var selectedPhoto: PhotosPickerItem? = nil
    @Binding var selectedData: Data?
    
    var body: some View {
        VStack {
            if let selectedData, let image = UIImage(data: selectedData) {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Rectangle())
//                    .overlay(.stroke(Color.white, lineWidth: 4))
//                    .shadow(radius: 10)
            }
            
            PhotosPicker(title, selection: $selectedPhoto)
        }
        .onChange(of: selectedPhoto) {
            Task {
                selectedData = try? await selectedPhoto?.loadTransferable(type: Data.self)
            }
        }
    }
    
    private var title: String {
        return selectedPhoto == nil ? "Choose a picture" : "Change picture"
    }
}
