import UIKit

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

class WebViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

         view.backgroundColor = UIColor(red: CGFloat(235.0/255.0), green: CGFloat(235.0/255.0), blue: CGFloat(235.0/255.0), alpha: CGFloat(1.0))
        
        let webView = UIWebView()
        view.addSubview(webView)

        webView.snp.makeConstraints { make in
            make.height.equalTo(view.bounds.height - 60)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        let textField = TextField()
        view.addSubview(textField)

        textField.backgroundColor = UIColor(red: CGFloat(255.0/255.0), green: CGFloat(255.0/255.0), blue: CGFloat(255.0/255.0), alpha: CGFloat(1.0))
        textField.placeholder = "输入网址："
        textField.keyboardType = .URL
        textField.layer.cornerRadius = 8.0
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: CGFloat(180.0/255.0), green: CGFloat(180.0/255.0), blue: CGFloat(180.0/255.0), alpha: CGFloat(1.0)).cgColor
        textField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(75)
            make.width.equalTo(view.bounds.width - 20)
            make.height.equalTo(40)
        }
        
        let urlStr = "https://shanbay.com"
        if let url = URL.init(string: urlStr) {
            let request = URLRequest.init(url: url)
            webView.loadRequest(request)
        }
        
        // FIXI
        textField.delegate = WebViewController
    }
}

extension WebViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        if let text = textField.text {
            if let url = URL(string: text) {
                let request = URLRequest(url: url)
                // FIXI
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
        print("loading")
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("finished")
    }
}
