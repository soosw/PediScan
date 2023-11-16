//
//  InicioSesion.swift
//  App-DiabeticFoot
//
//  Created by Alumno on 04/11/23.
//

import SwiftUI

struct InicioSesion: View {
    @State private var username = ""
    @State private var password = ""
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            ZStack {
                
                Button("Back") {
                    mode.wrappedValue.dismiss()
                }.navigationBarBackButtonHidden(true)

                
                Image("BG_RosaCirculos")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                
                VStack() {
                    
                    TextField("", text: $username, prompt: Text("Usuario").foregroundColor(Color.white))
                        .foregroundColor(Color.white)
                        .padding(.vertical, 10)
                        .multilineTextAlignment(.center)
                        .background(Color(red: 184/255, green: 106/255, blue: 106/255))
                        .cornerRadius(20)
                        .frame(width: 280)
                        .font(.custom("Arimo", size: 15))
                    
                    SecureField("", text: $password, prompt: Text("Contraseña").foregroundColor(Color.white))
                        .foregroundColor(Color.white)
                        .padding(.vertical, 10)
                        .multilineTextAlignment(.center)
                        .background(Color(red: 184/255, green: 106/255, blue: 106/255))
                        .cornerRadius(20)
                        .frame(width: 280)
                        .padding(10)
                        .font(.custom("Arimo", size: 15))
                    
                    NavigationLink(
                        destination: MainMadView(),
                        label: {
                            Text("Ingresar")
                                .frame(width: 180)
                                .padding(8)
                                .background(Color(red: 161/255, green: 90/255, blue: 90/255))
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .padding(.vertical, 15)
                                .font(.custom("Arimo", size: 15))
                        }
                    )
                    
                    NavigationLink(
                        destination: RegistroView(),
                        label: {
                            Text("Crear cuenta")
                                .frame(width: 180)
                                .padding(8)
                                .background(Color(red: 91/255, green: 137/255, blue: 164/255))
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .padding(.vertical, 15)
                                .font(.custom("Arimo", size: 15))
                        }
                    )
                    
                }
                .padding(.top, 30)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    InicioSesion()
}
