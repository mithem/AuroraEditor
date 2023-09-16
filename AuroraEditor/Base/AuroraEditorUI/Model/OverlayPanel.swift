//
//  OverlayPanel.swift
//  Aurora Editor
//
//  Created by Pavel Kasila on 20.03.22.
//  Copyright © 2023 Aurora Company. All rights reserved.
//
//  This file originates from CodeEdit, https://github.com/CodeEditApp/CodeEdit

import AppKit

public final class OverlayPanel: NSPanel, NSWindowDelegate {

    var viewType: ViewType?

    enum ViewType {
        case quickOpen
        case commandPalette
    }

    public init() {
        super.init(
            contentRect: NSRect(x: 0, y: 0, width: 500, height: 48),
            styleMask: [.fullSizeContentView, .titled, .resizable],
            backing: .buffered, defer: false)
        self.delegate = self
        self.center()
        self.titlebarAppearsTransparent = true
        self.isMovableByWindowBackground = true
    }

    override public func standardWindowButton(_ button: NSWindow.ButtonType) -> NSButton? {
        let btn = super.standardWindowButton(button)
        btn?.isHidden = true
        return btn
    }

    public func windowDidResignKey(_ notification: Notification) {
        if let panel = notification.object as? OverlayPanel {
            panel.close()
        }
    }
}
