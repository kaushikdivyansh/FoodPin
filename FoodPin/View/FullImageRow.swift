//
//  FullImageRow.swift
//  FoodPin
//
//  Created by Divyansh Kaushik on 3/29/22.
//

import SwiftUI

struct FullImageRow: View {
    
    //    MARK: State Varirables
    
    @State private var showOptions = false
    @State private var showError = false
    
    //    MARK: Binding
    
    @Binding var restaurant: Restaurant
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading) {
                Image(restaurant.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .cornerRadius(20)
                
                VStack(alignment: .leading) {
                    Text(restaurant.name)
                        .font(.system(.title2, design: .rounded))
                    
                    Text(restaurant.type)
                        .font(.system(.body, design: .rounded))
                    
                    Text(restaurant.location)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            if restaurant.isFavorite {
                Spacer()
                
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                    .offset(x: -10, y: 10)
            }
        }
        .contextMenu{
            Button {
                showError.toggle()
            } label: {
                HStack {
                    Text("Reserve a Table")
                    Image(systemName: "phone")
                }
            }
            
            Button {
                restaurant.isFavorite.toggle()
            } label: {
                Text(restaurant.isFavorite ? "Remove from favorites" : "Mark as Favorite")
                Image(systemName: "heart")
            }
        }
//        .onTapGesture {
//            showOptions.toggle()
//        }
//        Action Sheet is going to be deprecated soon. Start using confirmationDialog(_:isPresented:titleVisibility:presenting:actions:message:)
//        .confirmationDialog("What do you want to do?", isPresented: $showOptions, titleVisibility: .visible) {
//            Button("Reserve a Table") {
//                showError.toggle()
//            }
//            Button(restaurant.isFavorite ? "Remove from favorites" : "Mark as Favorite") {
//                restaurant.isFavorite.toggle()
//            }
//            Button("Cancel", role: .cancel) {
//
//            }
//        }
//        Alert is going to be deprecated soon. Use a View modifier like alert(_:isPresented:presenting:actions:message:) instead.
        .alert("Not yet Available", isPresented: $showError) {
            Button("OK") {}
            Button("Cancel", role: .cancel) {}
        }
        message: {
            Text("Sorry, this feature is not available yet. Please retry later")
        }
    }
}

struct FullImageRow_Previews: PreviewProvider {
    // .constant: Creates a binding with an immutable value.
    static var previews: some View {
        FullImageRow(restaurant: .constant(Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "22 Charlwood Street London SW1V 2DY Pimlico", phone: "432-344050", description: "With kitchen serving gourmet burgers. We offer food every day of the week, Monday through to Sunday. Join us every Sunday from 4:30 – 7:30pm for live acoustic music!", image: "cask", isFavorite: false)))
    }
}
