//
//  FilterView.swift
//  Housing
//
//  Created by Omid Shojaeian Zanjani on 05/02/24.
//

import SwiftUI

struct FilterView: View {
    @State private var searchText:String = ""
    private var propertyTypes:[String] = ["Apartment", "House", "Land", "Camera","Apartment", "House", "Land", "Camera","Apartment", "House", "Land", "Camera","Apartment", "House", "Land", "Camera","Apartment", "House", "Land", "Camera","Apartment", "House", "Land", "Camera","Apartment", "House", "Land", "Camera","Apartment", "House", "Land", "Camera"]
    @State var sliderPosition: ClosedRange<Float> = 3...8

    private var bedrooms:[String] = ["no room", "1 room", "2room", "3 room"]
    var body: some View {
        VStack(alignment:.leading){
            
            HStack{
                Spacer()
                RoundedRectangle(cornerRadius: 1)
                    .fill(Color.gray)
                    .frame(width: 40, height: 1)
                Spacer()
            }
            HStack{
                Spacer()
                Text("Filter")
                    .fontWeight(.bold)
                Spacer()
            }
            HStack{
                Image(systemName: "magnifyingglass")
                TextField(text: $searchText) {
                    Text("search")
                }
            }
            .padding()
            .background{
                RoundedRectangle(cornerRadius: 15.0)
                    .fill(Color("_gray"))
                    .frame(height: 50)
            }
            
            Text("Property types")
                .fontWeight(.bold)
            HorizontalStringItemsPresenter(items: propertyTypes)
            Text("Bed Rooms")
                .fontWeight(.bold)
            HorizontalStringItemsPresenter(items: bedrooms)
            Text("Property Price")
                .fontWeight(.bold)
            
            RangedSliderView(value: $sliderPosition, bounds: 1...10)
                .frame(height: 50)
            
            
            VStack(alignment:.center){
                HStack{
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Search")
                    }
                    .frame(width: 200)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Spacer()
                }
                
                HStack{
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Reset")
                    }
                    .frame(width: 200)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 2)
                    )
                    Spacer()
                }
            }
        }
        .padding()
    }
}

struct HorizontalStringItemsPresenter:View {
    var items:[String]
    
    init(items: [String]?) {
        self.items = items ?? []
    }
    
    
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(items, id: \.self) { item in
                    Text("\(item)")
                        .frame(width: 100, height: 42)
                        .background{
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color("_green"))
                        }
                        .foregroundStyle(Color.white)
                        .fontWeight(.semibold)
                        
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    VStack{
        Spacer()
        FilterView()
        
    }
}
