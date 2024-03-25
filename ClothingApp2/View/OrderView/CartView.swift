//
//  CartView.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-17.
//

import SwiftUI

struct CartView: View {
    
    @Binding var isDark : Bool
    @Binding var name: String
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                VStack{
                    List{
                        ForEach(order.items){product in
                            CartListCell(product: product)
                            
                        }
                        .onDelete(perform: deleteItems)
                                    
                    }
                    .listStyle(PlainListStyle())
                    
                
                    Button{
                        
                    } label: {
                        ProductBtn(title: "Place order")
                    }
                    .padding(.bottom, 25)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "PlaceHolder", lable: "You have no items in your cart")
                }
            }
            
            .navigationTitle("Cart")
        }
        
        
        
    }
    
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

#Preview {
    CartView(isDark: .constant(false), name: .constant(""))
}
