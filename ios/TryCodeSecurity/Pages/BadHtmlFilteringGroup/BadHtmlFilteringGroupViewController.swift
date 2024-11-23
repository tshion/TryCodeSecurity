import UIKit
import WebKit

/// 「不正な HTML フィルタリング正規表現」のテスト用
/// https://codeql.github.com/codeql-query-help/swift/swift-bad-tag-filter/
class BadHtmlFilteringGroupViewController: UIViewController {
    
    static func newInstance() -> BadHtmlFilteringGroupViewController {
        return BadHtmlFilteringGroupViewController.init(nibName: "BadHtmlFilteringGroupViewController", bundle: nil)
    }
    
    
    @IBOutlet weak var browser: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var html = """
        <!DOCTYPE html>
        <html lang="ja">
        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>不正な HTML フィルタリング正規表現</title>
        </head>
        <body>
            <p>不正な HTML フィルタリング正規表現</p>
            <script>alert('JavaScript: alert()')</script foo="bar">
        </body>
        </html>
        """
        
        let script_tag_regex = /<script[^>]*>.*<\/script>/
        
        var old_html = ""
        while (html != old_html) {
            old_html = html
            html.replace(script_tag_regex, with: "")
        }
        
        browser.configuration.defaultWebpagePreferences.allowsContentJavaScript = true
        browser.uiDelegate = self
        browser.loadHTMLString(html, baseURL: nil)
    }
}

extension BadHtmlFilteringGroupViewController: WKUIDelegate {
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default, handler: { _ in
            completionHandler()
        }))
        present(alert, animated: true, completion: nil)
    }
}
