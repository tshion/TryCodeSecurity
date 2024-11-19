import UIKit

/// 「非効率的な正規表現」のテスト用
/// https://codeql.github.com/codeql-query-help/swift/swift-redos/
class InefficientRegexViewController: UIViewController {
    
    static func newInstance() -> InefficientRegexViewController {
        return InefficientRegexViewController.init(nibName: "InefficientRegexViewController", bundle: nil)
    }


    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var textSearch: UITextField!

    private let regexBad = /^_(__|.)+_$/
    private let regexGood = /^_(__|[^_])+_$/
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textSearch.text = "___A_"
    }


    @IBAction func onExecute(_ sender: Any) {
        let text = textSearch.text!
        let matchBad = text.wholeMatch(of: regexBad)
        let matchGood = text.wholeMatch(of: regexGood)
        labelResult.text = "Bad: \(matchBad != nil), Good: \(matchGood != nil)"
    }
}
