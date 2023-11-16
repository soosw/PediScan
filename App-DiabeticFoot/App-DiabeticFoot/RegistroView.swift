//
//  RegistroView.swift
//  App-DiabeticFoot
//
//  Created by Scarlet on 04/11/23.
//

import SwiftUI



struct RegistroView: View {
    @State private var name: String = ""
    @State private var lastName: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    //Esto me va a servir para poder anular el "back" al llegar  a la pestaña desde el log in
    //me deja editar los valores ambientales de la presentacion
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            
            Button("Back") {
                mode.wrappedValue.dismiss()
            }.navigationBarBackButtonHidden(true)
            
            Image("BG_AzulCirculos")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                TextField("", text: $name, prompt: Text("Nombre").foregroundColor(Color.white))
                    .foregroundColor(Color.white)
                    .padding(.vertical, 10)
                    .multilineTextAlignment(.center)
                    .background(Color(red: 153/255, green: 188/255, blue: 208/255))
                    .cornerRadius(20)
                    .frame(width: 280)
                    .font(.custom("Arimo", size: 15))
                
                TextField("", text: $lastName, prompt: Text("Apellido").foregroundColor(Color.white))
                    .foregroundColor(Color.white)
                    .padding(.vertical, 10)
                    .multilineTextAlignment(.center)
                    .background(Color(red: 153/255, green: 188/255, blue: 208/255))
                    .cornerRadius(20)
                    .frame(width: 280)
                    .font(.custom("Arimo", size: 15))
                
                TextField("", text: $username, prompt: Text("Usuario").foregroundColor(Color.white))
                    .foregroundColor(Color.white)
                    .padding(.vertical, 10)
                    .multilineTextAlignment(.center)
                    .background(Color(red: 153/255, green: 188/255, blue: 208/255))
                    .cornerRadius(20)
                    .frame(width: 280)
                    .font(.custom("Arimo", size: 15))
                
                TextField("", text: $email, prompt: Text("Correo").foregroundColor(Color.white))
                    .foregroundColor(Color.white)
                    .padding(.vertical, 10)
                    .multilineTextAlignment(.center)
                    .background(Color(red: 153/255, green: 188/255, blue: 208/255))
                    .cornerRadius(20)
                    .frame(width: 280)
                    .font(.custom("Arimo", size: 15))
                
                SecureField("", text: $password, prompt: Text("Contraseña").foregroundColor(Color.white))
                    .foregroundColor(Color.white)
                    .padding(.vertical, 10)
                    .multilineTextAlignment(.center)
                    .background(Color(red: 153/255, green: 188/255, blue: 208/255))
                    .cornerRadius(20)
                    .frame(width: 280)
                    .font(.custom("Arimo", size: 15))

                NavigationLink(
                    destination: UnidadesView(),
                    label: {
                        Text("Siguiente")
                            .frame(width: 180)
                            .padding(8)
                            .background(Color(red: 91/255, green: 137/255, blue: 164/255))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .padding(.top, 15)
                            .font(.custom("Arimo", size: 15))
                    }
                )
                
                NavigationLink(
                    destination: InicioSesion(),
                    label: {
                        Text("Ir al log in")
                            .frame(width: 180)
                            .padding(8)
                            .background((Color(red: 216/255, green: 145/255, blue: 145/255)))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            //.padding(.vertical, 15)
                            .font(.custom("Arimo", size: 15))
                    }
                )
                .disableAutocorrection(true)
            }

            .padding(.top, 30)
        }
    }
    
}

struct RegistroView_Previews: PreviewProvider {
    static var previews: some View {
        RegistroView()
    }
}
