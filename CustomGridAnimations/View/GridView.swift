//
//  GridView.swift
//  CustomGridAnimations
//
//  Created by Rohit Prajapati on 05/07/20.
//

import SwiftUI

struct HomeGridView: View {
    
    //MARK: PROPERTIES
    @State var columns: Array<GridItem>
    
    
    var body: some View {
        
        LazyVStack {
            HStack {
                Text("Popular")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: self.columns.count == 2 ? "rectangle.grid.1x2" : "square.grid.2x2")
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                }
                
            }
            .padding(.top, 25)
            
            LazyVGrid(columns: self.columns, spacing: 25) {
                ForEach(data) { data in
                   //Grid View....
                    GridView(product: data, columns: $columns)
                }
            }
            .padding([.top])
        }
    }
}



struct GridView: View {
    
    var product: ShopData
    @Binding var columns: [GridItem]
    
    var body: some View {
        
        VStack {
            if self.columns.count == 2 {
                VStack(spacing: 15) {
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                        Image(product.image)
                            .resizable()
                            .frame(height: 250)
                            .cornerRadius(15)
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "heart.fill")
                                .foregroundColor(Color.red)
                                .padding(.all, 10)
                                .background(Color.white)
                                .clipShape(Circle())
                            
                        }
                        .padding(.all, 10)
                        
                    }
                    
                    
                    Text(product.name)
                        .fontWeight(.bold)
                        .lineLimit(1)
                        
                    
                    Button {
                         
                    } label: {
                        Text("Buy Now")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 25)
                            .background(Color.red)
                            .cornerRadius(10)
                        
                    }

                }
            } else {
                
            }
        }
        
       
    }
}
