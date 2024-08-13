//
//  OtherProfileView.swift
//  Yumm
//
//  Created by Akshar Chunduri on 8/12/24.
//

import SwiftUI

struct OtherProfileView: View {
    @State private var bioText = "This is the user's bio."

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // Profile Picture and Username
                VStack(spacing: 20) {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color(hex: 0xFD499D))
                    
                    Text("Username")
                        .font(.custom("Quicksand-Bold", size: 24))
                        .foregroundColor(Color(hex: 0x0A0A0A))
                }
                
                // User Information
                VStack(alignment: .leading, spacing: 15) {
                    ProfileInfoRow(label: "First Name", value: "LeBron")
                    ProfileInfoRow(label: "Last Name", value: "James")

                    // Non-editable Bio Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Bio")
                            .font(.custom("Quicksand-Bold", size: 18))
                            .foregroundColor(Color(hex: 0x0A0A0A))
                        
                        Text(bioText)
                            .font(.custom("Quicksand-Regular", size: 16))
                            .foregroundColor(Color(hex: 0x0A0A0A))
                            .padding(.top, 5)
                    }

                    ProfileInfoRow(label: "Date Joined", value: "January 1, 2023")
                    ProfileInfoRow(label: "Email", value: "john.doe@example.com")
                    ProfileInfoRow(label: "Phone Number", value: "(123) 456-7890")
                    
                    // Separate lines for title and text
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Favorite Cuisines")
                            .font(.custom("Quicksand-Bold", size: 18))
                            .foregroundColor(Color(hex: 0x0A0A0A))
                        
                        Text("Italian, Japanese, Mexican")
                            .font(.custom("Quicksand-Regular", size: 16))
                            .foregroundColor(Color(hex: 0x0A0A0A))
                            .padding(.top, 5)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Dietary Restrictions")
                            .font(.custom("Quicksand-Bold", size: 18))
                            .foregroundColor(Color(hex: 0x0A0A0A))
                        
                        Text("Vegetarian, Gluten-Free")
                            .font(.custom("Quicksand-Regular", size: 16))
                            .foregroundColor(Color(hex: 0x0A0A0A))
                            .padding(.top, 5)
                    }
                }
                .padding(.horizontal, 20)
            }
            .padding(.vertical, 30)
        }
        .background(Color(hex: 0xFFEBD6).edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    OtherProfileView()
}
