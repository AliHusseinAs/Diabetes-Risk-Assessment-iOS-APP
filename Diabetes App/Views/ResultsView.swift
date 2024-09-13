//
//  ResultsView.swift
//  DiabetesApp
//
//  Created by Ali Hussein on 12.09.2024.
//

import Foundation
import SwiftUI

public func send(){
    print("send")
}

private func dataAdded(){
    print("Data")
}
struct ResultsView: View{
    @ObservedObject var viewModelRes: PublicVarsClass
    var questionRes: QuestionModel
    
    var body: some View{
        Button(action: {send()})
        {
            Text("Click")
        }
    }
}

struct ResultsView_Preview : PreviewProvider{
    static var previews: some View{
        ResultsView(viewModelRes: PublicVarsClass(), questionRes: QuestionModel(
            questionText: "Result Page"
        )
        )
    }
}
