//
//  URL.swift
//  
//
//  Created by Kamaal M Farah on 25/01/2021.
//

import Foundation

public extension URL {
    init(staticString: StaticString) {
        self.init(string: "\(staticString)")!
    }
}
