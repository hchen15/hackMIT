//
//  ViewController.swift
//  hackMIT
//
//  Created by Hannah Chen on 9/16/17.
//  Copyright © 2017 Hannah Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FrameExtractorDelegate{
    var frameExtractor: FrameExtractor!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        frameExtractor = FrameExtractor()
        // Do any additional setup after loading the view, typically from a nib.
        frameExtractor.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func captured(image: UIImage) {
        imageView.image = image
    }
}

