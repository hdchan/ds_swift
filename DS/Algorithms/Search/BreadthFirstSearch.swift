//
//  BreadthFirstSearch.swift
//  DS
//
//  Created by Henry Chan on 12/31/19.
//  Copyright © 2019 HDC. All rights reserved.
//

import Foundation

struct BreadthFirstSearch<TreeNodeType: TreeNode, QueueType: Queue> where QueueType.NodeType == TreeNodeType {
    
    private let queue: QueueType
    
    init(queue: QueueType) {
        self.queue = queue
    }
    
    func search(tree: TreeNodeType, for value: TreeNodeType.Value) -> TreeNodeType? {
        if tree.value == value {
            return tree
        }
        
        queue.enqueue(node: tree)

        while let _ = queue.head {
            guard let node = queue.dequeue() else {
                break
            }
            node.visited = true
            if node.value == value {
                return node
            }
            for c in node.children as! [TreeNodeType] {
                if c.visited == false {
                    queue.enqueue(node: c)
                }
            }
        }
        
        return nil
    }
}
