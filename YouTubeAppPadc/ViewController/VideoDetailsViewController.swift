//
//  VideoDetailsViewController.swift
//  YouTubeAppPadc
//
//  Created by Theint Su on 15/3/23.
//

import UIKit
import AVKit

class VideoDetailsViewController: UIViewController {

    @IBOutlet weak var viewContainerVideoPlayer: UIView!
    
    @IBOutlet weak var ivBack: UIImageView!
    
    let avPlayerController = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpVideoPlayer()
        
        initGestureRecognizers()
        
    }
    
    @objc func  onTapNext(){
        navigationController?.popViewController(animated: true)
        
        dismiss(animated: true)
    }

    private func initGestureRecognizers(){
        
        
        let tapGestureForBack = UITapGestureRecognizer(target: self, action: #selector(onTapNext))
        ivBack.isUserInteractionEnabled = true
        ivBack.addGestureRecognizer(tapGestureForBack)
        

    }
    
    private func setUpVideoPlayer(){
        
        addChild(avPlayerController)
        
        viewContainerVideoPlayer.addSubview(avPlayerController.view)
        avPlayerController.view.translatesAutoresizingMaskIntoConstraints = false
        
        avPlayerController.view.leadingAnchor.constraint(equalTo: viewContainerVideoPlayer.leadingAnchor).isActive = true
        avPlayerController.view.trailingAnchor.constraint(equalTo: viewContainerVideoPlayer.trailingAnchor).isActive = true
        avPlayerController.view.topAnchor.constraint(equalTo: viewContainerVideoPlayer.topAnchor).isActive = true
        avPlayerController.view.bottomAnchor.constraint(equalTo: viewContainerVideoPlayer.bottomAnchor).isActive = true
        
        
        let avPlayer = AVPlayer(url: URL(string: "https://jsoncompare.org/LearningContainer/SampleFiles/Video/MP4/sample-mp4-file.mp4")!)
        
        avPlayerController.player = avPlayer
        
        avPlayer.play()
        
        
    }
    

   

}
