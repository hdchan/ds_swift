//
//  MergeSort.swift
//  DS
//
//  Created by Henry Chan on 1/4/20.
//  Copyright © 2020 HDC. All rights reserved.
//

import Foundation

struct MergeSort<T: Comparable> {
    
    enum PivotStrategy {
        case naive
    }
    
    static func sort(_ comparable: [T], _ pivotStrategy: PivotStrategy = .naive) -> [T] {
        guard comparable.count > 1 else {
            return comparable
        }
        
        let pivotIndex = pickPivotIndex(comparable, pivotStrategy)
        
        let leftValues = sort(Array(comparable[0..<pivotIndex]))
        let rightValues = sort(Array(comparable[pivotIndex...]))
        
        var sortedValues: [T] = []
        
        var leftPointer = 0
        var rightPointer = 0
        
        while leftPointer < leftValues.count && rightPointer < rightValues.count {
            let leftValue = leftValues[leftPointer]
            let rightValue = rightValues[rightPointer]
            
            if leftValue < rightValue {
                sortedValues.append(leftValues[leftPointer])
                leftPointer += 1
            } else if rightValue < leftValue {
                sortedValues.append(rightValues[rightPointer])
                rightPointer += 1
            } else { // both are equal
                sortedValues.append(leftValues[leftPointer])
                leftPointer += 1
                sortedValues.append(rightValues[rightPointer])
                rightPointer += 1
            }
        }
        
        if leftPointer < leftValues.count {
            sortedValues += leftValues[leftPointer...]
        } else if rightPointer < rightValues.count {
            sortedValues += rightValues[rightPointer...]
        }
        
        return sortedValues
    }
    
    private static func pickPivotIndex(_ comparable: [T], _ pivotStrategy: PivotStrategy) -> Int {
        switch pivotStrategy {
        case .naive: return comparable.count / 2
        }
    }
}
