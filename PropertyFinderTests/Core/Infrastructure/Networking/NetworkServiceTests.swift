//
//  NetworkServiceTests.swift
//  PropertyFinderTests
//
//  Created by Alexander Zarutskiy on 06.12.2024.
//

import XCTest
@testable import PropertyFinder

final class NetworkServiceTests: XCTestCase {
    var sut: NetworkServiceProtocol!
    var mockURLSession: URLSession!

    override func setUp() {
        super.setUp()

        // Configure URLSession with mock protocol
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        mockURLSession = URLSession(configuration: configuration)
        sut = NetworkService(session: mockURLSession)
    }

    override func tearDown() {
        sut = nil
        mockURLSession = nil
        MockURLProtocol.requestHandler = nil
        super.tearDown()
    }

    /// Test successful property list fetch with valid response
    func testFetchPropertyList_Success() async throws {
        // Given
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )!
            return (response, MockResponses.validPropertyListResponse!)
        }

        // When
        let result: PropertyListResponseDTO = try await sut.fetch(from: .cityProperties(cityId: 1530))

        // Then
        XCTAssertEqual(result.properties.count, 1)
        XCTAssertEqual(result.properties.first?.id, "32849")
        XCTAssertEqual(result.properties.first?.name, "Test Property")
    }

    /// Test successful property detail fetch with valid response
    func testFetchPropertyDetail_Success() async throws {
        // Given
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )!
            return (response, MockResponses.validPropertDetailResponse!)
        }
        
        // When
        let result: PropertyDetailDTO = try await sut.fetch(from: .propertyDetail(id: "32849"))

        // Then
        XCTAssertEqual(result.id, "32849")
        XCTAssertEqual(result.name, "STF Vandrarhem Stigbergsliden")
        XCTAssertEqual(result.rating?.overall, 82)

    }

    /// Test handling of server error response
    func testFetch_ServerError() async {
        // Given
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 500,
                httpVersion: nil,
                headerFields: nil
            )!
            return (response, Data())
        }

        // When/Then
        do {
            let _:PropertyListResponseDTO = try await sut.fetch(from: .cityProperties(cityId: 1530))
            XCTFail("Expected Server Error")
        } catch let error as NetworkError {
            XCTAssertEqual(error, NetworkError.serverError(500))
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }

    /// Test handling of invalid JSON response
    func testFetch_DecodingError() async throws {
        // Given
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )!
            return (response, MockResponses.invalidResponse!)
        }

        // When/Then
        do {
            let _:PropertyListResponseDTO = try await sut.fetch(from: .cityProperties(cityId: 1530))
            XCTFail("Unexpected decoding error")
        } catch let error as NetworkError {
            XCTAssertEqual(error, NetworkError.decodingError)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }

    }

}
