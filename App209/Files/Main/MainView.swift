//
//  MainView.swift
//  App209
//
//  Created by Вячеслав on 10/4/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .leading, spacing: 30, content: {
                    
                    HStack(content: {
                        
                        VStack(alignment: .leading, spacing: 8, content: {
                            
                            Text("Your amount for real estate")
                                .foregroundColor(.white.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("$\(1000)")
                                .foregroundColor(.white)
                                .font(.system(size: 29, weight: .semibold))
                        })
                        
                        Spacer()
                    })
                    
                    Button(action: {
                        
                        viewModel.isChart = true
                        
                    }, label: {
                    
                        HStack {
                            
                            Text("USD")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .regular))
                        }
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(1)))
                    })
                })
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                .padding(.horizontal)
                
                Text("Added real estate")
                    .foregroundColor(.black)
                    .font(.system(size: 19, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                if viewModel.estates.isEmpty {
                    
                    VStack(alignment: .center, spacing: 7, content: {
                        
                        Image("empty")
                        
                        Text("Empty")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("You don't have any properties added yet")
                            .foregroundColor(.black)
                            .font(.system(size: 13, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: true) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.estates, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.current_estate = index
                                    viewModel.isDetail = true
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 8, content: {
                                            
                                            Text("$\(index.price)")
                                                .foregroundColor(.white)
                                                .font(.system(size: 15, weight: .medium))
                                                .padding(7)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(.green))
                                            
                                            Text(index.address ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 17, weight: .medium))
                                        })
                                        
                                        Spacer()
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                                })
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                }
            }
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.isAdd = true
                    
                }, label: {
                    
                    Text("Add real estate")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
            }
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            MainAdd(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isChart, content: {
            
            MainChart()
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            if let index = viewModel.current_estate {
                
                MainDetail(index: index)
            }
        })
        .onAppear {
            
            viewModel.fetchEstates()
        }
    }
}

#Preview {
    MainView()
}
