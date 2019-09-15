//
//  ViewController.swift
//  Bip The Guy
//
//  Created by Richard Jove on 9/15/19.
//  Copyright © 2019 Richard Jove. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var imageToPunch: UIImageView!
    
    var audioPlayer = AVAudioPlayer()
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //MARK: Functions
    
    func animateImage() {
        let bounds = self.imageToPunch.bounds
        let shrinkValue: CGFloat = 60 //If you don't change the type to CGFloat, you'll get an error. 
        
        // shrink our imageToPunch by 60 pixels
        self.imageToPunch.bounds = CGRect(x: self.imageToPunch.bounds.origin.x + shrinkValue, y: self.imageToPunch.bounds.origin.y + shrinkValue, width: self.imageToPunch.bounds.size.width - shrinkValue, height: self.imageToPunch.bounds.size.height - shrinkValue)
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: {self.imageToPunch.bounds = bounds}, completion: nil)
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        //Can we load in the file soundName?
        if let sound = NSDataAsset(name: soundName) {
            //Check if data sound.data is a sound file
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                //if sound.data is not a valid audio file
                print("ERROR: data in \(soundName) couldn't be played as a sound.")
            }
        } else {
            //If reading in the NSDataAsset didn't work, tell the developer to report the error.
            print("ERROR: file \(soundName) didn't load")
        }
    }
    
    // MARK: Actions


    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        animateImage()
        playSound(soundName: "punchSound", audioPlayer: &audioPlayer)
    }
    
    @IBAction func cameraPressed(_ sender: UIButton) {
    }
    
    @IBAction func libraryPressed(_ sender: UIButton) {
        
    }
}

