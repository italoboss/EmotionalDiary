//
//  EmotionRecordFeeling.swift
//  EmotionalDiary
//
//  Created by Italo Boss on 13/06/19.
//  Copyright © 2019 Italo Boss. All rights reserved.
//

import SwiftUI

struct EmotionRecordFeeling : View {
    @State var feeling: String
    
    var body: some View {
        NavigationView {
            VStack {
                TextField($feeling, placeholder: Text("Tell us"))
                
                Spacer()
                
                HStack {
                    Spacer()
                    FormButton()
                }
                .padding(12)
            }
            .padding(20)
            .navigationBarTitle(Text("How do you felt?"))
        }
    }
}

#if DEBUG
struct EmotionRecordFeeling_Previews : PreviewProvider {
    static var previews: some View {
        EmotionRecordFeeling(feeling: "")
    }
}
#endif

struct FormButton : View {
    var body: some View {
        return Button(action: {
            print("Button")
        }) {
            Text("Continue")
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 12)
        .accentColor(Color.white)
        .background(Color.primary)
        .cornerRadius(50)
}
}
