import UIKit

/// 「安全でない WebView フェッチ」のテスト用
/// https://codeql.github.com/codeql-query-help/swift/swift-unsafe-webview-fetch/
class UnsafeUIWebViewController: UIViewController {
    
    static func newInstance() -> UnsafeUIWebViewController {
        return UnsafeUIWebViewController.init(nibName: "UnsafeUIWebViewController", bundle: nil)
    }


    @IBOutlet weak var browser: UIWebView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let htmlData = """
        <!DOCTYPE html>
        <html lang="ja">
        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>安全でない WebView フェッチ</title>
        </head>
        <body>
            <p>安全でない WebView フェッチ</p>
        </body>
        </html>
        """
        browser.loadHTMLString(htmlData, baseURL: nil)
    }
}
