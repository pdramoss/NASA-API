//
//  APODDetailContentView.swift
//  Nasa API
//
//  Created by Pedro Ramos on 13/09/20.
//  Copyright © 2020 Pedro Ramos. All rights reserved.
//

import SwiftUI

struct APODDetailContentView: View {
    @State var entity: EntityAPOD
    var body: some View {
        VStack {
            CLCard(title: entity.title, explanation: entity.explanation)
            CLImage(withURL: entity.url)
            Spacer()
        }.background(Theme.BaseColor.backgrounsSecondary.color.edgesIgnoringSafeArea(.all))
    }
}

struct APODDetailContentView_Previews: PreviewProvider {
    static var previews: some View {
        APODDetailContentView(entity: EntityAPOD(copyright: nil, date: "2020-09-09", explanation: "", mediaType: .image, serviceVersion: "v1", title: "", url: "", hdurl: nil))
    }
}
