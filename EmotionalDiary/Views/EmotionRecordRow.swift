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
            Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
            
        }
    }
}

#if DEBUG
struct EmotionRecordRow_Previews : PreviewProvider {
    static var previews: some View {
        EmotionRecordDetail(emotion: EmotionRecord(id: 1, situation: "Abc", feelings: [.happiness], thoughts: "Cde", result: "Fgh"))
    }
}
#endif
