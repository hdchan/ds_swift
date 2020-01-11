//
//  ArrayQueue.swift
//  DS
//
//  Created by Henry Chan on 12/31/19.
//  Copyright © 2019 HDC. All rights reserved.
//

import Foundation

class ArrayQueue<NodeType>: Queue where NodeType: Node {
    var head: NodeType? {
        return array.first
    }

    var tail: NodeType? {
        return array.last
    }

    private var array: [NodeType] = []
    
    init(node: NodeType? = nil) {
        if let node = node {
            array.append(node)
        }
    }

    func enqueue(node: NodeType) {
        array.append(node)
    }

    func dequeue() -> NodeType? {
        return array.removeFirst()
    }
}
