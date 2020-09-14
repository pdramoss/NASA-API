//
//  CLImage.swift
//  Nasa API
//
//  Created by Pedro Ramos on 13/09/20.
//  Copyright © 2020 Pedro Ramos. All rights reserved.
//

import SwiftUI
import Combine

class CLImageLoader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}

struct CLImage: View {
    @ObservedObject var imageLoader: CLImageLoader
    @State var image: UIImage = UIImage()
    
    init(withURL url:String) {
        imageLoader = CLImageLoader(urlString:url)
    }
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(minWidth: 150, maxWidth: .infinity, minHeight: 100, maxHeight: 350, alignment: .center)
            .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
        }
    }
}

struct CLImage_Previews: PreviewProvider {
    static var previews: some View {
        CLImage(withURL: "https://apod.nasa.gov/apod/image/2009/M2D9_HubbleSchmidt_985.jpg")
    }
}
