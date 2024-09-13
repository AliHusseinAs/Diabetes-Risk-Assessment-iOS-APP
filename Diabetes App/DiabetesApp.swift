//
//  DiabetesApp.swift
//  DiabetesApp
//
//  Created by Ali Hussein on 12.09.2024.
//



import SwiftUI
@main
struct DiabetesApp: App {
    @StateObject private var viewModelAll = PublicVarsClass()
    @StateObject private var viewModelRes = PublicVarsClass()
    @State private var showMainView = false
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if showMainView {
                    mainView(viewModelAll: viewModelAll, questionsAll: QuestionModel(questionText: "Next"))
                } else {
                    WelcomeView(showMainView: $showMainView)
                }
            }
        }
    }
}
