//
//  StorageService.swift
//  TakeNotes
//
//  Created by Gaurav Bhambhani on 10/30/24.
//

import Amplify
import Foundation

class StorageService: ObservableObject {
    
    func upload(_ data: Data, name: String) async {
        let task = Amplify.Storage.uploadData(
            key: name,
            data: data,
            options: .init(accessLevel: .private)
        )
        do {
            let result = try await task.value
            print("Upload data completed with result: \(result)")
        } catch {
            print("ERROR: Upload data failed with error: \(error)")
        }
    }
    
    func download(withName name: String) async -> Data? {
        let task = Amplify.Storage.downloadData(
            key: name,
            options: .init(accessLevel: .private)
        )
        do {
            let result = try await task.value
            print("Download data completed")
            return result
        } catch {
            print("ERROR: Download data failed with error: \(error)")
            return nil
        }
    }
    
    func remove(withName name: String) async {
        do {
            let result = try await Amplify.Storage.remove(
                key: name,
                options: .init(accessLevel: .private)
            )
        } catch {
            print("ERROR: Remove failed with error: \(error)")
        }
    }
    
}
