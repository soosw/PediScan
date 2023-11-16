//
//  ProfileView.swift
//  App-DiabeticFoot
//
//  Created by Carolina Nicole González Leal on 11/11/23.
//

import SwiftUI

struct ProfileView: View {

    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                
                VStack {
                    
                    VStack(spacing: 0) {
                        Color(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .ignoresSafeArea()
                            .frame(maxHeight: 0)
                        
                        HStack {
                            Text("Perfil")
                                .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                                .font(.custom("borsok", size: 35))
                                .lineSpacing(15)
                                .multilineTextAlignment(.center)
                        }
                        .padding(8)
                        .clipShape(
                            .rect(
                                bottomLeadingRadius: 20,
                                bottomTrailingRadius: 20
                            )
                        )
                    }
                    .padding(.bottom, 50)
                    
                    VStack {
                        HStack {
                            Image(systemName:"person.circle")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 110, height: 120)
                            
                                .padding()
                            
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Carolina Gonzalez")
                                    .font(.custom("arimo", size:25))
                                    .fontWeight(.bold)
                                
                                HStack {
                                    
                                    Image(systemName: "calendar")
                                        .foregroundStyle(.yellow)
                                    Text("21/02/2003")
                                        .font(Font.system(.caption))
                                        .bold()
                                }
                                .padding(8)
                                .background(.thinMaterial)
                                .foregroundStyle(.gray)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                
                                HStack {
                                    Image(systemName: "calendar")
                                        .foregroundStyle(.red)
                                    Text("15/07/2021")
                                        .font(Font.system(.caption))
                                        .bold()
                                }
                                .padding(8)
                                .background(.thinMaterial)
                                .foregroundStyle(.gray)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                
                                HStack {
                                    Image(systemName: "person.fill")
                                        .foregroundStyle(.blue)
                                    Text("Femenino")
                                        .font(Font.system(.caption))
                                        .bold()
                                }
                                .padding(8)
                                .background(.thinMaterial)
                                .foregroundStyle(.gray)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                
                                HStack {
                                    Image(systemName: "ruler.fill")
                                        .foregroundStyle(.brown)
                                    Text("4.5")
                                        .font(Font.system(.caption))
                                        .bold()
                                }
                                .padding(8)
                                .background(.thinMaterial)
                                .foregroundStyle(.gray)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                
                                HStack {
                                    Image(systemName: "pills.fill")
                                        .foregroundStyle(.green)
                                    Text("Bomba de insulina")
                                        .font(Font.system(.caption))
                                        .bold()
                                }
                                .padding(8)
                                .background(.thinMaterial)
                                .foregroundStyle(.gray)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            .tag("30 min")
                            
                            Spacer()
                        }
                    }
                    .padding(.bottom)
                    .ignoresSafeArea(.keyboard)
                    .frame(width: geometry.size.width)
                }
            }
        }
    }
}
                               
                               struct ProfileView_Previews: PreviewProvider {
                            static var previews: some View {
                                ProfileView()
                            }
                        }
