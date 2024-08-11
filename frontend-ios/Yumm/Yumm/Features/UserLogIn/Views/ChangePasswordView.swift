//
//  ChangePasswordView.swift
//  Yumm
//
//  Created by Akshar Chunduri on 8/9/24.
//

import SwiftUI

struct ChangePasswordView: View {
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @State private var errorMessage: String? = nil  // State variable for error message
    @State private var navigateToLogIn: Bool = false // State to trigger navigation

    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: 0xFFEBD6) // Set the entire background to tannish color
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) { // Reduced spacing for better layout with the error message
                    Text("Enter New Password")
                        .font(.custom("Quicksand-Bold", size: 28))
                        .foregroundColor(Color(hex: 0x0A0A0A))
                    
                    VStack(spacing: 25) { // Adjusted spacing
                        VStack(spacing: 10) {
                            SecureField("New Password", text: $newPassword)
                                .padding(.bottom, 5)
                                .font(.custom("Quicksand-Regular", size: 18))
                                .onChange(of: newPassword) { _ in
                                    validatePasswords()
                                }
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color(hex: 0x0A0A0A))
                        }
                        .padding(.horizontal, 40)
                        
                        VStack(spacing: 10) {
                            SecureField("Confirm New Password", text: $confirmPassword)
                                .padding(.bottom, 5)
                                .font(.custom("Quicksand-Regular", size: 18))
                                .onChange(of: confirmPassword) { _ in
                                    validatePasswords()
                                }
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color(hex: 0x0A0A0A))
                        }
                        .padding(.horizontal, 40)
                        
                        // Error message display
                        if let errorMessage = errorMessage {
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .font(.custom("Quicksand-Regular", size: 16))
                                .padding(.top, 5)
                        }
                        
                        Spacer().frame(height: 70)
                        
                        Button(action: {
                            if newPassword.isEmpty || confirmPassword.isEmpty {
                                errorMessage = "Please fill in all fields."
                            } else if newPassword == confirmPassword {
                                errorMessage = nil
                                navigateToLogIn = true
                            }
                        }) {
                            Text("Done")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(hex: 0xFD499D))
                                .cornerRadius(40)
                                .font(.custom("Quicksand-Bold", size: 18))
                        }
                        .padding(.horizontal, 110)
                    }
                    .padding(.top, 30)
                }
                .padding(.bottom, 270)
                
                NavigationLink(destination: UserLogIn()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true), isActive: $navigateToLogIn) {
                    EmptyView()
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func validatePasswords() {
        if newPassword.isEmpty || confirmPassword.isEmpty {
            errorMessage = "Please fill in all fields."
        } else if newPassword != confirmPassword {
            errorMessage = "Passwords do not match."
        } else {
            errorMessage = nil
        }
    }
}
