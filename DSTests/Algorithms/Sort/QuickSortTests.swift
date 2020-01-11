//
//  QuickSortTests.swift
//  DSTests
//
//  Created by Henry Chan on 1/4/20.
//  Copyright © 2020 HDC. All rights reserved.
//

import XCTest
@testable import DS

class QuickSortTests: XCTestCase {
    
    func test_quickSort_noElements_returnsEmptyArray() {
        let sut: [Int] = []
        
        let result = QuickSort.sort(sut)
        
        XCTAssertEqual(result, [])
    }
    
    func test_quickSort_elements_returnsSortedElements() {
        let sut = [1, 6, 8, 3, 5, 9, 2, 7, 4, 0]
        
        let result = QuickSort.sort(sut)
        
        XCTAssertEqual(result, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    }
}
