//
//  SplashView.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-17.
//

import SwiftUI

struct SplashView: View {
    
    var order = Order()
    var fav = Favorite()
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        
        if(isActive){
            NavigationView().environmentObject(order).environmentObject(fav)
        }
        else{
            VStack{
                ZStack{
                    Image("Splash Screen")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    
                    VStack{
                        Image("logo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 400, height: 400)
                        
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.2)){
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                        withAnimation{
                            self.isActive = true
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    SplashView()
}
