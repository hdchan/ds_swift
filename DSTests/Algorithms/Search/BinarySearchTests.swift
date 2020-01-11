//
//  BinarySearchTests.swift
//  DSTests
//
//  Created by Henry Chan on 1/8/20.
//  Copyright © 2020 HDC. All rights reserved.
//

import XCTest
@testable import DS

class BinarySearchTests: XCTestCase {
    
    func test_binarySearch_givenNoInput_returnsNil() {
        let array: [Int] = []
        let target = 5
        let sut = BinarySearchSpy<Int>()
        
        let result = sut.search(array, for: target, 0, 0)
        
        XCTAssertNil(result)
        XCTAssertEqual(sut.searchCount, 1)
    }
    
    func test_binarySearch_givenArrayWithOneElementAndEqualsTarget_returnsFirstIndex() {
        let array: [Int] = [5]
        let target = 5
        let sut = BinarySearchSpy<Int>()
        
        let result = sut.search(array, for: target, 0, 0)
        
        XCTAssertEqual(result, 0)
        XCTAssertEqual(sut.searchCount, 1)
    }
    
    func test_binarySearch_givenArrayWithOneElementAndDoesNotEqualsTarget_returnsNil() {
        let array: [Int] = [4]
        let target = 5
        let sut = BinarySearchSpy<Int>()
        
        let result = sut.search(array, for: target, 0, 0)
        
        XCTAssertNil(result)
        XCTAssertEqual(sut.searchCount, 1)
    }
    
    func test_binarySearch_givenArrayWithTenElements_returnsElementIndex() {
        let array: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        let target = 3
        let sut = BinarySearchSpy<Int>()
        
        let result = sut.search(array, for: target, 0, array.count - 1)
        
        XCTAssertEqual(result, 3)
        XCTAssertEqual(sut.searchCount, 4)
    }
    
    func test_binarySearch_givenArrayWithFifteenElements_returnsElementIndex() {
        let array: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
        let target = 5
        let sut = BinarySearchSpy<Int>()
        
        let result = sut.search(array, for: target, 0, array.count - 1)
        
        XCTAssertEqual(result, 5)
        XCTAssertEqual(sut.searchCount, 3)
    }
    
    // MARK: - Helper
        
    private class BinarySearchSpy<T: Comparable>: BinarySearch<T> {
        var searchCount = 0
        var lowHighPair: [[Int]] = []
        
        override func search(_ array: [T], for target: T, _ low: Int, _ high: Int) -> Int? {
            searchCount += 1
            lowHighPair.append([low, high])
            return super.search(array, for: target, low, high)
        }
    }
}

