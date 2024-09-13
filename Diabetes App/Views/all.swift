//
//  all.swift
//  DiabetesApp
//
//  Created by Ali Hussein on 13.09.2024.
//



import Foundation
import SwiftUI

struct mainView: View{
    @State public var answ1: String = ""
    @State var answ2: String = ""
    @State var answ3: String = ""
    @State var answ4: String = ""
    @State var answ5: String = ""
    @State var answ6: String = ""
    @State var answ7: String = ""
    @State var answ8: String = ""
    @State var answ9: String = ""
    @State var answ10: String = ""
    @State var answ11: String = ""
    @State var answ12: String = ""
    @ObservedObject var viewModelAll : PublicVarsClass
    @ObservedObject var viewModelRes = PublicVarsClass()
    var questionsAll : QuestionModel
    @State private var moveNext = false
    var body: some View{
        NavigationStack{
            ZStack{
                let gradient =  Gradient(colors: [.black, .pink])
                LinearGradient(
                    gradient: gradient, startPoint: .bottomTrailing,
                    endPoint: .topLeading
                )
                .edgesIgnoringSafeArea(.all)
                ScrollView(.vertical){
                    
                    
                    VStack(spacing: 20){
                        Text("Please fill the fields")
                            .font(.title)
                            .foregroundStyle(Color.white)
                            .padding(.top,20)
                        Group{
                            AllTextsView(
                                answ1: $answ1,
                                answ2: $answ2,
                                answ3: $answ3,
                                answ4: $answ4,
                                answ5: $answ5,
                                answ6: $answ6,
                                answ7: $answ7,
                                answ8: $answ8,
                                answ9: $answ9,
                                answ10: $answ10,
                                answ11: $answ11,
                                answ12: $answ12
                            )
                            
                            .padding(.top, 120)
                        }
                        Button(action: {
                            Task{
                                do{
                                    moveNext = true
                                    try await submitData()
                                    
                                }
                            }
                        }){
                            Text("Submit")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            
                        }
                        .navigationDestination(isPresented: $moveNext){
                            ResultsView(
                                viewModelRes: viewModelRes,
                                questionRes: QuestionModel(questionText:"Next")
                                
                            )
                        }
                        
                    }
                    
                }
            }
        }
        
    }
    
    func submitData() async throws {
        // Validate and convert inputs
        guard let idd = Int64(answ1) else {
            print("Error converting answ1 to Int")
            throw ValidationError.invalidInput
        }
        
        guard let age = Int(answ4) else {
            print("Error converting answ4 to Int")
            throw ValidationError.invalidInput
        }
        
        guard let bmi = Float(answ5) else {
            print("Error converting answ5 to Float")
            throw ValidationError.invalidInput
        }
        
        guard let waist = Float(answ6) else {
            print("Error converting answ6 to Float")
            throw ValidationError.invalidInput
        }
            
        guard let health = Int(answ8) else {
            print("Error converting answ8 to Int")
            throw ValidationError.invalidInput
        }
        
        guard let relative = Int(answ11) else {
            print("Error converting answ11 to Int")
            throw ValidationError.invalidInput
        }
        
        let answers: [String: Any] = [
            "id": idd,
            "name": answ2,
            "surname": answ3,
            "age": age,
            "bmi": bmi,
            "waistCircumference": waist,
            "activityLevel": answ7,
            "healthStatus": health,
            "relativeRisk": relative
        ]
        
        
        try await sendData(answers: answers)
    }
   
}
    
    
enum ValidationError: Error {
    case invalidInput
}
    
    
    struct mainView_Preview: PreviewProvider{
        static var previews: some View{
            mainView(viewModelAll: PublicVarsClass(), questionsAll: QuestionModel(
                questionText: "Next"
            ))
        }
    }

