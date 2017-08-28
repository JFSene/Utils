//
//  Utils.swift
//  snd_ios
//
//  Created by Dev-06 on 20/03/17.
//  Copyright © 2017 Dev-06. All rights reserved.
//

import UIKit
import SystemConfiguration

class Util {
    static func alertMessage(errorMessage: String, controller: UIViewController, title: String) {
        let alertController = UIAlertController(title: title, message: errorMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        controller.present(alertController, animated: true, completion: nil)
    }

    static func navController(_ view: UIViewController) {
        let rootViewController = LoginViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        UINavigationBar.appearance().tintColor = UIColor.asTurquoiseBlue
        UINavigationBar.appearance().barTintColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.asTurquoiseBlue]
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().backgroundColor = UIColor.asWhiteThree
        UIBarButtonItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.clear], for: UIControlState.normal)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.clear], for: UIControlState.highlighted)
        UISegmentedControl.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.asWhite], for: UIControlState.selected)
        UIToolbar.appearance().tintColor = UIColor.asTurquoiseBlue

        view.present(navigationController, animated: true, completion: nil)
    }

    static func principalViewController(_ view: UIViewController) {
        let rootViewController = TabBarViewController()
        UINavigationBar.appearance().tintColor = UIColor.asTurquoiseBlue
        UINavigationBar.appearance().barTintColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.asTurquoiseBlue]
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().backgroundColor = UIColor.asWhiteThree
        UIBarButtonItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.clear], for: UIControlState.normal)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.clear], for: UIControlState.highlighted)
        UISegmentedControl.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.asWhite], for: UIControlState.selected)
        UIToolbar.appearance().tintColor = UIColor.asTurquoiseBlue
        view.present(rootViewController, animated: true, completion: nil)
    }
    
    static func semLoginViewController(_ view: UIViewController) {
        let rootViewController = SemCadastroViewController()
        UINavigationBar.appearance().tintColor = UIColor.asTurquoiseBlue
        UINavigationBar.appearance().barTintColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.asTurquoiseBlue]
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().backgroundColor = UIColor.asWhiteThree
        UIBarButtonItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.clear], for: UIControlState.normal)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.clear], for: UIControlState.highlighted)
        UISegmentedControl.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.asWhite], for: UIControlState.selected)
        UIToolbar.appearance().tintColor = UIColor.asTurquoiseBlue
        view.present(rootViewController, animated: true, completion: nil)
    }

    static func inicialViewController(_ view: UIViewController) {
        let rootViewController = TelaInicialViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        UINavigationBar.appearance().tintColor = UIColor.asTurquoiseBlue
        UINavigationBar.appearance().barTintColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.asTurquoiseBlue]
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().backgroundColor = UIColor.asWhiteThree
        UIBarButtonItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.clear], for: UIControlState.normal)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.clear], for: UIControlState.highlighted)
        UISegmentedControl.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.asWhite], for: UIControlState.selected)
        UIToolbar.appearance().tintColor = UIColor.asTurquoiseBlue
        view.present(navigationController, animated: true, completion: nil)
    }

    public static func stringParaData(data: String, formato: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formato
        return dateFormatter.date(from: data) ?? Date()
    }
    
    public static func dateParaString(data: Date, formato: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formato
        return dateFormatter.string(from: data)
    }
    
    static func validarEmail(email: String) -> Bool {
        if email.isEmpty {
            return false
        }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    static func apenasNumerosString(texto: String) -> String {
        if texto.isEmpty {
            return ""
        }
        return texto.replacingOccurrences(of: "\\D", with: "", options: .regularExpression, range: texto.startIndex..<texto.endIndex)
    }
    
    static func validarCpf(cpf: String) -> Bool {
        if cpf.characters.count != 11 {
            return false
        }
        
        if cpf == "00000000000" {
            return false
        }
        if cpf == "11111111111" {
            return false
        }
        
        if cpf == "22222222222" {
            return false
        }
        
        if cpf == "33333333333" {
            return false
        }
        
        if cpf == "44444444444" {
            return false
        }
        
        if cpf == "55555555555" {
            return false
        }
        
        if cpf == "66666666666" {
            return false
        }
        
        if cpf == "77777777777" {
            return false
        }
        
        if cpf == "88888888888" {
            return false
        }
        
        if cpf == "99999999999" {
            return false
        }
        
        var input: String = ""
        input = cpf
        
        let cpf = input.characters.filter{"0123456789".characters.contains($0)}
        let digitTen = (Int(String(cpf[9])) ?? 0)
        let digitEleven = (Int(String(cpf[10])) ?? 0)
        var resultModuleOne: Int = 0
        var resultModuleTwo: Int = 0
        var realValue: Int = 0
        var i: Int = 0
        var j: Int = 11
        for index in 0..<cpf.count - 1 {
            realValue = (Int(String(cpf[index])) ?? 0)
            resultModuleTwo += (realValue * j)
            
            if (i > 0) {
                realValue = (Int(String(cpf[index - 1])) ?? 0)
                resultModuleOne += (realValue * j)
            }
            
            i += 1
            j -= 1
        }
        
        resultModuleOne %= 11
        resultModuleOne = resultModuleOne < 2 ? 0 : 11 - resultModuleOne
        resultModuleTwo %= 11
        resultModuleTwo = resultModuleTwo < 2 ? 0 : 11 - resultModuleTwo
        
        if (resultModuleOne == digitTen && resultModuleTwo == digitEleven) {
            return true
        }
        
        return false
    }
    
    static func formatCurrency(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.string(from: NSNumber(value: value)) ?? "R$0,00"
    }
    
    public static func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
    
        let isReachable = flags == .reachable
        let needsConnection = flags == .connectionRequired
        
        return isReachable && !needsConnection
        
    }
}
