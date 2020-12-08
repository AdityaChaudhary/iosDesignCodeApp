//
//  ZoomView.swift
//  FirstApp
//
//  Created by Aditya Chaudhary on 12/11/2020.
//  Copyright © 2020 Phantom. All rights reserved.
//

import SwiftUI

struct ZoomView: View {
    
    @State var showCardView = false
    
    var body: some View {
        
        
        ZStack {
            VStack {
                Text("Launch")
                    .font(.system(size: 20, weight: .semibold, design: .monospaced))
                    .foregroundColor(Color.white)
            }
            .padding()
            .frame(width: 150, height: 150, alignment: .center)
            .background(RadialGradient(gradient: Gradient(colors: [Color("card1"), Color("card5")]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 5, endRadius: 150))
            .clipShape(Circle())
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .onTapGesture {
                showCardView.toggle()
            }
            
    
            
            Color("card1")
                .frame(width: showCardView ? 1000 : 0, height: showCardView ? 1000 : 0, alignment: .center)
                .clipShape(Circle())
                .animation(.easeInOut(duration: 0.5))
                .onTapGesture {
                    showCardView.toggle()
                }
            
            
            
            VStack{
                HStack{
                    Text("Hello")
                    Spacer()
                }
                Spacer()
                
            }
            .opacity(showCardView ? 1 : 0)
            .background(Color("card1").opacity(showCardView ? 1 : 0))
            .animation(.easeIn(duration: 0.6))
            .frame(width: .infinity ,height: .infinity)
            .onTapGesture {
                showCardView.toggle()
            }

       }
        
        
    }
}

struct ZoomView_Previews: PreviewProvider {
    static var previews: some View {
        ZoomView()
    }
}
