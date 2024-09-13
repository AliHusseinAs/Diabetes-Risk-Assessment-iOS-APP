//
//  WelcomeView.swift
//  DiabetesApp
//
//  Created by Ali Hussein on 12.09.2024.
//

import Foundation
import SwiftUI

struct WelcomeView: View{
    @State private var moveNext = false
    @ObservedObject var viewModelAll = PublicVarsClass()
    @Binding var showMainView: Bool
    
    var body: some View{
        NavigationStack{
            ZStack {
                
                Color.red
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Text("Early Detection")
                        .font(.title)
                        .padding(.top, 100)
                        .foregroundColor(.white)
                    
                    Text("Better Life")
                        .font(.title2)
                        .padding(.top, 0)
                        .foregroundColor(.white)
                    Spacer()
                    
                    Text("Don't let diabetes sneak up on you")
                        .font(.title3)
                        .padding(.top, 1)
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 0.0 )
                                .fill(Color.black.opacity(0.19))
                                .shadow(color: .black, radius: 10, x: 0, y: 5)
                        )
                    
                    Text("Assess your risk today and take steps now")
                        .font(.title3)
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 0.0)
                                .fill(Color.black.opacity(0.19))
                                .shadow(color: .black, radius: 10, x: 0, y: 5)
                        )
                    Spacer()
                    
                    Image("med")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 190, height: 190)
                        .padding(.bottom, 70)
                    
                    Button(action: {
                        showMainView = true
                        moveNext = true
                    })
                    {
                        Text("Take Action Now")
                            .padding()
                            .font(.title2)
                            .background(
                                Color.blue
                            )
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .navigationDestination(isPresented: $moveNext){
                        mainView(
                            viewModelAll: viewModelAll,
                            questionsAll: QuestionModel(questionText: "Question Set One")
                        )
                    }
                    
                    Spacer()
                }
            }
        }
        
    }
}
