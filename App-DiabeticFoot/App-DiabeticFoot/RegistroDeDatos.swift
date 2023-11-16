//
//  PreEscaneo.swift
//  App-DiabeticFoot
//
//  Created by Alumno on 04/11/23.
//

import SwiftUI

struct RegistroDeDatos: View {
    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    @State private var dosisGlucosa = ""
    @State private var isChecked1: Bool = false
    @State private var isChecked2: Bool = false
    
    @State private var navigateToMainView = false
    
    var body: some View {
    
        ZStack {
            
            Image("BG_Rosita")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack {
                    Text("Registro de Datos")
                        .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                        .font(.custom("borsok", size: 35))
                        .lineSpacing(15)
                        .multilineTextAlignment(.center)
                        .padding(.top, 60)
                        .padding(.bottom, 20)
                    
                    HStack{
                        
                        DatePicker("", selection: $selectedDate, displayedComponents: .date)
                            .labelsHidden()
                            .padding(.vertical, 10)
                            .frame(width: 150)
                            .cornerRadius(20)
                            .font(.custom("Arimo", size: 15))
                        
                        
                        DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .padding(.vertical, 10)
                            .frame(width: 150)
                            .cornerRadius(20)
                            .font(.custom("Arimo", size: 15))
                            .onAppear {
                                // Set the initial selected time when the view appears
                                if let calendar = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: selectedTime) {
                                    selectedTime = calendar
                                }
                            }
                        
                    }
                    Rectangle()
                        .fill(Color(red: 164/255, green: 91/255, blue: 91/255))
                        //.fill(Color(red: 216/255, green: 145/255, blue: 145/255))
                        .frame(width: 430, height: 10)

                }
                
                ScrollView {
                    
                    
                    ZStack{
                        Rectangle()
                            .fill(Color(red: 164/255, green: 91/255, blue: 91/255))
                            .frame(width: 430, height: 45)
                        
                        Text("Glucosa")
                            .foregroundColor(Color(red: 248/255, green: 243/255, blue: 243/255))
                        //.multilineTextAlignment(.leading) //leading izquierda
                            .padding(.trailing, 250) //trailing derecha
                        
                    }
                    .padding(.bottom, 20)
                    
                    HStack{
                        
                        TextField("", text: $dosisGlucosa, prompt: Text("00.0").foregroundColor(Color.white))
                            .foregroundColor(Color.white)
                            .padding(.vertical, 10)
                            .multilineTextAlignment(.center)
                            .background(Color(red: 216/255, green: 145/255, blue: 145/255))
                            .cornerRadius(20)
                            .frame(width: 150)
                            .font(.custom("Arimo", size: 15))
                        
                        Text("mg/dL     ")
                            .font(.custom("Arimo", size: 15))
                            .foregroundColor(Color(red: 184/255, green: 106/255, blue: 106/255))
                                            
                    }
                    
                    Button(action: {
                        isChecked1.toggle()
                        isChecked2 = false
                        //print("Button 1 tapped. isChecked1: \(isChecked1), isChecked2: \(isChecked2)")
                    }) {
                        HStack {
                            Image(systemName: isChecked1 ? "checkmark.circle" : "circle")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color(red: 216/255, green: 145/255, blue: 145/255))
                                .background(Color(red: 243/255, green: 246/255, blue: 248/255))
                                .cornerRadius(25)
                            
                            Text("Glucosa estimada")
                                .padding(.vertical, 10)
                                .frame(width: 150)
                                .foregroundColor(Color(red: 184/255, green: 106/255, blue: 106/255))
                            //.background(Color(red: 243/255, green: 246/255, blue: 248/255))
                                .font(.custom("Arimo", size: 15))
                                .cornerRadius(25)
                        }
                    }
                    
                    Button(action: {
                        isChecked1 = false
                        isChecked2.toggle()
                        //print("Button 2 tapped. isChecked1: \(isChecked1), isChecked2: \(isChecked2)")
                    }) {
                        HStack {
                            Image(systemName: isChecked2 ? "checkmark.circle" : "circle")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color(red: 216/255, green: 145/255, blue: 145/255))
                                .background(Color(red: 243/255, green: 246/255, blue: 248/255))
                                .cornerRadius(25)
                            
                            Text("Glucosa exacta")
                                .padding(.vertical, 10)
                                .frame(width: 150)
                                .foregroundColor(Color(red: 184/255, green: 106/255, blue: 106/255))
                            //.background(Color(red: 243/255, green: 246/255, blue: 248/255))
                                .font(.custom("Arimo", size: 15))
                                .cornerRadius(25)
                        }
                    }
                    
                    
                    ZStack{
                        Rectangle()
                            .fill(Color(red: 164/255, green: 91/255, blue: 91/255))
                            .frame(width: 430, height: 45)
                        
                        Text("Alimentos")
                            .foregroundColor(Color(red: 248/255, green: 243/255, blue: 243/255))
                        //.multilineTextAlignment(.leading) //leading izquierda
                            .padding(.trailing, 225) //trailing derecha
                        
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    
                    Text("Carbohidratos")
                        .font(.custom("Arimo", size: 15))
                        .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                        .fontWeight(.bold)
                    HStack{
                        
                        TextField("", text: $dosisGlucosa, prompt: Text("00.0").foregroundColor(Color.white))
                            .foregroundColor(Color.white)
                            .padding(.vertical, 10)
                            .multilineTextAlignment(.center)
                            .background(Color(red: 216/255, green: 145/255, blue: 145/255))
                            .cornerRadius(20)
                            .frame(width: 150)
                            .font(.custom("Arimo", size: 15))
                        
                        Text("mg/dL     ")
                            .font(.custom("Arimo", size: 15))
                            .foregroundColor(Color(red: 184/255, green: 106/255, blue: 106/255))
                        
                    }
                    .padding(.bottom, 15)
                    
                    Text("Proteínas")
                        .font(.custom("Arimo", size: 15))
                        .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                        .fontWeight(.bold)
                    HStack{
                        
                        TextField("", text: $dosisGlucosa, prompt: Text("00.0").foregroundColor(Color.white))
                            .foregroundColor(Color.white)
                            .padding(.vertical, 10)
                            .multilineTextAlignment(.center)
                            .background(Color(red: 216/255, green: 145/255, blue: 145/255))
                            .cornerRadius(20)
                            .frame(width: 150)
                            .font(.custom("Arimo", size: 15))
                        
                        Text("gramos    ")
                            .font(.custom("Arimo", size: 15))
                            .foregroundColor(Color(red: 184/255, green: 106/255, blue: 106/255))
                        
                    }
                    .padding(.bottom, 15)
                    
                    Text("Calorías")
                        .font(.custom("Arimo", size: 15))
                        .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                        .fontWeight(.bold)
                    HStack{
                        
                        TextField("", text: $dosisGlucosa, prompt: Text("00.0").foregroundColor(Color.white))
                            .foregroundColor(Color.white)
                            .padding(.vertical, 10)
                            .multilineTextAlignment(.center)
                            .background(Color(red: 216/255, green: 145/255, blue: 145/255))
                            .cornerRadius(20)
                            .frame(width: 150)
                            .font(.custom("Arimo", size: 15))
                        
                        Text("kcal          ")
                            .font(.custom("Arimo", size: 15))
                            .foregroundColor(Color(red: 184/255, green: 106/255, blue: 106/255))
                        
                    }
                    .padding(.bottom, 15)
                    
                    Text("Grasas")
                        .font(.custom("Arimo", size: 15))
                        .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                        .fontWeight(.bold)
                    HStack{
                        
                        TextField("", text: $dosisGlucosa, prompt: Text("00.0").foregroundColor(Color.white))
                            .foregroundColor(Color.white)
                            .padding(.vertical, 10)
                            .multilineTextAlignment(.center)
                            .background(Color(red: 216/255, green: 145/255, blue: 145/255))
                            .cornerRadius(20)
                            .frame(width: 150)
                            .font(.custom("Arimo", size: 15))
                        
                        Text("mg/dL     ")
                            .font(.custom("Arimo", size: 15))
                            .foregroundColor(Color(red: 184/255, green: 106/255, blue: 106/255))
                        
                    }
                    
                    
                    ZStack{
                        Rectangle()
                            .fill(Color(red: 164/255, green: 91/255, blue: 91/255))
                            .frame(width: 430, height: 45)
                        
                        Text("Presion de sangre")
                            .foregroundColor(Color(red: 248/255, green: 243/255, blue: 243/255))
                        //.multilineTextAlignment(.leading) //leading izquierda
                            .padding(.trailing, 160) //trailing derecha
                        
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    
                    Text("Sistólica")
                        .font(.custom("Arimo", size: 15))
                        .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                        .fontWeight(.bold)
                    HStack{
                        
                        TextField("", text: $dosisGlucosa, prompt: Text("00.0").foregroundColor(Color.white))
                            .foregroundColor(Color.white)
                            .padding(.vertical, 10)
                            .multilineTextAlignment(.center)
                            .background(Color(red: 216/255, green: 145/255, blue: 145/255))
                            .cornerRadius(20)
                            .frame(width: 150)
                            .font(.custom("Arimo", size: 15))
                        
                        Text("mmHG     ")
                            .font(.custom("Arimo", size: 15))
                            .foregroundColor(Color(red: 184/255, green: 106/255, blue: 106/255))
                        
                    }
                    .padding(.bottom, 15)
                    
                    Text("Diastólica")
                        .font(.custom("Arimo", size: 15))
                        .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                        .fontWeight(.bold)
                    HStack{
                        
                        TextField("", text: $dosisGlucosa, prompt: Text("00.0").foregroundColor(Color.white))
                            .foregroundColor(Color.white)
                            .padding(.vertical, 10)
                            .multilineTextAlignment(.center)
                            .background(Color(red: 216/255, green: 145/255, blue: 145/255))
                            .cornerRadius(20)
                            .frame(width: 150)
                            .font(.custom("Arimo", size: 15))
                        
                        Text("mmHG     ")
                            .font(.custom("Arimo", size: 15))
                            .foregroundColor(Color(red: 184/255, green: 106/255, blue: 106/255))
                        
                    }
                    .padding(.bottom, 15)
                    
                    Text("Pulso")
                        .font(.custom("Arimo", size: 15))
                        .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                        .fontWeight(.bold)
                    HStack{
                        
                        TextField("", text: $dosisGlucosa, prompt: Text("00.0").foregroundColor(Color.white))
                            .foregroundColor(Color.white)
                            .padding(.vertical, 10)
                            .multilineTextAlignment(.center)
                            .background(Color(red: 216/255, green: 145/255, blue: 145/255))
                            .cornerRadius(20)
                            .frame(width: 150)
                            .font(.custom("Arimo", size: 15))
                        
                        Text("mmHG     ")
                            .font(.custom("Arimo", size: 15))
                            .foregroundColor(Color(red: 184/255, green: 106/255, blue: 106/255))
                        
                    }
                    
                    ZStack{
                        Rectangle()
                            .fill(Color(red: 164/255, green: 91/255, blue: 91/255))
                            .frame(width: 430, height: 45)
                        
                        Text("Actividad Física")
                            .foregroundColor(Color(red: 248/255, green: 243/255, blue: 243/255))
                        //.multilineTextAlignment(.leading) //leading izquierda
                            .padding(.trailing, 160) //trailing derecha
                        
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    
                    Text("Ejercicio")
                        .font(.custom("Arimo", size: 15))
                        .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                        .fontWeight(.bold)
                    
                    TextField("", text: $dosisGlucosa, prompt: Text("Nombre del deporte").foregroundColor(Color.white))
                            .foregroundColor(Color.white)
                            .padding(.vertical, 10)
                            .multilineTextAlignment(.center)
                            .background(Color(red: 216/255, green: 145/255, blue: 145/255))
                            .cornerRadius(20)
                            .frame(width: 210)
                            .font(.custom("Arimo", size: 15))
                            .padding(.bottom, 15)
                    
                    
                    Text("Duración")
                        .font(.custom("Arimo", size: 15))
                        .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                        .fontWeight(.bold)
                    HStack{
                        
                        TextField("", text: $dosisGlucosa, prompt: Text("00.0").foregroundColor(Color.white))
                            .foregroundColor(Color.white)
                            .padding(.vertical, 10)
                            .multilineTextAlignment(.center)
                            .background(Color(red: 216/255, green: 145/255, blue: 145/255))
                            .cornerRadius(20)
                            .frame(width: 150)
                            .font(.custom("Arimo", size: 15))
                        
                        Text("min       ")
                            .font(.custom("Arimo", size: 15))
                            .foregroundColor(Color(red: 184/255, green: 106/255, blue: 106/255))
                        
                    }
                    .padding(.bottom, 15)
                    
                    ZStack{
                        Rectangle()
                            .fill(Color(red: 164/255, green: 91/255, blue: 91/255))
                            .frame(width: 430, height: 45)
                        
                        Text("Adicional")
                            .foregroundColor(Color(red: 248/255, green: 243/255, blue: 243/255))
                        //.multilineTextAlignment(.leading) //leading izquierda
                            .padding(.trailing, 160) //trailing derecha
                        
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    
                    Text("Ketones")
                        .font(.custom("Arimo", size: 15))
                        .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                        .fontWeight(.bold)
                    
                    HStack{
                        
                        TextField("", text: $dosisGlucosa, prompt: Text("00.0").foregroundColor(Color.white))
                            .foregroundColor(Color.white)
                            .padding(.vertical, 10)
                            .multilineTextAlignment(.center)
                            .background(Color(red: 216/255, green: 145/255, blue: 145/255))
                            .cornerRadius(20)
                            .frame(width: 150)
                            .font(.custom("Arimo", size: 15))
                        
                        Text("mmol/L")
                            .font(.custom("Arimo", size: 15))
                            .foregroundColor(Color(red: 184/255, green: 106/255, blue: 106/255))
                        
                    }
                    .padding(.bottom, 15)
                    
                    Text("Peso")
                        .font(.custom("Arimo", size: 15))
                        .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                        .fontWeight(.bold)
                    
                    HStack{
                        
                        TextField("", text: $dosisGlucosa, prompt: Text("00.0").foregroundColor(Color.white))
                            .foregroundColor(Color.white)
                            .padding(.vertical, 10)
                            .multilineTextAlignment(.center)
                            .background(Color(red: 216/255, green: 145/255, blue: 145/255))
                            .cornerRadius(20)
                            .frame(width: 150)
                            .font(.custom("Arimo", size: 15))
                        
                        Text("kg        ")
                            .font(.custom("Arimo", size: 15))
                            .foregroundColor(Color(red: 184/255, green: 106/255, blue: 106/255))
                        
                    }
                    .padding(.bottom, 15)
                    
                    Text("Notas")
                        .font(.custom("Arimo", size: 15))
                        .foregroundColor(Color(red: 164/255, green: 91/255, blue: 91/255))
                        .fontWeight(.bold)
                    
                    TextField("", text: $dosisGlucosa, prompt: Text("Contexto extra").foregroundColor(Color.white))
                            .foregroundColor(Color.white)
                            .padding(.vertical, 10)
                            .multilineTextAlignment(.center)
                            .background(Color(red: 216/255, green: 145/255, blue: 145/255))
                            .cornerRadius(20)
                            .frame(width: 210)
                            .font(.custom("Arimo", size: 15))
                            .padding(.bottom, 15)
                    
                    
                    
                } //fin scroll view
                
                Button(action: {
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
        .background(
            NavigationLink("", destination: MainMadView(), isActive: $navigateToMainView)
                .opacity(0)
        )
    }
    
}

struct RegistroDeDatos_Previews: PreviewProvider {
    static var previews: some View {
        RegistroDeDatos()
    }
}
