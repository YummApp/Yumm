//
//  UserSignUpView2.swift
//  Yumm App
//
//  Created by Akshar Chunduri on 8/5/24.
//

import SwiftUI
import Foundation

struct UserSignUpView2: View {
    @State private var name: String = ""
    @State private var dateOfBirth: String = ""
    @State private var phoneNumber: String = ""
    @State private var isPhoneNumberValid: Bool = true
    @State private var isDateOfBirthValid: Bool = true
    @State private var isNameValid: Bool = true
    @State private var hasTypedName: Bool = false // Track if the user has started typing in the name field
    @State private var navigateToDietSelect: Bool = false // State to trigger navigation

    var body: some View {
        NavigationStack {
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
                                    TextField("Name", text: $name, onEditingChanged: { began in
                                        if began {
                                            hasTypedName = true
                                        }
                                    })
                                        .padding(.bottom, 5)
                                        .font(.custom("Quicksand-Regular", size: 18))
                                        .onChange(of: name) { newValue in
                                            // Check if the name is valid
                                            isNameValid = !newValue.isEmpty
                                        }
                                    
                                    Rectangle()
                                        .frame(height: 1)
                                        .foregroundColor(isNameValid || !hasTypedName ? Color(hex: 0x0A0A0A) : .red)
                                }
                                .padding(.horizontal, 20)
                                
                                if !isNameValid && hasTypedName {
                                    Text("Name is required")
                                        .foregroundColor(.red)
                                        .font(.custom("Quicksand-Regular", size: 14))
                                }
                                
                                VStack(spacing: 10) {
                                    TextField("Date of Birth", text: $dateOfBirth)
                                        .padding(.bottom, 5)
                                        .font(.custom("Quicksand-Regular", size: 18))
                                        .onChange(of: dateOfBirth) { newValue in
                                            isDateOfBirthValid = !newValue.isEmpty && validateDateOfBirth(newValue)
                                        }
                                    
                                    Rectangle()
                                        .frame(height: 1)
                                        .foregroundColor(isDateOfBirthValid ? Color(hex: 0x0A0A0A) : .red)
                                }
                                .padding(.horizontal, 20)
                                
                                if !isDateOfBirthValid {
                                    Text(dateOfBirth.isEmpty ? "Date of birth is required" : "Invalid date of birth")
                                        .foregroundColor(.red)
                                        .font(.custom("Quicksand-Regular", size: 14))
                                }
                                
                                VStack(spacing: 10) {
                                    TextField("Phone Number", text: $phoneNumber)
                                        .padding(.bottom, 5)
                                        .font(.custom("Quicksand-Regular", size: 18))
                                        .onChange(of: phoneNumber) { newValue in
                                            isPhoneNumberValid = !newValue.isEmpty && validatePhoneNumber(newValue)
                                        }
                                    
                                    Rectangle()
                                        .frame(height: 1)
                                        .foregroundColor(isPhoneNumberValid ? Color(hex: 0x0A0A0A) : .red)
                                }
                                .padding(.horizontal, 20)
                                
                                if !isPhoneNumberValid {
                                    Text(phoneNumber.isEmpty ? "Phone number is required" : "Invalid phone number")
                                        .foregroundColor(.red)
                                        .font(.custom("Quicksand-Regular", size: 14))
                                }
                            }
                            
                            Button(action: {
                                // Validate all fields when the button is pressed
                                if name.isEmpty {
                                    isNameValid = false
                                }
                                if dateOfBirth.isEmpty {
                                    isDateOfBirthValid = false
                                }
                                if phoneNumber.isEmpty {
                                    isPhoneNumberValid = false
                                }
                                
                                if isNameValid && isDateOfBirthValid && isPhoneNumberValid {
                                    navigateToDietSelect = true // Trigger navigation
                                } else {
                                    // Handle invalid fields
                                    if !hasTypedName {
                                        hasTypedName = true
                                    }
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
                
                NavigationLink(destination: DietSelectView()
                                .navigationBarBackButtonHidden(true)
                                .navigationBarHidden(true), isActive: $navigateToDietSelect) {
                    EmptyView()
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
        // Define a regex pattern for valid date formats: MM/DD/YYYY, MM-DD-YYYY, or MMDDYYYY
        let dateRegex = "^\\d{2}/\\d{2}/\\d{4}$|^\\d{2}-\\d{2}-\\d{4}$|^\\d{8}$"
        let dateTest = NSPredicate(format: "SELF MATCHES %@", dateRegex)
        
        guard dateTest.evaluate(with: date) else {
            return false // If the date format doesn't match, return false
        }
        
        // Convert the input string to a Date object
        let dateFormatter = DateFormatter()
        if date.contains("/") {
            dateFormatter.dateFormat = "MM/dd/yyyy"
        } else if date.contains("-") {
            dateFormatter.dateFormat = "MM-dd-yyyy"
        } else {
            dateFormatter.dateFormat = "MMddyyyy"
        }
        
        guard let dateOfBirth = dateFormatter.date(from: date) else {
            return false
        }
        
        // Calculate the age
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: dateOfBirth, to: Date())
        let age = ageComponents.year ?? 0
        
        // Check if the age is between 13 and 125
        return age >= 13 && age <= 125
    }
}

#Preview {
    UserSignUpView2()
}
