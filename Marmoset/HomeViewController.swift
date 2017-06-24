import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let textColor = UIColor(red: CGFloat(145.0/255.0), green: CGFloat(145.0/255.0), blue: CGFloat(145.0/255.0), alpha: CGFloat(1.0))
//        
//        
        view.backgroundColor = UIColor(red: CGFloat(235.0/255.0), green: CGFloat(235.0/255.0), blue: CGFloat(235.0/255.0), alpha: CGFloat(1.0))
//        
//        let tabbarView = UIView()
//        tabbarView.backgroundColor = UIColor(red: CGFloat(250.0/255.0), green: CGFloat(250.0/255.0), blue: CGFloat(250.0/255.0), alpha: CGFloat(0.9))
//        view.addSubview(tabbarView)
//        
//        let topBorder = CALayer()
//        topBorder.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 0.6)
//        topBorder.backgroundColor = UIColor(red: CGFloat(180.0/255.0), green: CGFloat(180.0/255.0), blue: CGFloat(180.0/255.0), alpha: CGFloat(1.0)).cgColor
//        tabbarView.layer.addSublayer(topBorder)
//        
//        tabbarView.snp.makeConstraints { make in
//            make.height.equalTo(60)
//            make.width.equalToSuperview()
//            make.bottom.equalToSuperview()
//        }
//        
//        let homeLabel = UILabel()
//        homeLabel.font = UIFont.systemFont(ofSize: 16)
//        homeLabel.textColor = textColor
//        homeLabel.text = "首页"
//        homeLabel.textAlignment = .center
//        
//        view.addSubview(homeLabel)
//        
//        homeLabel.snp.makeConstraints { make in
//            make.top.equalTo(tabbarView)
//            make.width.equalTo(tabbarView.snp.width).dividedBy(3)
//            make.centerY.equalTo(tabbarView)
//            make.centerX.equalTo(tabbarView.snp.left).offset(view.bounds.width/6)
//        }
//
//        let webviewLabel = UILabel()
//        webviewLabel.font = UIFont.systemFont(ofSize: 16)
//        webviewLabel.textColor = textColor
//        webviewLabel.text = "网页"
//        webviewLabel.textAlignment = .center
//        
//        view.addSubview(webviewLabel)
//        
//        webviewLabel.snp.makeConstraints { make in
//            make.top.equalTo(tabbarView)
//            make.width.equalTo(tabbarView.snp.width).dividedBy(3)
//            make.centerY.equalTo(tabbarView)
//            make.centerX.equalTo(tabbarView.snp.left).offset(view.bounds.width/2)
//        }
//
//        
//        let mineLabel = UILabel()
//        mineLabel.font = UIFont.systemFont(ofSize: 16)
//        mineLabel.textColor = textColor
//        mineLabel.text = "我的"
//        mineLabel.textAlignment = .center
//        
//        view.addSubview(mineLabel)
//        
//        mineLabel.snp.makeConstraints { make in
//            make.top.equalTo(tabbarView)
//            make.width.equalTo(tabbarView.snp.width).dividedBy(3)
//            make.centerY.equalTo(tabbarView)
//            make.centerX.equalTo(tabbarView.snp.left).offset(view.bounds.width * 5/6)
//        }
//        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(tapLabelFunc))
//        webviewLabel.isUserInteractionEnabled = true
//        webviewLabel.addGestureRecognizer(tap)
    }
    
    func tapLabelFunc() {
        let weviewViewController = WebViewController()
        navigationController?.pushViewController(weviewViewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
