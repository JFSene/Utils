//
//  Util.swift
//  Odebrecht
//
//  Created by dev03 on 24/01/17.
//  Copyright © 2017 Guilherme Souza. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration

class Util {
	
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
	
    static func apenasNumerosString(texto: String) -> String {
        if texto.isEmpty {
            return ""
        }
        return texto.replacingOccurrences(of: "\\D", with: "", options: .regularExpression, range: texto.startIndex..<texto.endIndex)
    }
    
	static func alertMessageSuccess(successMessage: String, controller: UIViewController, title: String, handler: ((UIAlertAction) -> Void)? = nil) {
		let alertController = UIAlertController(title: title, message: successMessage, preferredStyle: .alert)
		let okAction = UIAlertAction(title: "Ok", style: .default, handler: handler)
		alertController.addAction(okAction)
		controller.present(alertController, animated: true, completion: nil)
	}
	
	static func alertMessage(errorMessage: String, controller: UIViewController, title: String, handler: ((UIAlertAction) -> Void)? = nil) {
		let alertController = UIAlertController(title: title, message: errorMessage, preferredStyle: .alert)
		let okAction = UIAlertAction(title: "Ok", style: .default, handler: handler)
		alertController.addAction(okAction)
		controller.present(alertController, animated: true, completion: nil)
	}
    
    static func alertMessageButtonCustom(errorMessage: String, controller: UIViewController, title: String, textButton: String = "Ok", handler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: errorMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: textButton, style: .default, handler: handler)
        alertController.addAction(okAction)
        controller.present(alertController, animated: true, completion: nil)
    }
	
	public static func confirmMessage(viewController:UIViewController, title: String, message: String, yesText:String, noText:String, yesButton: @escaping () ->(), noButton: @escaping () ->()) {
		
		let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert);
		
		alert.addAction(UIAlertAction.init(title: noText, style: .default, handler: {(action:UIAlertAction) in
			noButton()
		}));
		
		alert.addAction(UIAlertAction.init(title: yesText, style: .default, handler: {(action:UIAlertAction) in
			yesButton()
		}));

		viewController.present(alert, animated: true, completion: nil);
	}
	
    static func validarCnpj(cnpj: String) -> Bool {
        if cnpj.characters.count != 14 {
            return false
        }
        
        if cnpj == "00000000000000" {
            return false
        }
        
        if cnpj == "11111111111111" {
            return false
        }
        
        if cnpj == "22222222222222" {
            return false
        }
        
        if cnpj == "33333333333333" {
            return false
        }
        
        if cnpj == "44444444444444" {
            return false
        }
        
        if cnpj == "55555555555555" {
            return false
        }
        
        if cnpj == "66666666666666" {
            return false
        }
        
        if cnpj == "77777777777777" {
            return false
        }
        
        if cnpj == "88888888888888" {
            return false
        }
        
        if cnpj == "99999999999999" {
            return false
        }
        
        var input: String = ""
        input = cnpj
        
        let cnpj = input.characters.filter{"0123456789".characters.contains($0)}
        let digitTen = (Int(String(cnpj[12])) ?? 0)
        let digitEleven = (Int(String(cnpj[13])) ?? 0)
        
        var resultModuleOne: Int = 0
        var resultModuleTwo: Int = 0
        var realValue: Int = 0
        var i: Int = 0
        var j: Int = 6
        for index in 0..<cnpj.count - 1 {
            realValue = (Int(String(cnpj[index])) ?? 0)
            resultModuleTwo += (realValue * j)
            
            if (i > 0) {
                realValue = (Int(String(cnpj[index - 1])) ?? 0)
                resultModuleOne += (realValue * j)
            }
            
            i += 1
            j -= 1
            if j < 2 {
                j = 9
            }
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
    
    static func validarEmail(email: String) -> Bool {
        if email.isEmpty {
            return false
        }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }

    static func formatCurrency(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.string(from: NSNumber(value: value)) ?? "R$0,00"
    }
	
	static func salvaSharedPreferencesString(valor:String, chave:String) {
		UserDefaults.standard.setValue(valor, forKey: chave)
		UserDefaults.standard.synchronize()
	}
    
    static func recuperarSharedPreferencesString(chave:String) -> String {
        guard let prefsString: String = UserDefaults.standard.value(forKey: chave) as! String? else {
            return ""
        }
        
        if !isEmptyString(string: prefsString) {
            return prefsString
        }
        return ""
    }
	
    public static func isEmptyString(string: String) ->Bool {
        let text = string.trimmingCharacters(in: .whitespaces)
        if text.characters.count == 0 {
            return true
        }
        
        return false
    }
    
    public static func stringParaData(data: String, formato: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formato
        return dateFormatter.date(from: data)!
    }
    
    public static func dateParaString(data: Date, formato: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formato
        return dateFormatter.string(from: data)
    }
	
	public static func base64From(image: UIImage) -> String {
		let imageData:NSData = UIImagePNGRepresentation(image)! as NSData
		let strBase64 = imageData.base64EncodedString()
		return strBase64
	}
    
    public static func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize.init(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize.init(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect.init(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
}
