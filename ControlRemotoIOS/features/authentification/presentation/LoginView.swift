//
//  LoginView.swift
//  ControlRemotoIOS
//
//  Created by Nexo Soluciones on 19/09/2023.
//

import SwiftUI
import ExytePopupView

struct LoginView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var toast: ToastCustom? = nil
    @InjectedLogin private var viewModel: LoginViewModel
    @State private var showProgress = false
    @Binding var isLoggedin: Bool
    
    var body: some View {
        
        ScrollView{
            VStack {
                Image("logoApp")
                    .resizable()
                    .frame(width: 100, height: 100)
                
                Text("Todos los dispositivos de Digital Signage, al alcance de tu mano.")
                    .font(.body)
                    .bold()
                    .foregroundColor(.white)
                    .clipped()
                    .multilineTextAlignment(.center)
                
                
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color("purple_variant")).opacity(0.5)
                        .shadow(color: .gray, radius: 5, x: 0, y: 5)
                    
                    VStack {
                        TextField("Usuario", text: $username)
                            .autocapitalization(.none)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .padding()
                            .font(.headline)
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(6)
                            .onChange(of: username, perform: { value in
                                
                            })
                        
                        Spacer().frame(height: 30)
                        
                        SecureField("Contraseña", text: $password)
                            .disableAutocorrection(true)
                            .padding()
                            .font(.headline)
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(6)
                            .onChange(of: password, perform: { value in
                                if value.isEmpty{
                                    
                                }
                            })
                        
                        Spacer().frame(height: 50)
                        
                        Button(action: {
                            if authCredentialsAreValid(user: username, password: password) {
                                viewModel.loginUser(username: username, passwords: password)
                                self.showProgress = true
                            }else{
                                toast = ToastCustom(type: .warning, title: "Ha ocurrido un erorr..", message: "Por favor, complete todos los campos antes de iniciar sesión")
                                self.showProgress = false
                            }
                        }) {
                            Text("Iniciar sesión")
                            if showProgress {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                                    .padding(2)
                            }
                        }
                        .padding()
                        .background(Color.pink)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .font(.headline)
                        .onReceive(viewModel.$authenticationState) { state in
                            switch state {
                            case .loading(let isLoading):
                                
                                if isLoading {
                                    // Realizar acciones relacionadas con la carga
                                }
                            case .success(let loginData):
                                
                                self.showProgress = false
                                SecureDataHolder.shared.saveAuthToken(drfToken: loginData.drfToken)
                                isLoggedin = true
                                
                            case .error(let errorMessage):
                                toast = ToastCustom(type: .error, title: "Error", message: errorMessage)
                                self.showProgress = false
                            case .none:
                                self.showProgress = false
                            }
                        }
                    }
                    .padding(24)
                    
                }
                .frame(width: .infinity, alignment: .centerLastTextBaseline)
                
            }
            .padding()
            .frame(maxWidth: .infinity)
            
        }
        .background(Color("light_purple"))
        .toastView(toast: $toast)
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        @State var isLoggedin : Bool = false
        LoginView(isLoggedin: $isLoggedin)
    }
}

func authCredentialsAreValid(user:String, password:String) -> Bool {
    var areValid = false
    if !user.isEmpty && !password.isEmpty {
        areValid = true
    }
    
    return areValid
}

