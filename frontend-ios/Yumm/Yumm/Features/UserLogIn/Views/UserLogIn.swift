//
//  UserLogIn.swift
//  Yumm
//
//  Created by Vamsi Putti on 8/4/24.
//

import SwiftUI

struct UserLogIn: View {
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        ZStack {
            Color(hex: 0xFE9AC9)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                VStack(spacing: 50) {
                    Text("Welcome Back!")
                        .font(.custom("Quicksand-Bold", size: 28))
                        .foregroundColor(Color(hex: 0x0A0A0A))
                    
                    VStack(spacing: 35) {
                        VStack(spacing: 12) {
                            TextField("Username", text: $username)
                                .padding(.bottom, 5)
                                .font(.custom("Quicksand-Regular", size: 18))
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color(hex: 0x0A0A0A))
                        }
                        .padding(.horizontal, 20)
                        
                        VStack(spacing: 10) {
                            SecureField("Password", text: $password)
                                .padding(.bottom, 5)
                                .font(.custom("Quicksand-Regular", size: 18))
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color(hex: 0x0A0A0A))
                        }
                        .padding(.horizontal, 20)
                    }
                    
                    Button(action: {
                        // Handle login action
                    }) {
                        Text("Log In")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: 0xFD499D))
                            .cornerRadius(40)
                            .font(.custom("Quicksand-Bold", size: 18))
                    }
                    .padding(.horizontal, 90)
                }
                .padding(.vertical, 30)
                .background(Color(hex: 0xFFEBD6))
                .cornerRadius(25)
                .padding(.horizontal, 20)
                .shadow(radius: 5)
                
                Spacer()
                
                Text("OR")
                    .font(.custom("Quicksand-Bold", size: 28))
                    .foregroundColor(Color(hex: 0x0A0A0A))
                    .padding(.bottom, 33)
                
                VStack(spacing: 15) {
                    Button(action: {
                        // Handle Google sign in
                    }) {
                        Text("Sign In With Google")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: 0xFD499D))
                            .cornerRadius(40)
                            .font(.custom("Quicksand-Bold", size: 18))
                    }
                    .padding(.horizontal, 40)
                    
                    Button(action: {
                        // Handle Apple sign in
                    }) {
                        Text("Sign In with Apple")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: 0xFD499D))
                            .cornerRadius(40)
                            .font(.custom("Quicksand-Bold", size: 18))
                    }
                    .padding(.horizontal, 40)
                }
                
                Spacer()
                
                Button(action: {
                    // Handle forgot password
                }) {
                    Text("Forgot Password")
                        .foregroundColor(Color(hex: 0xDE0269))
                        .underline()
                        .font(.custom("Quicksand-Bold", size: 16))
                }
                .padding(.bottom, 45)
            }
        }
    }
}

#Preview {
    UserLogIn()
}
