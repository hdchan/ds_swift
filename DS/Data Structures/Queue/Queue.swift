//
//  Queue.swift
//  DS
//
//  Created by Henry Chan on 12/31/19.
//  Copyright © 2019 HDC. All rights reserved.
//

import Foundation

protocol Queue {
    associatedtype NodeType = Node
    var head: NodeType? { get }
    var tail: NodeType? { get }
    func enqueue(node: NodeType)
    func dequeue() -> NodeType?
}
