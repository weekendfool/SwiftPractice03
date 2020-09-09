//
//  ViewController.swift
//  ARSampleStage3App
//
//  Created by 尾原徳泰 on 2020/09/09.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    var stagePoint:SCNVector3?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // デリゲートの設定
        sceneView.delegate = self
        // シーンの作成
        sceneView.scene = SCNScene()
        
        // 特徴点を表示する
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        //　光源の設定
        sceneView.autoenablesDefaultLighting = true
        // 平面の検出
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration)
    
       
    }
    // MARK: - カメラ座標の中心座標を記録する

    @IBAction func tappedButton(_ sender: Any) {
        // 座標を決定しておく
        //　カメラ座標系で３０センチ前に
        let infrontOfCamera = SCNVector3(x: 0, y: 0, z: -0.3)
        
        //  カメラ座標系からワールド座標系に変換
        guard let cameraNode = sceneView.pointOfView else { return }
        print("-----------------------------------------------")
        print("cameraNode.camera!.zNear\(cameraNode.camera!.zNear)")
        print("cameraNode.camera!.zFar\(cameraNode.camera!.zFar)")
        let pointInWorld = cameraNode.convertPosition(infrontOfCamera, to: nil)
//        // ワールド座標からスクリーン座標へ変換
//        var screenPos = sceneView.projectPoint(pointInWorld)
        print("screenPos\(pointInWorld)")
        // scnファイルからシーンを読み込む
        let scene = SCNScene(named: "art.scnassets/field.scn")
        // シーンからノードを検索
        let fieldNode = (scene?.rootNode.childNode(withName: "field", recursively: false))!
        // 表示する座標を指定する
        fieldNode.position = pointInWorld
        // ステージを設置した座標を０としたオブジェクト座標に変換して記録
        stagePoint = cameraNode.convertPosition(infrontOfCamera, to: fieldNode)
        print("stagePoint\(stagePoint)")
        // ノードの作成
        sceneView.scene.rootNode.addChildNode(fieldNode)
    }
    // コマを表示するボタン
    @IBAction func tappedButton2(_ sender: Any) {
        // scnファイルからシーンを読み込む
        let scene = SCNScene(named: "art.scnassets/testBlue.scn")
        // シーンからノードを検索
        let blueNode = (scene?.rootNode.childNode(withName: "testBlue", recursively: false))!
        //　ステージのオブジェクト座標から計算で出した値に直す
        let newStagePintX = stagePoint!.x + 0.0
        let newStagePintZ = stagePoint!.z + 0.0
        let newStagePintY = stagePoint!.y + 0.0
        // 新しいオブジェクトの座標を規定
        let newStagePoint = SCNVector3(x: newStagePintX, y: newStagePintY , z: newStagePintZ)
        //　ワールド座標系に変換
        let finalPoint = sceneView.projectPoint(newStagePoint)
        // 表示する座標を指定する
        blueNode.position = finalPoint
        // ノードの作成
        sceneView.scene.rootNode.addChildNode(blueNode)
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
