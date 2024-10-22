//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Razvan Pricop on 22.10.24.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            let message = "Could not read \(file) from bundle."
            fatalError(message)
        }
        
        let decoder = JSONDecoder()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Could not find key \(key) in \(file). \(context.debugDescription)")
        } catch DecodingError.typeMismatch(let type, let context) {
            fatalError("Type mismatch for \(type) in \(file). \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let value, let context) {
            fatalError("Value not found for \(value) in \(file). \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(let context) {
            fatalError("Data corrupted in \(file). \(context.debugDescription)")
        } catch {
            fatalError("Unknown error in \(file). \(error.localizedDescription)")
        }
    }
}
