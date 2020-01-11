//
//  ArrayStack.swift
//  DS
//
//  Created by Henry Chan on 12/31/19.
//  Copyright © 2019 HDC. All rights reserved.
//

import Foundation

class ArrayStack<NodeType>: Stack where NodeType: Node {
    
    var top: NodeType? {
        return array.first
    }
    
    private var array: [NodeType] = []
    
    init(node: NodeType? = nil) {
        if let node = node {
            array.append(node)
        }
    }
    
    @discardableResult
    func pop() -> NodeType? {
        return array.removeFirst()
    }
    
    func push(node: NodeType) {
        array.insert(node, at: 0)
    }
    
    func peek() -> NodeType? {
        return array.first
    }
}
