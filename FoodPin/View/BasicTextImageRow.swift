//
//  BasicImageRowView.swift
//  FoodPin
//
//  Created by Divyansh Kaushik on 3/29/22.
//

import SwiftUI

struct BasicTextImageRow: View {
    
//    MARK: State Varirables
    
    @State private var showOptions = false
    @State private var showError = false
    
//    MARK: Binding
    
    @Binding var restaurant: Restaurant
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Image(restaurant.image)
                .resizable()
                .frame(width: 120, height: 120)
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
            
            if restaurant.isFavorite {
                Spacer()
                
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
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
            
            Button {
                showOptions.toggle()
            } label: {
                Text("Share")
                Image(systemName: "square.and.arrow.up")
            }
        }
//        Adds an action to perform when this view recognizes a tap gesture.
//        .onTapGesture {
//            showOptions.toggle()
//        }
//
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
        .sheet(isPresented: $showOptions) {
            let defaultText = "Just checking in at \(restaurant.name)"
            
            if let imageToShare = UIImage(named: restaurant.image) {
                ActivityView(activityItems: [defaultText, imageToShare])
            } else {
                ActivityView(activityItems: [defaultText])
            }
        }
//       Alert is going to be deprecated soon. Use a View modifier like alert(_:isPresented:presenting:actions:message:) instead.
        .alert("Not yet Available", isPresented: $showError) {
            Button("OK") {
                
            }
            Button("Cancel", role: .cancel) {
                
            }
        } message: {
            Text("Sorry, this feature is not available yet. Please retry later")
        }
        
    }
}

struct BasicTextImageRow_Previews: PreviewProvider {
    // .constant: Creates a binding with an immutable value.
    static var previews: some View {
        BasicTextImageRow(restaurant: .constant(Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "22 Charlwood Street London SW1V 2DY Pimlico", phone: "432-344050", description: "With kitchen serving gourmet burgers. We offer food every day of the week, Monday through to Sunday. Join us every Sunday from 4:30 – 7:30pm for live acoustic music!", image: "cask", isFavorite: false)))
            .padding()
    }
}
