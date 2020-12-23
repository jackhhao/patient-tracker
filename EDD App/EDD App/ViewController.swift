//
//  ViewController.swift
//  EDD App
//
//  Created by Arya Tschand on 12/21/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderChange(_ sender: Any) {
        getLeader(value2: String(Int(slider.value)))
    }
    
    func getLeader(value2: String) {
        printMessagesForUser(parameters: value2) {
                (returnval, error) in
                if (returnval)!
                {
                    DispatchQueue.main.async {
                    }
                } else {
                    print(error)
                }
            }
            DispatchQueue.main.async { // Correct
            }
        }
        
        func printMessagesForUser(parameters: String, CompletionHandler: @escaping (Bool?, Error?) -> Void){
            do {
                let url = NSURL(string: "http://192.168.87.188:5000/?usage=input&distance=" + parameters)!
                let request = NSMutableURLRequest(url: url as URL)
                request.httpMethod = "Get"
                
                request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
                print(request)
                let task = URLSession.shared.dataTask(with: request as URLRequest){ data, response, error in
                    if let returned = String(data: data!, encoding: .utf8) {
                                        print(returned)
                    }
                }
                task.resume()
            } catch {
                
                print(error)
            }
        }
    
}

