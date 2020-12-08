//
//  UpdateList.swift
//  FirstApp
//
//  Created by Aditya Chaudhary on 13/11/2020.
//  Copyright © 2020 Phantom. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    
    @ObservedObject var store = UpdateStore()
    
    func addUpdate(){
        store.updates.append(Update(image: "Card1", title: "New Item", text: "Test", date: "Jan 2"))
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                List{
                    ForEach(store.updates) { update in
                        HStack {
                            NavigationLink(destination: UpdateDetail(update: update)) {
                                HStack {
                                    
                                    Image(update.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width:80, height: 80)
                                        .background(Color.black)
                                        .cornerRadius(20)
                                        .padding(.trailing, 4)
                                    
                                    VStack (alignment: .leading, spacing: 8.0) {
                                        Text(update.title)
                                            .font(.system(size: 20, weight: .bold))
                                        
                                        Text(update.text)
                                            .lineLimit(2)
                                            .font(.subheadline)
                                            .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                                        
                                        Text(update.date)
                                            .font(.caption)
                                            .fontWeight(.bold)
                                            .foregroundColor(.secondary)
                                        
                                    }
                                }
                                .background(Color.black)
                                .padding(.vertical, 8)
                                
                                
                                
                                
                            }
                            
                        }
                        .frame(width: .infinity)
                        .background(Color.blue)
                    }
                    .onDelete(perform: { indexSet in
                        store.updates.remove(at: indexSet.first!)
                    })
                    .onMove(perform: { indices, newOffset in
                        self.store.updates.move(fromOffsets: indices, toOffset: newOffset)
                    })
                }
                .padding(10)
                .background(Color.red)
                .navigationBarTitle(Text("Updates"))
                .navigationBarItems(leading: Button(action: addUpdate) {
                    Text("Add Update")
                }, trailing: EditButton())
                
            }
            
        }
        
        
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}


struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(image: "Card1", title: "Swift UI", text: "Swift UI Text", date: "Jan 1"),
    Update(image: "Card2", title: "Swift UI Advanced", text: "Text", date: "Jan 1"),
    Update(image: "Card3", title: "Backend dev", text: "Text", date: "Jan 1")
]
