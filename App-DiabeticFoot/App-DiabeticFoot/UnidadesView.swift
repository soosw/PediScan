//
//  UnidadesView.swift
//  App-DiabeticFoot
//
//  Created by Alumno on 04/11/23.
//

import SwiftUI

struct UnidadesView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var progress: Float = 0.25
    @State private var colorMetrica = false
    @State private var colorUS = false
    @State private var colorMMO = false
    @State private var colorMG = false
    @State private var colorGRAMOS = false
    @State private var colorBREAD = false
    @State private var colorEXCH10 = false
    @State private var colorEXCH15 = false
    @State private var medicion: String = ""
    @State private var glucosa: String = ""
    @State private var carbohidratos: String = ""
    
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
            
            VStack{
                
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
                
                /* ProgressView(value: progress) // Barra de progreso que se llena
                 .foregroundColor(.white)
                 .progressViewStyle(LinearProgressViewStyle(tint: Color(red: 91/255, green: 137/255, blue: 164/255)))
                 .scaleEffect(x: 1, y: 4)
                 .padding()*/
                
                
                Text("Unidad de medición")
                    .font(.custom("Arimo", size: 20))
                    .foregroundColor(Color(red: 49/255, green: 86/255, blue: 107/255))
                    .fontWeight(.bold)
                
                HStack {
                    Button(action: {
                        medicion = "metrica"
                        colorMetrica.toggle()
                        colorUS = false
                        
                    }, label: {
                        Text("Métrica (kg, gram, ml, cm)")
                            .padding(.vertical, 10)
                            .frame(width: 150)
                            .foregroundColor(colorMetrica ? Color(red: 243/255, green: 246/255, blue: 248/255) : Color(red: 91/255, green: 137/255, blue: 164/255))
                            .background(colorMetrica ? Color(red: 91/255, green: 137/255, blue: 164/255) : Color(red: 243/255, green: 246/255, blue: 248/255))
                            .font(.custom("Arimo", size: 15))
                            .cornerRadius(25)
                    })
                    Button(action: {
                        medicion = "us"
                        colorUS.toggle()
                        colorMetrica = false
                    }, label: {
                        Text("US (lb, oz, fl oz, inch)")
                            .padding(.vertical, 10)
                            .frame(width: 150)
                            .foregroundColor(colorUS ? Color(red: 243/255, green: 246/255, blue: 248/255) : Color(red: 91/255, green: 137/255, blue: 164/255))
                            .background(colorUS ? Color(red: 91/255, green: 137/255, blue: 164/255) : Color(red: 243/255, green: 246/255, blue: 248/255))
                            .font(.custom("Arimo", size: 15))
                            .cornerRadius(25)
                    })
                }
                .padding(.bottom, 20)
                
                Text("Unidad de glucosa")
                    .font(.custom("Arimo", size: 20))
                    .foregroundColor(Color(red: 49/255, green: 86/255, blue: 107/255))
                    .fontWeight(.bold)
                
                HStack {
                    Button(action: {
                        glucosa = "mmol/L"
                        colorMMO.toggle()
                        colorMG = false
                    }, label: {
                        Text("mmol/L                ")
                            .padding(.vertical, 10)
                            .frame(width: 150)
                            .foregroundColor(colorMMO ? Color(red: 243/255, green: 246/255, blue: 248/255) : Color(red: 91/255, green: 137/255, blue: 164/255))
                            .background(colorMMO ? Color(red: 91/255, green: 137/255, blue: 164/255) : Color(red: 243/255, green: 246/255, blue: 248/255))
                            .font(.custom("Arimo", size: 15))
                            .cornerRadius(25)
                        
                    })
                    Button(action: {
                        glucosa = "mg/dL"
                        colorMG.toggle()
                        colorMMO = false
                    }, label: {
                        Text("mg/dL                     ")
                            .padding(.vertical, 10)
                            .frame(width: 150)
                            .foregroundColor(colorMG ? Color(red: 243/255, green: 246/255, blue: 248/255) : Color(red: 91/255, green: 137/255, blue: 164/255))
                            .background(colorMG ? Color(red: 91/255, green: 137/255, blue: 164/255) : Color(red: 243/255, green: 246/255, blue: 248/255))
                            .font(.custom("Arimo", size: 15))
                            .cornerRadius(25)
                    })
                }
                .padding(.bottom, 20)
                
                Text("Unidad de carbohidratos")
                    .font(.custom("Arimo", size: 20))
                    .foregroundColor(Color(red: 49/255, green: 86/255, blue: 107/255))
                    .fontWeight(.bold)
                
                VStack {
                    HStack {
                        Button(action: {
                            colorGRAMOS.toggle()
                            colorBREAD = false
                            colorEXCH10 = false
                            colorEXCH15 = false
                            carbohidratos = "gramos"
                        }, label: {
                            Text("Gramos              ")
                                .padding(.vertical, 10)
                                .frame(width: 150)
                                .foregroundColor(colorGRAMOS ? Color(red: 243/255, green: 246/255, blue: 248/255) : Color(red: 91/255, green: 137/255, blue: 164/255))
                                .background(colorGRAMOS ? Color(red: 91/255, green: 137/255, blue: 164/255) : Color(red: 243/255, green: 246/255, blue: 248/255))
                                .font(.custom("Arimo", size: 15))
                                .cornerRadius(25)
                            
                        })
                        Button(action: {
                            colorGRAMOS = false
                            colorBREAD.toggle()
                            colorEXCH10 = false
                            colorEXCH15 = false
                            carbohidratos = "Bread Units (12g)"
                        }, label: {
                            Text("Bread Units (12g)")
                                .padding(.vertical, 10)
                                .frame(width: 150)
                                .foregroundColor(colorBREAD ? Color(red: 243/255, green: 246/255, blue: 248/255) : Color(red: 91/255, green: 137/255, blue: 164/255))
                                .background(colorBREAD ? Color(red: 91/255, green: 137/255, blue: 164/255) : Color(red: 243/255, green: 246/255, blue: 248/255))
                                .font(.custom("Arimo", size: 15))
                                .cornerRadius(25)
                        })
                    }
                    HStack {
                        Button(action: {
                            colorGRAMOS = false
                            colorBREAD = false
                            colorEXCH10.toggle()
                            colorEXCH15 = false
                            carbohidratos = "Exchanges (10g)"
                        }, label: {
                            Text("Exchanges (10g)")
                                .padding(.vertical, 10)
                                .frame(width: 150)
                                .foregroundColor(colorEXCH10 ? Color(red: 243/255, green: 246/255, blue: 248/255) : Color(red: 91/255, green: 137/255, blue: 164/255))
                                .background(colorEXCH10 ? Color(red: 91/255, green: 137/255, blue: 164/255) : Color(red: 243/255, green: 246/255, blue: 248/255))
                                .font(.custom("Arimo", size: 15))
                                .cornerRadius(25)
                            
                            
                        })
                        Button(action: {
                            colorGRAMOS = false
                            colorBREAD = false
                            colorEXCH10 = false
                            colorEXCH15.toggle()
                            carbohidratos = "Exchanges (15g)"
                        }, label: {
                            Text("Exchanges (15g)")
                                .padding(.vertical, 10)
                                .frame(width: 150)
                                .foregroundColor(colorEXCH15 ? Color(red: 243/255, green: 246/255, blue: 248/255) : Color(red: 91/255, green: 137/255, blue: 164/255))
                                .background(colorEXCH15 ? Color(red: 91/255, green: 137/255, blue: 164/255) : Color(red: 243/255, green: 246/255, blue: 248/255))
                                .font(.custom("Arimo", size: 15))
                                .cornerRadius(25)
                        })
                    }
                }
                .padding(.bottom, 30)
                
                
                HStack {
                    NavigationLink(
                        destination: RegistroView(),
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
                        destination: DatosBView(),
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
            }
        }
    }
}


#Preview {
    UnidadesView()
}
