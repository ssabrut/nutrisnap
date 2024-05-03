//
//  AddMealView.swift
//  NutriSnap
//
//  Created by Michael Eko on 02/05/24.
//

import SwiftUI

struct accessCameraView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var isPresented
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
}

// Coordinator will help to preview the selected image in the View.
class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var picker: accessCameraView
    
    init(picker: accessCameraView) {
        self.picker = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        self.picker.selectedImage = selectedImage
        self.picker.isPresented.wrappedValue.dismiss()
    }
}

struct AddMealView: View {
    @EnvironmentObject var manager: DataManager
    @Environment(\.managedObjectContext) var viewContext
    
    private let headerFontSize: CGFloat = 18
    private let cornerRadius: CGFloat = 12
    @State private var showCamera = false
    @State private var selectedImage: UIImage?
    @State private var mealName: String = ""
    @Binding var popToRoot: Bool
    
    private func saveMeal(mealName: String, selectedImage: UIImage) {
        let meal = Meal(context: self.viewContext)
        meal.id = UUID()
        meal.name = mealName
        meal.image = selectedImage.jpegData(compressionQuality: 1.0)
        meal.created_at = Date()
        
        do {
            try self.viewContext.save()
            self.popToRoot = false
        } catch {
            print("Error saving data: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack(spacing: 0) {
                    if let selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: .infinity, height: 256)
                            .cornerRadius(12)
                            .padding(.bottom, 16)
                    }
                    
                    Button(action: {
                        self.showCamera.toggle()
                    }) {
                        Label((selectedImage == nil) ? "Open Camera" : "Take Another", systemImage: "camera")
                            .foregroundStyle((selectedImage == nil) ? Color("TextNavyBlue") : .white)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .padding(.vertical, selectedImage == nil ? 128 : 16)
                    }
                    .background((selectedImage == nil) ? .white : Color("TextNavyBlue"))
                    .cornerRadius(12)
                    .fullScreenCover(isPresented: self.$showCamera) {
                        accessCameraView(selectedImage: self.$selectedImage)
                    }
                    HStack {
                        Text("Food Name")
                            .padding(.trailing, 48)
                        Spacer()
                        TextField("e.g. Nasi Padang", text: $mealName)
                            .background(.white)
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(12)
                    .padding(.vertical, 24)
                    Spacer()
                    Button(action: {
                        saveMeal(mealName: mealName, selectedImage: selectedImage!)
                    }) {
                        Text("Add")
                            .font(.system(size: headerFontSize))
                            .bold()
                            .foregroundStyle(.white)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .padding(.vertical, 16)
                    }
                    .background(Color("BGNavyBlue"))
                    .cornerRadius(cornerRadius)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(EdgeInsets(top: 24, leading: 24, bottom: 0, trailing: 24))
            .onTapGesture {
                hideKeyboard()
            }
        }
        .background(Color("BGGray"))
        .navigationTitle("Add Meal")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    AddMealView(popToRoot: true)
//}
