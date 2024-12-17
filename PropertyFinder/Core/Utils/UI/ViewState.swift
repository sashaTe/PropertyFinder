//
//  ViewState.swift
//  PropertyFinder
//
//  Created by Alexander Zarutskiy on 12.12.2024.
//
import Foundation

/// Represents the state of data loading in the application
/// Generic type T must conform to Equatable for state comparison
enum ViewState<T: Equatable> {
    /// Data is currently being loaded
    case loading
    /// An error occurred during data loading
    case error(Error)
    /// Data was successfully loaded
    case loaded(T)
    /// No data is available
    case empty

    /// Creates a ViewState instance based on current loading conditions
    /// - Parameters:
    ///   - isLoading: Whether data is currently being loaded
    ///   - error: Optional error that occurred during loading
    ///   - data: Optional data that was loaded
    /// - Returns: Appropriate ViewState based on the parameters
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
