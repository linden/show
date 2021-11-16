import AppKit
import WebKit

let app = NSApplication.shared

class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate {
	let window = NSWindow.init(contentRect: NSRect(x: 0, y: 0, width: 750, height: 600), styleMask: [ 
		NSWindow.StyleMask.titled, 
		NSWindow.StyleMask.closable,
		NSWindow.StyleMask.resizable
	], backing: NSWindow.BackingStoreType.buffered, defer: false)

    func applicationDidFinishLaunching(_ notification: Notification) {
		if (CommandLine.arguments.count < 2) {
			print("URL argument required, example: show https://github.com/linden/show\r\n")
			app.terminate(self)
		}
	
		let url = URL(string: CommandLine.arguments[1])!
		
       	window.makeKeyAndOrderFront(nil)
		window.orderFrontRegardless()
	   	window.center()
		
		window.delegate = self
		window.title = "show"
	   	
	   	let webview = WKWebView(frame: window.contentView!.frame)
	   	let request = URLRequest(url: url)
		       	
	   	window.contentView?.addSubview(webview)
	   	webview.load(request)
    }
	
	func windowWillClose(_ notification: Notification) {
		app.terminate(self)
	}
}

let delegate = AppDelegate()

app.delegate = delegate

app.run()