//
//  String.swift
//  
//
//  Created by Kamaal Farah on 28/10/2020.
//

import Foundation

public extension String {
    var splitByCapital: [String] {
        let indexes = Set(self
            .enumerated()
            .filter { $0.element.isUppercase }
            .map { $0.offset })
        let chunks = self
            .map { String($0) }
            .enumerated()
            .reduce([String]()) { (chunks: [String], elm: (offset: Int, element: String)) -> [String] in
                guard !chunks.isEmpty else { return [elm.element] }
                guard !indexes.contains(elm.offset) else { return chunks + [String(elm.element)] }
                var chunks = chunks
                chunks[chunks.count-1] += String(elm.element)
                return chunks
        }
        return chunks
    }

    var trimmingByWhitespacesAndNewLines: String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var nsString: NSString? {
        NSString(utf8String: self)
    }

    var uuid: UUID? {
        UUID(uuidString: self)
    }
}
