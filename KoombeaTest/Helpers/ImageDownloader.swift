//
//  ImageDownloader.swift
//  KoombeaTest
//
//  Created by Matheus Weber on 19/10/23.
//

import Foundation
import UIKit

class ImageDownloader {
    static let shared = ImageDownloader()
    
    func downloadImageFromUrl(url: URL, completion: @escaping (UIImage) -> Void) {
        Task {
            do {
                let data = try await downloadImageData(from: url)
                if let image = UIImage(data: data) {
                    completion(image)
                }
                // Display the image
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func downloadImageData(from url: URL) async throws -> Data {
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
}
