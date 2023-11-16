//
//  DatosBView.swift
//  App-DiabeticFoot
//
//  Created by Scarlet on 04/11/23.
//

import SwiftUI

struct DatosBView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var progress: Float = 0.5
    
    @State private var BirthDate = Date()
    @State private var DxDate = Date()
    @State private var Shoe: String = ""
    @State private var selectedSexo = ""
    @State private var colorMasc = false
    @State private var colorFem = false
    @State private var colorOtro = false
    
    enum ShoeType: String, CaseIterable, Identifiable {
        case Mex, USA, Eur
        var id: Self { self }
    }

    @State private var selectedShoeType: ShoeType = .Mex
    
    init(){
                UINavigationBar.setAnimationsEnabled(false)
            }
    
    var body: some View {
        ZStack {
            
            Button("Back") {
                mode.wrappedValue.dismiss()
            }.navigationBarBackButtonHidden(true)
            
            Image("BG_Azul")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                ZStack {
                    Capsule() // Barra de progreso con esquinas redondeadas
                        .frame(height: 8) // Altura de la barra
                        .scaleEffect(x: 1, y: 2)
                        .foregroundColor(.white) // Color de fondo no lleno
                        .padding()
                    Capsule() // Barra de progreso con esquinas redondeadas
                        .frame(width: CGFloat(progress) * UIScreen.main.bounds.width, height: 8) // Ancho de la barra
                        .scaleEffect(x: 1, y: 2)
                        .foregroundColor(Color(red: 91/255, green: 137/255, blue: 164/255)) // Color de la barra llena
                        .padding()
                }
                .padding(.bottom, 20)
                
                VStack {
                    Text("Sexo")
                        .font(.custom("Arimo", size: 20))
                        .foregroundColor(Color(red: 49/255, green: 86/255, blue: 107/255))
                        .fontWeight(.bold)
                    
                    HStack {
                        Button(action: {
                            selectedSexo = "Masculino"
                            colorMasc = true
                            colorFem = false
                            colorOtro = false
                        }, label: {
                            Text("Masculino")
                                .padding(.vertical, 10)
                                .frame(width: 100)
                                .foregroundColor(colorMasc ? Color(red: 243/255, green: 246/255, blue: 248/255) : Color(red: 91/255, green: 137/255, blue: 164/255))
                                .background(colorMasc ? Color(red: 91/255, green: 137/255, blue: 164/255) : Color(red: 243/255, green: 246/255, blue: 248/255))
                                .font(.custom("Arimo", size: 15))
                                .cornerRadius(25)
                            
                        })
                        Button(action: {
                            selectedSexo = "Femenino"
                            colorMasc = false
                            colorFem = true
                            colorOtro = false
                        }, label: {
                            Text("Femenino")
                                .padding(.vertical, 10)
                                .frame(width: 100)
                                .foregroundColor(colorFem ? Color(red: 243/255, green: 246/255, blue: 248/255) : Color(red: 91/255, green: 137/255, blue: 164/255))
                                .background(colorFem ? Color(red: 91/255, green: 137/255, blue: 164/255) : Color(red: 243/255, green: 246/255, blue: 248/255))
                                .font(.custom("Arimo", size: 15))
                                .cornerRadius(25)
                        })
                        Button(action: {
                            selectedSexo = "Otro"
                            colorMasc = false
                            colorFem = false
                            colorOtro = true
                        }, label: {
                            Text("Otro")
                                .padding(.vertical, 10)
                                .frame(width: 100)
                                .foregroundColor(colorOtro ? Color(red: 243/255, green: 246/255, blue: 248/255) : Color(red: 91/255, green: 137/255, blue: 164/255))
                                .background(colorOtro ? Color(red: 91/255, green: 137/255, blue: 164/255) : Color(red: 243/255, green: 246/255, blue: 248/255))
                                .font(.custom("Arimo", size: 15))
                                .cornerRadius(25)
                            
                        })
                    }
                }
                
                
                DatePicker("Fecha de nacimiento", selection: $BirthDate, displayedComponents: .date)
                    .font(.custom("Arimo", size: 20))
                    .foregroundColor(Color(red: 49/255, green: 86/255, blue: 107/255))
                    .fontWeight(.bold)
                    .padding()
                
                DatePicker("Fecha de diagnóstico", selection: $DxDate, displayedComponents: .date)
                    .font(.custom("Arimo", size: 20))
                    .foregroundColor(Color(red: 49/255, green: 86/255, blue: 107/255))
                    .fontWeight(.bold)
                    .padding()
                
                Text("Calzado")
                    .font(.custom("Arimo", size: 20))
                    .foregroundColor(Color(red: 49/255, green: 86/255, blue: 107/255))
                    .fontWeight(.bold)
                
                HStack {

                    TextField("", text: $Shoe, prompt: Text("##").foregroundColor(Color.white))
                        .foregroundColor(Color.white)
                        .padding(.vertical, 10)
                        .multilineTextAlignment(.center)
                        .background(Color(red: 153/255, green: 188/255, blue: 208/255))
                        .cornerRadius(20)
                        .frame(width: 80)
                        .font(.custom("Arimo", size: 15))
                        .fontWeight(.bold)
                    
                    Picker("", selection: $selectedShoeType) {
                        Text("Mex").tag(ShoeType.Mex)
                        Text("USA").tag(ShoeType.USA)
                        Text("Eur").tag(ShoeType.Eur)
                    }
                    .background(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .foregroundColor(Color(red: 49/255, green: 86/255, blue: 107/255))
   
                }

                HStack {
                    NavigationLink(
                        destination: UnidadesView(),
                        label: {
                            Text("Regresar")
                                .frame(width: 160)
                                .padding(8)
                                .background(Color(red: 91/255, green: 137/255, blue: 164/255))
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .padding(.bottom, 30)
                                .font(.custom("Arimo", size: 19))
                        }
                    )
                    
                    NavigationLink(
                        destination: Tratamiento1View(),
                        label: {
                            Text("Siguiente")
                                .frame(width: 160)
                                .padding(8)
                                .background(Color(red: 91/255, green: 137/255, blue: 164/255))
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .padding(.bottom, 30)
                                .font(.custom("Arimo", size: 19))
                        }
                    )
                }
                .padding()
                
            }
        }
        .accentColor(Color(red: 91/255, green: 137/255, blue: 164/255))
    }
    
}

struct DatosBView_Previews: PreviewProvider {
    static var previews: some View {
        DatosBView()
    }
}
