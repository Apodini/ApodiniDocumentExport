//
// This source file is part of the Apodini open source project
// 
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Foundation
import PathKit

public extension String {
    
    /// Returns encoded data of `self`
    func data(_ encoding: Encoding = .utf8) -> Data {
        data(using: encoding) ?? .init()
    }
}
