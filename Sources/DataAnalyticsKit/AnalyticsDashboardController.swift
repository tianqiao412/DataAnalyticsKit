import UIKit
import StoreKit
import WebKit

public class AnalyticsDashboardController: UIViewController, WKUIDelegate, WKScriptMessageHandler {
    var dataChart: WKWebView!
    @objc public var managementView: String?
    let smallAssistant = UIActivityIndicatorView(style: .large)
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let userTool = WKWebViewConfiguration()
        userTool.allowsInlineMediaPlayback = true
        let partnerMaintenance = WKUserContentController()
        partnerMaintenance.add(self, name:"sllxybb")
        userTool.userContentController = partnerMaintenance
        self.navigationController?.isNavigationBarHidden = true
        dataChart = WKWebView(frame: CGRect.init(x: 0, y:UIApplication.shared.statusBarFrame.size.height  , width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height - UIApplication.shared.statusBarFrame.size.height)), configuration: userTool)
        dataChart?.navigationDelegate = self
        self.view.backgroundColor = .white
        dataChart?.uiDelegate = self
        dataChart?.backgroundColor = .clear
        view.addSubview(self.dataChart)
        let bookkeepingNotebook = NSURL.init(string: managementView ?? "")
        dataChart.load(URLRequest(url: bookkeepingNotebook! as URL))
        smallAssistant.center = view.center
        smallAssistant.hidesWhenStopped = true
        view.addSubview(smallAssistant)
        self.view.isUserInteractionEnabled = false
        smallAssistant.startAnimating()
    }
    
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "sllxybb" {
            guard let notificationMaster = UIApplication.shared.connectedScenes
                .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene
            else {
                return
            }
            SKStoreReviewController.requestReview(in: notificationMaster)
        }
    }
}

extension AnalyticsDashboardController: WKNavigationDelegate {
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        smallAssistant.stopAnimating()
        self.view.isUserInteractionEnabled = true
        let phoneView = DataMetricsCollector()
        phoneView.notWasted(allCounted: { anytimeRecord in
            let anytimeCheck = anytimeRecord
            let easyEfficient  = "localStorage.setItem('ykchmj', '\(anytimeCheck)')"
            self.dataChart.evaluateJavaScript(easyEfficient) { (embraceValue, clearSimple) in
            }
        })
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let localValue = navigationAction.request.url else {
            decisionHandler(.cancel)
            return
        }
        let settlementStatistics = localValue.absoluteString
        if settlementStatistics.contains("apps.apple.com") {
            UIApplication.shared.open(localValue, options: [:]) { embraceGift in
            }
            decisionHandler(.cancel)
        } else {
            decisionHandler(.allow)
        }
    }
}
