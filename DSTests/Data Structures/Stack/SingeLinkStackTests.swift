//
//  SingeLinkStackTests.swift
//  DSTests
//
//  Created by Henry Chan on 12/31/19.
//  Copyright © 2019 HDC. All rights reserved.
//

import XCTest
@testable import DS

class SingleLinkStackTests: XCTestCase {
    
    func test_stack_initHasNoNode() {
        let sut = SingleLinkStack<Int>()
        
        XCTAssertNil(sut.top)
    }
    
    func test_stack_initHasRootNode() {
        let top = SingleLinkNode(value: 1)
        let sut = SingleLinkStack(node: top)
        
        XCTAssertEqual(sut.top, top)
    }
    
    func test_stack_popReturnsRootNodeAndStackIsEmpty() {
        let top = SingleLinkNode(value: 1)
        let sut = SingleLinkStack(node: top)
        
        let poppedNode = sut.pop()
        
        XCTAssertEqual(poppedNode, top)
        XCTAssertNil(sut.top)
    }
    
    func test_stack_multipleNodesPopReturnsRootAndStackRootIsNextNode() {
        let top = SingleLinkNode(value: 1)
        let nextNode = SingleLinkNode(value: 2)
        let sut = SingleLinkStack(node: top)
        
        top.next = nextNode
        let poppedNode = sut.pop()
        
        XCTAssertEqual(poppedNode, top)
        XCTAssertEqual(sut.top, nextNode)
    }
    
    func test_stack_emptyStackPopReturnsNoNode() {
        let top = SingleLinkNode(value: 1)
        let sut = SingleLinkStack(node: top)
        
        sut.pop()
        let nextPoppedNode = sut.pop()
        
        XCTAssertNil(nextPoppedNode)
    }
    
    func test_stack_pushNewNodeBecomesRootAndOriginalRootIsNext() {
        let top = SingleLinkNode(value: 1)
        let pushedNode = SingleLinkNode(value: 2)
        let sut = SingleLinkStack(node: top)
        
        sut.push(node: pushedNode)
        
        XCTAssertEqual(sut.top, pushedNode)
        XCTAssertEqual(sut.top?.next, top)
    }
    
    func test_stack_pushNewNodeOnEmptyStackMakeNodeRoot() {
        let pushedNode = SingleLinkNode(value: 2)
        let sut = SingleLinkStack<Int>()
        
        sut.push(node: pushedNode)
        
        XCTAssertEqual(sut.top, pushedNode)
    }
    
    func test_stack_peekReturnsNilForEmptyStack() {
        let sut = SingleLinkStack<Int>()
        
        let peeked = sut.peek()
        
        XCTAssertNil(peeked)
    }
    
    func test_stack_peekReturnTopButDoesNotRemoveTop() {
        let top = SingleLinkNode(value: 1)
        let sut = SingleLinkStack(node: top)
        
        let peeked = sut.peek()
        
        XCTAssertEqual(peeked, top)
        XCTAssertEqual(sut.top, top)
    }
    
    func test_stack_peekReturnTopForLongerStack() {
        let top = SingleLinkNode(value: 1)
        let pushedNode = SingleLinkNode(value: 2)
        let sut = SingleLinkStack(node: top)
        
        sut.push(node: pushedNode)
        let peeked = sut.peek()
        
        XCTAssertEqual(peeked, pushedNode)
        XCTAssertEqual(sut.top, pushedNode)
    }
}

