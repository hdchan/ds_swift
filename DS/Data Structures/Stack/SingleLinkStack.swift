//
//  SingleLinkStack.swift
//  DS
//
//  Created by Henry Chan on 12/31/19.
//  Copyright © 2019 HDC. All rights reserved.
//

import Foundation

class SingleLinkStack<T: Equatable>: Stack {
    typealias Node = SingleLinkNode<T>
    
    var top: Node?
    
    init(node: Node? = nil) {
        self.top = node
    }
    
    @discardableResult
    func pop() -> Node? {
        guard let top = self.top else { return nil }
        
        if let nextNode = self.top?.next {
            self.top = nextNode
        } else {
            self.top = nil
        }
        
        return top
    }
    
    func push(node: Node) {
        node.next = self.top
        self.top = node
    }
    
    func peek() -> Node? {
        return self.top
    }
}
