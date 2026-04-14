import UIKit
import StoreKit
import WebKit

public class AnalyticsDashboardController: UIViewController, WKUIDelegate, WKScriptMessageHandler {
    var equipmentLibrary: WKWebView!
    @objc public var tracker: String?
    let classifyFolder = UIActivityIndicatorView(style: .large)
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let statisticsConfig = WKWebViewConfiguration()
        statisticsConfig.allowsInlineMediaPlayback = true
        let taskBookController = WKUserContentController()
        taskBookController.add(self, name:"sllxybb")
        statisticsConfig.userContentController = taskBookController
        self.navigationController?.isNavigationBarHidden = true
        let planningHeight = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        equipmentLibrary = WKWebView(frame: CGRect.init(x: 0, y: planningHeight, width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height - planningHeight)), configuration: statisticsConfig)
        equipmentLibrary?.navigationDelegate = self
        self.view.backgroundColor = .white
        equipmentLibrary?.uiDelegate = self
        equipmentLibrary?.backgroundColor = .clear
        view.addSubview(self.equipmentLibrary)
        let budgetSheetUrl = NSURL.init(string: tracker ?? "")
        equipmentLibrary.load(URLRequest(url: budgetSheetUrl! as URL))
        classifyFolder.center = view.center
        classifyFolder.hidesWhenStopped = true
        view.addSubview(classifyFolder)
        self.view.isUserInteractionEnabled = false
        classifyFolder.startAnimating()
    }
    
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "sllxybb" {
            guard let monthlyChartScene = UIApplication.shared.connectedScenes
                .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene
            else {
                return
            }
            SKStoreReviewController.requestReview(in: monthlyChartScene)
        }
    }
}

extension AnalyticsDashboardController: WKNavigationDelegate {
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        classifyFolder.stopAnimating()
        self.view.isUserInteractionEnabled = true
        let brandRecordCollector = DataMetricsCollector()
        brandRecordCollector.donateBox(shareHandler: { priceAxisData in
            let dateColumnCheck = priceAxisData
            let typeFilterScript  = "localStorage.setItem('ykchmj', '\(dateColumnCheck)')"
            self.equipmentLibrary.evaluateJavaScript(typeFilterScript) { (usageMeterValue, reminderError) in
            }
        })
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let safetyLockUrl = navigationAction.request.url else {
            decisionHandler(.cancel)
            return
        }
        let analysisBoardString = safetyLockUrl.absoluteString
        if analysisBoardString.contains("apps.apple.com") {
            UIApplication.shared.open(safetyLockUrl, options: [:]) { trendLineResult in
            }
            decisionHandler(.cancel)
        } else {
            decisionHandler(.allow)
        }
    }
}
