//
//  HistoryView.swift
//  App209
//
//  Created by Вячеслав on 10/4/23.
//

import SwiftUI

struct HistoryView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("History")
                    .foregroundColor(.black)
                    .font(.system(size: 25, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                VStack(alignment: .center, spacing: 7, content: {
                    
                    Image("empty")
                    
                    Text("Empty")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("You don't have any compared estate")
                        .foregroundColor(.black)
                        .font(.system(size: 13, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .frame(maxHeight: .infinity, alignment: .center)
            }
        }
        .onAppear {
            
            viewModel.fetchEstates()
        }
    }
}

#Preview {
    HistoryView()
}
