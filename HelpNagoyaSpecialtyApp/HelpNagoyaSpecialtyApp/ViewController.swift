//
//  ViewController.swift
//  HelpNagoyaSpecialtyApp
//
//  Created by 尾原徳泰 on 2020/11/08.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // シーンの作成
        let scene = GameScene()
        
        // viewControllerのviewをSKview型として取り出す
        let view = self.view as! SKView
        
        // FPSの表示
        view.showsFPS = true
        // ノード数の表示
        view.showsNodeCount = true
        
        // viewの上にシーンを表示
        view.presentScene(scene)
    }


}

