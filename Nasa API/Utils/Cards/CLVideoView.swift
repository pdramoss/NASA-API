//
//  CLVideoView.swift
//  Nasa API
//
//  Created by Pedro Ramos on 13/09/20.
//  Copyright © 2020 Pedro Ramos. All rights reserved.
//

import SwiftUI
import UIKit
import AVFoundation
import AVKit

struct CLVideoView: UIViewControllerRepresentable {
    var url: String
    init(url: String) {
        self.url = url
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CLVideoView>) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        let player1 = AVPlayer(url: URL(string: url)!)
        controller.player = player1
        return controller
    }
    
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<CLVideoView>) {
        
    }
}
