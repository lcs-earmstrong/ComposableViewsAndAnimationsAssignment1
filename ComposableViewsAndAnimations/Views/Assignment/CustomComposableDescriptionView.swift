//
//  CustomComposableDescriptionView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI

struct CustomComposableDescriptionView: View {
    
    // MARK: Stored properties
    @State private var percentComplete: CGFloat = 50.0
    
    // MARK: Computed properties
    var body: some View {
        
        List {
            
            VStack(alignment: .leading) {
                
                Group {
                    
                    Text("What is your body battery")
                        .font(.title2)
                        .bold()
                        .padding(.top)
                    
                    Text("Slide the bar and it will show you what percentage you are at")
                
                    Slider(value: $percentComplete, in: 0...100, step: 1.0) {
                        Text("Completion amount")
                    }
                }
                .padding(.bottom)
                
            }
            
            NavigationLink(destination: CustomComposableView(fillToValue: percentComplete)) {
                SimpleListItemView(title: "My Composable View",
                                   caption: "How much energy do you have right now")
            }
            
        }
        .padding()
        .navigationTitle("My Composable View")
        
    }
}

struct CustomComposableDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomComposableDescriptionView()
        }
    }
}
