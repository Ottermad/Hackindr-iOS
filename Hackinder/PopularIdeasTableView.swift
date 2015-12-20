//
//  PopularIdeasTableView.swift
//  Hackinder
//
//  Created by Charlie Thomas on 19/12/2015.
//  Copyright (c) 2015 Charlie Thomas. All rights reserved.
//

import UIKit

class PopularIdeasTableView: UITableViewController {
    var ideas : [String]?
    var tappedSubject : String = ""
    var ideasDict = [String: String]()
    
    
    // MARK: - UITableViewDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let length = ideas?.count {
            return length
        }
        return 0;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("IdeaCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = ideas![indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ideas = []
        let url = NSURL(string: "http://70e6ceb0.ngrok.io/ideas/top")
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
                    if let items = json["ideas"] as? NSArray {
                        println(items)
                        for item in items {
                            var title = item["title"] as String;
                            var id = item["content"] as String;
                            println(id)
                            self.ideas!.append(title);
                            self.ideasDict[title] = id;
                            self.tableView.reloadData()
                        }
                    }
                }

            }
            running = false
        }
        
        running = true
        task.resume()

        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //CODE TO BE RUN ON CELL TOUCH
        self.tappedSubject = ideas![indexPath.item]
        println("SUBJECT")
        println(self.ideasDict[self.tappedSubject])
        self.performSegueWithIdentifier("viewIdea", sender: self)

        //self.performSegueWithIdentifier("openNotes", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "viewIdea" {
            let notesViewController = segue.destinationViewController as ViewIdeaViewController
            println(self.ideasDict[self.tappedSubject])
            notesViewController.content = self.ideasDict[self.tappedSubject]
            notesViewController.ideaTitle = self.tappedSubject
        }
    }
    
    
    
    
}