//
//  MainDetail.swift
//  App209
//
//  Created by Вячеслав on 10/4/23.
//

import SwiftUI

struct MainDetail: View {
    
    let index: MainModel
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
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
                    
                    LazyVStack {
                        
                        HStack {
                            
                            Image(systemName: "map.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                            
                            Text(index.address ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                        
                        Text("$\(index.price)")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .padding(13)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.green))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 40)
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 7, content: {
                                
                                Text("Number of rooms")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text("\(index.rooms)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 23, weight: .semibold))
                            })
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                            
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 7, content: {
                                
                                Text("Ceiling height")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text("\(index.ceilingHeight ?? "") m")
                                    .foregroundColor(.black)
                                    .font(.system(size: 23, weight: .semibold))
                            })
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                        }
                        
                        VStack(alignment: .leading, spacing: 7, content: {
                            
                            Text("Garage")
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .regular))
                            
                            Text(index.garage ? "Yes" : "No")
                                .foregroundColor(.black)
                                .font(.system(size: 23, weight: .semibold))
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    }
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addComparison(adress: index.address ?? "")
                    
                }, label: {
                    
                    Text(viewModel.isCompared(adress: index.address ?? "") ? "Added" : "Add to comparison")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
                .opacity(viewModel.isCompared(adress: index.address ?? "") ? 0.5 : 1)
            }
        }
    }
}

//#Preview {
//    MainDetail(index: mainmode)
//}
