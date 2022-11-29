//
// This source file is part of the Apodini open source project
// 
// SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//


import ApodiniDocumentExport

struct Document: Value {
    let id: String
    let name: String
    let content: [Content]
    
    struct Content: Value {
        let value: Int
    }
}
