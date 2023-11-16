//
//  GraficasView.swift
//  App-DiabeticFoot
//
//  Created by Sofía Cantú on 11/11/23.
//

import SwiftUI
import Charts


struct datosGlucosa: Identifiable {
    var dia: Double
    var mgdL: Double
    var id = UUID()
}
//Datos temporales, luego hacer prueba con json y luego con API
var dataG: [datosGlucosa] = [
    .init(dia: 1, mgdL: 111),
    .init(dia: 2, mgdL: 154),
    .init(dia: 3, mgdL: 143),
    .init(dia: 4, mgdL: 120),
    .init(dia: 5, mgdL: 151),
    .init(dia: 6, mgdL: 172),
    .init(dia: 7, mgdL: 131),
    .init(dia: 8, mgdL: 141),
    .init(dia: 9, mgdL: 164),
    .init(dia: 10, mgdL: 171)
]

struct datosPie: Identifiable {
    var dia: Double
    var grado: Double
    var id = UUID()
}
//Datos temporales, luego hacer prueba con json y luego con API
var dataP: [datosPie] = [
    .init(dia: 1, grado: 3),
    .init(dia: 2, grado: 3),
    .init(dia: 3, grado: 3),
    .init(dia: 4, grado: 3),
    .init(dia: 5, grado: 2),
    .init(dia: 6, grado: 2),
    .init(dia: 7, grado: 2),
    .init(dia: 8, grado: 1),
    .init(dia: 9, grado: 1),
    .init(dia: 10, grado: 1)
]



struct GraficasView: View {
    
    var body: some View {
        
        ZStack{
            Image("BG_Azulito")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Text("Estadisticas")
                    .foregroundColor(Color(red: 91/255, green: 137/255, blue: 164/255))
                    .font(.custom("borsok", size: 35))
                    .lineSpacing(15)
                    .multilineTextAlignment(.center)
                    .padding(.top, 40)
                    .padding()
                
                ScrollView{
                    
                    GroupBox ("Registro del nivel de Pie diabetico"){
                        Chart(dataP) {
                            LineMark(
                                x: .value("dia", $0.dia),
                                y: .value("grado", $0.grado)
                            )
                            //.interpolationMethod(.catmullRom)
                            .lineStyle(.init(lineWidth: 5))
                            .symbol {
                                Circle()
                                //.fill(.white)
                                //.foregroundColor(Color(red: 153/255, green: 188/255, blue: 208/255))
                                    .foregroundColor(Color(red: 243/255, green: 246/255, blue: 248/255))
                                    .frame(width: 5)
                                    .shadow(radius: 2)
                            }
                            
                        }
                        .foregroundStyle(Color(red: 91/255, green: 137/255, blue: 164/255)) //color de la grafica
                        .chartXScale (domain: 1...10)
                        .chartYScale (domain: 0...5)
                        .aspectRatio (1.5, contentMode: .fit) //tamaño de la grafica
                        .padding(10)
                    }
                    .foregroundColor(Color(red: 91/255, green: 137/255, blue: 164/255))
                    .backgroundStyle(Color(red: 210/255, green: 227/255, blue: 239/255))
                    .padding(30)
                    
                    GroupBox ("Registro de Glucosa"){
                        Chart(dataG) {
                            LineMark(
                                x: .value("dia", $0.dia),
                                y: .value("mgdL", $0.mgdL)
                            )
                            //.interpolationMethod(.catmullRom)
                            .lineStyle(.init(lineWidth: 5))
                            .symbol {
                                Circle()
                                //.fill(.white)
                                //.foregroundColor(Color(red: 153/255, green: 188/255, blue: 208/255))
                                    .foregroundColor(Color(red: 243/255, green: 246/255, blue: 248/255))
                                    .frame(width: 5)
                                    .shadow(radius: 2)
                            }
                            
                        }
                        .foregroundStyle(Color(red: 91/255, green: 137/255, blue: 164/255)) //color de la grafica
                        .chartXScale (domain: 1...10)
                        .chartYScale (domain: 50...250)
                        .aspectRatio (1.5, contentMode: .fit) //tamaño de la grafica
                        .padding(10)
                    }
                    .foregroundColor(Color(red: 91/255, green: 137/255, blue: 164/255))
                    .backgroundStyle(Color(red: 210/255, green: 227/255, blue: 239/255))
                    .padding(30)
                            
                }
                
            }
        }
        
        
    }
}




#Preview {
    GraficasView()
}
