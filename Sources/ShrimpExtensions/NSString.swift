//
//  NSString.swift
//  
//
//  Created by Kamaal M Farah on 27/02/2021.
//

import Foundation

public extension NSString {
    var uuid: UUID? {
        UUID(uuidString: self.string)
    }

    var string: String {
        String(self)
    }
}
