//
//  EmotionsList.swift
//  EmotionalDiary
//
//  Created by Italo Boss on 18/06/19.
//  Copyright © 2019 Italo Boss. All rights reserved.
//

import SwiftUI

struct EmotionsList : View {
    
    private var emotions: [EmotionRecord] = EmotionDao.shared.getAll()
    
    var body: some View {
        NavigationView {
            List(emotions) { emotion in
                NavigationButton(destination: EmotionRecordDetail(emotion: emotion)) {
                    EmotionRecordRow(emotion: emotion)
                }
            }
            .navigationBarTitle(Text("My emotions"))
            .navigationBarItems(trailing:
                PresentationButton(Image(systemName: "plus")
                        .imageScale(.large)
                        .accessibility(label: Text("Add new emotion"))
                        .padding(),
                    destination: EmotionRecordFeeling(feeling: ""))
            )
        }
        
    }
}

#if DEBUG
struct EmotionsList_Previews : PreviewProvider {
    static var previews: some View {
        EmotionsList()
    }
}
#endif
