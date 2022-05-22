//
//  ContentView.swift
//  UITestingDemo
//
//  Created by Shubham Kumar on 21/02/22.
//

import SwiftUI

class UITestingDemoViewModel: ObservableObject {
    let placeholderText: String = "Add your name..."
    @Published var textFieldText: String = ""
    @Published var currentUserSignedIn: Bool = false
    
    func signUpButtonPressed() {
        guard !textFieldText.isEmpty else {
            return
        }
        currentUserSignedIn = true
    }
}

struct UITestingView: View {
    @StateObject private var vm = UITestingDemoViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            if vm.currentUserSignedIn {
                Text("Hello World")
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .transition(.move(edge: .trailing))
            } else {
                signUpLayer
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .transition(.move(edge: .leading))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UITestingView()
    }
}

extension UITestingView {
    private var signUpLayer: some View {
        VStack {
            TextField(vm.placeholderText, text: $vm.textFieldText)
                .font(.headline)
                .padding(10)
                .background(Color.white)
                .cornerRadius(10)
            
            Button {
                withAnimation(.spring()) {
                    vm.signUpButtonPressed()
                }
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }

        }
    }
}
