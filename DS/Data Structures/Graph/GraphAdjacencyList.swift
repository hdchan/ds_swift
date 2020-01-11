//
//  GraphAdjacencyList.swift
//  DS
//
//  Created by Henry Chan on 1/10/20.
//  Copyright © 2020 HDC. All rights reserved.
//

import Foundation

class GraphAdjacencyList<T: Equatable> {
    typealias Node = GraphNode<T>
    typealias GraphEdgeList = [GraphEdge<T>]
    
    typealias VertexList = [Node]
    typealias EdgeList = [Node: GraphEdgeList]
    
    enum EdgeType {
        case directed
        case undirected
    }
    
    var verticies: [Node] {
        return vertexList
    }
    
    private lazy var vertexList: VertexList = {
        return VertexList()
    }()
    
    private lazy var edgeList: EdgeList = {
        return EdgeList()
    }()
    
    @discardableResult
    func createVertex(with value: T) -> Node {
        let node = GraphNode(value: value)
        self.vertexList.append(node)
        self.edgeList[node] = GraphEdgeList()
        return node
    }
    
    func addDirectedEdge(from source: Node, to target: Node) {
        let edge = GraphEdge(source: source, target: target)
        self.edgeList[source]?.append(edge)
        print("hi")
    }
    
    func addUndirectedEdge(from source: Node, to target: Node) {
        addDirectedEdge(from: source, to: target)
        addDirectedEdge(from: target, to: source)
    }
    
    func add(_ edge: EdgeType, from source: Node, to target: Node) {
        switch edge {
        case .directed:
            addDirectedEdge(from: source, to: target)
        case .undirected:
            addUndirectedEdge(from: source, to: target)
        }
    }
    
    func edges(from source: Node) -> GraphEdgeList? {
        return edgeList[source]
    }
}
