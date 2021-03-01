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
                    
                    Text("Description")
                        .font(.title2)
                        .bold()
                        .padding(.top)
                    
                    Text("""
                        Replace this with a description of how to use this view.

                        If the view accepts a parameter, provide a control to enter the input below.
                        """)
                
                    Slider(value: $percentComplete, in: 0...100, step: 1.0) {
                        Text("Completion amount")
                    }
                }
                .padding(.bottom)
                
            }
            
            NavigationLink(destination: CustomComposableView(fillToValue: percentComplete)) {
                SimpleListItemView(title: "My Composable View",
                                   caption: "A brief description of my view")
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
