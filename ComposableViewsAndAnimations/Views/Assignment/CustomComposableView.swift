//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

import SwiftUI

struct CustomComposableView: View {
            
            
    var fillToValue: CGFloat
    
    @State private var completedAmount: CGFloat = 0.0
    
    @State private var useAnimation = false

    let timer = Timer.publish(every: 0.11, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack{
       
            Spacer()
                HStack{
    
            Spacer()
                    
                }
        ZStack{
            
                
          
                
            Rectangle()
                .trim(from: 0, to: completedAmount)
                              .fill(Color.red)
                              .frame(width: 100, height: (geometry.size.height) - 44, alignment: .center)
                            // Offset is moves the opaque rectangle up
                               
                .onReceive(timer) { _ in
                    
                    // stop when completion amount reaches the fill to value
                    
                    guard completedAmount <
                            fillToValue / 100.0 else
                    {return}
                    
                    withAnimation(.linear(duration: 0.03)) {
                        completedAmount += fillToValue / 100.0 / 100.0
                    }
                    
                }
            
            Text("\(String(format: "%3.0f", (completedAmount) * 100.0))%")
                .font(Font.custom("Courier-Bold", size: 24.0))
                .animation(.linear(duration: 0.03))
        }
         
        }
            Spacer()
    }
    Spacer()
    }
}
struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView(fillToValue: 25)
    }
}
