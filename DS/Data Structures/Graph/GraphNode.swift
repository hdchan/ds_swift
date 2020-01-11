//
//  GraphNode.swift
//  DS
//
//  Created by Henry Chan on 1/10/20.
//  Copyright © 2020 HDC. All rights reserved.
//

import Foundation

class GraphNode<T: Equatable>: NSObject, Node {
    typealias Value = T
    
    let value: T
    
    var visited: Bool = false
    
    init(value: T) {
        self.value = value
    }
}
