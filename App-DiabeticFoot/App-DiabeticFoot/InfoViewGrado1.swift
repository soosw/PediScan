//
//  InfoViewGrado1.swift
//  App-DiabeticFoot
//
//  Created by Scarlet on 04/11/23.
//

import SwiftUI

struct InfoViewGrado1: View {
    
    var body: some View {
        VStack {
            Text("Curación")
                .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                .font(.custom("borsok", size: 25))
                .padding()
            
            VideoView(videoID: "aFgB-frLwP4")
                .frame(minHeight: 0,  maxHeight:
                        UIScreen.main.bounds.height * 0.3)
                .cornerRadius(12)
                .padding(.horizontal, 24)

            
            List {
                Text("DEBE EVITAR")
                    .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                    .font(.custom("Arial", size: 15))
                    .multilineTextAlignment(.center)
                Text("• Calzado inadecuado")
                Text("• Ir sin calcetines")
                Text("• Ir descalzo")
                Text("• Hábitos tóxicos (fumar, beber alcohol)")
                Text("• Productos químicos y apósitos para las callosidades")
            }
            .scrollContentBackground(.hidden)
        }
    }
}

struct InfoViewGrado1_Previews: PreviewProvider {
    static var previews: some View {
        InfoViewGrado1()
    }
}


