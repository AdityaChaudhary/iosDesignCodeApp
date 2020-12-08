//
//  TabBar.swift
//  FirstApp
//
//  Created by Aditya Chaudhary on 13/11/2020.
//  Copyright © 2020 Phantom. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home().tabItem {
                Image(systemName: "play.circle.fill")
                Text("Home")
            }
            ContentView().tabItem {
                Image(systemName: "rectangle.stack.fill")
                Text("Certificates")
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar().previewDevice("iPhone 12 Pro")
            TabBar().previewDevice("iPhone 11 Pro")
        }
    }
}
