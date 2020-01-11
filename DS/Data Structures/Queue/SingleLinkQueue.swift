//
//  SingleLinkQueue.swift
//  DS
//
//  Created by Henry Chan on 12/31/19.
//  Copyright © 2019 HDC. All rights reserved.
//

import Foundation

class SingleLinkQueue<T: Equatable>: Queue {
    typealias Node = SingleLinkNode<T>
    
    var head: Node?
    
    var tail: Node?
    
    init(node: Node? = nil) {
        self.head = node
        self.tail = node
    }
    
    func enqueue(node: Node) {
        if let _ = self.head {
            self.tail?.next = node
            self.tail = node
        } else {
            self.head = node
            self.tail = node
        }
    }
    
    @discardableResult
    func dequeue() -> Node? {
        guard let head = self.head else { return nil }
        self.head = head.next
        return head
    }
}
