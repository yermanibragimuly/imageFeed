
import UIKit
import WebKit

public protocol WebViewViewControllerProtocol: AnyObject {
    var presenter: WebViewPresenterProtocol? { get set }
    func load(request: URLRequest)
    func setProgressValue(_ newValue: Float)
    func setProgressHidden(_ isHidden: Bool)
}

protocol WebViewControllerDelegate: AnyObject {
    func webViewViewController(_ vc: WebViewController, didAuthenticateWithCode code: String)
    func webViewViewControllerDidCancel(_ vc: WebViewController)
}

final class WebViewViewController: UIViewController, WebViewViewControllerProtocol {
    var presenter: WebViewPresenterProtocol?
    
    // MARK: - IB Outlets
    @IBOutlet private var webView: WKWebView!
    @IBOutlet private weak var progressView: UIProgressView!
    
    //MARK: - Properties
    weak var delegate: WebViewControllerDelegate?
    private var estimatedProgressObservation: NSKeyValueObservation?
    private var alertPresenter: AlertPresenterProtocol?
    
    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
        estimatedProgressObservation = webView.observe(
            \.estimatedProgress,
             options: [],
             changeHandler: { [weak self] _, _ in
                 guard let self = self else { return }
                 presenter?.didUpdateProgressValue(webView.estimatedProgress)
             })
    }
    
    // MARK: - Actions
        @IBAction private func didTapBackButton(_ sender: Any?) {
            delegate?.webViewViewControllerDidCancel(self)
        }

        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
    //        updateProgress()
        }

        func load(request: URLRequest) {
            webView.load(request)
        }

        func setProgressValue(_ newValue: Float) {
            progressView.progress = newValue
        }

        func setProgressHidden(_ isHidden: Bool) {
            progressView.isHidden = isHidden
        }

    }

    extension WebViewViewController: WKNavigationDelegate {
        private func code(from navigationAction: WKNavigationAction) -> String? {
            if let url = navigationAction.request.url {
                return presenter?.code(from: url)
            }
            return nil
        }

        func webView(
            _ webView: WKWebView,
            decidePolicyFor navigationAction: WKNavigationAction,
            decisionHandler: @escaping (WKNavigationActionPolicy
            ) -> Void) {
            if let code = code(from: navigationAction) {
                delegate?.webViewViewController(self, didAuthenticateWithCode: code)
                decisionHandler(.cancel)
            } else {
                decisionHandler(.allow)
            }
        }
    }
