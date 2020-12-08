//
//  HomeView.swift
//  FirstApp
//
//  Created by Aditya Chaudhary on 13/11/2020.
//  Copyright © 2020 Phantom. All rights reserved.
//

import SwiftUI


struct HomeView: View {
    
    @Binding var showProfile: Bool
    @State var showUpdate = false

    var body: some View {
        
        VStack {
            HStack {
                Text("Watching")
//                    .font(.system(size: 28, weight: .bold))
                    .modifier(CustomFontModifier())
                
                Spacer()
                
                AvatarView(showProfile: $showProfile)
                
                Button(action: { self.showUpdate.toggle() }) {
                    Image(systemName: "bell")
                        .renderingMode(.original)
                        .font(.system(size: 16, weight: .medium))
                        .frame(width: 36, height: 36)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                        .shadow(color: Color.black.opacity(0.2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 10)
                }
                .sheet(isPresented: $showUpdate, content: {
                    UpdateList()
                })
            }
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.top, 30)
            
            ScrollView (.horizontal, showsIndicators: false) {
                WatchRings()
                    .padding(.horizontal, 30)
                    .padding(.bottom, 30)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(sectionData) { item in
                        GeometryReader { geometry in
                            SectionView(section: item)
                                .rotation3DEffect(Angle(degrees: Double(geometry.frame(in:.global).minX - 30) / -20
                                ), axis: (x: 0, y: 10.0, z: 0))
                        }
                        .frame(width: 275)
                    }
                }
                .padding(30)
                .padding(.bottom, 30)
            }
            
            Spacer()
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}

struct SectionView: View {
    
    var section: Section
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image(section.logo)
            }
            
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
            
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}


struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}


let sectionData = [
    Section(title: "Prototype designs in Swift UI", text: "10 Sections", logo: "Logo1", image: Image("Card1"), color: Color("card1")),
    Section(title: "Build a Swift UI app", text: "20 Sections", logo: "Logo2", image: Image("Card2"), color: Color("card2")),
    Section(title: "Swift UI Advanced", text: "10 Sections", logo: "Logo3", image: Image("Card3"), color: Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))),
]

struct WatchRings: View {
    var body: some View {
        HStack(spacing: 30.0) {
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), color2: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), width: 44, height: 44, percent: 68, show: .constant(true))
                
                VStack(alignment: .leading, spacing: 4.0) {
                    Text("6 min left").bold()
                        .modifier(FontModifier(style: .subheadline))
                    Text("Watched 10 mins today").modifier(FontModifier(style: .caption))
                }
                
            }
            .padding(8)
            .background(Color.white, alignment: .center)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), color2: #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), width: 32, height: 32, percent: 54, show: .constant(true))
                
            }
            .padding(8)
            .background(Color.white, alignment: .center)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), color2: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), width: 32, height: 32, percent: 32, show: .constant(true))
                
            }
            .padding(8)
            .background(Color.white, alignment: .center)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            
        }
    }
}
