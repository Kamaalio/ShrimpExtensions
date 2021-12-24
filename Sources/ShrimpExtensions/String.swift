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
        let chunks: [String] = self
            .map { String($0) }
            .enumerated()
            .reduce([]) { (chunks: [String], elm: (offset: Int, element: String)) in
                guard !chunks.isEmpty else { return [elm.element] }
                guard !indexes.contains(elm.offset) else { return chunks + [String(elm.element)] }
                var chunks = chunks
                chunks[chunks.count - 1] += String(elm.element)
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

    var scrambled: String {
        String(self.shuffled())
    }

    var digits: String {
        components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }

    func replaceMultipleOccurrences(of targets: [Character], with replacement: Character) -> String {
        guard !targets.isEmpty else { return self }
        var stringToEdit = self.asArray()
        for (index, character) in self.enumerated() where targets.contains(character) {
            stringToEdit[index] = replacement
        }
        return String(stringToEdit)
    }

    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
