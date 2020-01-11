//
//  DepthFirstSearch.swift
//  DS
//
//  Created by Henry Chan on 12/31/19.
//  Copyright © 2019 HDC. All rights reserved.
//

import Foundation

struct DepthFirstSearch<TreeNodeType: TreeNode, StackType: Stack> where StackType.NodeType == TreeNodeType {
    
    private let stack: StackType
    
    init(stack: StackType) {
        self.stack = stack
    }
    
    func search(tree: TreeNodeType, for value: TreeNodeType.Value) -> TreeNodeType? {
        if tree.value == value {
            return tree
        }
        
        stack.push(node: tree)
                
        for c in tree.children as! [TreeNodeType] {
            if let found = search(tree: c, for: value) {
                return found
            }
        }
        
        return nil
    }
}
