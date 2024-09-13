//
//  PublicVarsClass.swift
//  DiabetesApp
//
//  Created by Ali Hussein on 12.09.2024.
//

import Foundation
import SwiftUI
import Combine

class PublicVarsClass: ObservableObject{
    @Published var ans1: String = ""
    @Published var ans2: String = ""
    @Published var ans3: String = ""
    @Published var ans4: String = ""
    @Published var ans5: String = ""
    @Published var ans6: String = ""
    @Published var ans7: String = ""
    @Published var ans8: String = ""
    @Published var ans9: String = ""
    @Published var ans10: String = ""
    @Published var ans11: String = ""
    @Published var ans12: String = ""
    
    func submitData(completion: @escaping (Result<Data, Error>) -> Void) {
            let data = [
                "ans1": ans1,
                "ans2": ans2,
                "ans3": ans3,
                "ans4": ans4,
                "ans5": ans5,
                "ans6": ans6
            ]
            
            APIClient.shared.postData(data: data) { result in
                DispatchQueue.main.async {
                    completion(result)
                }
            }
        }
        
        func fetchResults(completion: @escaping (Result<Data, Error>) -> Void) {
            APIClient.shared.getResults { result in
                DispatchQueue.main.async {
                    completion(result)
                }
            }
        }
}
