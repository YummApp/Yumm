//
//  UserSignUpView2.swift
//  Yumm App
//
//  Created by Akshar Chunduri on 8/5/24.
//

import SwiftUI

struct SignUpView2: View {
    @State private var name: String = ""
    @State private var dateOfBirth: String = ""
    @State private var phoneNumber: String = ""
    @State private var isPhoneNumberValid: Bool = true
    @State private var isDateOfBirthValid: Bool = true

    var body: some View {
        ZStack {
            Color(hex: 0xFFEBD6)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    Spacer()
                        .frame(height: 10)
                    VStack(spacing: 60) {
                        Text("Tell Us About Yourself")
                            .font(.custom("Quicksand-Bold", size: 28))
                            .foregroundColor(Color(hex: 0x0A0A0A))
                        
                        VStack(spacing: 45) {
                            VStack(spacing: 10) {
                                TextField("Name", text: $name)
                                    .padding(.bottom, 5)
                                    .font(.custom("Quicksand-Regular", size: 18))
                                
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(Color(hex: 0x0A0A0A))
                            }
                            .padding(.horizontal, 20)
                            
                            VStack(spacing: 10) {
                                TextField("Date of Birth", text: $dateOfBirth)
                                    .padding(.bottom, 5)
                                    .font(.custom("Quicksand-Regular", size: 18))
                                    .onChange(of: dateOfBirth) { newValue in
                                        isDateOfBirthValid = validateDateOfBirth(newValue)
                                    }
                                
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(isDateOfBirthValid ? Color(hex: 0x0A0A0A) : .red)
                            }
                            .padding(.horizontal, 20)
                            
                            if !isDateOfBirthValid {
                                Text("Invalid date of birth")
                                    .foregroundColor(.red)
                                    .font(.custom("Quicksand-Regular", size: 14))
                            }
                            
                            VStack(spacing: 10) {
                                TextField("Phone Number", text: $phoneNumber)
                                    .padding(.bottom, 5)
                                    .font(.custom("Quicksand-Regular", size: 18))
                                    .onChange(of: phoneNumber) { newValue in
                                        isPhoneNumberValid = validatePhoneNumber(newValue)
                                    }
                                
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(isPhoneNumberValid ? Color(hex: 0x0A0A0A) : .red)
                            }
                            .padding(.horizontal, 20)
                            
                            if !isPhoneNumberValid {
                                Text("Invalid phone number")
                                    .foregroundColor(.red)
                                    .font(.custom("Quicksand-Regular", size: 14))
                            }
                        }
                        
                        Button(action: {
                            // Handle next action
                            if validatePhoneNumber(phoneNumber) && validateDateOfBirth(dateOfBirth) {
                                // Proceed with valid phone number and date of birth
                            } else {
                                // Handle invalid phone number or date of birth
                            }
                        }) {
                            Text("Next")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(hex: 0xFD499D))
                                .cornerRadius(40)
                                .font(.custom("Quicksand-Bold", size: 18))
                        }
                        .padding(.horizontal, 90)
                    }
                    .padding(.vertical, 40)
                    .cornerRadius(25)
                    .padding(.horizontal, 20)
                    .shadow(radius: 5)
                    
                    Spacer()
                }
            }
        }
    }
    
    private func validatePhoneNumber(_ number: String) -> Bool {
        // Define a regex pattern for a valid phone number allowing dashes and parentheses
        let phoneRegex = "^(\\(\\d{3}\\)\\d{3}-\\d{4}|\\d{3}-\\d{3}-\\d{4}|\\d{10})$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: number)
    }
    
    private func validateDateOfBirth(_ date: String) -> Bool {
        // Define a regex pattern for a valid date of birth format MM/DD/YYYY or MMDDYYYY
        let dateRegex = "^\\d{2}/\\d{2}/\\d{4}$|^\\d{8}$"
        let dateTest = NSPredicate(format: "SELF MATCHES %@", dateRegex)
        return dateTest.evaluate(with: date)
    }
}

#Preview {
    SignUpView2()
}
