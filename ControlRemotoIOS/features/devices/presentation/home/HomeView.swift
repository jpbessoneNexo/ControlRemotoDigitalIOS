//
//  HomeView.swift
//  ControlRemotoIOS
//
//  Created by Nexo Soluciones on 30/11/2023.
//
import SwiftUI
import Foundation

struct HomeView: View {
    
    @InjectedModuleDevice private var viewModel:DeviceViewModel
    @EnvironmentObject var routers: Routers
    @State private var showProgress = false
    @Binding var isLoggedin: Bool
    
    var body: some View {
        
        NavigationStack{
            
            VStack {                
                
                Spacer()
                ZStack(alignment:.bottomTrailing){
                    
                    switch viewModel.devicesState {
                    case .loading(let show):
                        if show {
                            ProgressView()
                        }
                    case .success(let devices):
                        List(devices, id: \.id) { device in
                            ItemHomeCell(device: device)
                        }
                    case .error(let error):
                        Text("Error: \(error)")
                            .foregroundColor(.red)
                    case .none:
                        EmptyView()
                    }
                }
                .listStyle(PlainListStyle())
                .onAppear{
                    viewModel.getDevices()
                }
                
                Button{
                    
                } label: {
                    Image(systemName: "plus")
                        .font(.title.weight(.semibold))
                        .padding()
                        .background(Color("purple_variant"))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .shadow(radius: 4, x:0 ,y:4)
                }.padding()
            }
            .navigationTitle("Devices")
            .toolbar{
                Button(action: {
                    SecureDataHolder.shared.deleteAuthToken()
                    isLoggedin = false
                }, label: {
                    Text("Log out")
                })
            }
            
        }
        
    
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        @State var isLoggedin : Bool = false
        HomeView(isLoggedin: $isLoggedin)
    }
}
