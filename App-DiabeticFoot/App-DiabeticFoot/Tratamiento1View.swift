//
//  Tratamiento1View.swift
//  App-DiabeticFoot
//
//  Created by Alumno on 04/11/23.
//

import SwiftUI

struct CheckboxView: View {
    
    @State private var isChecked: Bool = false
    
    var body: some View {
        Toggle(isOn: $isChecked) {
            Text("Opción")
        }
        .padding()
    }
}

struct Tratamiento1View: View {
    @State private var isChecked1: Bool = false
    @State private var sinInsulina: Bool = false
    @State private var isChecked2: Bool = false
    @State private var inyecciones: Bool = false
    @State private var isChecked3: Bool = false
    @State private var bomba: Bool = false
    @State private var dropdownSelection: String = ""
    @State private var selectedOption: String = ""
    
    
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var progress: Float = 0.75
    
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
                
                Text("¿Cuál es tu tratamiento?")
                    .font(.custom("Arimo", size: 20))
                    .foregroundColor(Color(red: 49/255, green: 86/255, blue: 107/255))
                    .fontWeight(.bold)
                
                
                VStack {
                    Button(action: {
                        isChecked1.toggle()
                        isChecked2 = false
                        isChecked3 = false
                        sinInsulina = isChecked1
                    }) {
                        HStack {
                            Image(systemName: isChecked1 ? "checkmark.circle" : "circle")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color(red: 153/255, green: 188/255, blue: 208/255))
                                .background(Color(red: 243/255, green: 246/255, blue: 248/255))
                                .cornerRadius(25)
                            
                            Text("Tratamiento sin insulina")
                                .padding(.vertical, 10)
                                .frame(width: 150)
                                .foregroundColor(Color(red: 91/255, green: 137/255, blue: 164/255))
                                .background(Color(red: 243/255, green: 246/255, blue: 248/255))
                                .font(.custom("Arimo", size: 15))
                                .cornerRadius(25)
                        }
                    }
                    
                    Button(action: {
                        isChecked2.toggle()
                        isChecked1 = false
                        isChecked3 = false
                        inyecciones = isChecked2
                    }) {
                        HStack {
                            Image(systemName: isChecked2 ? "checkmark.circle" : "circle")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color(red: 153/255, green: 188/255, blue: 208/255))
                                .background(Color(red: 243/255, green: 246/255, blue: 248/255))
                                .cornerRadius(25)
                            
                            Text("Inyecciones diarias")
                                .padding(.vertical, 10)
                                .frame(width: 150)
                                .foregroundColor(Color(red: 91/255, green: 137/255, blue: 164/255))
                                .background(Color(red: 243/255, green: 246/255, blue: 248/255))
                                .font(.custom("Arimo", size: 15))
                                .cornerRadius(25)
                        }
                    }
                    .padding()
                    
                    if isChecked2 {
                        DropdownView(selection: $dropdownSelection, selectedOption: $selectedOption)
                    }
                }
                
                Button(action: {
                    isChecked3.toggle()
                    isChecked2 = false
                    isChecked1 = false
                    bomba = isChecked3
                }) {
                    HStack {
                        Image(systemName: isChecked3 ? "checkmark.circle" : "circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color(red: 153/255, green: 188/255, blue: 208/255))
                            .background(Color(red: 243/255, green: 246/255, blue: 248/255))
                            .cornerRadius(25)
                        
                        Text("Bomba de insulina")
                            .padding(.vertical, 10)
                            .frame(width: 150)
                            .foregroundColor(Color(red: 91/255, green: 137/255, blue: 164/255))
                            .background(Color(red: 243/255, green: 246/255, blue: 248/255))
                            .font(.custom("Arimo", size: 15))
                            .cornerRadius(25)
                    }
                }
                
                HStack {
                    NavigationLink(
                        destination: DatosBView(),
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
                        destination: Tratamiento2View(),
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
        
    }
}


struct DropdownView: View {
    @Binding var selection: String
    @Binding var selectedOption: String
    @State private var colorFirst = false
    @State private var colorSecond = false
    @State private var colorThird = false
    
    var body: some View {
        VStack {
            Text("Dosis de inyección:")
                .font(.custom("Arimo", size: 20))
                .foregroundColor(Color(red: 49/255, green: 86/255, blue: 107/255))
            
            HStack {
                Button(action: {
                    selectedOption = "0.5 U"
                    colorFirst = true
                    colorSecond = false
                    colorThird = false
                }, label: {
                    Text("0.5 U")
                        .padding(.vertical, 10)
                        .frame(width: 80)
                        .foregroundColor(colorFirst ? Color(red: 243/255, green: 246/255, blue: 248/255) : Color(red: 91/255, green: 137/255, blue: 164/255))
                        .background(colorFirst ? Color(red: 91/255, green: 137/255, blue: 164/255) : Color(red: 243/255, green: 246/255, blue: 248/255))
                        .font(.custom("Arimo", size: 15))
                        .cornerRadius(25)
                })
                Button(action: {
                    selectedOption = "1 U"
                    colorFirst = false
                    colorSecond = true
                    colorThird = false
                }, label: {
                    Text("1 U")
                        .padding(.vertical, 10)
                        .frame(width: 80)
                        .foregroundColor(colorSecond ? Color(red: 243/255, green: 246/255, blue: 248/255) : Color(red: 91/255, green: 137/255, blue: 164/255))
                        .background(colorSecond ? Color(red: 91/255, green: 137/255, blue: 164/255) : Color(red: 243/255, green: 246/255, blue: 248/255))
                        .font(.custom("Arimo", size: 15))
                        .cornerRadius(25)
                })
                Button(action: {
                    selectedOption = "2 U"
                    colorFirst = false
                    colorSecond = false
                    colorThird = true
                }, label: {
                    Text("2 U")
                        .padding(.vertical, 10)
                        .frame(width: 80)
                        .foregroundColor(colorThird ? Color(red: 243/255, green: 246/255, blue: 248/255) : Color(red: 91/255, green: 137/255, blue: 164/255))
                        .background(colorThird ? Color(red: 91/255, green: 137/255, blue: 164/255) : Color(red: 243/255, green: 246/255, blue: 248/255))
                        .font(.custom("Arimo", size: 15))
                        .cornerRadius(25)
                })
            }
            .padding(.bottom, 20)
            
        }
    }
}


#Preview {
    Tratamiento1View()
}
