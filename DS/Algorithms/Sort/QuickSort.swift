//
//  QuickSort.swift
//  DS
//
//  Created by Henry Chan on 1/4/20.
//  Copyright © 2020 HDC. All rights reserved.
//

import Foundation

struct QuickSort<T: Comparable> {
    
    enum PivotStrategy {
        case naive
    }
    
    static func sort(_ comparable: [T], _ pivotStrategy: PivotStrategy = .naive) -> [T] {
        guard comparable.count > 1 else {
            return comparable
        }
        
        // Our value comparison can produce a worse case scenario of O(N^2)
        let pivotValue = comparable[pickPivotIndex(comparable, pivotStrategy)]
        
        let leftValues = comparable.filter({ $0 < pivotValue })
        let equal = comparable.filter({ $0 == pivotValue })
        let rightValues = comparable.filter({ $0 > pivotValue })
        
        return sort(leftValues, pivotStrategy) + equal + sort(rightValues, pivotStrategy)
    }
    
    private static func pickPivotIndex(_ comparable: [T], _ pivotStrategy: PivotStrategy) -> Int {
        switch pivotStrategy {
        case .naive: return comparable.count / 2
        }
    }
}
