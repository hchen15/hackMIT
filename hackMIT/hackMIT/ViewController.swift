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
    
    @IBOutlet weak var bottomText: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        frameExtractor = FrameExtractor()
        frameExtractor.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func captured(image: UIImage) {
        imageView.image = image
//        imageView.image = textToImage(drawText: "Test", inImage: image, atPoint: CGPoint(x: 50, y: 50))
        
    }
    
//    func textToImage(drawText text: NSString, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
//        let textColor = UIColor.white
//        let textFont = UIFont(name: "Helvetica Bold", size: 12)!
//        
//        let scale = UIScreen.main.scale
//        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
//        
//        let textFontAttributes = [
//            NSFontAttributeName: textFont,
//            NSForegroundColorAttributeName: textColor,
//            ] as [String : Any]
//        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
//        
//        let rect = CGRect(origin: point, size: image.size)
//        text.draw(in: rect, withAttributes: textFontAttributes)
//        
//        let newImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        
//        return newImage!
//    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        var touchPoint = touches.first as! UITouch
//        var screenSize = imageView.bounds.size
//        var focusPoint = CGPoint(x: touchPoint.locationInView(videoView).y / screenSize.height, y: 1.0 - touchPoint.locationInView(videoView.x / screenSize.width)
//        
//        if let device = cameraDevice {
//            if(device.lockForConfiguration(nil)) {
//                if device.focusPointOfInterestSupported {
//                    device.focusPointOfInterest = focusPoint
//                    device.focusMode = AVCaptureFocusMode.AutoFocus
//                }
//                if device.exposurePointOfInterestSupported {
//                    device.exposurePointOfInterest = focusPoint
//                    device.exposureMode = AVCaptureExposureMode.AutoExpose
//                }
//                device.unlockForConfiguration()
//            }
//        }
//    }
}

