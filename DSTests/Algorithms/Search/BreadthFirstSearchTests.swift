//
//  BreadthFirstSearchTests.swift
//  DSTests
//
//  Created by Henry Chan on 12/31/19.
//  Copyright © 2019 HDC. All rights reserved.
//

import XCTest
@testable import DS

class BreadthFirstSearchTests: XCTestCase {
    
    func test_bfs_root() {
        let root = BinaryTreeNode(value: 2)
        let (sut, spy) = createSUT()
            
        let node = sut.search(tree: root, for: 2)
        
        XCTAssertEqual(node, root)
        XCTAssertEqual(spy.dequeuedItems, [])
    }
    
    func test_bfs_returnsLeftNode() {
        let right = BinaryTreeNode(value: 3)
        let left = BinaryTreeNode(value: 2)
        let root = BinaryTreeNode(value: 1)
        root.left = left
        root.right = right
        let (sut, spy) = createSUT()
        
        let node = sut.search(tree: root, for: 2)
        
        XCTAssertEqual(node, left)
        XCTAssertEqual(spy.dequeuedItems, [root, left])
    }
    
    func test_bfs_returnsRightNode() {
        let right = BinaryTreeNode(value: 3)
        let left = BinaryTreeNode(value: 2)
        let root = BinaryTreeNode(value: 1)
        root.left = left
        root.right = right
        let (sut, spy) = createSUT()
        
        let node = sut.search(tree: root, for: 3)
        
        XCTAssertEqual(node, right)
        XCTAssertEqual(spy.dequeuedItems, [root, left, right])
    }
    
    func test_bfs_returnsCorrectNode() {
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
        XCTAssertEqual(spy.dequeuedItems, [root,
                                           two,
                                           three,
                                           four,
                                           five,
                                           six,
                                           seven])
    }
    
    private func createSUT<T: BinaryTreeNode<Int>>() -> (BreadthFirstSearch<T, ArrayQueueSpy<T>>, ArrayQueueSpy<T>) {
        let queue = ArrayQueueSpy<T>()
        let bfs = BreadthFirstSearch(queue: queue)
        return (bfs, queue)
    }
    
    
    private class ArrayQueueSpy<NodeType>: ArrayQueue<NodeType> where NodeType: Node {
        var dequeuedItems: [NodeType] = []
        
        override func dequeue() -> NodeType? {
            guard let dequeued = super.dequeue() else {
                return nil
            }
            dequeuedItems.append(dequeued)
            return dequeued
        }
    }
}
