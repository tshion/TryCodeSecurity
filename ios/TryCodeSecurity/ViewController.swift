import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onGoBadHtmlFilteringGroup(_ sender: Any) {
        let vc = BadHtmlFilteringGroupViewController.newInstance()
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func onGoInefficient(_ sender: Any) {
        let vc = InefficientRegexViewController.newInstance()
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func onGoRegexInjection(_ sender: Any) {
        let vc = RegexInjectionViewController.newInstance()
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func onGoUnsafeUIWebView(_ sender: Any) {
        let vc = UnsafeUIWebViewController.newInstance()
        present(vc, animated: true, completion: nil)
    }
}
