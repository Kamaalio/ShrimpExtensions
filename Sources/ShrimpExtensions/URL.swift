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

    func getJSON<T: Codable>() -> Result<T, Error> {
        var data: Data
        do {
            data = try Data(contentsOf: self, options: .mappedIfSafe)
        } catch {
            return .failure(error)
        }
        var file: T
        do {
            file = try JSONDecoder().decode(T.self, from: data)
        } catch {
            return .failure(error)
        }
        return .success(file)
    }
}
