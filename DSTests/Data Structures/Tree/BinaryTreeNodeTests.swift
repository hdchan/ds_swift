//
//  BinaryTreeNodeTests.swift
//  DSTests
//
//  Created by Henry Chan on 12/31/19.
//  Copyright © 2019 HDC. All rights reserved.
//

import XCTest
@testable import DS

class BinaryTreeNodeTests: XCTestCase {
    
    func test_btn_initWithValueAndEmptyBraches() {
        let sut = BinaryTreeNode(value: 2)
        
        XCTAssertEqual(sut.value, 2)
        XCTAssertNil(sut.left)
        XCTAssertNil(sut.right)
        XCTAssertFalse(sut.visited)
    }
    
    func test_btn_assignLeaves() {
        let left = BinaryTreeNode(value: 2)
        let right = BinaryTreeNode(value: 3)
        let sut = BinaryTreeNode(value: 1)
        
        sut.left = left
        sut.right = right
        
        XCTAssertEqual(sut.left, left)
        XCTAssertEqual(sut.right, right)
    }
    
    func test_btn_setVisited_correctlyReturnsVisitedState() {
        let sut = BinaryTreeNode(value: 2)
        
        XCTAssertFalse(sut.visited)
        
        sut.visited = true
        
        XCTAssertTrue(sut.visited)
        
        sut.visited = false
        
        XCTAssertFalse(sut.visited)
    }
}
