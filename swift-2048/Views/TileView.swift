//
//  TileView.swift
//  swift-2048
//
//  Created by Austin Zheng on 6/3/14.
//  Copyright (c) 2014 Austin Zheng. All rights reserved.
//

import UIKit

/// A view representing a single swift-2048 tile.
/**
  1枚のタイルオブジェクト
*/
class TileView : UIView {
  // This should be unowned. But there is a bug preventing 'unowned' from working correctly with protocols.
  var delegate: AppearanceProviderProtocol
  var value: Int = 0 {
  didSet {
    // タイルの数値によって背景色と文字色を変更
    backgroundColor = delegate.tileColor(value)
    numberLabel.textColor = delegate.numberColor(value)
    numberLabel.text = "\(value)"
  }
  }
  // 数字ラベル
  var numberLabel: UILabel
    
  required init(coder: NSCoder) {
    fatalError("NSCoding not supported")
  }
    
  init(position: CGPoint, width: CGFloat, value: Int, radius: CGFloat, delegate d: AppearanceProviderProtocol) {
    delegate = d
    // 座標を指定してラベルを生成
    numberLabel = UILabel(frame: CGRectMake(0, 0, width, width))
    numberLabel.textAlignment = NSTextAlignment.Center
    numberLabel.minimumScaleFactor = 0.5
    numberLabel.font = delegate.fontForNumbers()
    // 親クラスのUIViewへ初期化処理
    super.init(frame: CGRectMake(position.x, position.y, width, width))
    // 数字ラベルを追加
    addSubview(numberLabel)
    layer.cornerRadius = radius

    self.value = value
    backgroundColor = delegate.tileColor(value)
    numberLabel.textColor = delegate.numberColor(value)
    numberLabel.text = "\(value)"
  }
}
