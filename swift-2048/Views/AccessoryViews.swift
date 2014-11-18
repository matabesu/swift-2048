//
//  AccessoryViews.swift
//  swift-2048
//
//  Created by Austin Zheng on 6/4/14.
//  Copyright (c) 2014 Austin Zheng. All rights reserved.
//

import UIKit

protocol ScoreViewProtocol {
  func scoreChanged(newScore s: Int)
}

/// A simple view that displays the player's score.
/**
  画面上部にあるユーザのスコアを描画するクラス
*/
class ScoreView : UIView, ScoreViewProtocol {
  var score: Int = 0 {
  // didSetは書き換え可能なプロパティ
  didSet {
    label.text = "SCORE: \(score)"
  }
  }

  // 表示座標を作る
  let defaultFrame = CGRectMake(0, 0, 140, 40)
  // スコア表示用のラベル
  var label: UILabel

  init(backgroundColor bgcolor: UIColor, textColor tcolor: UIColor, font: UIFont, radius r: CGFloat) {
    // 座標位置をセットしてラベルを生成
    label = UILabel(frame: defaultFrame)
    // ラベルの位置を揃える
    label.textAlignment = NSTextAlignment.Center
    super.init(frame: defaultFrame)
    // 引数でもらった色をそれぞれセット
    backgroundColor = bgcolor
    label.textColor = tcolor
    label.font = font
    // ここは親クラスのUIViewのプロパティ
    layer.cornerRadius = r
    // UIViewにラベルを追加
    self.addSubview(label)
  }

  required init(coder aDecoder: NSCoder) {
    fatalError("NSCoding not supported")
  }

  func scoreChanged(newScore s: Int)  {
    score = s
  }
}

// A simple view that displays several buttons for controlling the app
class ControlView {
  let defaultFrame = CGRectMake(0, 0, 140, 40)
  // TODO: Implement me
}
