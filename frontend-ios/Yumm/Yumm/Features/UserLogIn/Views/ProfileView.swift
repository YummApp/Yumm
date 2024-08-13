import SwiftUI
import PhotosUI

struct ProfileView: View {
    @State private var isEditingBio = false
    @State private var bioText = "This is your bio. Click Edit to modify."
    @State private var profileImage: Image? = Image(systemName: "person.crop.circle.fill")
    @State private var isImagePickerPresented = false
    @State private var isZoomed = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // Profile Picture and Username
                VStack(spacing: 20) {
                    ZStack(alignment: .bottomTrailing) {
                        profileImage?
                            .resizable()
                            .aspectRatio(contentMode: isZoomed ? .fit : .fill)
                            .frame(width: isZoomed ? UIScreen.main.bounds.width : 100, height: isZoomed ? UIScreen.main.bounds.width : 100)
                            .clipShape(Circle())
                            .onTapGesture {
                                withAnimation {
                                    isZoomed.toggle()
                                }
                            }
                            .foregroundColor(Color(hex: 0xFD499D))
                        
                        if !isZoomed {
                            Button(action: {
                                isImagePickerPresented = true
                            }) {
                                Image(systemName: "camera.fill")
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(Color.black.opacity(0.7))
                                    .clipShape(Circle())
                            }
                        }
                    }
                    .sheet(isPresented: $isImagePickerPresented) {
                        PhotoPicker(image: $profileImage)
                    }
                    
                    Text("Username")
                        .font(.custom("Quicksand-Bold", size: 24))
                        .foregroundColor(Color(hex: 0x0A0A0A))
                }
                
                // User Information
                VStack(alignment: .leading, spacing: 15) {
                    ProfileInfoRow(label: "First Name", value: "LeBron")
                    ProfileInfoRow(label: "Last Name", value: "James")
                    
                    // Editable Bio Section
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Bio")
                                .font(.custom("Quicksand-Bold", size: 18))
                                .foregroundColor(Color(hex: 0x0A0A0A))
                            Spacer()
                            Button(action: {
                                isEditingBio.toggle()
                            }) {
                                Text(isEditingBio ? "Done" : "Edit")
                                    .font(.custom("Quicksand-Bold", size: 16))
                                    .foregroundColor(Color(hex: 0xFD499D))
                            }
                        }
                        
                        if isEditingBio {
                            TextEditor(text: $bioText)
                                .frame(height: 100)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 2)
                        } else {
                            Text(bioText)
                                .font(.custom("Quicksand-Regular", size: 16))
                                .foregroundColor(Color(hex: 0x0A0A0A))
                                .padding(.top, 5)
                        }
                    }
                    
                    ProfileInfoRow(label: "Date Joined", value: "January 1, 2023")
                    ProfileInfoRow(label: "Email", value: "john.doe@example.com")
                    ProfileInfoRow(label: "Phone Number", value: "(123) 456-7890")
                }
                .padding(.horizontal, 20)
                
                // Cuisines and Dietary Restrictions
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("Favorite Cuisines")
                            .font(.custom("Quicksand-Bold", size: 18))
                            .foregroundColor(Color(hex: 0x0A0A0A))
                        Spacer()
                        Button(action: {
                            // Edit action (currently no function)
                        }) {
                            Text("Edit")
                                .font(.custom("Quicksand-Bold", size: 16))
                                .foregroundColor(Color(hex: 0xFD499D))
                        }
                    }
                    Text("Italian, Japanese, Mexican")
                        .font(.custom("Quicksand-Regular", size: 16))
                        .foregroundColor(Color(hex: 0x0A0A0A))
                    
                    HStack {
                        Text("Dietary Restrictions")
                            .font(.custom("Quicksand-Bold", size: 18))
                            .foregroundColor(Color(hex: 0x0A0A0A))
                        Spacer()
                        Button(action: {
                            // Edit action (currently no function)
                        }) {
                            Text("Edit")
                                .font(.custom("Quicksand-Bold", size: 16))
                                .foregroundColor(Color(hex: 0xFD499D))
                        }
                    }
                    Text("Vegetarian, Gluten-Free")
                        .font(.custom("Quicksand-Regular", size: 16))
                        .foregroundColor(Color(hex: 0x0A0A0A))
                }
                .padding(.horizontal, 20)
            }
            .padding(.vertical, 30)
        }
        .background(Color(hex: 0xFFEBD6).edgesIgnoringSafeArea(.all))
    }
}

// Reusable Profile Info Row
struct ProfileInfoRow: View {
    var label: String
    var value: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(.custom("Quicksand-Bold", size: 18))
                .foregroundColor(Color(hex: 0x0A0A0A))
            Spacer()
            Text(value)
                .font(.custom("Quicksand-Regular", size: 16))
                .foregroundColor(Color(hex: 0x0A0A0A))
        }
        .padding(.vertical, 5)
    }
}

// PhotoPicker to handle image selection
struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var image: Image?

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: PhotoPicker

        init(_ parent: PhotoPicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)

            guard let provider = results.first?.itemProvider, provider.canLoadObject(ofClass: UIImage.self) else { return }

            provider.loadObject(ofClass: UIImage.self) { image, _ in
                DispatchQueue.main.async {
                    if let uiImage = image as? UIImage {
                        self.parent.image = Image(uiImage: uiImage)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
