//
//  ViewController.swift
//  swift-2048
//
//  Created by Austin Zheng on 6/3/14.
//  Copyright (c) 2014 Austin Zheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func startGameButtonTapped(sender : UIButton) {
    // ゲームコントローラーの起動。縦横のマスの数と、あがりの数字を設定
    let game = NumberTileGameViewController(dimension: 4, threshold: 2048)
    // 透過表示させている
    self.presentViewController(game, animated: true, completion: nil)
  }
}

