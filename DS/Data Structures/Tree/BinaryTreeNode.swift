//
//  BinaryTreeNode.swift
//  DS
//
//  Created by Henry Chan on 12/31/19.
//  Copyright © 2019 HDC. All rights reserved.
//

import Foundation

class BinaryTreeNode<T: Equatable>: NSObject, TreeNode {
    typealias Value = T
    
    typealias TreeNode = BinaryTreeNode
    
    let value: T
    
    var left: BinaryTreeNode?
    
    var right: BinaryTreeNode?
    
    var visited: Bool = false
    
    var children: [TreeNode] {
        return [left, right].compactMap({ $0 })
    }
    
    init(value: T) {
        self.value = value
    }
}
