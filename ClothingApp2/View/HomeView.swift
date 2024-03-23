//
//  HomeView.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-17.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = ProductListViewModel()
    
    var body: some View {
        
        ZStack{
            
            
            VStack{
                
                HStack{
                    VStack{
                        Text("Beauty comes")
                            .font(.system(size: 30, weight: .light, design: .serif))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.black)
                        Text("When")
                            .font(.system(size: 30, weight: .bold, design: .serif))
                            .foregroundColor(.pink.opacity(0.80))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Fashion Succeeds")
                            .font(.system(size: 30, weight: .light, design: .serif))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.black)
                        
                    }.padding(.bottom, -10)
                    
                    
                }
                .padding()
                
                NavigationStack{
            
                    ScrollView{
                        HStack {
                                                    
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: -24) {
                                    ForEach (viewModel.products, id: \.id) {product in
                                        HStack {
                                            Text(".\(product.price)")
                                                .font(.system(size: 15, weight: .light))
                                        }
                                        .padding(5)
                                        .frame(width: 100, height: 40)
                                        .background(.secondary.opacity(0.1))
                                        .clipShape(RoundedRectangle(cornerRadius: 30))
                                        
                                    }
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 4)
                                }
                            }
                        }
                        
                        HStack {
                           Text("Best Selling")
                               .font(.system(size: 24, weight: .semibold))
                               .foregroundStyle(.black)
                                        
                            Spacer()
                                        
                            Text("View All")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(.gray)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                                        
                         ScrollView(.horizontal, showsIndicators: false){
                             LazyHStack(spacing: 5){
                               ForEach(viewModel.products, id: \.id){product in
                                 ProductListCell(product: product)
                                   .onTapGesture {
                                       viewModel.selectedProduct = product
                                       viewModel.isShowingDetails = true
                                           }
                                     }
                               }
                                .frame(height: 200)
                             }
                            .padding(.horizontal, 20)
                            .padding(.vertical, -20)
                        
                        
                    }
                                     
                
                }
               
                .onAppear{
                    viewModel.getProducts()
                }
            
                
                
            }
            .blur(radius: viewModel.isShowingDetails ? 20 : 0)
            if viewModel.isShowingDetails {
                ProductDetailView(product: viewModel.selectedProduct!, isShowingDetails: $viewModel.isShowingDetails)
            }
            
            if viewModel.isLoading{
                LoadingView()
            }
            
            
        }
    }
}

#Preview {
    HomeView()
}


