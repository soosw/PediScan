//
//  InfoViewGrado2.swift
//  App-DiabeticFoot
//
//  Created by Carolina Nicole González Leal on 11/11/23.
//

import SwiftUI

struct InfoViewGrado2: View {
    var body: some View {
        VStack {
            Text("En caso de herida")
                .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                .font(.custom("borsok", size: 25))
                .padding()
            
            VideoView(videoID: "FRLcGp6C")
                .frame(minHeight: 0,  maxHeight:
                        UIScreen.main.bounds.height * 0.3)
                .cornerRadius(12)
                .padding(.horizontal, 24)
            List{
                Text("SIGNOS DE ALARMA")
                    .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                    .font(.custom("Arial", size: 15))
                    .multilineTextAlignment(.center)
                Text("• Presencia de lesión, enrojecimiento en la zona.")
                Text("• Picor, inflamación")
                Text("• Consulte ante cualquier duda o cambio en el aspecto habitual")
            }
            .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    InfoViewGrado2()
}
