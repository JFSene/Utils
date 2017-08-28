import UIKit

extension UITabBarController {
    
    func setTopSelectionBorder() {
        if tabBar.selectionIndicatorImage == nil {
            let size = CGSize(width: view.frame.width / CGFloat(viewControllers?.count ?? 1), height: 49)
            let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            let rectLine = CGRect(x: 0, y: 0, width: view.frame.width / CGFloat(viewControllers?.count ?? 1), height: 2)
            UIGraphicsBeginImageContextWithOptions(size, false, 0)
            UIColor.clear.setFill()
            UIRectFill(rect)
            tabBar.tintColor.setFill()
            UIRectFill(rectLine)
            tabBar.selectionIndicatorImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
    }
    
}
