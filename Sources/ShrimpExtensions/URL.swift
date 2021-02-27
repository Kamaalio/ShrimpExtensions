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

    /// Will be deprecated soon, use `decodeJSON` instead
    func getJSON<T: Codable>() -> Result<T, Error> {
        decodeJSON()
    }

    func decodeJSON<T: Codable>() -> Result<T, Error> {
        let data: Data
        do {
            data = try Data(contentsOf: self, options: .mappedIfSafe)
        } catch {
            return .failure(error)
        }
        let file: T
        do {
            file = try JSONDecoder().decode(T.self, from: data)
        } catch {
            return .failure(error)
        }
        return .success(file)
    }
}
