//
//  CalendarView.swift
//  App-DiabeticFoot
//
//  Created by Scarlet on 04/11/23.
//

import SwiftUI

struct FirstView: View {
    @State private var showInicioSesion = false

    var body: some View {
        NavigationView {
            ZStack {
                Image("BG_Azulito")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(showInicioSesion ? 0 : 1)
                    .animation(.easeInOut)
                
                NavigationLink(
                    destination: InicioSesion(),
                    isActive: $showInicioSesion,
                    label: {
                        EmptyView()
                    }
                )
                .hidden()

                VStack {
                    Image("Logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)

                    Text("PediScan")
                        .foregroundColor(Color(red: 161/255, green: 90/255, blue: 90/255))
                        .font(.custom("Arimo", size: 20))
                        .fontWeight(.bold)
                }
            }
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        showInicioSesion = true
                    }
                }
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
