//
//  VideoView.swift
//  App209
//
//  Created by Вячеслав on 10/4/23.
//

import SwiftUI

struct VideoView: View {
    
    @StateObject var viewModel = VideoViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Video Lessons")
                    .foregroundColor(.black)
                    .font(.system(size: 25, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                if viewModel.isLoading {
                    
                    ProgressView()
                        .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    if viewModel.lessons.isEmpty {
                        
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
                            
                            LazyVStack(spacing: 45) {
                                
                                VStack(alignment: .leading, content: {
                                    
                                    Text("Best of the month")
                                        .foregroundColor(.black)
                                        .font(.system(size: 21, weight: .semibold))
                                        .multilineTextAlignment(.leading)
                                    
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        
                                        HStack {
                                            
                                            ForEach(Array(viewModel.lessons).shuffled().prefix(4), id: \.self) { index in
                                                
                                                Button(action: {
                                                    
                                                    viewModel.viewed_videos += 1
                                                    viewModel.selectedLesson = index
                                                    viewModel.isDetail = true
                                                    
                                                }, label: {
                                                    
                                                    VStack(alignment: .leading, spacing: 15, content: {
                                                        
                                                        WebPic(urlString: index.image ?? "", width: 150, height: 100, cornerRadius: 10, isPlaceholder: true)
                                                        
                                                        Text(index.title ?? "")
                                                            .foregroundColor(.black)
                                                            .font(.system(size: 15, weight: .medium))
                                                            .frame(width: 140)
                                                            .multilineTextAlignment(.leading)
                                                            .lineLimit(2)
                                                    })
                                                })
                                            }
                                        }
                                    }
                                })
                                
                                VStack(alignment: .leading, content: {
                                    
                                    Text("The most important")
                                        .foregroundColor(.black)
                                        .font(.system(size: 21, weight: .semibold))
                                        .multilineTextAlignment(.leading)
                                    
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        
                                        HStack {
                                            
                                            ForEach(Array(viewModel.lessons).shuffled().prefix(7), id: \.self) { index in
                                                
                                                Button(action: {
                                                    
                                                    viewModel.viewed_videos += 1
                                                    viewModel.selectedLesson = index
                                                    viewModel.isDetail = true
                                                    
                                                }, label: {
                                                    
                                                    VStack(alignment: .leading, spacing: 15, content: {
                                                        
                                                        WebPic(urlString: index.image ?? "", width: 150, height: 100, cornerRadius: 10, isPlaceholder: true)
                                                        
                                                        Text(index.title ?? "")
                                                            .foregroundColor(.black)
                                                            .font(.system(size: 15, weight: .medium))
                                                            .frame(width: 140)
                                                            .multilineTextAlignment(.leading)
                                                            .lineLimit(2)
                                                    })
                                                })
                                            }
                                        }
                                    }
                                })
                                
                                VStack(alignment: .leading, content: {
                                    
                                    Text("General directory")
                                        .foregroundColor(.black)
                                        .font(.system(size: 21, weight: .semibold))
                                        .multilineTextAlignment(.leading)
                                    
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        
                                        HStack {
                                            
                                            ForEach(Array(viewModel.lessons).shuffled().prefix(4), id: \.self) { index in
                                                
                                                Button(action: {
                                                    
                                                    viewModel.viewed_videos += 1
                                                    viewModel.selectedLesson = index
                                                    viewModel.isDetail = true
                                                    
                                                }, label: {
                                                    
                                                    VStack(alignment: .leading, spacing: 15, content: {
                                                        
                                                        WebPic(urlString: index.image ?? "", width: 150, height: 100, cornerRadius: 10, isPlaceholder: true)
                                                        
                                                        Text(index.title ?? "")
                                                            .foregroundColor(.black)
                                                            .font(.system(size: 15, weight: .medium))
                                                            .frame(width: 140)
                                                            .multilineTextAlignment(.leading)
                                                            .lineLimit(2)
                                                    })
                                                })
                                            }
                                        }
                                    }
                                })
                            }
                            .padding([.horizontal, .bottom])
                        }
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.getVideos()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            VideoDetail(index: viewModel.selectedLesson)
        })
    }
}

#Preview {
    VideoView()
}
