//
//  MainMadView.swift
//  App-DiabeticFoot
//
//  Created by Alumno on 04/11/23.
//

import SwiftUI

class SharedData: ObservableObject {
    @Published var textoSuperior = "Registrar foto del día"
    
    static let shared = SharedData()
}

struct MainMadView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @ObservedObject var sharedData = SharedData.shared
    @State private var navigateToClassificationView = false
    
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
                    VStack {
                        NavigationLink(
                            destination: ProfileView(),
                            label: {
                                Image(systemName: "person.circle")
                                    .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                                    .font(.custom("Arimo", size: 35))
                                    //.background(Color.white)
                                    
                            }
                        )
                        .offset(x: 140, y: -30)
                        //.offset(x: 140, y: -30)
                        //.background(Color.white)
                        
                        Text(sharedData.textoSuperior)
                            .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                            .font(.custom("borsok", size: 30))
                            .lineSpacing(10)
                            .multilineTextAlignment(.center)
                            .lineLimit(3) // Limita la cantidad de líneas
                            .fixedSize(horizontal: false, vertical: true) // Permite el crecimiento vertical
                            .frame(maxWidth: .infinity) // Permite el salto de línea si el texto no cabe horizontalmente
                            .padding(.bottom, 50)
                    }
                    
                    ZStack{
                        Rectangle()
                            .fill(Color(red: 91/255, green: 137/255, blue: 164/255))
                            .frame(width: 430, height: 50)
                            .ignoresSafeArea()
                        
                        Image(systemName: "shoeprints.fill")
                            .foregroundColor(Color(red: 248/255, green: 243/255, blue: 243/255))
                            .font(.custom("borsok", size: 30))
                    }
                }
                .background(Color(red: 246/255, green: 225/255, blue: 225/255))
                
                VStack {
                    
                    HStack {
                        NavigationLink(
                            destination: RegistroDeDatos(),
                            label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color(red: 0/255, green: 60/255, blue: 94/255), lineWidth: 2)
                                        .background(
                                            RoundedRectangle(cornerRadius: 25)
                                                .fill(Color(red: 188/255, green: 215/255, blue: 230/255))
                                                .shadow(color: .black, radius: 5, x: 0, y: 3)
                                        )
                                        .frame(width: 150, height: 150)
                                    
                                    VStack{
                                        Image(systemName: "book.pages")
                                            .resizable()
                                            .foregroundColor(Color(red: 0/255, green: 60/255, blue: 94/255))
                                            .fontWeight(.bold)
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50, height: 50)
                                            .padding()
                                        
                                        Text("Registro de \ndatos")
                                            .foregroundColor(Color(red: 0/255, green: 60/255, blue: 94/255))
                                            .font(.custom("borsok", size: 20))
                                            .multilineTextAlignment(.center)
                                            .lineSpacing(15)
                                            .padding(.horizontal, 10)
                                    }
                                }
                            }
                        )
                        .padding(.horizontal, 10)
                        
                        Button(action: {
                            navigateToClassificationView = true
                        }) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color(red: 0/255, green: 60/255, blue: 94/255), lineWidth: 2)
                                    .background(
                                        RoundedRectangle(cornerRadius: 25)
                                            .fill(Color(red: 188/255, green: 215/255, blue: 230/255))
                                            .shadow(color: .black, radius: 5, x: 0, y: 3)
                                    )
                                    .frame(width: 150, height: 150)
                                
                                VStack{
                                    Image(systemName: "camera")
                                        .resizable()
                                        .foregroundColor(Color(red: 0/255, green: 60/255, blue: 94/255))
                                        .fontWeight(.bold)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 50)
                                        .padding()
                                    
                                    Text("Agregar foto \ndel día")
                                        .foregroundColor(Color(red: 0/255, green: 60/255, blue: 94/255))
                                        .font(.custom("borsok", size: 18))
                                        .multilineTextAlignment(.center)
                                        .lineSpacing(15)
                                    
                                }
                            }
                        }
                        .padding(.horizontal, 10)
                    }
                    .padding(.vertical, 20)
                    
                    HStack {
                        NavigationLink(
                            destination: GraficasView(),
                            label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color(red: 0/255, green: 60/255, blue: 94/255), lineWidth: 2)
                                        .background(
                                            RoundedRectangle(cornerRadius: 25)
                                                .fill(Color(red: 188/255, green: 215/255, blue: 230/255))
                                                .shadow(color: .black, radius: 5, x: 0, y: 3)
                                        )
                                        .frame(width: 150, height: 150)
                                    
                                    VStack{
                                        Image(systemName: "chart.line.uptrend.xyaxis")
                                            .resizable()
                                            .foregroundColor(Color(red: 0/255, green: 60/255, blue: 94/255))
                                            .fontWeight(.bold)
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50, height: 50)
                                            .padding()
                                        
                                        Text("Gráficas \npersonales")
                                            .foregroundColor(Color(red: 0/255, green: 60/255, blue: 94/255))
                                            .font(.custom("borsok", size: 20))
                                            .multilineTextAlignment(.center)
                                            .lineSpacing(15)
                                            .padding(.horizontal, 10)
                                    }
                                }
                            }
                        )
                        .padding(.horizontal, 15)
                        
                        NavigationLink(
                            destination: HistorialView(),
                            label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color(red: 0/255, green: 60/255, blue: 94/255), lineWidth: 2)
                                        .background(
                                            RoundedRectangle(cornerRadius: 25)
                                                .fill(Color(red: 188/255, green: 215/255, blue: 230/255))
                                                .shadow(color: .black, radius: 5, x: 0, y: 3)
                                        )
                                        .frame(width: 150, height: 150)
                                    
                                    VStack{
                                        Image(systemName: "book.closed.fill")
                                            .resizable()
                                            .foregroundColor(Color(red: 0/255, green: 60/255, blue: 94/255))
                                            .fontWeight(.bold)
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50, height: 50)
                                            .padding()
                                        
                                        Text("Historial")
                                            .foregroundColor(Color(red: 0/255, green: 60/255, blue: 94/255))
                                            .font(.custom("borsok", size: 20))
                                            .multilineTextAlignment(.center)
                                            .lineSpacing(15)
                                            .padding(.horizontal, 10)
                                    }
                                }
                            }
                        )
                        .padding(.horizontal, 15)
                    }
                    
                    HStack {
                        NavigationLink(
                            destination: RecordatoriosView(),
                            label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color(red: 0/255, green: 60/255, blue: 94/255), lineWidth: 2)
                                        .background(
                                            RoundedRectangle(cornerRadius: 25)
                                                .fill(Color(red: 188/255, green: 215/255, blue: 230/255))
                                                .shadow(color: .black, radius: 5, x: 0, y: 3)
                                        )
                                        .frame(width: 150, height: 150)
                                    
                                    VStack{
                                        Image(systemName: "alarm.waves.left.and.right")
                                            .resizable()
                                            .foregroundColor(Color(red: 0/255, green: 60/255, blue: 94/255))
                                            .fontWeight(.bold)
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 70, height: 50)
                                            .padding()
                                        
                                        Text("Recordatorios")
                                            .foregroundColor(Color(red: 0/255, green: 60/255, blue: 94/255))
                                            .font(.custom("borsok", size: 18))
                                            .multilineTextAlignment(.center)
                                            .lineSpacing(15)
                                            .padding(.horizontal, 10)
                                    }
                                }
                            }
                        )
                        .padding(.horizontal, 10)
                        
                        
                        NavigationLink(
                            destination: MainInfoView(),
                            label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color(red: 0/255, green: 60/255, blue: 94/255), lineWidth: 2)
                                        .background(
                                            RoundedRectangle(cornerRadius: 25)
                                                .fill(Color(red: 188/255, green: 215/255, blue: 230/255))
                                                .shadow(color: .black, radius: 5, x: 0, y: 3)
                                        )
                                        .frame(width: 150, height: 150)
                                    
                                    VStack{
                                        Image(systemName: "lightbulb.max")
                                            .resizable()
                                            .foregroundColor(Color(red: 0/255, green: 60/255, blue: 94/255))
                                            .fontWeight(.bold)
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 70, height: 50)
                                            .padding()
                                        
                                        Text("Tips")
                                            .foregroundColor(Color(red: 0/255, green: 60/255, blue: 94/255))
                                            .font(.custom("borsok", size: 20))
                                            .multilineTextAlignment(.center)
                                            .lineSpacing(15)
                                            .padding(.horizontal, 10)
                                    }
                                }
                            }
                        )
                        .padding(.horizontal, 10)
                    }
                    .padding(.vertical, 20)
                    
                    
                    
                }
            }
            .padding(.top, 40)
        }
        .background(
            NavigationLink("", destination: ClassificationView(), isActive: $navigateToClassificationView)
                .opacity(0)
        )
    }
    
}

#Preview {
    MainMadView()
}
