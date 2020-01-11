//
//  GraphAdjacencyListTests.swift
//  DSTests
//
//  Created by Henry Chan on 1/10/20.
//  Copyright © 2020 HDC. All rights reserved.
//

import XCTest
@testable import DS

class GraphAdjacencyListTests: XCTestCase {

    func test_gal_addVertex_producesCorrectActions() {
        let sut = GraphAdjacencyListSpy<Int>()
        
        let result = sut.createVertex(with: 2)
        
        XCTAssertEqual(sut.verticies, [result])
        XCTAssertEqual(result.value, 2)
        XCTAssertEqual(sut.actions, [.addVertex])
    }
    
    func test_gal_addDirectedEdge_producedCorrectActions() {
        let sut = GraphAdjacencyListSpy<Int>()
        
        let node1 = sut.createVertex(with: 2)
        let node2 = sut.createVertex(with: 4)
        sut.addDirectedEdge(from: node1, to: node2)
        
        XCTAssertEqual(sut.verticies, [node1, node2])
        XCTAssertEqual(sut.actions, [.addVertex, .addVertex, .addDirectedEdge])
    }
    
    func test_gal_addDirectedEdgeFromEnum_producedCorrectActions() {
        let sut = GraphAdjacencyListSpy<Int>()
        
        let node1 = sut.createVertex(with: 2)
        let node2 = sut.createVertex(with: 4)
        sut.addDirectedEdge(from: node1, to: node2)
        
        XCTAssertEqual(sut.verticies, [node1, node2])
        XCTAssertEqual(sut.actions, [.addVertex, .addVertex, .addDirectedEdge])
    }
    
    func test_gal_addUndirectedEdge_producedCorrectActions() {
        let sut = GraphAdjacencyListSpy<Int>()
        
        let node1 = sut.createVertex(with: 2)
        let node2 = sut.createVertex(with: 4)
        sut.add(.directed, from: node1, to: node2)
        
        XCTAssertEqual(sut.verticies, [node1, node2])
        XCTAssertEqual(sut.actions, [.addVertex,
                                     .addVertex,
                                     .addDirectedEdge])
    }
    
    func test_gal_addUndirectedEdgeWithEnum_producedCorrectActions() {
        let sut = GraphAdjacencyListSpy<Int>()
        
        let node1 = sut.createVertex(with: 2)
        let node2 = sut.createVertex(with: 4)
        sut.add(.undirected, from: node1, to: node2)
        
        XCTAssertEqual(sut.verticies, [node1, node2])
        XCTAssertEqual(sut.actions, [.addVertex,
                                     .addVertex,
                                     .addDirectedEdge,
                                     .addDirectedEdge])
    }
    
    func test_gal_getEdgesForNodeWithNoEdges_returnsEmptyArray() {
        let sut = GraphAdjacencyListSpy<Int>()
        
        let node1 = sut.createVertex(with: 2)
        let node2 = sut.createVertex(with: 4)
        
        XCTAssertEqual(sut.verticies, [node1, node2])
        XCTAssertEqual(sut.edges(from: node1), [])
        XCTAssertEqual(sut.edges(from: node2), [])
    }
    
    func test_gal_getEdgesForNodeNotInGraph_returnsNil() {
        let sut = GraphAdjacencyListSpy<Int>()
        
        let node = GraphNode(value: 2)
        
        XCTAssertEqual(sut.verticies, [])
        XCTAssertNil(sut.edges(from: node))
    }
    
    func test_gal_getEdgesForNodeWithDirectedEdge_returnsEdge() {
        let sut = GraphAdjacencyListSpy<Int>()
        
        let node1 = sut.createVertex(with: 2)
        let node2 = sut.createVertex(with: 4)
        sut.add(.directed, from: node1, to: node2)
        
        XCTAssertEqual(sut.verticies, [node1, node2])
        XCTAssertEqual(sut.edges(from: node1)?.count, 1)
        XCTAssertEqual(sut.edges(from: node2), [])
    }
    
    private class GraphAdjacencyListSpy<T: Equatable>: GraphAdjacencyList<T> {
        enum Action {
            case addVertex
            case addDirectedEdge
        }
        
        var actions: [Action] = []
        
        @discardableResult
        override func createVertex(with value: T) -> Node {
            actions.append(.addVertex)
            return super.createVertex(with: value)
        }
        
        override func addDirectedEdge(from source: Node, to target: Node) {
            super.addDirectedEdge(from: source, to: target)
            actions.append(.addDirectedEdge)
        }
    }
}
