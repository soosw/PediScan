//
//  LogoView.swift
//  App-DiabeticFoot
//
//  Created by Sofía Cantú on 11/11/23.
//

import SwiftUI

struct LogoView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var viewChange = false
    
    var body: some View {
        
        ZStack {
            Button("Back") {
                mode.wrappedValue.dismiss()
            }.navigationBarBackButtonHidden(true)
            
            Image("BG_Azulito")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            NavigationLink(
                destination: MainMadView(),
                isActive: $viewChange,
                label: {
                    VStack {
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        
                        Text("PediScan")
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



struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
