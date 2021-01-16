//
//  Optional.swift
//  
//
//  Created by Kamaal M Farah on 16/01/2021.
//

import Foundation

public extension Optional {
    func unwrapped(or defaultValue: Wrapped) -> Wrapped {
        self ?? defaultValue
    }

    func unwrapped(or error: Error) throws -> Wrapped {
        guard let wrapped = self else { throw error }
        return wrapped
    }
}
