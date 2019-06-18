//
//  EmotionRecordDetail.swift
//  EmotionalDiary
//
//  Created by Italo Boss on 12/06/19.
//  Copyright © 2019 Italo Boss. All rights reserved.
//

import SwiftUI

struct EmotionRecordDetail : View {
    var emotion: EmotionRecord
    
    var body: some View {
        Text("Hello")
    }
}

#if DEBUG
struct EmotionRecordDetail_Previews : PreviewProvider {
    static var previews: some View {
        EmotionRecordDetail(emotion: EmotionRecord(id: 1, situation: "A", feelings: [.happiness], thoughts: "B", result: "C", creationDate: Date()))
    }
}
#endif
