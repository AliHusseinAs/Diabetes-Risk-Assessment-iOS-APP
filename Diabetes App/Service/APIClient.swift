//
//  APIClient.swift
//  DiabetesApp
//
//  Created by Ali Hussein on 12.09.2024.
//

// Service that handles API calls to Java Spring backend

import Foundation

class APIClient{
    static let shared = APIClient()
    private let baseURL = "http://localhost:9000/addData"
    
    private init (){}
    
    func postData(data: [String: Any], completion: @escaping (Result<Data, Error>) -> Void) {
            guard let url = URL(string: "\(baseURL)/submit") else { return }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: data, options: [])
            } catch {
                completion(.failure(error))
                return
            }
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data"])))
                    return
                }
                
                completion(.success(data))
            }
            
            task.resume()
        }
    
    func getResults(completion: @escaping (Result<Data, Error>) -> Void) {
            guard let url = URL(string: "\(baseURL)/results") else { return }
            let request = URLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data"])))
                    return
                }
                
                completion(.success(data))
            }
            
            task.resume()
        }
}
