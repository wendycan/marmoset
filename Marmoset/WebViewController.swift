import UIKit
import Toaster
import NVActivityIndicatorView

class TextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}

class WebViewController: UIViewController, NVActivityIndicatorViewable {

    let webView = UIWebView()
    let activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 60, height: 60), type: .ballScaleMultiple, color: UIColor(red: CGFloat(167.0/255.0), green: CGFloat(101.0/255.0), blue: CGFloat(57.0/255.0), alpha: CGFloat(1.0)))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: CGFloat(235.0/255.0), green: CGFloat(235.0/255.0), blue: CGFloat(235.0/255.0), alpha: CGFloat(1.0))

        view.addSubview(webView)
        view.addSubview(activityIndicatorView)
        
        activityIndicatorView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        let urlStr = "https://www.shanbay.com/web/zero/urls"
        if let url = URL.init(string: urlStr) {
            let request = URLRequest.init(url: url)
            webView.loadRequest(request)
        }
        
        webView.backgroundColor = UIColor(red: CGFloat(245.0/255.0), green: CGFloat(245.0/255.0), blue: CGFloat(245.0/255.0), alpha: CGFloat(1.0))
        webView.snp.makeConstraints { make in
            make.height.equalTo(view.bounds.height - 60)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.top.equalTo(60)
        }
        
        let textField = TextField()
        view.addSubview(textField)

        textField.backgroundColor = UIColor(red: CGFloat(255.0/255.0), green: CGFloat(255.0/255.0), blue: CGFloat(255.0/255.0), alpha: CGFloat(1.0))
        textField.placeholder = "输入 URL："
        textField.keyboardType = .URL
        textField.layer.cornerRadius = 6.0
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: CGFloat(180.0/255.0), green: CGFloat(180.0/255.0), blue: CGFloat(180.0/255.0), alpha: CGFloat(1.0)).cgColor
        textField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(75)
            make.width.equalTo(view.bounds.width - 20)
            make.height.equalTo(40)
        }
        
        textField.delegate = self
        webView.delegate = self
        webView.scrollView.delegate = self
    }
}

extension WebViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        if let text = textField.text {
            if let url = URL(string: text) {
                let request = URLRequest(url: url)
                webView.loadRequest(request)
            }
        }
        
        return true;
    }
}

extension WebViewController: UIWebViewDelegate {
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        activityIndicatorView.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activityIndicatorView.stopAnimating()
        
        // insert script
        let script = ""
        self.webView.stringByEvaluatingJavaScript(from: script)
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        let toast = Toast(text: "加载失败")
        activityIndicatorView.stopAnimating()
        toast.show()
    }
}

extension WebViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if scrollView.contentOffset.y < -60 {
            webView.reload()
        }
    }
}
