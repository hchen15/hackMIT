//
//  SecondViewController.swift
//  hackMIT
//
//  Created by Hannah Chen on 9/17/17.
//  Copyright © 2017 Hannah Chen. All rights reserved.
//

import UIKit
import SwiftyJSON


class SecondViewController: UIViewController {
    var foodImageURL = URL(string: "")
    
    @IBOutlet weak var indicator: NSLayoutConstraint!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var foodImage: UIImageView!
    
    
    @IBAction func backButton(_ sender: UIButton) {
        performSegue(withIdentifier: "backSegue", sender: self)
    }
    override func viewDidLoad() {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        
        let word = correctSpelling(word: foodName, lang: "en-US")
        label.text = word
        getImageURL(query: word)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getImageURL(query: String){
        
        let group = DispatchGroup()
        group.enter()
        
        DispatchQueue.main.async {
            RestApiManager.sharedInstance.getFoodImage (url: "v1?key=AIzaSyC8_wiEfInjnwYHyDkTeLTeffwPl0PyEtU&cx=015355424676736350578:k4rs93-sg0w&q=" + query + "&searchType=image&imgType=photo&num=1"){ (json: JSON) in
                if let results = json["items"].array {
                    let photoString = results[0]["link"].stringValue
                    self.foodImageURL = URL(string: photoString)
                    group.leave()
                }
            }
            
        }
        
        // does not wait. But the code in notify() is run
        // after enter() and leave() calls are balanced
        
    
        group.notify(queue: .main) {
            self.setImage()
        }
        
        
    }
    
    func setImage(){
        
        let data = try? Data(contentsOf: self.foodImageURL!)
        let img = UIImage(data: data!)
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let resizedImage = resizeImage(image: img!, newWidth: screenWidth)
        foodImage.image = resizedImage
        foodImage.contentMode = UIViewContentMode.center
        
    }
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth,height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    func textToImage(drawText text: NSString, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        let textColor = UIColor.black
        let textFont = UIFont(name: "Helvetica", size: 12)!

        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)

        let textFontAttributes = [
            NSFontAttributeName: textFont,
            NSForegroundColorAttributeName: textColor,
            ] as [String : Any]
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))

        let rect = CGRect(origin: point, size: image.size)
        text.draw(in: rect, withAttributes: textFontAttributes)

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    func correctSpelling(word: String, lang: String) -> String{
        let textchecker = UITextChecker()
        let range = textchecker.rangeOfMisspelledWord(in : word, range: NSRange(location: 0, length: word.characters.count), startingAt: 0, wrap: false, language: lang )
        if range.length != 0{
            if let guesses = textchecker.guesses(forWordRange: range, in: word, language: lang){
                return guesses[0]
            }
            
        }
        return word
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
