//
//  PostEscaneadoView.swift
//  App-DiabeticFoot
//
//  Created by Sofía Cantú on 12/11/23.
//

import SwiftUI
import PhotosUI

struct PostEscaneadoView: View {
    
    @ObservedObject var sharedData = SharedData.shared
   
    @State private var pieSano = false
    @State private var gradoUno = false
    @State private var gradoDos = false
    @State private var gradoTres = false
    @State private var grado: String = ""
    
    @State private var navigateToMainView = false
    
    @State private var alto = ""
    @State private var ancho = ""
    
    @State private var selectedOption = "Color"
    let options = ["Rojizo", "Rosa", "Con amarillo", "Negro"]
    @State private var rojo = false
    @State private var rosa = false
    @State private var conAmarillo = false
    @State private var negro = false
    @State private var color: String = ""
    
    @State private var selectedPhoto: PhotosPickerItem? = nil
    
    @State private var painLevel = 0.0
    
    var body: some View {
    
        
        ZStack {
            
            Image("BG_Rosita")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                
                Text("Información de la herída")
                    .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                    .font(.custom("borsok", size: 35))
                    .lineSpacing(15)
                    .multilineTextAlignment(.center)
                    //.padding(.top, 60)
                    .padding(.vertical, 10)
                    .padding(.top, 10)
                
                ZStack{
                    Rectangle()
                        .fill(Color(red: 164/255, green: 91/255, blue: 91/255))
                        .frame(width: 430, height: 45)
                    
                    Text("Datos adicionales para el analisis")
                        .foregroundColor(Color(red: 248/255, green: 243/255, blue: 243/255))
                        .multilineTextAlignment(.center)
                }
                
                ScrollView{
                    
                    Text("Grado")
                        .font(.custom("Arimo", size: 20))
                        .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                    
                    VStack {
                        HStack {
                            Button(action: {
                                pieSano.toggle()
                                gradoDos = false
                                gradoTres = false
                                gradoTres = false
                                grado = "pieSano"
                            }, label: {
                                Text("Pie Sano")
                                    .padding(.vertical, 10)
                                    .frame(width: 150)
                                    .foregroundColor(pieSano ? Color(red: 230/255, green: 187/255, blue: 187/255) : Color(red: 164/255, green: 91/255, blue: 91/255))
                                    .background(pieSano ? Color(red: 164/255, green: 91/255, blue: 91/255) : Color(red: 230/255, green: 187/255, blue: 187/255))
                                    .font(.custom("Arimo", size: 15))
                                    .cornerRadius(25)
                                
                            })
                            Button(action: {
                                pieSano = false
                                gradoUno.toggle()
                                gradoDos = false
                                gradoTres = false
                                grado = "gradoUno"
                            }, label: {
                                Text("Grado Uno")
                                    .padding(.vertical, 10)
                                    .frame(width: 150)
                                    .foregroundColor(gradoUno ? Color(red: 230/255, green: 187/255, blue: 187/255) : Color(red: 164/255, green: 91/255, blue: 91/255))
                                    .background(gradoUno ? Color(red: 164/255, green: 91/255, blue: 91/255) : Color(red: 230/255, green: 187/255, blue: 187/255))
                                    .font(.custom("Arimo", size: 15))
                                    .cornerRadius(25)
                            })
                        }
                        HStack {
                            Button(action: {
                                pieSano = false
                                gradoUno = false
                                gradoDos.toggle()
                                gradoTres = false
                                grado = "gradoDos"
                            }, label: {
                                Text("Grado Dos")
                                    .padding(.vertical, 10)
                                    .frame(width: 150)
                                    .foregroundColor(gradoDos ? Color(red: 230/255, green: 187/255, blue: 187/255) : Color(red: 164/255, green: 91/255, blue: 91/255))
                                    .background(gradoDos ? Color(red: 164/255, green: 91/255, blue: 91/255) : Color(red: 230/255, green: 187/255, blue: 187/255))
                                    .font(.custom("Arimo", size: 15))
                                    .cornerRadius(25)
                                
                                
                            })
                            Button(action: {
                                pieSano = false
                                gradoUno = false
                                gradoDos = false
                                gradoTres.toggle()
                                grado = "gradoTres"
                            }, label: {
                                Text("Grado Tres")
                                    .padding(.vertical, 10)
                                    .frame(width: 150)
                                    .foregroundColor(gradoTres ? Color(red: 230/255, green: 187/255, blue: 187/255) : Color(red: 164/255, green: 91/255, blue: 91/255))
                                    .background(gradoTres ? Color(red: 164/255, green: 91/255, blue: 91/255) : Color(red: 230/255, green: 187/255, blue: 187/255))
                                    .font(.custom("Arimo", size: 15))
                                    .cornerRadius(25)
                            })
                        }
                    }
                    .padding(.bottom, 30)
                    
                    Text("Tamaño")
                        .font(.custom("Arimo", size: 20))
                        .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
                    
                    Text("Alto")
                        .font(.custom("Arimo", size: 15))
                        .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                        .fontWeight(.bold)
                    HStack{
                        
                        TextField("", text: $alto, prompt: Text("00.0").foregroundColor(Color.white))
                            .foregroundColor(Color.white)
                            .padding(.vertical, 10)
                            .multilineTextAlignment(.center)
                            .background(Color(red: 216/255, green: 145/255, blue: 145/255))
                            .cornerRadius(20)
                            .frame(width: 150)
                            .font(.custom("Arimo", size: 15))
                        
                        Text("cm     ")
                            .font(.custom("Arimo", size: 15))
                            .foregroundColor(Color(red: 184/255, green: 106/255, blue: 106/255))
                        
                    }
                    .padding(.bottom, 15)
                    
                    Text("Ancho")
                        .font(.custom("Arimo", size: 15))
                        .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                        .fontWeight(.bold)
                    HStack{
                        
                        TextField("", text: $ancho, prompt: Text("00.0").foregroundColor(Color.white))
                            .foregroundColor(Color.white)
                            .padding(.vertical, 10)
                            .multilineTextAlignment(.center)
                            .background(Color(red: 216/255, green: 145/255, blue: 145/255))
                            .cornerRadius(20)
                            .frame(width: 150)
                            .font(.custom("Arimo", size: 15))
                        
                        Text("cm     ")
                            .font(.custom("Arimo", size: 15))
                            .foregroundColor(Color(red: 184/255, green: 106/255, blue: 106/255))
                        
                    }
                    .padding(.bottom, 30)
                    
                    Text("Color")
                        .font(.custom("Arimo", size: 20))
                        .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                        .fontWeight(.bold)
                    
                    VStack {
                        HStack {
                            Button(action: {
                                rojo.toggle()
                                rosa = false
                                conAmarillo = false
                                negro = false
                                color = "rojo"
                            }, label: {
                                Text("Rojo")
                                    .padding(.vertical, 10)
                                    .frame(width: 150)
                                    .foregroundColor(rojo ? Color(red: 230/255, green: 187/255, blue: 187/255) : Color(red: 164/255, green: 91/255, blue: 91/255))
                                    .background(rojo ? Color(red: 164/255, green: 91/255, blue: 91/255) : Color(red: 230/255, green: 187/255, blue: 187/255))
                                    .font(.custom("Arimo", size: 15))
                                    .cornerRadius(25)
                                
                            })
                            Button(action: {
                                rojo = false
                                rosa.toggle()
                                conAmarillo = false
                                negro = false
                                color = "rosa"
                            }, label: {
                                Text("Rosa")
                                    .padding(.vertical, 10)
                                    .frame(width: 150)
                                    .foregroundColor(rosa ? Color(red: 230/255, green: 187/255, blue: 187/255) : Color(red: 164/255, green: 91/255, blue: 91/255))
                                    .background(rosa ? Color(red: 164/255, green: 91/255, blue: 91/255) : Color(red: 230/255, green: 187/255, blue: 187/255))
                                    .font(.custom("Arimo", size: 15))
                                    .cornerRadius(25)
                            })
                        }
                        HStack {
                            Button(action: {
                                rojo = false
                                rosa = false
                                conAmarillo.toggle()
                                negro = false
                                color = "conAmarillo"
                            }, label: {
                                Text("Con amarillo")
                                    .padding(.vertical, 10)
                                    .frame(width: 150)
                                    .foregroundColor(conAmarillo ? Color(red: 230/255, green: 187/255, blue: 187/255) : Color(red: 164/255, green: 91/255, blue: 91/255))
                                    .background(conAmarillo ? Color(red: 164/255, green: 91/255, blue: 91/255) : Color(red: 230/255, green: 187/255, blue: 187/255))
                                    .font(.custom("Arimo", size: 15))
                                    .cornerRadius(25)
                                
                                
                            })
                            Button(action: {
                                rojo = false
                                rosa = false
                                conAmarillo = false
                                negro.toggle()
                                color = "negro"
                            }, label: {
                                Text("Negro")
                                    .padding(.vertical, 10)
                                    .frame(width: 150)
                                    .foregroundColor(negro ? Color(red: 230/255, green: 187/255, blue: 187/255) : Color(red: 164/255, green: 91/255, blue: 91/255))
                                    .background(negro ? Color(red: 164/255, green: 91/255, blue: 91/255) : Color(red: 230/255, green: 187/255, blue: 187/255))
                                    .font(.custom("Arimo", size: 15))
                                    .cornerRadius(25)
                            })
                        }
                    }
                    .padding(.bottom, 30)
                    
                    Text("Dolor")
                        .font(.custom("Arimo", size: 20))
                        .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                        .fontWeight(.bold)
                    //.padding(.bottom, 5)
                    
                    Slider(value: $painLevel, in: 1.0...10.0, step: 1.0)
                        .padding(.horizontal, 70)
                    
                    Text("Nivel de dolor: \(Int(painLevel))")
                        .foregroundStyle(Color(red: 164/255, green: 91/255, blue: 91/255))
                        .padding(.bottom, 30)
                    
                    
                    Text("Agregar imagen")
                        .font(.custom("Arimo", size: 20))
                        .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
                    

                    /*PhotosPicker(selection: $selectedItems,
                                 matching: .images) {
                        Button(action: {
                            fotoAgregada.toggle()
                        }, label: {
                            Image(systemName: fotoAgregada ? "photo.badge.checkmark":"photo.badge.plus")
                            //.foregroundColor(Color(red: 248/255, green: 243/255, blue: 243/255))
                                .font(.custom("borsok", size: 50))
                        })
                    }
                    */
                    
                    PhotosPicker(
                        selection: $selectedPhoto,
                        matching: .images,
                        photoLibrary: .shared()
                    ) {
                        
                        if selectedPhoto == nil  {
                            Image(systemName: "photo.badge.plus")
                            //.foregroundColor(Color(red: 248/255, green: 243/255, blue: 243/255))
                                .font(.custom("borsok", size: 50))
                        }
                        
                        if selectedPhoto != nil  {
                            Image(systemName: "photo.badge.checkmark")
                            //.foregroundColor(Color(red: 248/255, green: 243/255, blue: 243/255))
                                .font(.custom("borsok", size: 50))
                        }
                    }
                    
                    
                    Button(action: {
                        sharedData.textoSuperior = "¡Felicidades, has registrado tu \nprogreso del día!"
                        navigateToMainView = true
                    }) {
                        Text("Guardar")
                            .padding(10)
                    }
                    .foregroundColor(Color(red: 230/255, green: 187/255, blue: 187/255))
                    .background(Color(red: 164/255, green: 91/255, blue: 91/255))
                    .cornerRadius(20)
                    .frame(width: 150)
                    .font(.custom("Arimo", size: 20))
                    .padding(20)
                    
                }
            }
        }
        .background(
            NavigationLink("", destination: MainMadView(), isActive: $navigateToMainView)
                .opacity(0)
        )
    }
}

#Preview {
    PostEscaneadoView()
}
