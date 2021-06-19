//
//  Dictionary.swift
//  
//
//  Created by Kamaal M Farah on 11/01/2021.
//

import Foundation

public extension Dictionary {
    var urlQueryItems: [URLQueryItem] {
        self.compactMap({ (key: Key, value: Value?) in
            guard let keyString = key as? String, let valueString = value as? String else { return nil }
            return URLQueryItem(name: keyString, value: valueString)
        })
    }

    func has(key: Key) -> Bool {
        index(forKey: key) != nil
    }
}
