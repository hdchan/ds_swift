//
//  SingleLinkNodeTest.swift
//  DSTests
//
//  Created by Henry Chan on 12/31/19.
//  Copyright © 2019 HDC. All rights reserved.
//

import XCTest
@testable import DS

class SingleLinkNodeTests: XCTestCase {

    func test_node_hasValue() {
        let sut = SingleLinkNode(value: 2)
        
        XCTAssertEqual(sut.value, 2)
    }
    
    func test_node_initDoesNotHaveNextNode() {
        let sut = SingleLinkNode(value: 2)
        
        XCTAssertNil(sut.next)
    }
    
    func test_node_setNextNodeHasNextNode() {
        let sut = SingleLinkNode(value: 2)
        let nextNode = SingleLinkNode(value: 3)
        
        sut.next = nextNode
        
        XCTAssertEqual(sut.next, nextNode)
    }
}
