import UIKit
import SnapKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: CGFloat(235.0/255.0), green: CGFloat(235.0/255.0), blue: CGFloat(235.0/255.0), alpha: CGFloat(1.0))
        
        let tabbarView = UIView()
        tabbarView.backgroundColor = UIColor(red: CGFloat(250.0/255.0), green: CGFloat(250.0/255.0), blue: CGFloat(250.0/255.0), alpha: CGFloat(0.9))
        view.addSubview(tabbarView)
        
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 0.6)
        topBorder.backgroundColor = UIColor(red: CGFloat(180.0/255.0), green: CGFloat(180.0/255.0), blue: CGFloat(180.0/255.0), alpha: CGFloat(1.0)).cgColor
        tabbarView.layer.addSublayer(topBorder)
        
        tabbarView.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }

//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 14)
//        label.text = "xxxxxxasfasfasfasf"
//        view.addSubview(label)
//        
//        label.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
