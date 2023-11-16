//
//  InfoViewGrado3.swift
//  App-DiabeticFoot
//
//  Created by Carolina Nicole González Leal on 11/11/23.
//

import SwiftUI

struct InfoViewGrado3: View {
    var body: some View {
        
        VStack {
            Text("¡La salud de tu pie corre peligro!")
                .padding(8)
                .foregroundColor(Color(red: 161/255, green: 90/255, blue: 90/255))
                .font(.custom("borsok", size: 45))
                .multilineTextAlignment(.center)
                .lineSpacing(5)
            
            Text("Te recomendamos acudir al hospital lo más pronto posible")
                .foregroundColor(Color(red: 161/255, green: 90/255, blue: 90/255))
                .font(.custom("Arimo", size: 35))
                .multilineTextAlignment(.center)
                .lineSpacing(5)
        }
        
    }
}

#Preview {
    InfoViewGrado3()
}
