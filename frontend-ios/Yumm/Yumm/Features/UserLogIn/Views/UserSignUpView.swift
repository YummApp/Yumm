//
//  UserSignUpView.swift
//  Yumm App
//
//  Created by Akshar Chunduri on 8/5/24.
//

import SwiftUI

struct UserSignUpView: View {
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isEmailValid: Bool = true
    @State private var isPasswordMatching: Bool = true
    @State private var isUsernameValid: Bool = true
    @State private var hasTypedUsername: Bool = false  // Track if the user has started typing in the username field
    @State private var showEmailError: Bool = false    // Track email error visibility
    @State private var showPasswordError: Bool = false // Track password error visibility
    @State private var showConfirmPasswordError: Bool = false // Track confirm password error visibility
    
    @State private var shouldNavigate: Bool = false  // State to control navigation

    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: 0xFE9AC9)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack {
                        Spacer()
                        
                        VStack(spacing: 30) {
                            Text("Get Started!")
                                .font(.custom("Quicksand-Bold", size: 28))
                                .foregroundColor(Color(hex: 0x0A0A0A))
                            
                            VStack(spacing: 25) {
                                VStack(spacing: 10) {
                                    TextField("Email", text: $email)
                                        .padding(.bottom, 5)
                                        .font(.custom("Quicksand-Regular", size: 18))
                                        .onChange(of: email) { newValue in
                                            isEmailValid = validateEmail(newValue)
                                            showEmailError = false // Hide error while typing
                                        }
                                    
                                    Rectangle()
                                        .frame(height: 1)
                                        .foregroundColor(isEmailValid ? Color(hex: 0x0A0A0A) : .red)
                                }
                                .padding(.horizontal, 20)
                                
                                if showEmailError || !isEmailValid {
                                    Text("Invalid email address")
                                        .foregroundColor(.red)
                                        .font(.custom("Quicksand-Regular", size: 14))
                                }
                                
                                VStack(spacing: 10) {
                                    TextField("Username", text: $username, onEditingChanged: { began in
                                        if began {
                                            hasTypedUsername = true
                                        }
                                    })
                                        .padding(.bottom, 5)
                                        .font(.custom("Quicksand-Regular", size: 18))
                                        .onChange(of: username) { newValue in
                                            isUsernameValid = !newValue.isEmpty
                                        }
                                    
                                    Rectangle()
                                        .frame(height: 1)
                                        .foregroundColor(isUsernameValid || !hasTypedUsername ? Color(hex: 0x0A0A0A) : .red)
                                }
                                .padding(.horizontal, 20)
                                
                                if !isUsernameValid && hasTypedUsername {
                                    Text("Username is required")
                                        .foregroundColor(.red)
                                        .font(.custom("Quicksand-Regular", size: 14))
                                }
                                
                                VStack(spacing: 10) {
                                    SecureField("Password", text: $password)
                                        .padding(.bottom, 5)
                                        .font(.custom("Quicksand-Regular", size: 18))
                                        .onChange(of: password) { _ in
                                            isPasswordMatching = validatePasswordMatch()
                                            showPasswordError = false // Hide error while typing
                                        }
                                    
                                    Rectangle()
                                        .frame(height: 1)
                                        .foregroundColor(showPasswordError ? .red : Color(hex: 0x0A0A0A))
                                }
                                .padding(.horizontal, 20)
                                
                                if showPasswordError {
                                    Text("Password is required")
                                        .foregroundColor(.red)
                                        .font(.custom("Quicksand-Regular", size: 14))
                                }
                                
                                VStack(spacing: 10) {
                                    SecureField("Confirm Password", text: $confirmPassword)
                                        .padding(.bottom, 5)
                                        .font(.custom("Quicksand-Regular", size: 18))
                                        .onChange(of: confirmPassword) { _ in
                                            isPasswordMatching = validatePasswordMatch()
                                            showConfirmPasswordError = false // Hide error while typing
                                        }
                                    
                                    Rectangle()
                                        .frame(height: 1)
                                        .foregroundColor(isPasswordMatching && !showConfirmPasswordError ? Color(hex: 0x0A0A0A) : .red)
                                }
                                .padding(.horizontal, 20)
                                
                                if showConfirmPasswordError || !isPasswordMatching {
                                    Text(showConfirmPasswordError ? "Confirm Password is required" : "Passwords do not match")
                                        .foregroundColor(.red)
                                        .font(.custom("Quicksand-Regular", size: 14))
                                }
                            }
                            
                            Button(action: {
                                // Validate all fields when the button is pressed
                                if email.isEmpty {
                                    isEmailValid = false
                                    showEmailError = true
                                } else {
                                    isEmailValid = validateEmail(email)
                                    showEmailError = !isEmailValid
                                }
                                
                                if username.isEmpty {
                                    isUsernameValid = false
                                }
                                
                                if password.isEmpty {
                                    showPasswordError = true
                                }
                                
                                if confirmPassword.isEmpty {
                                    showConfirmPasswordError = true
                                } else {
                                    showConfirmPasswordError = false
                                }
                                
                                if isEmailValid && !password.isEmpty && !confirmPassword.isEmpty && validatePasswordMatch() && isUsernameValid {
                                    shouldNavigate = true  // Trigger navigation
                                }
                                
                                if !hasTypedUsername {
                                    hasTypedUsername = true
                                }
                            }) {
                                Text("Sign Up")
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
                        .background(Color(hex: 0xFFEBD6))
                        .cornerRadius(25)
                        .padding(.horizontal, 20)
                        .shadow(radius: 5)
                        
                        Spacer()
                        
                        Text("OR")
                            .font(.custom("Quicksand-Bold", size: 24))
                            .foregroundColor(Color(hex: 0x0A0A0A))
                            .padding(.vertical, 20)
                        
                        VStack(spacing: 15) {
                            Button(action: {
                                // Handle Google sign up
                            }) {
                                Text("Sign Up With Google")
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color(hex: 0xFD499D))
                                    .cornerRadius(40)
                                    .font(.custom("Quicksand-Bold", size: 18))
                            }
                            .padding(.horizontal, 40)
                            
                            Button(action: {
                                // Handle Apple sign up
                            }) {
                                Text("Sign Up with Apple")
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color(hex: 0xFD499D))
                                    .cornerRadius(40)
                                    .font(.custom("Quicksand-Bold", size: 18))
                            }
                            .padding(.horizontal, 40)
                        }
                        .padding(.bottom, 45)
                    }
                }
                
                // NavigationLink to UserSignUpView2
                NavigationLink(destination: UserSignUpView2().navigationBarHidden(true), isActive: $shouldNavigate) {
                    EmptyView()
                }
            }
            .navigationBarHidden(true)  // Hide the navigation bar in this view
        }
        .navigationBarHidden(true)  // Also hide navigation bar on the NavigationView
    }
    
    private func validateEmail(_ email: String) -> Bool {
        // Define a regex pattern for a valid email
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
    
    private func validatePasswordMatch() -> Bool {
        return password == confirmPassword
    }
}

#Preview {
    UserSignUpView()
}

extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}
