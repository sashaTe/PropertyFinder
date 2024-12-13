//
//  ViewState.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//
import Foundation

enum ViewState<T: Equatable> {
    case loading
    case error(Error)
    case loaded(T)
    case empty

    static func from(
        isLoading: Bool,
        error: Error?,
        data: T?
    ) -> ViewState<T> {
        if isLoading {
            return .loading
        }
        if let error {
            return .error(error)
        }
        if let data {
            return .loaded(data)
        }
        return .empty
    }
}

extension ViewState: Equatable {
    static func == (lhs: ViewState<T>, rhs: ViewState<T>) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.empty, .empty):
            return true
        case let (.loaded(lhsData), .loaded(rhsData)):
            return lhsData == rhsData
        case let (.error(lhsError), .error(rhsError)):
            return (lhsError as NSError) == (rhsError as NSError)
        default:
            return false
        }
    }
}
