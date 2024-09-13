//
//  UIs.swift
//  DiabetesApp
//
//  Created by Ali Hussein on 13.09.2024.
//

import Foundation
import SwiftUI

struct AllTextsView: View {
    @Binding var answ1: String
    @Binding var answ2: String
    @Binding var answ3: String
    @Binding var answ4: String
    @Binding var answ5: String
    @Binding var answ6: String
    @Binding var answ7: String
    @Binding var answ8: String
    @Binding var answ9: String
    @Binding var answ10: String
    @Binding var answ11: String
    @Binding var answ12: String
    
    
    var body: some View
    {
        VStack
        {
            TextField("Enter Your ID", text: $answ1)
                .background(Color.white.opacity(0.65))
                .cornerRadius(4)
                .frame(width: 320)
                .padding(.horizontal, 20)
                .font(.system(size: 25, weight: .medium))
            
            TextField("Enter Your Name", text: $answ2)
                .background(Color.white.opacity(0.65))
                .cornerRadius(4)
                .frame(width: 320)
                .padding(.horizontal, 20)
                .font(.system(size: 25, weight: .medium))
            
            TextField("Enter Your Surname", text: $answ3)
                .background(Color.white.opacity(0.65))
                .cornerRadius(4)
                .frame(width: 320)
                .padding(.horizontal, 20)
                .font(.system(size: 25, weight: .medium))
            
            TextField("Enter Your Age", text: $answ4)
                .background(Color.white.opacity(0.65))
                .cornerRadius(4)
                .frame(width: 320)
                .padding(.horizontal, 20)
                .font(.system(size: 25, weight: .medium))
            
            TextField("Enter BMI", text: $answ5)
                .background(Color.white.opacity(0.65))
                .cornerRadius(4)
                .frame(width: 320)
                .padding(.horizontal, 20)
                .font(.system(size: 25, weight: .medium))
            
            TextField("Enter Waist Circumference", text: $answ6)
                .background(Color.white.opacity(0.65))
                .cornerRadius(4)
                .frame(width: 320)
                .padding(.horizontal, 20)
                .font(.system(size: 25, weight: .medium))
            
            TextField("Do you have 30min Physical Activities", text: $answ7)
                .background(Color.white.opacity(0.65))
                .cornerRadius(4)
                .frame(width: 320)
                .padding(.horizontal, 20)
                .font(.system(size: 25, weight: .medium))
            
            TextField("How often do you eat healthy", text: $answ8)
                .background(Color.white.opacity(0.65))
                .cornerRadius(4)
                .frame(width: 320)
                .padding(.horizontal, 20)
            
                .font(.system(size: 25, weight: .medium))
            
            TextField("Did you take Antihybertensive before", text: $answ9)
                .background(Color.white.opacity(0.65))
                .cornerRadius(4)
                .frame(width: 320)
                .padding(.horizontal, 20)
            
                .font(.system(size: 25, weight: .medium))
            
            TextField("Do you have high blood glucose", text: $answ10)
                .background(Color.white.opacity(0.65))
                .cornerRadius(4)
                .frame(width: 320)
                .padding(.horizontal, 20)
                .font(.system(size: 25, weight: .medium))
            
            TextField("Diabetes history", text: $answ11)
                .background(Color.white.opacity(0.65))
                .cornerRadius(4)
                .frame(width: 320)
                .padding(.horizontal, 20)
                .font(.system(size: 25, weight: .medium))
            
            TextField("Enter your sex", text: $answ12)
                .background(Color.white.opacity(0.65))
                .cornerRadius(4)
                .frame(width: 320)
                .padding(.horizontal, 20)
                .font(.system(size: 25, weight: .medium))
            
        }
        
    }
}

