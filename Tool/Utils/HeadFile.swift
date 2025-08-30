//
//  HeadFile.swift
//  InfoAPP
//
//  Created by leeco on 2019/5/7.
//  Copyright © 2019 zsw. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift


let KSCREEN_WIDTH = UIScreen.main.bounds.size.width
let KSCREEN_HEIGHT = UIScreen.main.bounds.size.height

func isiPhoneXScreen() -> Bool {
    guard #available(iOS 11.0, *) else {
        return false
    }
    return UIApplication.shared.windows[0].safeAreaInsets.bottom > 0
}

//iPhonex以上判断
let KIS_IPhoneX_All = isiPhoneXScreen()
//导航栏高
let KDevice_NaviBar_Height = (KIS_IPhoneX_All ? 88.0 : 64.0)
//状态栏高
let KDevice_StatusBar_Height = (KIS_IPhoneX_All ? 44.0 : 20.0)
//底部高
let KDevice_TabBar_Height = (KIS_IPhoneX_All ? 83.0 : 49.0)
//安全区高
let KDevice_SafeArea_BottomHeight = (KIS_IPhoneX_All ? 34.0 : 0.0)
/**宽度比例*/
func NG_ScaleWidth(_ font:CGFloat) -> (CGFloat) {
   return (KSCREEN_WIDTH/375)*font
}
/**高度比例*/
func NG_ScaleHeight(_ font:CGFloat) -> (CGFloat) {
  return  KSCREEN_HEIGHT/667*font
}

func RGB_COLOR(r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
}

//主题颜色
let kTHEME_COLOR = RGB_COLOR(r: 116, g: 186, b: 102)
