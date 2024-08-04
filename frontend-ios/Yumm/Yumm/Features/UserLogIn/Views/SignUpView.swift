//
//  SignUpView.swift
//  Yumm
//
//  Created by Vamsi Putti on 8/4/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    
    var body: some View {
        ZStack {
            YummColors.lightPink
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    Text("Welcome Back!")
                        .font(Font.custom(YummFonts.QuicksandSemiBold, size: 24))
                        .padding(.vertical)
                    
                    Text("Enter your username and password to continue.")
                        .font(Font.custom(YummFonts.QuicksandLight, size: 16))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        
                    Spacer()
                        .frame(height: 20)
                    
                    TextField("Username", text: $username)
                        .font(Font.custom(YummFonts.QuicksandRegular, size: 18))
                        .padding()
                    
                    Spacer()
                        .frame(height: 20)
                    
                    SecureField("Password", text: $password)
                        .font(Font.custom(YummFonts.QuicksandRegular, size: 18))
                        .padding()
                    
                    Spacer()
                        .frame(height: 20)
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("Login")
                                .font(Font.custom(YummFonts.QuicksandBold, size: 16))
                                .padding(15)
                        }
                        Spacer()
                    }
                    .background(YummColors.regPink)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.horizontal, 50)
                    .padding(.vertical, 20)
                }
                .background(YummColors.cream)
                .cornerRadius(20)
                .padding()
                
                Text("OR")
                    .font(Font.custom(YummFonts.QuicksandBold, size: 32))
                    .padding(5)
                
                /// Apple and Google Sign In
                HStack {
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Sign In With Google")
                            .font(Font.custom(YummFonts.QuicksandBold, size: 16))
                            .padding(15)
                    }
                    Spacer()
                }
                .background(YummColors.regPink)
                .foregroundColor(.white)
                .cornerRadius(20)
                .padding(.horizontal, 50)
                .padding(.vertical, 20)
                
                HStack {
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Sign In with Apple")
                            .font(Font.custom(YummFonts.QuicksandBold, size: 16))
                            .padding(15)
                    }
                    Spacer()
                }
                .background(YummColors.regPink)
                .foregroundColor(.white)
                .cornerRadius(20)
                .padding(.horizontal, 50)
                
                Text("Forgot Password?")
                    .font(Font.custom(YummFonts.QuicksandBold, size: 12))
                    .foregroundColor(YummColors.darkPink)
                    .padding(15)
                    .underline()
            }
            
        }
    }
}

#Preview {
    SignUpView()
}
