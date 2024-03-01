//
//  ContentView.swift
//  SimonSays
//
//  Created by Paweł Jan Tłusty on 29/02/2024.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
        ZStack{
            storyboardview().edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
            }
        }
        
    }
}

#Preview {
    ContentView()
}


struct storyboardview: UIViewControllerRepresentable{
    func makeUIViewController(context content: Context) -> UIViewController {
        let storyboard = UIStoryboard(name: "Storyboard", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(identifier: "SimonHome")
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}
