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
    
    var stageCount = 0
    //タップした箇所の座標を取得する
    var stagePoint:CGPoint?
    // 二つ目のオブジェクトの追加許可フラグ
    var secondFlag = 0
    
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
        guard !(anchor is ARPlaneAnchor) else { return }
        //ひとつしかステージを表示しない
        if stageCount == 1 {
            // ファイルからシーンを読み込む
            let field = SCNScene(named: "art.scnassets/field2.scn")
            // シーンからノードを検索
            let fieldNode = (field?.rootNode.childNode(withName: "field2", recursively: false))!
            // 検出面の子要素にする
            node.addChildNode(fieldNode)
            stageCount += 1
        } else {
            print("二つ目を検出")

        }
        
        if secondFlag == 1 {
            // ファイルからシーンを読み込む
            let field = SCNScene(named: "art.scnassets/ship.scn")
            // シーンからノードを検索
            let fieldNode = (field?.rootNode.childNode(withName: "ship", recursively: false))!
            // 検出面の子要素にする
            node.addChildNode(fieldNode)
            secondFlag += 1
        }
    }
   
    // MARK: - 画面タップの座標確認
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        print("-----------------------------------------")
//        print("touch:\(touch)")
        
        //空間上の座標を取得
        let touchPos = touch.location(in: sceneView)
        stagePoint = touchPos
        print("stagePoint:\(stagePoint)")
//        pointArray = touchPos
        print("touch:\(touchPos)")
        //タップされた位置のARアンカーを探す
        let hitTest = sceneView.hitTest(touchPos, types: .existingPlaneUsingExtent)
        if !hitTest.isEmpty {
            print("stageCount\(stageCount)")
            stageCount += 1
            //タップした箇所が取得できたらアンカーを追加
            let anchor = ARAnchor(transform: hitTest.first!.worldTransform)
            sceneView.session.add(anchor: anchor)
        }
    }
    // MARK: - buttonタップして座標に物体を出現させる
    @IBAction func tapButton(_ sender: Any) {
        //　座標が保存されていた場合
        if let stagePoint = stagePoint{
            //保存された位置のARアンカーを探す
            let hitTest = sceneView.hitTest(stagePoint, types: .existingPlaneUsingExtent)
            //保存された位置の取得できたらアンカーを追加
            let anchor = ARAnchor(transform: hitTest.first!.worldTransform)
                   sceneView.session.add(anchor: anchor)
            // 二つ目のオブジェクトの追加を許可
            secondFlag += 1
        }
        
       
        
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
