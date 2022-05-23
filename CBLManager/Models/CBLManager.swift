//
//  CBLManager.swift
//  CBLManager
//
//  Created by Otávio Albuquerque on 16/05/22.
//

import Foundation

class CBLManager: ObservableObject {
    @Published var manager: [CBL] = load(filename: fileURL())
    
    private static func fileURL() -> URL {
        return try! FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("CBLManager.data")
    }
    
    static func load(completion: @escaping (Result<[CBL],Error>)-> Void) -> [CBL]{
        var CBLManager: [CBL] = []
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                CBLManager = try JSONDecoder().decode([CBL].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(CBLManager))

                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))

                }
            }
        }
        return CBLManager
    }
    
    static func load(filename: URL = fileURL()) -> [CBL] {
        let data: Data
        do {
            data = try Data(contentsOf: filename)
        } catch {
            return []
//            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }


            let decoder = JSONDecoder()
        return try! decoder.decode([CBL].self, from: data)
        
    }
    
    static func save(CBLManager: [CBL], completion: @escaping (Result<Int,Error>)-> Void) {
        DispatchQueue.global(qos: .background).async {
            do{
                let data = try JSONEncoder().encode(CBLManager)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(CBLManager.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
