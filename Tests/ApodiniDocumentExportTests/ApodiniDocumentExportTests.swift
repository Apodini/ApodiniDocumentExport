//
//  ApodiniDocumentExportTests.swift
//  
//
//  Created by Valentin Bootz on 29.01.22.
//

import Foundation
import XCTest
import PathKit
@testable import ApodiniDocumentExport

class ApodiniDocumentExportTests: XCTestCase {
    
    let dir = "./\(UUID().uuidString)"
    var path: Path {
        Path(dir)
    }

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        if !path.exists {
            try path.mkpath()
        }
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()

        try path.delete()
    }
    
    func XCTAssertNoThrowWithResult<T>(_ expression: @autoclosure () throws -> T, file: StaticString = #file, line: UInt = #line) -> T {
        XCTAssertNoThrow(try expression(), file: file, line: line)
        do {
            return try expression()
        } catch {
            XCTFail(error.localizedDescription, file: file, line: line)
        }
        preconditionFailure("Expression threw an error")
    }
    
    func XCTAssertThrows<T>(_ expression: @autoclosure () throws -> T) {
        let expectation = XCTestExpectation(description: "Expression did throw")
        do {
            try _ = expression()
            XCTFail("Expression did not throw")
        } catch {
            expectation.fulfill()
        }
    }

    func testYAMLandJSON() throws {
        for format in [OutputFormat.json, .yaml] {
            guard let url = Bundle.module.url(forResource: "document", withExtension: "json") else {
                fatalError("Resource not found!")
            }
            guard let content = try? String(contentsOf: url, encoding: .utf8) else {
                fatalError("Failed to read the resource")
            }
            let document: Document = XCTAssertNoThrowWithResult(try Document.decode(from: content))
            let path = Path(XCTAssertNoThrowWithResult(try document.write(at: dir, outputFormat: format)))
            XCTAssertThrows(try Document.decode(from: path + "invalid"))
            let stringContent = XCTAssertNoThrowWithResult(try path.read() as String)
            let documentFromPath = XCTAssertNoThrowWithResult(try Document.decode(from: path))
            XCTAssert(document == documentFromPath)
            XCTAssertEqual(format.string(of: document).isEmpty, false)
            XCTAssertEqual(stringContent.isEmpty, false)
        }
    }
}
