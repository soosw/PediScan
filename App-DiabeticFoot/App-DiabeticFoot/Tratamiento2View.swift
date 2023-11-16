//
//  Tratamiento2View.swift
//  App-DiabeticFoot
//
//  Created by Carolina Nicole González Leal on 07/11/23.
//

import SwiftUI

struct Checkbox2View: View {
    
    @State private var isChecked: Bool = false
    
    var body: some View {
        Toggle(isOn: $isChecked) {
            Text("Opción")
        }
        .padding()
    }
}

struct Tratamiento2View: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var progress: Float = 0.75
    
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    @State private var isChecked1: Bool = false
    @State private var accRapida: String = ""
    
    @State private var isChecked2: Bool = false
    @State private var dropdown1Selection: String = ""
    @State private var selectedOption1: String = ""
    @State private var dropdownViews: [Dropdown1View] = []
    
    @State private var isChecked3: Bool = false
    @State private var dropdown2Views: [Dropdown2View] = []
    @State private var dropdown2Selection: String = ""
    @State private var selectedOption2: String = ""
    var body: some View {
        ZStack {
            
            Button("Back") {
                mode.wrappedValue.dismiss()
            }.navigationBarBackButtonHidden(true)
            
            Image("BG_Azul")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
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
                    
                    
                    Button(action: {
                        isChecked1.toggle()
                        isChecked2 = false
                        isChecked3 = false
                        accRapida = "Insulina de acción rápida/corta"
                    }) {
                        HStack {
                            Image(systemName: isChecked1 ? "checkmark.circle" : "circle")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color(red: 153/255, green: 188/255, blue: 208/255))
                                .background(Color(red: 243/255, green: 246/255, blue: 248/255))
                                .cornerRadius(25)
                            
                            Text("Insulina de acción rápida/corta")
                                .padding(.vertical, 10)
                                .frame(width: 250)
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
                    }) {
                        HStack {
                            Image(systemName: isChecked2 ? "checkmark.circle" : "circle")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color(red: 153/255, green: 188/255, blue: 208/255))
                                .background(Color(red: 243/255, green: 246/255, blue: 248/255))
                                .cornerRadius(25)
                            
                            Text("Insulina de acción intermedia/larga")
                                .padding(.vertical, 10)
                                .frame(width: 250)
                                .foregroundColor(Color(red: 91/255, green: 137/255, blue: 164/255))
                                .background(Color(red: 243/255, green: 246/255, blue: 248/255))
                                .font(.custom("Arimo", size: 15))
                                .cornerRadius(25)
                        }
                    }
                    .padding()
                    
                    if isChecked2 {
                        Text("Tasa/Índice basal:")
                            .font(.custom("Arimo", size: 20))
                            .foregroundColor(Color(red: 49/255, green: 86/255, blue: 107/255))
                        
                        ForEach(dropdownViews.indices, id: \.self) { index in
                            dropdownViews[index]
                        }
                        Button(action: {
                            // Add a new Dropdown1View when the "+" button is pressed
                            dropdownViews.append(Dropdown1View(selection: $dropdown1Selection, selectedOption: $selectedOption1))
                        }) {
                            Image(systemName: "plus")
                                .padding(.vertical, 10)
                                .frame(width: 35)
                                .foregroundColor(Color(red: 91/255, green: 137/255, blue: 164/255))
                                .background(Color(red: 243/255, green: 246/255, blue: 248/255))
                                .font(.custom("Arimo", size: 15))
                                .cornerRadius(25)
                        }
                    }
                    
                    Button(action: {
                        isChecked3.toggle()
                        isChecked2 = false
                        isChecked1 = false
                    }) {
                        HStack {
                            Image(systemName: isChecked3 ? "checkmark.circle" : "circle")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color(red: 153/255, green: 188/255, blue: 208/255))
                                .background(Color(red: 243/255, green: 246/255, blue: 248/255))
                                .cornerRadius(25)
                            
                            Text("Medicamentos adicionales")
                                .padding(.vertical, 10)
                                .frame(width: 250)
                                .foregroundColor(Color(red: 91/255, green: 137/255, blue: 164/255))
                                .background(Color(red: 243/255, green: 246/255, blue: 248/255))
                                .font(.custom("Arimo", size: 15))
                                .cornerRadius(25)
                        }
                    }
                    .padding()
                    
                    if isChecked3 {
                        ForEach(dropdown2Views.indices, id: \.self) { index in
                            dropdown2Views[index]
                        }
                        Button(action: {
                            dropdown2Views.append(Dropdown2View(selection: $dropdown2Selection, selectedOption: $selectedOption2))
                        }) {
                            Image(systemName: "plus")
                                .padding(.vertical, 10)
                                .frame(width: 35)
                                .foregroundColor(Color(red: 91/255, green: 137/255, blue: 164/255))
                                .background(Color(red: 243/255, green: 246/255, blue: 248/255))
                                .font(.custom("Arimo", size: 15))
                                .cornerRadius(25)
                        }
                    }
                    
                    HStack {
                        NavigationLink(
                            destination: Tratamiento1View(),
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
                            destination: ContentView(),
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
            .padding(.top, 150)
        }
    }
}

struct Dropdown1View: View {
    @Binding var selection: String
    @Binding var selectedOption: String
    @State private var hour: String = ""
    @State private var dosis: String = ""
    @State private var selectedTime = Date()
    
    var body: some View {
        VStack {
            
            VStack {
                HStack {
                    DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .padding(.vertical, 10)
                        .frame(width: 150)
                    // .background(Color(red: 153/255, green: 188/255, blue: 208/255))
                        .cornerRadius(20)
                        .font(.custom("Arimo", size: 15))
                        .onAppear {
                            // Set the initial selected time when the view appears
                            if let calendar = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: selectedTime) {
                                selectedTime = calendar
                            }
                        }
                    
                    TextField("", text: $dosis, prompt: Text("(U/hora)").foregroundColor(Color.white))
                        .foregroundColor(Color.white)
                        .padding(.vertical, 10)
                        .multilineTextAlignment(.center)
                        .background(Color(red: 153/255, green: 188/255, blue: 208/255))
                        .cornerRadius(20)
                        .frame(width: 150)
                        .font(.custom("Arimo", size: 15))
                    
                }
            }
        }
    }
}

struct Dropdown2View: View {
    @Binding var selection: String
    @Binding var selectedOption: String
    @State private var hour: String = ""
    @State private var dosis: String = ""
    @State private var selectedTime = Date()
    
    var body: some View {
        VStack {
            
            VStack {
                TextField("", text: $dosis, prompt: Text("Nombre").foregroundColor(Color.white))
                    .foregroundColor(Color.white)
                    .padding(.vertical, 10)
                    .multilineTextAlignment(.center)
                    .background(Color(red: 153/255, green: 188/255, blue: 208/255))
                    .cornerRadius(20)
                    .frame(width: 200)
                    .font(.custom("Arimo", size: 15))
                
                
                HStack {
                    TextField("", text: $hour, prompt: Text("Cada cuantas horas").foregroundColor(Color.white))
                        .foregroundColor(Color.white)
                        .padding(.vertical, 10)
                        .multilineTextAlignment(.center)
                        .background(Color(red: 153/255, green: 188/255, blue: 208/255))
                        .cornerRadius(20)
                        .frame(width: 180)
                        .font(.custom("Arimo", size: 15))
                    
                    TextField("", text: $dosis, prompt: Text("Cantidad (mg o #)").foregroundColor(Color.white))
                        .foregroundColor(Color.white)
                        .padding(.vertical, 10)
                        .multilineTextAlignment(.center)
                        .background(Color(red: 153/255, green: 188/255, blue: 208/255))
                        .cornerRadius(20)
                        .frame(width: 150)
                        .font(.custom("Arimo", size: 15))
                }
            }
            .padding(.bottom, 15)
        }
    }
}



#Preview {
    Tratamiento2View()
}
