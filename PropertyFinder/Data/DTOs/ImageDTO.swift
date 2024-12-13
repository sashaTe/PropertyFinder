//
//  ImageDTO.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 07.12.2024.
//

import Foundation

struct ImageDTO: Decodable {
    let suffix: String
    let prefix: String

    enum Size: String {
        case small = "_s"
        case large = "_l"
        case original = ""
    }

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
