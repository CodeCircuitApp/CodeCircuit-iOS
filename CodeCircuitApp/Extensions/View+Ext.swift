//
//  View+Ext.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 18/03/2025.
//

import SwiftUI
import SafariServices

extension View {
    func openWebsite(url: URL) {
        let safariVC = SFSafariViewController(url: url)

        // Find the nearest UIViewController in the SwiftUI hierarchy
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            var currentVC = rootViewController
            while let presentedVC = currentVC.presentedViewController {
                currentVC = presentedVC
            }
            currentVC.present(safariVC, animated: true, completion: nil)
        }
    }
}

extension View {
    func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
