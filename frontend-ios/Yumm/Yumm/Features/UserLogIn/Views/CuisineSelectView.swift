//
//  CuisineSelectView.swift
//  Yumm
//
//  Created by Akshar Chunduri on 8/7/24.
//

import SwiftUI

struct CuisineSelectView: View {
    @State private var selectedCuisines: Set<String> = []

    let cuisines = [
        "Italian", "Mexican", "Chinese", "Mediterranean",
        "American", "African", "French", "Indian", "Japanese", "Korean", "Brazilian", "Carribean"
    ]

    var body: some View {
        ZStack {
            Color(hex: 0x0A0A0A) // Background color
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 5) {
                Spacer().frame(height: 20)
                Text("Please select any cuisine preferences.")
                    .font(.custom("Quicksand-SemiBold", size: 24))
                    .foregroundColor(Color(hex: 0xFFEBD6))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                Spacer().frame(height: 20)
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem()], spacing: 20) {
                        ForEach(cuisines, id: \.self) { cuisine in
                            cuisineButton(cuisine)
                        }
                    }
                    .padding(.horizontal, 20)
                }
                
                Spacer()
                
                Button(action: {
                    // Handle next action
                }) {
                    Text("Next")
                        .foregroundColor(Color(hex: 0x0A0A0A))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: 0xFFEBD6))
                        .cornerRadius(40)
                        .font(.custom("Quicksand-Bold", size: 18))
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal, 110)
                
                Spacer().frame(height: 20)
            }
        }
    }
    
    private func cuisineButton(_ title: String) -> some View {
        Button(action: {
            toggleSelection(for: title, in: &selectedCuisines)
        }) {
            Text(title)
                .foregroundColor(selectedCuisines.contains(title) ? Color(hex: 0x0A0A0A) : .white)
                .frame(width: 150, height: 100)
                .background(selectedCuisines.contains(title) ? Color(hex: 0xFFEBD6) : Color(hex: 0xFD499D))
                .cornerRadius(20)
                .font(.custom("Quicksand-Bold", size: 18))
        }
    }
    
    private func toggleSelection(for item: String, in set: inout Set<String>) {
        if set.contains(item) {
            set.remove(item)
        } else {
            set.insert(item)
        }
    }
}

#Preview {
    CuisineSelectView()
}
