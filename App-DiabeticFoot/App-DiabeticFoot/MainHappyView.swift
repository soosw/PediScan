//
//  MainHappyView.swift
//  App-DiabeticFoot
//
//  Created by Carolina Nicole González Leal on 08/11/23.
//

import SwiftUI

struct MainHappyView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        
        ZStack {
            Button("Back") {
                mode.wrappedValue.dismiss()
            }.navigationBarBackButtonHidden(true)
            
            Image("BG_Half")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            
            VStack{
                VStack {
                    Text("¡Ya registraste tu progreso de hoy!")
                        .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                        .font(.custom("borsok", size: 35))
                        .lineSpacing(15)
                        .multilineTextAlignment(.center)
                }
                .padding(.bottom, 30)
                
                ZStack{
                    Rectangle()
                        .fill(Color(red: 91/255, green: 137/255, blue: 164/255))
                        .frame(width: 430, height: 45)
                    
                    Image(systemName: "shoeprints.fill")
                        .foregroundColor(Color(red: 248/255, green: 243/255, blue: 243/255))
                        .font(.custom("borsok", size: 30))
                }
                
                
                List {
                    NavigationLink(
                        destination: InicioSesion(),
                        label: {
                            Image(systemName: "book.pages")
                                .padding(.vertical, 10)
                                .fontWeight(.bold)
                                .frame(width: 50)
                                .foregroundColor(Color(red: 0/255, green: 60/255, blue: 94/255))
                                .background(Color(red: 188/255, green: 215/255, blue: 230/255))
                                .font(.custom("Arimo", size: 25))
                                .cornerRadius(25)
                            Text("Registro de datos")
                                .foregroundColor(Color(red: 0/255, green: 60/255, blue: 94/255))
                                .font(.custom("Arimo", size: 22))
                                .lineSpacing(15)
                                .multilineTextAlignment(.center)
                                .fontWeight(.bold)
                        }
                    )
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    
                    NavigationLink(
                        destination: InicioSesion(),
                        label: {
                            Image(systemName: "camera")
                                .padding(.vertical, 10)
                                .fontWeight(.bold)
                                .frame(width: 50)
                                .foregroundColor(Color(red: 0/255, green: 60/255, blue: 94/255))
                                .background(Color(red: 188/255, green: 215/255, blue: 230/255))
                                .font(.custom("Arimo", size: 25))
                                .cornerRadius(25)
                            Text("Agregar foto de pie")
                                .foregroundColor(Color(red: 0/255, green: 60/255, blue: 94/255))
                                .font(.custom("Arimo", size: 22))
                                .lineSpacing(15)
                                .multilineTextAlignment(.center)
                                .fontWeight(.bold)
                        }
                    )
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    NavigationLink(
                        destination: InicioSesion(),
                        label: {
                            Image(systemName: "chart.line.uptrend.xyaxis")
                                .padding(.vertical, 10)
                                .fontWeight(.bold)
                                .frame(width: 50)
                                .foregroundColor(Color(red: 0/255, green: 60/255, blue: 94/255))
                                .background(Color(red: 188/255, green: 215/255, blue: 230/255))
                                .font(.custom("Arimo", size: 25))
                                .cornerRadius(25)
                            Text("Gráficas personales")
                                .foregroundColor(Color(red: 0/255, green: 60/255, blue: 94/255))
                                .font(.custom("Arimo", size: 22))
                                .lineSpacing(15)
                                .multilineTextAlignment(.center)
                                .fontWeight(.bold)
                        }
                    )
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    NavigationLink(
                        destination: HistorialView(),
                        label: {
                            Image(systemName: "book.closed.fill")
                                .padding(.vertical, 10)
                                .fontWeight(.bold)
                                .frame(width: 50)
                                .foregroundColor(Color(red: 0/255, green: 60/255, blue: 94/255))
                                .background(Color(red: 188/255, green: 215/255, blue: 230/255))
                                .font(.custom("Arimo", size: 25))
                                .cornerRadius(25)
                            Text("Historial")
                                .foregroundColor(Color(red: 0/255, green: 60/255, blue: 94/255))
                                .font(.custom("Arimo", size: 22))
                                .lineSpacing(15)
                                .multilineTextAlignment(.center)
                                .fontWeight(.bold)
                        }
                    )
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    
                    NavigationLink(
                        destination: InicioSesion(),
                        label: {
                            Image(systemName: "alarm.waves.left.and.right")
                                .padding(.vertical, 10)
                                .fontWeight(.bold)
                                .frame(width: 50)
                                .foregroundColor(Color(red: 0/255, green: 60/255, blue: 94/255))
                                .background(Color(red: 188/255, green: 215/255, blue: 230/255))
                                .font(.custom("Arimo", size: 25))
                                .cornerRadius(25)
                            Text("Recomendaciones y notificaciones")
                                .foregroundColor(Color(red: 0/255, green: 60/255, blue: 94/255))
                                .font(.custom("Arimo", size: 22))
                                .lineSpacing(15)
                                .multilineTextAlignment(.center)
                                .fontWeight(.bold)
                        }
                    )
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                }
                .listRowSpacing(15.0)
                .padding()
                .scrollContentBackground(.hidden)
                
                NavigationLink(
                    destination: InicioSesion(),
                    label: {
                        Image(systemName: "gearshape")
                            .padding(.vertical, 10)
                            .fontWeight(.bold)
                            .frame(width: 50)
                            .foregroundColor(Color(red: 91/255, green: 137/255, blue: 164/255))
                            .background(Color(red: 188/255, green: 215/255, blue: 230/255))
                            .font(.custom("Arimo", size: 25))
                            .cornerRadius(30)
                            .offset(x: 140)
                    }
                )
                
                
            }
            .padding(.top, 40)
        }
        
    }
    
}


#Preview {
    MainHappyView()
}
