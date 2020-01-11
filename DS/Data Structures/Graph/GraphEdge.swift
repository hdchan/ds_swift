//
//  GraphEdge.swift
//  DS
//
//  Created by Henry Chan on 1/10/20.
//  Copyright © 2020 HDC. All rights reserved.
//

import Foundation

class GraphEdge<T: Equatable>: NSObject {
    typealias Node = GraphNode<T>
    
    let source: Node
    let target: Node
    
    init(source: Node, target: Node) {
        self.source = source
        self.target = target
    }
}
