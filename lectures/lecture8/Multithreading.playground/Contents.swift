import UIKit
import PlaygroundSupport

// Multithreading is mostly about “queues” in iOS

/*
 Serial queue sample
 
      Handler
        {}
       ____
        {}
        {}
        {}
 */

/*
 Concurrent queue sample
 
    Handler 1   Handler 2   ...
        {}         {}
       ____       ____
             {}
             {}
             {}
 */

// Getting a queue

// Getting the main queue (where all UI activity must occur).
let mainQueue = DispatchQueue.main

// Getting a global, shared, concurrent “background” queue.
// This is almost always what you will use to get activity off the main queue.
let backgroundQueue = DispatchQueue.global(qos: .background)

// Types of global queues:
DispatchQoS.userInteractive // high priority, only do something short and quick
DispatchQoS.userInitiated // high priority, but might take a little bit of time
DispatchQoS.background // not directly initiated by user, so can run as slow as needed // long-running background processes, low priority
DispatchQoS.utility // long-running background processes, low priority

// Put closure insude queue
backgroundQueue.sync { print("backgroundQueue.sync") }
backgroundQueue.async { print("backgroundQueue.async") }

// Your own serial queue (use this only if you have multiple, serially dependent activities) ...
let serialQueue = DispatchQueue(label: "MySerialQ")

// Your own concurrent queue (rare that you would do this versus global queues) ...
let concurrentQueue = DispatchQueue(label: "MyConcurrentQ", attributes: .concurrent)



let session = URLSession(configuration: .default)
if let url = URL(string: "http://www.effigis.com/wp-content/uploads/2015/02/DigitalGlobe_WorldView2_50cm_8bit_Pansharpened_RGB_DRA_Rome_Italy_2009DEC10_8bits_sub_r_1.jpg") {
    let task = session.dataTask(with: url) { (data: Data?, response, error) in
        let image = UIImage(data: data!)
        DispatchQueue.main.async {
           // set the image to the UIImageView
            print("inside data task in main queue")
        }
        print("inside data task")
    }
    task.resume()
}

 print("end")

PlaygroundPage.current.needsIndefiniteExecution = true
