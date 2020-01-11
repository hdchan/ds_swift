//
//  TreeNode.swift
//  DS
//
//  Created by Henry Chan on 12/31/19.
//  Copyright © 2019 HDC. All rights reserved.
//

import Foundation

protocol TreeNode: NSObject, Node {
    associatedtype Node = TreeNode
    var children: [Node] { get }
    var visited: Bool { get set }
}
