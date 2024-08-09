//
//  DietSelectView.swift
//  Yumm
//
//  Created by Akshar Chunduri on 8/7/24.
//

import SwiftUI

struct DietSelectView: View {
    @State private var selectedDiets: Set<String> = []
    @State private var selectedAllergies: Set<String> = []

    let diets = ["Vegetarian", "Vegan", "Jain", "Halal", "Kosher", "Pescatarian"]
    let allergies = ["Peanuts", "Tree Nuts", "Soy", "Dairy", "Gluten", "Seafood", "Egg"]

    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: 0x0A0A0A) // Background color
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 5) {
                    Spacer().frame(height: 5)
                    
                    Text("Please select any dietary restrictions or")
                        .font(.custom("Quicksand-Medium", size: 18))
                        .foregroundColor(Color(hex: 0xFFEBD6))
                        .padding(.horizontal, 20)
                    Text("allergies that apply to you:")
                        .font(.custom("Quicksand-Medium", size: 18))
                        .foregroundColor(Color(hex: 0xFFEBD6))
                        .padding(.horizontal, 20)
                    Spacer().frame(height: 18)
                    Text("Diet")
                        .font(.custom("Quicksand-Bold", size: 28))
                        .foregroundColor(Color(hex: 0xFFEBD6))
                    Spacer().frame(height: 5)
                    LazyVGrid(columns: [GridItem(), GridItem()], spacing: 20) {
                        ForEach(diets, id: \.self) { diet in
                            dietButton(diet)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer().frame(height: 10)
                    
                    Text("Allergies")
                        .font(.custom("Quicksand-Bold", size: 28))
                        .foregroundColor(Color(hex: 0xFFEBD6))
                    Spacer().frame(height: 5)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(allergies, id: \.self) { allergy in
                                allergyButton(allergy)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    
                    Spacer().frame(height: 30)
                    
                    NavigationLink(destination: CuisineSelectView().navigationBarHidden(true)) {
                        Text("Next")
                            .foregroundColor(Color(hex: 0x0A0A0A))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: 0xFFEBD6))
                            .cornerRadius(40)
                            .font(.custom("Quicksand-Bold", size: 18))
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                    }
                    .padding(.horizontal, 110)
                    
                    Spacer().frame(height: 20)
                }
            }
            .navigationBarHidden(true) // Hide the navigation bar in this view
        }
    }
    
    private func dietButton(_ title: String) -> some View {
        Button(action: {
            toggleSelection(for: title, in: &selectedDiets)
        }) {
            Text(title)
                .foregroundColor(selectedDiets.contains(title) ? Color(hex: 0x0A0A0A) : .white)
                .frame(width: 150, height: 100)
                .background(selectedDiets.contains(title) ? Color(hex: 0xFFEBD6) : Color(hex: 0xFD499D))
                .cornerRadius(20)
                .font(.custom("Quicksand-Bold", size: 18))
        }
    }
    
    private func allergyButton(_ title: String) -> some View {
        Button(action: {
            toggleSelection(for: title, in: &selectedAllergies)
        }) {
            Text(title)
                .foregroundColor(selectedAllergies.contains(title) ? Color(hex: 0x0A0A0A) : .white)
                .frame(width: 100, height: 50)
                .background(selectedAllergies.contains(title) ? Color(hex: 0xFFEBD6) : Color(hex: 0xFD499D))
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
    DietSelectView()
}
