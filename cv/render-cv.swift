// cv.html dosyasını tek sayfalık A4 PDF'e çevirir (595x842 pt).
// Kullanım:  swift cv/render-cv.swift cv/cv.html site/Muhammed-Emir-Aslanbas-CV.pdf
import Cocoa
import WebKit

let args = CommandLine.arguments
guard args.count == 3 else { print("kullanım: swift render-cv.swift <cv.html> <cikti.pdf>"); exit(2) }
let input = URL(fileURLWithPath: args[1])
let output = URL(fileURLWithPath: args[2])
let W: CGFloat = 595, H: CGFloat = 842

final class Renderer: NSObject, WKNavigationDelegate {
    let webView = WKWebView(frame: NSRect(x: 0, y: 0, width: W, height: H))
    let window = NSWindow(contentRect: NSRect(x: -4000, y: -4000, width: W, height: H),
                          styleMask: [.borderless], backing: .buffered, defer: false)

    override init() {
        super.init()
        window.contentView = webView
        window.orderBack(nil)
        webView.navigationDelegate = self
    }

    func start() { webView.loadFileURL(input, allowingReadAccessTo: input.deletingLastPathComponent()) }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // Fontların oturması için kısa bir bekleme
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let cfg = WKPDFConfiguration()
            cfg.rect = CGRect(x: 0, y: 0, width: W, height: H)
            webView.createPDF(configuration: cfg) { result in
                switch result {
                case .success(let data):
                    try? data.write(to: output)
                    print("PDF yazıldı:", output.path)
                    exit(0)
                case .failure(let err):
                    print("PDF hatası:", err); exit(1)
                }
            }
        }
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) { print("yüklenemedi", error); exit(3) }
}

let app = NSApplication.shared
app.setActivationPolicy(.prohibited)
let renderer = Renderer()
renderer.start()
app.run()
