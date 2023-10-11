//
//  VideoDetail.swift
//  App209
//
//  Created by Вячеслав on 10/4/23.
//

import SwiftUI
import AVKit

struct VideoDetail: View {
    
    @StateObject var viewModel = MainViewModel()
    
    @Environment(\.presentationMode) var router
    
    let index: VideoItem
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                if let url = URL(string: index.video ?? "") {
                    
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(maxWidth: .infinity)
                        .frame(height: 250)
                }
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        VStack {
                            
                            VStack(alignment: .leading, spacing: 10, content: {
                                
                                Text(index.title ?? "title")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .medium))
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                                
                                Text("Video's duration is: \(index.duration ?? 0)")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12, weight: .regular))
                            })
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 20, content: {
                                    
                                    HStack {
                                        
                                        Text("0/3")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .medium))
                                            .padding(10)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                                        
                                        Text("Video Viewed")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .regular))
                                    }
                                    
                                    HStack {
                                        
                                        Text("0/5")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .medium))
                                            .padding(10)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.purple))
                                        
                                        Text("Video listened")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .regular))
                                    }
                                })
                                
                                Spacer()
                                
                                ZStack {
                                    
                                    Circle()
                                        .stroke(.gray.opacity(0.25), lineWidth: 6)
                                        .frame(width: 120, height: 120)
                                    
                                    Circle()
                                        .stroke(.gray.opacity(0.25), lineWidth: 6)
                                        .frame(width: 90, height: 90)
                                }
                            }
                            .padding()
                        }
                        .background(RoundedRectangle(cornerRadius: 7).fill(.gray.opacity(0.1)))
                        
                        VStack(spacing: 5) {
                            
                            Image("empty")
                                .padding(.bottom)
                            
                            Text("No any Comments")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .semibold))
                            
                            Text("No any comment on the post found")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        }
                        .padding(.vertical, 100)
                    }
                    .padding()
                }
            }
            .ignoresSafeArea(.all, edges: .top)
        }
    }
}

#Preview {
    VideoDetail(index: VideoItem(id: 0, categoryId: 0, title: "dsam", image: "dp", video: "", duration: 0))
}
