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
            Text(emotion.feeling.image)
                .font(.largeTitle)
            VStack(alignment: .leading) {
                Text(emotion.situation)
                Text(emotion.thoughts)
                    .fontWeight(.thin)
            }
        }
    }
}

#if DEBUG
struct EmotionRecordRow_Previews : PreviewProvider {
    static var previews: some View {
        EmotionRecordRow(emotion: EmotionRecord(id: 1, situation: "Something", feeling: .happiness, thoughts: "Some", result: "C", creationDate: Date()))
        .previewLayout(.sizeThatFits)
    }
}
#endif
