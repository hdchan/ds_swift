//
//  Stack.swift
//  DS
//
//  Created by Henry Chan on 12/31/19.
//  Copyright © 2019 HDC. All rights reserved.
//

import Foundation

protocol Stack {
    associatedtype NodeType = Node
    var top: NodeType? { get }
    func pop() -> NodeType?
    func push(node: NodeType)
    func peek() -> NodeType?
}
