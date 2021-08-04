//
//  Bundle+Extension.swift
//  Pokee
//
//  Created by Vitalii K on 17.10.2019.
//  Copyright © 2019 Vitalii K. All rights reserved.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T? {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        var loaded: T?

        do {
            loaded = try decoder.decode(T.self, from: data)
            return loaded
        } catch  {
            print(error)
        }
        return nil
    }
}
