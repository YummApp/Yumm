//
//  ForgotPasswordView.swift
//  Yumm
//
//  Created by Akshar Chunduri on 8/9/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = ""
    @State private var code: String = ""
    @Environment(\.dismiss) var dismiss // Environment variable to handle view dismissal

    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: 0xFFEBD6) // Set the entire background to tannish color
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 40) { // Increase spacing to shift content down
                    VStack(spacing: 20) { // Containing everything within a VStack
                        HStack {
                            Button(action: {
                                dismiss() // Dismiss the current view
                            }) {
                                Text("Back")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color(hex: 0xFD499D))
                                    .cornerRadius(40)
                                    .font(.custom("Quicksand-Bold", size: 18))
                            }
                            Spacer()
                        }
                        .padding(.leading, 20)
                        .padding(.top, -35)

                        Text("Forgot Password?")
                            .font(.custom("Quicksand-Bold", size: 28))
                            .foregroundColor(Color(hex: 0x0A0A0A))
                        Spacer().frame(height: 60)
                        VStack(spacing: 20) {
                            VStack(spacing: 10) {
                                TextField("Email", text: $email)
                                    .padding(.bottom, 5)
                                    .font(.custom("Quicksand-Regular", size: 18))
                                
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(Color(hex: 0x0A0A0A))
                            }
                            .padding(.horizontal, 40)
                            
                            Button(action: {
                                // Action for Send Code
                            }) {
                                Text("Send Code")
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color(hex: 0xFD499D))
                                    .cornerRadius(40)
                                    .font(.custom("Quicksand-Bold", size: 18))
                            }
                            .padding(.horizontal, 90)
                            
                            Spacer().frame(height: 70)
                            
                            VStack(spacing: 10) {
                                TextField("Enter Code", text: $code)
                                    .padding(.bottom, 5)
                                    .font(.custom("Quicksand-Regular", size: 18))
                                
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(Color(hex: 0x0A0A0A))
                            }
                            .padding(.horizontal, 40)
                            
                            NavigationLink(destination: ChangePasswordView()
                                .navigationBarBackButtonHidden(true)
                                .navigationBarHidden(true)) {
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
                    }
                    .padding(.vertical, 30)
                    
                    Spacer()
                }
            }
            .navigationBarHidden(true) // Hide the default navigation bar
        }
    }
}

#Preview {
    ForgotPasswordView()
}
