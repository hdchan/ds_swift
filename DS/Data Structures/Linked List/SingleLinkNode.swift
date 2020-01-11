//
//  SingleLinkNode.swift
//  DS
//
//  Created by Henry Chan on 12/31/19.
//  Copyright © 2019 HDC. All rights reserved.
//

import Foundation

class SingleLinkNode<T: Equatable>: NSObject, Node {
    typealias Value = T
    
    let value: T
    
    var next: SingleLinkNode?
    
    init(value: T) {
        self.value = value
    }
}
