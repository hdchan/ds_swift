//
//  Node.swift
//  DS
//
//  Created by Henry Chan on 12/31/19.
//  Copyright © 2019 HDC. All rights reserved.
//

import Foundation

protocol Node {
    associatedtype Value: Equatable
    var value: Value { get }
}
