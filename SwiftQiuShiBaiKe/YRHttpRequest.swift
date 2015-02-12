

import UIKit
import Foundation




class YRHttpRequest: NSObject {

    override init()
    {
        super.init();
    }
    
    class func requestWithURL(urlString:String,completionHandler:(data:AnyObject)->Void)
    {
        var URL = NSURL(string: urlString)
        println("\(URL)")
        var req = NSURLRequest(URL: URL!)
        var queue = NSOperationQueue();
        NSURLConnection.sendAsynchronousRequest(req, queue: queue, completionHandler: { response, data, error in
            if error != nil
            {
                dispatch_async(dispatch_get_main_queue(),
                {
                    println(error)
                    completionHandler(data:NSNull())
                })
            }
            else
            {
                let jsonData = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary

                dispatch_async(dispatch_get_main_queue(),
                {
                    completionHandler(data:jsonData)
                    
                })
            }
        })
    }
    
    
    
}
