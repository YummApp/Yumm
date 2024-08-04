//
//  IntroView.swift
//  Yumm
//
//  Created by Vamsi Putti on 8/4/24.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
        ZStack {
            YummColors.defaultBlack
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                HStack {
                    Spacer()
                    
                    Image(.yummLogo)
                        .resizable()
                        .frame(width: 130, height: 130)
                    
                    Text("YUMM")
                        .font(Font.custom(YummFonts.QuicksandBold, size: 72))
                        .foregroundStyle(YummColors.regPink)
                        .padding(.leading, -10)
                    
                    Spacer()
                }
                .padding(.leading, -29)
                
                Text("Explore. Experience. Enjoy.")
                    .font(Font.custom(YummFonts.QuicksandBold, size: 24))
                    .foregroundStyle(.white)
                
                Spacer()
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                
                HStack {
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Get Started")
                            .font(Font.custom(YummFonts.QuicksandBold, size: 24))
                            .padding(15)
                    }
                    Spacer()
                }
                .background(YummColors.regPink)
                .foregroundColor(YummColors.cream)
                .cornerRadius(20)
                .padding(.horizontal)
                .padding(.bottom, 10)
                
                HStack {
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Log In")
                            .font(Font.custom(YummFonts.QuicksandBold, size: 24))
                            .padding(15)
                    }
                    Spacer()
                }
                .background(YummColors.cream)
                .foregroundColor(YummColors.regPink)
                .cornerRadius(20)
                .padding(.horizontal)
                
                
                
            }
        }
    }
}

#Preview {
    IntroView()
}
