//
//  ViewController.swift
//  weatherApp
//
//  Created by JAMES IKELER on 8/6/17.
//  Copyright © 2017 JAMES IKELER. All rights reserved.
//

import UIKit
import UICircularProgressRing
import SVProgressHUD

class ViewController: UIViewController {

    
    @IBOutlet var temperatureProgressBar: UICircularProgressRingView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        SVProgressHUD.show(withStatus: "Loading...")
        getTemp();
    }
    
    func getTemp() {

        
        URLSession.shared.dataTask(with: URL(string:"http://10.0.1.146:8080/temp")!, completionHandler: { data,response,error -> Void in
        
            if error == nil && data != nil {
                let datastring = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
    
                print("test:\(datastring!.floatValue)")
                
                let temp = datastring!.floatValue * 9/5 + 32
                DispatchQueue.main.async {
                    self.temperatureProgressBar.value = CGFloat(temp)
                    SVProgressHUD.dismiss()
                }
            } else {
                print(error?.localizedDescription)
            }
            
        }).resume()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

