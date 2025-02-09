import SwiftUI
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    
    private var hasOpenedWithFile = false
    var mainWindowController: NSWindowController?

    func application(_ application: NSApplication, open urls: [URL]) {
        hasOpenedWithFile = true
        
        if let url = urls.first {
            let mouseLocation = NSEvent.mouseLocation
            
            let panel = FloatingPanel(
                view: { return InstallingView(path: url) },
                contentRect: NSRect(
                    origin: CGPoint(x: mouseLocation.x, y: mouseLocation.y),
                    size: CGSize(width: 300, height: 100)
                )
            )
            panel.makeKeyAndOrderFront(nil)
        }
    }
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        DispatchQueue.main.async {
            if !self.hasOpenedWithFile {
                NSApp.setActivationPolicy(.regular)
                self.showMainWindow()
            }
        }
    }
    
    private func showMainWindow() {
        if mainWindowController == nil {
            let contentView = MainView()

            let window = NSWindow(
                contentRect: NSRect(x: 1000, y: 4000, width: 1000, height: 2000),
                styleMask: [.titled, .closable, .resizable],
                backing: .buffered,
                defer: false
            )
//            window.center()
            window.setFrameAutosaveName("Main Window")
            window.contentView = NSHostingView(rootView: contentView)
            
            window.makeKeyAndOrderFront(nil)

            let windowController = NSWindowController(window: window)
            self.mainWindowController = windowController

            NSApp.activate(ignoringOtherApps: true)
            
            window.delegate = self
            window.setFrame(NSRect(x: 1000, y: 4000, width: 1000, height: 2000), display: true)
            window.setContentSize(CGSize(width: 300, height: 1000))
        }
    }
}

extension AppDelegate: NSWindowDelegate {
    func windowShouldClose(_ sender: NSWindow) -> Bool {
        NSApp.terminate(nil)
        return true
    }
}
