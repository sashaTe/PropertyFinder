//
//  MockURLProtocol.swift
//  PropertyFinderTests
//
//  Created by Alexander Zarutskiy on 06.12.2024.
//

import Foundation

/// A mock URL protocol for testing network requests
class MockURLProtocol: URLProtocol {
    /// Handler that provides mock responses for requests
    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data))?

    /// Always returns true to handle all requests
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    /// Returns the request as is without modifications
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    /// Simulates loading of the request by calling the handler and returning mock data
    override func startLoading() {
        guard let handler = MockURLProtocol.requestHandler else {
            fatalError("Handler is unavailable")
        }

        do {
            let (response, data) = try handler(request)

            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }
    
    /// Required implementation for URL protocol
    override func stopLoading() {}
}
