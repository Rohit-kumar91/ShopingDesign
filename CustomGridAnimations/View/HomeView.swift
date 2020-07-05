//
//  HomeView.swift
//  CustomGridAnimations
//
//  Created by Rohit Prajapati on 05/07/20.
//

import SwiftUI

struct Home: View {
    
    //MARK: PRORERTIES
    @State var search = ""
    @State var index = 1
    @State var homeColumns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    
    var body: some View{
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                HStack {
                    Text("Start Shopping")
                        .font(.title)
                        .fontWeight(.bold)
                        
                    Spacer()
                    
                }
                
                TextField("Search", text: $search)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.black.opacity(0.07))
                    .cornerRadius(10)
                
                
                //Carousel List
                TabView(selection: self.$index) {
                    ForEach(1...7, id: \.self) { index in
                        Image("c\(index)")
                            .resizable()
                            //Adding Animation
                            .frame(height: self.index == index ? 230 : 180)
                            .cornerRadius(15)
                            //For Identifying the current Index
                            .tag(index)
                    }
                }
                .frame(height: 230)
                .padding(.top, 25)
                .tabViewStyle(PageTabViewStyle())
                .animation(.easeOut)
                
                
                //GridView
                HomeGridView(columns: homeColumns)
                
            }
            .padding(.vertical)
            .padding(.horizontal)
        }
        .background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.all))
    }
}
