//
//  ViewController.swift
//  hackMIT
//
//  Created by Hannah Chen on 9/16/17.
//  Copyright © 2017 Hannah Chen. All rights reserved.
//

import UIKit
import SwiftyJSON

var foodName = ""

class ViewController: UIViewController, FrameExtractorDelegate{
    var frameExtractor: FrameExtractor!
    
    
    @IBOutlet weak var bottomText: UILabel!
    @IBAction func testSwitchScreens(_ sender: UIButton) {
        performSegue(withIdentifier: "segue", sender: self)
    }
    @IBOutlet weak var imageView: UIImageView!

    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureREcognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureREcognizer)
        frameExtractor = FrameExtractor()
        frameExtractor.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func captured(image: UIImage) {
        imageView.image = image
        
    }
    
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        frameExtractor.touched()
    }
}

