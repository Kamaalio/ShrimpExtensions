//
//  UUID.swift
//  
//
//  Created by Kamaal M Farah on 27/02/2021.
//

import Foundation

public extension UUID {
    var nsString: NSString? {
        NSString(utf8String: self.uuidString)
    }
}
