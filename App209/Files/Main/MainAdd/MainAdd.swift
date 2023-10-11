//
//  MainAdd.swift
//  App209
//
//  Created by Вячеслав on 10/4/23.
//

import SwiftUI

struct MainAdd: View {
    
    @StateObject var viewModel: MainViewModel
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("New real estate")
                        .foregroundColor(.black)
                        .font(.system(size: 19, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .medium))
                            .padding(15)
                            .background(Circle().fill(.gray.opacity(0.1)))
                    })
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack(spacing: 20) {
                        
                        VStack(alignment: .leading, spacing: 7, content: {
                            
                            Text("Adress")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                    .opacity(viewModel.adress.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.adress)
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.2)))
                        })
                        
                        VStack(alignment: .leading, spacing: 7, content: {
                            
                            Text("Price")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("$0.00")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                    .opacity(viewModel.price.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.price)
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .regular))
                                    .keyboardType(.decimalPad)
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.2)))
                        })
                        
                        VStack(alignment: .leading, spacing: 7, content: {
                            
                            Text("Ceiling height (m)")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("0.00")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                    .opacity(viewModel.height.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.height)
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .regular))
                                    .keyboardType(.decimalPad)
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.2)))
                        })
                        
                        VStack(alignment: .leading, spacing: 7, content: {
                            
                            Text("Number of rooms")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                                HStack {
                                    
                                    ForEach(1...6, id: \.self) { index in
                                        
                                        Button(action: {
                                            
                                            viewModel.rooms = index
                                            
                                        }, label: {
                                            
                                            Text("\(index)")
                                                .foregroundColor(viewModel.rooms == index ? .white : .black)
                                                .font(.system(size: 15, weight: .medium))
                                                .padding(.horizontal, 10)
                                                .padding(15)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(viewModel.rooms == index ? Color("primary") : .gray.opacity(0.1)))
                                        })
                                    }
                                }
                            }
                        })
                        
                        VStack(alignment: .leading, spacing: 7, content: {
                            
                            Text("Garage")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                                HStack {
                                    
                                    ForEach(["Yes", "No"], id: \.self) { index in
                                        
                                        Button(action: {
                                            
                                            viewModel.garage = index
                                            
                                        }, label: {
                                            
                                            Text("\(index)")
                                                .foregroundColor(viewModel.garage == index ? .white : .black)
                                                .font(.system(size: 15, weight: .medium))
                                                .padding(.horizontal, 10)
                                                .padding(15)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(viewModel.garage == index ? Color("primary") : .gray.opacity(0.1)))
                                        })
                                    }
                                }
                            }
                        })
                    }
                    .padding([.horizontal, .bottom])
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addEstate {
                        
                        viewModel.fetchEstates()
                        
                        router.wrappedValue.dismiss()
                    }
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
                .opacity(viewModel.adress.isEmpty || viewModel.price.isEmpty || viewModel.height.isEmpty || viewModel.rooms == 0 || viewModel.garage.isEmpty ? 0.5 : 1)
                .disabled(viewModel.adress.isEmpty || viewModel.price.isEmpty || viewModel.height.isEmpty || viewModel.rooms == 0 || viewModel.garage.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    MainAdd(viewModel: MainViewModel())
}
