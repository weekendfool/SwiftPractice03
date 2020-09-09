//
//  ViewController.swift
//  ARTouchSampleApp
//
//  Created by 尾原徳泰 on 2020/09/08.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
       sceneView.scene = SCNScene()
    
        sceneView.autoenablesDefaultLighting = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapGgesture(_:)))
        sceneView.addGestureRecognizer(gesture)
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    @objc func tapGgesture(_ recognizer: UITapGestureRecognizer) {
        // カメラ座標系で30cm前
        let infrontOfCamera = SCNVector3(x: 0, y: 0, z: -0.3)
        
        // カメラ座標系 -> ワールド座標系
        guard let cameraNode = sceneView.pointOfView else { return }
        let pointInWorld = cameraNode.convertPosition(infrontOfCamera, to: nil)
        print("===============================================")
        print("pointInWorld:\(pointInWorld)")
        // ワールド座標系　-> スクリーン座標系
        var screenPos = sceneView.projectPoint(pointInWorld)
        print("screenPos:\(screenPos)")
        
        // スクリーン座標系でx, y座標のみ変換
         let finger = recognizer.location(in: nil)
        screenPos.x = Float(finger.x)
        screenPos.y = Float(finger.y)
        
        // ワールド座標に戻す
        let finalPosition = sceneView.unprojectPoint(screenPos)
        
        // nodeをおく
        let airPlaneNode = airPlane
        airPlaneNode.position = finalPosition
        sceneView.scene.rootNode.addChildNode(airPlaneNode)
        
        
    }
    private let airPlane: SCNNode = {
        let scene = SCNScene(named: "art.scnassets/ship.scn")
        let node = scene?.rootNode
        node?.scale = SCNVector3(0.2, 0.2, 0.2)
        return node!
    }()

    @IBAction func tappedButton(_ sender: Any) {
//        // カメラ座標系で30cm前
//        let infrontOfCamera = SCNVector3(x: 0, y: 0, z: -0.3)
//
//        // カメラ座標系 -> ワールド座標系
//        guard let cameraNode = sceneView.pointOfView else { return }
//        let pointInWorld = cameraNode.convertPosition(infrontOfCamera, to: nil)
//        print("===============================================")
//        print("pointInWorld:\(pointInWorld)")
//        // ワールド座標系　-> スクリーン座標系
//        var screenPos = sceneView.projectPoint(pointInWorld)
//        print("screenPos:\(screenPos)")
//
//        // スクリーン座標系でx, y座標のみ変換
        
    }
    
    
    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
