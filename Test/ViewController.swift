//
//  ViewController.swift
//  Test
//
//  Created by 洋洋 on 2019/3/20.
//  Copyright © 2019年 洋洋. All rights reserved.
//

import UIKit
import LeanCloud
import AVOSCloud


class ViewController: UIViewController {

    
    @IBOutlet weak var URL: UILabel!
    
    @IBAction func button(_ sender: UIButton) {
        
        //获取对象
        let todo = LCObject(className: "Todo") 

        
        let query = LCQuery(className: "Todo")
        let _ = query.get("5c93475d8d6d81006f3e85d5") { (result) in
            switch result {
            case .success(object: let object):
                // handle object
                print()
                print(String(describing: object.objectId?.stringValue))
                print("String(describing: object.objectId?.stringValue)")
                break
            case .failure(error: let error):
                // handle error
                print("objectId?.stringValue error")
                break
            }
        }

        let object = LCObject(className: "Todo", objectId: "5c93475d8d6d81006f3e85d5")
        let _ = object.fetch { (result) in
            switch result {
            case .success:
                // handle object
                break
            case .failure(error: let error):
                // handle error
                break
            }
        }

//获取 objectId

//        do {
//            let todo = LCObject(className: "Todo")
//            try todo.set("title", value: "meeting")
//            try todo.set("content", value: "monday,14:00")
//            try todo.set("location", value: "room")
//            let _ = todo.save { (result) in
//                switch result {
//                case .success:
//                    // handle object
//                    print(String(describing: todo.objectId?.stringValue))
//                    print("//////////")
//                    break
//                case .failure(error: let error):
//                    // handle error
//                    break
//                }
//            }
//        } catch {
//            // handle error
//        }
        
        
        
        //访问对象的属性
//        let query2 = LCQuery(className: "Todo")
        let _ = query.get("5c93475d8d6d81006f3e85d5") { (result) in
            switch result {
            case .success(object: let object):
                // get value by string key
                let title = object.get("title")
//                print(title)
                let url = object.get("url")?.lcValue.jsonValue
                    print("url url url")
                    print(url!)
                    print("url url url")
                self.URL.text = url as! String
                
                // get property
                let objectId = object.objectId
                let updatedAt = object.updatedAt
                let createdAt = object.createdAt
    
            case .failure(error: let error):
                // handle error
                break
            }
        }
        
        
    }
    
    @IBAction func Post(_ sender: UIButton) {
        
        let post = LCObject(className: "Post")
        
        try? post.set("words", value: "Hello World!")
        
        _ = post.save { result in
            switch result {
            case .success:
                
                print()
                print("postpostpost")

                break
            case .failure(let error):
                break
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


}
