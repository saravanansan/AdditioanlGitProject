//
//  FontsName.swift
//  Jakson_Cus_iOS
//
//  Created by admin on 10/07/24.
//

import UIKit

 class FontsName{
     static var montserrat = Montserrat.shared
     static var roboto = Roboto.shared    
}

final class Montserrat{
    private init(){}
    static var shared = Montserrat()
    var Light = "Montserrat-Light.ttf"
    var Regular = "Montserrat-Regular.ttf"
    var Medium = "Montserrat-Medium.ttf"
    var SemiBold = "Montserrat-SemiBold.ttf"
    var Bold = "Montserrat-Bold.ttf"
}

final class Roboto{
    private init(){}
    static var shared = Roboto()
    var Light = "Roboto-Light.ttf"
    var Regular = "Roboto-Regular.ttf"
    var Thin = "Roboto-Thin.ttf"
    var ThinItalic = "Roboto-ThinItalic.ttf"
    var Italic = "Roboto-Italic.ttf"
    var Medium = "Roboto-Medium.ttf"
    var Bold = "Roboto-Bold.ttf"
    var Black = "Roboto-Black.ttf"
}
