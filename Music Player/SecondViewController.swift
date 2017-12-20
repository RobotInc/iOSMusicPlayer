//
//  SecondViewController.swift
//  Music Player
//
//  Created by Rajeev Sharma on 18/09/17.
//  Copyright © 2017 Rajeev Sharma. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    @IBAction func pause(_ sender: Any) {
        
        if audioPlayer.isPlaying
        {
            audioPlayer.pause()
        }
    }
    @IBAction func play(_ sender: Any) {
        if audioPlayer.isPlaying == false{
            audioPlayer.play()
        }
    }
    
    @IBAction func prev(_ sender: Any) {
        if thisSong > 0 {
            playThis(thisOne: songs[thisSong-1])
            thisSong -= 1
            label.text = songs[thisSong]
        }
        else{
            //
        }
    }
    
    @IBAction func next(_ sender: Any) {
        if thisSong < songs.count-1 {
        
        playThis(thisOne: songs[thisSong+1])
        thisSong += 1
        label.text = songs[thisSong]
        
        }
        else{
            //
        }
    }
    @IBAction func slider(_ sender: UISlider) {
        audioPlayer.volume = sender.value
    }
    
    func playThis(thisOne : String) {
        do
        {
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath : audioPath!) as URL )
            
            audioPlayer.play()
            
        }
        catch
        {
            print("Error")
        }    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text = songs[thisSong]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

