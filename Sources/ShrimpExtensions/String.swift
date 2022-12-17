//
//  String.swift
//  
//
//  Created by Kamaal Farah on 28/10/2020.
//

import Foundation

extension String {
    public var nsString: NSString? {
        NSString(utf8String: self)
    }

    public var uuid: UUID? {
        UUID(uuidString: self)
    }

    public func replaceMultipleOccurrences(of targets: [Character], with replacement: Character) -> String {
        guard !targets.isEmpty else { return self }
        var stringToEdit = self.asArray()
        for (index, character) in self.enumerated() where targets.contains(character) {
            stringToEdit[index] = replacement
        }
        return String(stringToEdit)
    }
}

extension StringProtocol {
    public var splitByCapital: [String] {
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

    /// Split String by newlines(\n)
    public var splitLines: [SubSequence] {
        self.split(whereSeparator: \.isNewline)
    }

    /// Split String by commas(,)
    public var splitCommas: [SubSequence] {
        self.split(separator: ",")
    }

    /// Converts String to Int
    public var int: Int? {
        Int(self)
    }

    public var trimmingByWhitespacesAndNewLines: String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    public var scrambled: String {
        String(self.shuffled())
    }

    public var digits: String {
        components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }

    /// Splitting strings by new lines (\n).
    /// - Parameter omittingEmptySubsequences: Whether or not to omit empty subsequences.
    /// - Returns: A splitted string by new line.
    func splitLines(omittingEmptySubsequences: Bool) -> [Self.SubSequence] {
        return self.split(omittingEmptySubsequences: omittingEmptySubsequences, whereSeparator: \.isNewline)
    }

    /// Makes a range of the current string.
    /// - Parameters:
    ///   - start: from which index to start the range.
    ///   - end: the index to end the range on.
    /// - Returns: range of the current string.
    public func range(from start: Int, to end: Int? = nil) -> Self.SubSequence {
        var end = end ?? count
        if end > count {
            end = count
        }

        return self[self.index(self.startIndex, offsetBy: start)..<self.index(self.startIndex, offsetBy: end)]
    }

    public subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
