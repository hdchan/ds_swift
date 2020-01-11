//
//  GraphEdgeTests.swift
//  DSTests
//
//  Created by Henry Chan on 1/10/20.
//  Copyright © 2020 HDC. All rights reserved.
//

import XCTest
@testable import DS

class GraphEdgeTests: XCTestCase {
    func test_graphEdge_init() {
        let source = GraphNode(value: 2)
        let target = GraphNode(value: 3)
        let sut = GraphEdge(source: source, target: target)
        
        XCTAssertEqual(sut.source, source)
        XCTAssertEqual(sut.target, target)
    }
}


