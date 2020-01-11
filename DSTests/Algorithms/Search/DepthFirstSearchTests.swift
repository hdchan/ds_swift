//
//  DepthFirstSearch.swift
//  DSTests
//
//  Created by Henry Chan on 12/31/19.
//  Copyright © 2019 HDC. All rights reserved.
//

import XCTest
@testable import DS

class DepthFirstSearchTests: XCTestCase {
    
    func test_dfs_root() {
        let root = BinaryTreeNode(value: 2)
        let (sut, spy) = createSUT()
        
        let node = sut.search(tree: root, for: 2)
        
        XCTAssertEqual(node, root)
        XCTAssertEqual(spy.pushedItems, [])
    }
    
    func test_dfs_returnsLeftNode() {
        let right = BinaryTreeNode(value: 3)
        let left = BinaryTreeNode(value: 2)
        let root = BinaryTreeNode(value: 1)
        root.left = left
        root.right = right
        let (sut, spy) = createSUT()
        
        let node = sut.search(tree: root, for: 2)
        
        XCTAssertEqual(node, left)
        XCTAssertEqual(spy.pushedItems, [root])
    }
    
    func test_dfs_returnsRightNode() {
        let right = BinaryTreeNode(value: 3)
        let left = BinaryTreeNode(value: 2)
        let root = BinaryTreeNode(value: 1)
        root.left = left
        root.right = right
        let (sut, spy) = createSUT()
        
        let node = sut.search(tree: root, for: 3)
        
        XCTAssertEqual(node, right)
        XCTAssertEqual(spy.pushedItems, [root, left])
    }
    
    func test_dfs_returnsCorrectNode() {
        let root = BinaryTreeNode(value: 1)
        let two = BinaryTreeNode(value: 2)
        let three = BinaryTreeNode(value: 3)
        let four = BinaryTreeNode(value: 4)
        let five = BinaryTreeNode(value: 5)
        let six = BinaryTreeNode(value: 6)
        let seven = BinaryTreeNode(value: 7)
        
        root.left = two
        root.right = three
        two.left = four
        two.right = five
        three.left = six
        three.right = seven
        let (sut, spy) = createSUT()
        
        let node = sut.search(tree: root, for: 7)
     
        XCTAssertEqual(node, seven)
        XCTAssertEqual(spy.pushedItems, [root,
                                         two,
                                         four,
                                         five,
                                         three,
                                         six])
    }
    
    private func createSUT<T: BinaryTreeNode<Int>>() -> (DepthFirstSearch<T, ArrayStackSpy<T>>, ArrayStackSpy<T>) {
        let stack = ArrayStackSpy<T>()
        let bfs = DepthFirstSearch(stack: stack)
        return (bfs, stack)
    }
    
    
    private class ArrayStackSpy<NodeType>: ArrayStack<NodeType> where NodeType: Node {
        var pushedItems: [NodeType] = []
        
        override func push(node: NodeType) {
            super.push(node: node)
            pushedItems.append(node)
        }
    }
}
