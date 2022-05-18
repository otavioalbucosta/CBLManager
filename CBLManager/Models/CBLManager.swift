//
//  CBLManager.swift
//  CBLManager
//
//  Created by Otávio Albuquerque on 16/05/22.
//

import Foundation

class CBLManager: ObservableObject {
    @Published var manager: [CBL] = [CBL(title: "1Mock CBL",engage: .mock, investigate: .mock, act: .mock),
                                    CBL(title: "2Mock CBL",engage: .mock, investigate: .mock, act: .mock),
                                    CBL(title: "3Mock CBL",engage: .mock, investigate: .mock, act: .mock),
                                    CBL(title: "4Mock CBL",engage: .mock, investigate: .mock, act: .mock)]
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("CBLManager.data")
    }
    
    static func load(completion: @escaping (Result<[CBL],Error>)-> Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let CBLManager = try JSONDecoder().decode([CBL].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(CBLManager))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
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
    @Published var mock = [CBL(title: "1Mock CBL",engage: .mock, investigate: .mock, act: .mock),
                       CBL(title: "2Mock CBL",engage: .mock, investigate: .mock, act: .mock),
                       CBL(title: "3Mock CBL",engage: .mock, investigate: .mock, act: .mock),
                       CBL(title: "4Mock CBL",engage: .mock, investigate: .mock, act: .mock)]
}
