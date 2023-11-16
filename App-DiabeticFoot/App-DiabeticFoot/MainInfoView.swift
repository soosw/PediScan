//
//  MainInfoView.swift
//  App-DiabeticFoot
//
//  Created by Carolina Nicole González Leal on 11/11/23.
//

import SwiftUI

struct MainInfoView: View {
    var body: some View {
        TabView {
            InfoViewGrado1()
                .tabItem {
                    Image(systemName: "1.lane")
                    Text("Grado")
                }
            
            InfoViewGrado2()
                .tabItem {
                    Image(systemName: "2.lane")
                    Text("Grado")
                }
            
            InfoViewGrado3()
                .tabItem {
                    Image(systemName: "3.lane")
                    Text("Grado")
                }
        }
    }
}

#Preview {
    MainInfoView()
}
