import UIKit

/// 「正規表現インジェクション」のテスト用
/// https://codeql.github.com/codeql-query-help/swift/swift-regex-injection/
class RegexInjectionViewController: UIViewController {
    
    static func newInstance() -> RegexInjectionViewController {
        return RegexInjectionViewController.init(nibName: "RegexInjectionViewController", bundle: nil)
    }
    
    
    @IBOutlet weak var labelRegex: UITextField!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var labelText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // https://owasp.org/www-community/attacks/Regular_expression_Denial_of_Service_-_ReDoS
        labelRegex.text = "^(([a-z])+.)+[A-Z]([a-z])+$"
        labelText.text = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa!"
    }
    
    
    @IBAction func onRunNSRegex(_ sender: Any) {
        let remoteInput = labelRegex.text!
        let targetInput = labelText.text!
        
        // BAD: Unsanitized user input is used to construct a regular expression
        let regexStr = "abc|\(remoteInput)"
        let regex = try! NSRegularExpression(pattern: regexStr)
        let matches = regex.matches(in: targetInput, range: NSRange(0..<targetInput.count))
        labelResult.text = "NSRegularExpression: \(0 < matches.count)"
    }
    
    @IBAction func onRunSwiftRegex(_ sender: Any) {
        let remoteInput = labelRegex.text!
        let targetInput = labelText.text!
        
        // BAD: Unsanitized user input is used to construct a regular expression
        let regex = try! Regex(remoteInput)
        let result = try? regex.wholeMatch(in: targetInput)
        labelResult.text = "SwiftRegex: \(result != nil)"
    }
}
