//
//  ContentView.swift
//  App-DiabeticFoot
//
//  Created by Alumno on 01/11/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var viewChange = false
    
    var body: some View {
        
        ZStack {
            Button("Back") {
                mode.wrappedValue.dismiss()
            }.navigationBarBackButtonHidden(true)
            
            Image("BG_Rosita")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            NavigationLink(
                destination: LogoView(),
                isActive: $viewChange,
                label: {
                    VStack {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(Color(red: 161/255, green: 90/255, blue: 90/255))
                            .font(.custom("Arimo", size: 35))
                        
                        Text("¡Gracias, has creado tu cuenta!")
                            .foregroundColor(Color(red: 161/255, green: 90/255, blue: 90/255))
                            .font(.custom("Arimo", size: 20))
                            .fontWeight(.bold)
                    }
                    
                }
            )
            .opacity(viewChange ? 0 : 1) // Initial opacity
            .animation(.easeOut(duration: 1.0)) // Fade-out animation duration
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.viewChange.toggle()
                    }
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
