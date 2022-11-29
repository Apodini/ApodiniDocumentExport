//
// This source file is part of the Apodini open source project
// 
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation
import PathKit
@_implementationOnly import Yams

public extension Decodable {
    /// Initializes self from data
    static func decode(from data: Data) throws -> Self {
        try JSONDecoder().decode(Self.self, from: data)
    }
    
    /// Initializes self from string
    static func decode(from string: String) throws -> Self {
        try decode(from: string.data())
    }
    
    /// Initializes self from the content of path
    static func decode(from path: Path) throws -> Self {
        guard path.is(.json) || path.is(.yaml) else {
            throw DecodingError.dataCorrupted(
                .init(
                    codingPath: [],
                    debugDescription: "`ApodiniMigrator` only supports decoding of files in either json or yaml format"
                )
            )
        }
        let data = try path.read() as Data
        if path.is(.yaml) {
            return try YAMLDecoder().decode(from: data)
        }
        return try decode(from: data)
    }
}
