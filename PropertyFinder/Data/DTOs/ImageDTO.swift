//
//  ImageDTO.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//

import Foundation

/// A data transfer object that represents image information with size variants
struct ImageDTO: Decodable {
    let suffix: String
    let prefix: String

    /// Available image size variants
    enum Size: String {
        case small = "_s"
        case large = "_l"
        case original = ""
    }

    /// Constructs URL for the image with specified size
    /// - Parameter size: Desired image size (default is original)
    /// - Returns: Optional URL for the image
    func url(size: Size = .original) -> URL? {
        let urlString: String
        if size == .original {
            urlString = prefix.replacingOccurrences(of: "http://", with: "https://") + suffix
        } else {
            urlString = prefix.replacingOccurrences(of: "http://", with: "https://") + size.rawValue + suffix
        }
        return URL(string: urlString)
    }
}

extension ImageDTO: Equatable {}
