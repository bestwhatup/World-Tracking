//
//  ViewController.swift
//  World Tracking
//
//  Created by Chawatvish Worrapoj on 10/12/2560 BE.
//  Copyright © 2560 Chawatvish Worrapoj. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView:ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints,
                                  ARSCNDebugOptions.showWorldOrigin]
        sceneView.session.run(configuration, options: .removeExistingAnchors)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func addNode(_ sender:UIButton) {
        //Add the box.
        let node = SCNNode()
        //Change the box size.
        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        //Change the box color.
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        //Change the box position.
        node.position = SCNVector3(0, 0, -0.3)
        //Add the box into scene.
        sceneView.scene.rootNode.addChildNode(node)
    }
    
    @IBAction func reset(_ sender: UIButton) {
        restartSession()
    }
    
    func restartSession() {
        //Pause the scene session.
        sceneView.session.pause()
        //Loop child node from parent
        sceneView.scene.rootNode.enumerateChildNodes
            { (node, _) in
                node.removeFromParentNode()
        }
        //Recreate scene session
        sceneView.session.run(configuration, options: [.resetTracking,.removeExistingAnchors])
    }
    
    
}

