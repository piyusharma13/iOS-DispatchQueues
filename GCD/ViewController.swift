//
//  ViewController.swift
//  GCD
//
//  Created by Piyush Sharma on 18/09/18.
//  Copyright © 2018 Piyush Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let inactiveQueue = inactiveQueues()
        
        for i in 0...10
        {
            print("😈 count: \(i)")
        }
        
        inactiveQueue.activate()
        
//        concurrentQueues()
//        globalQueue()
//        queuesWithQOS2()
//        queuesWithQOS1()
//        normalQueues()
    }
    
    func inactiveQueues() -> DispatchQueue
    {
        let queue1 = DispatchQueue.init(label: "com.DC.queue", qos: .utility, attributes: .initiallyInactive)
        
        queue1.async {
            for i in 0...10
            {
                print("🤑 count: \(i)")
            }
        }
        
        queue1.async {
            for test in 200..<210
            {
                print("😈 count: \(test)")
            }
        }
        
        queue1.async {
            for o in 100..<110
            {
                print("🤠 count: \(o)")
            }
        }
        
        return queue1
        
    }
    
    func concurrentQueues()
    {
        let queue1 = DispatchQueue.init(label: "com.DC.queue", qos: .utility, attributes: .concurrent)
        
        queue1.async {
            for i in 0...10
            {
                print("🤑 count: \(i)")
            }
        }
        
        queue1.async {
            for test in 200..<210
            {
                print("😈 count: \(test)")
            }
        }
        
        queue1.async {
            for o in 100..<110
            {
                print("🤠 count: \(o)")
            }
        }
        
    }
    
    func globalQueue()
    {
        let queue2 = DispatchQueue.main
    
        queue2.async {
            for o in 100..<110
            {
                print("🤠 count: \(o)")
            }
        }
        
    }
    
    func queuesWithQOS1()
    {
        let queue1 = DispatchQueue.init(label: "com.DC.queue1", qos: .userInteractive)
        let queue2 = DispatchQueue.init(label: "com.DC.queue2", qos: .userInteractive)

        queue1.async {
            for i in 0...10
            {
                print("🤑 count: \(i)")
            }
        }
        
        queue2.async {
            for o in 100..<110
            {
                print("🤠 count: \(o)")
            }
        }
        
    }
 
    func queuesWithQOS2()
    {
        let queue1 = DispatchQueue.init(label: "com.DC.queue3", qos: .userInteractive)
        let queue2 = DispatchQueue.init(label: "com.DC.queue4", qos: .userInitiated)
        
        queue2.async {
            for i in 0...10
            {
                print("🤑 count: \(i)")
            }
        }
        
        queue1.async {
            for o in 100..<110
            {
                print("🤠 count: \(o)")
            }
        }
        
    }
    
    func normalQueues()
    {
        let queue = DispatchQueue.init(label: "com.DC.queue0")
        
        queue.async {
            for i in 0...10
            {
                print("🤑 count: \(i)")
            }
        }
        
        queue.async {
            for o in 100..<110
            {
                print("🤠 count: \(o)")
            }
        }
        
        for test in 200..<210
        {
            print("😈 count: \(test)")
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

