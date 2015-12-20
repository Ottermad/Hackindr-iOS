//
//  ViewIdeaViewController.swift
//  Hackinder
//
//  Created by Charlie Thomas on 20/12/2015.
//  Copyright (c) 2015 Charlie Thomas. All rights reserved.
//

import Foundation
//
//  ViewController.swift
//  Hackinder
//
//  Created by Charlie Thomas on 19/12/2015.
//  Copyright (c) 2015 Charlie Thomas. All rights reserved.
//

import UIKit

class ViewIdeaViewController: UIViewController {
    @IBOutlet var titleField: UILabel!
    @IBOutlet var contentField: UILabel!
    var ideaTitle : String?
    var content : String?
    /*@IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBAction func loginButtonPress(sender: AnyObject) {
        let url = NSURL(string: "http://70e6ceb0.ngrok.io/token")
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let userPasswordString = "test@example.com:password"
        let userPasswordData = userPasswordString.dataUsingEncoding(NSUTF8StringEncoding)
        let base64EncodedCredential = userPasswordData!.base64EncodedStringWithOptions(nil)
        let authString = "Basic \(base64EncodedCredential)"
        config.HTTPAdditionalHeaders = ["Authorization" : authString]
        let session = NSURLSession(configuration: config)
        
        var running = false
        let task = session.dataTaskWithURL(url) {
            (let data, let response, let error) in
            if let httpResponse = response as? NSHTTPURLResponse {
                //let dataString = NSString(data: data, encoding: NSUTF8StringEncoding)
                if let json: NSDictionary = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary {
                    println(json["token"])
                }
            }
            running = false
        }
        
        running = true
        task.resume()
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.text = ideaTitle!;
        if content != nil {
            contentField.text = content!;
            println(content)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

