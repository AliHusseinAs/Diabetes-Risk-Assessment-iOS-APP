//
//  Functions.swift
//  DiabetesApp
//
//  Created by Ali Hussein on 13.09.2024.
//

import SwiftUI
import Foundation

public func sendData(answers: [String: Any]) async throws {
    let url = URL(string: "http://localhost:9000/send/data")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let jsonData = try JSONSerialization.data(withJSONObject: answers, options: [])
    request.httpBody = jsonData
    let (data, response) = try await URLSession.shared.data(for: request)
    
    guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
        throw NetworkError.requestFailed
    }

    print("Response: \(String(decoding: data, as: UTF8.self))")
}

enum NetworkError: Error {
    case requestFailed
}

public func getResult(for id: Int64) async throws -> resultModel {
    let url = URL(string: "http://localhost:9000/get/score\(id)")!
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    let (data, _) = try await URLSession.shared.data(for: request)
    let result = try JSONDecoder().decode(resultModel.self, from: data)
    
    return result
}

public struct resultModel: Codable{
    let res : Float
}
