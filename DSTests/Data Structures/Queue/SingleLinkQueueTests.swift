//
//  SingleLinkQueueTests.swift
//  DSTests
//
//  Created by Henry Chan on 12/31/19.
//  Copyright © 2019 HDC. All rights reserved.
//

import XCTest
@testable import DS

class SingleLinkQueueTests: XCTestCase {
    
    func test_queue_initHasNilRootAndTail() {
        let sut = SingleLinkQueue<Int>()
        
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
    
    func test_queue_initWithNodeIsHeadAndTail() {
        let node = SingleLinkNode(value: 1)
        let sut = SingleLinkQueue(node: node)
        
        XCTAssertEqual(sut.head, node)
        XCTAssertEqual(sut.tail, node)
    }
    
    func test_queue_enqueueEmptyQueueNodeBecomesHeadAndTail() {
        let node = SingleLinkNode(value: 1)
        let sut = SingleLinkQueue<Int>()
        
        sut.enqueue(node: node)
        
        XCTAssertEqual(sut.head, node)
        XCTAssertEqual(sut.tail, node)
    }
    
    func test_queue_enqueueNodeBecomesHeadNextAndTail() {
        let firstNode = SingleLinkNode(value: 1)
        let secondNode = SingleLinkNode(value: 2)
        let sut = SingleLinkQueue(node: firstNode)
        
        sut.enqueue(node: secondNode)
        
        XCTAssertEqual(sut.head?.next, secondNode)
        XCTAssertEqual(sut.tail, secondNode)
    }
    
    func test_queue_enqueueThreeNodes() {
        let firstNode = SingleLinkNode(value: 1)
        let secondNode = SingleLinkNode(value: 2)
        let thirdNode = SingleLinkNode(value: 3)
        let sut = SingleLinkQueue(node: firstNode)
        
        sut.enqueue(node: secondNode)
        sut.enqueue(node: thirdNode)
        
        XCTAssertEqual(sut.head?.next, secondNode)
        XCTAssertEqual(sut.tail, thirdNode)
    }
    
    func test_queue_dequeueReturnsHeadAndMakesNextHead() {
        let firstNode = SingleLinkNode(value: 1)
        let secondNode = SingleLinkNode(value: 2)
        let sut = SingleLinkQueue(node: firstNode)
        
        sut.enqueue(node: secondNode)
        let dequeuedNode = sut.dequeue()
        
        XCTAssertEqual(dequeuedNode, firstNode)
        XCTAssertEqual(sut.head, secondNode)
    }
    
    func test_queue_dequeueEmptyQueueReturnsNothing() {
        let sut = SingleLinkQueue<Int>()
        
        let dequeuedNode = sut.dequeue()
        
        XCTAssertNil(dequeuedNode)
    }
}
