//
//  EmotionRecordRow.swift
//  EmotionalDiary
//
//  Created by Italo Boss on 13/06/19.
//  Copyright © 2019 Italo Boss. All rights reserved.
//

import SwiftUI

struct EmotionRecordRow : View {
    var emotion: EmotionRecord
    
    var body: some View {
        HStack {
            Text(emotion.feelings[0].image)
            VStack {
                Text("Test")
            }
        }
    }
}

#if DEBUG
struct EmotionRecordRow_Previews : PreviewProvider {
    static var previews: some View {
        EmotionRecordRow(emotion: EmotionRecord(id: 1, situation: "A", feelings: [.happiness], thoughts: "B", result: "C", creationDate: Date()))
    }
}
#endif
