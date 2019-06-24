//
//  EmotionRecordFeeling.swift
//  EmotionalDiary
//
//  Created by Italo Boss on 13/06/19.
//  Copyright © 2019 Italo Boss. All rights reserved.
//

import SwiftUI

struct EmotionRecordFeeling : View {
    @State private var emotion = EmotionRecord(id: Int.random(in: 1...100), situation: "Test situation", feeling: .happiness, thoughts: "", result: "", creationDate: Date())
    
    @State private var selectedFeeling = EmotionRecord.Feeling.happiness.rawValue
    private var feelings = EmotionRecord.Feeling.allCases
    
    var body: some View {
        NavigationView {
            VStack(spacing: 12.0) {
                
                SegmentedControl(selection: $selectedFeeling) {
                    ForEach(0..<feelings.count) { index in Text(self.feelings[index].image).tag(self.feelings[index].rawValue)
                    }
                }
                
                TextField($emotion.situation, placeholder: Text("Tell us"))
                
                Spacer()
                
                HStack {
                    Spacer()
                    FormButton {
                        print("---->", self.emotion)
                    }
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
        EmotionRecordFeeling()
    }
}
#endif

struct FormButton : View {
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            print("Button")
            self.action()
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
