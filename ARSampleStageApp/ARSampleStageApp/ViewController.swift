//
//  ViewController.swift
//  ARSampleStageApp
//
//  Created by 尾原徳泰 on 2020/09/04.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // デリゲートの設定
        sceneView.delegate = self
        
        // シーンを作成して登録
        sceneView.scene = SCNScene()
        
        // 特徴点を表示する
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        // 原点座標を表示
//        sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin]
        // ライトを追加する
        sceneView.autoenablesDefaultLighting = true
        // 平面検出
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration)
    }
    
    // MARK: - 平面が検出された時にフィールドを原点座標に表示する
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        // ファイルからシーンを読み込む
        let field = SCNScene(named: "art.scnassets/field.scn")
        // シーンからノードを検索
        let fieldNode = (field?.rootNode.childNode(withName: "field", recursively: false))!
        // 検出面の子要素にする
        node.addChildNode(fieldNode)
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
