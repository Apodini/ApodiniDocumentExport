//
//  File.swift
//  
//
//  Created by Valentin Bootz on 29.01.22.
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
