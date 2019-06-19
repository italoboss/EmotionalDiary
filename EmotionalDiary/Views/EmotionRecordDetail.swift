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
        VStack(alignment: .leading, spacing: 12.0) {
            HStack {
                Spacer()
                Text(emotion.feeling.image)
                    .font(.system(size: 100))
                Spacer()
            }
            
            Text(emotion.situation)
                .lineLimit(0)
                .font(.title)
            
            Text("My thoughts were")
                .fontWeight(.thin)
                .multilineTextAlignment(.leading)
                .padding(.top)
            
            Text(emotion.thoughts)
                .lineLimit(0)
            
            Text("So...")
                .fontWeight(.thin)
                .multilineTextAlignment(.leading)
                .padding(.top)
            
            Text(emotion.result)
                .lineLimit(0)
            
            Spacer()
        }
        .padding([.leading, .bottom, .trailing])
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

#if DEBUG
struct EmotionRecordDetail_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView {
            EmotionRecordDetail(emotion: EmotionRecord(id: 1, situation: "Something happen and then other something happen ", feeling: .surprising, thoughts: "OMG!!!", result: "I guess that it was good for me, because this and that, and that too. I guess that it was bad for me, because this and that, and that too.", creationDate: Date()))
        }
    }
}
#endif
