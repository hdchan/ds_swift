//
//  BinarySearch.swift
//  DS
//
//  Created by Henry Chan on 1/8/20.
//  Copyright © 2020 HDC. All rights reserved.
//

import Foundation

class BinarySearch<T: Comparable> {
    func search(_ array: inout [T], for target: T, _ low: Int, _ high: Int) -> Int? {
        guard array.count > 0 else {
            return nil
        }
        
        if low == high {
            return array[low] == target ? low : nil
        }
        
        let midPointIndex = ((high - low + 1) / 2) + low
        let midPointValue = array[midPointIndex]
        if midPointValue == target {
            return midPointIndex
        }
        
        if target < midPointValue {
            return search(&array, for: target, low, midPointIndex - 1)
        } else {
            return search(&array, for: target, midPointIndex + 1, high)
        }
        
    }
}
