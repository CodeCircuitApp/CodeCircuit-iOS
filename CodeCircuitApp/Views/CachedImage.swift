//
//  CachedImage.swift
//  CodeCircuitApp
//
//  Created by Jakub Malinkiewicz on 14/06/2025.
//

import SwiftUI

struct CachedImage<Content: View>: View {
    private let manager = CachedImageManager()
    let url: URL
    @ViewBuilder let content: (AsyncImagePhase) -> Content
    
    var body: some View {
        ZStack {
            switch manager.currentState {
            case .loading:
                content(.empty)
            case .failed(let error):
                content(.failure(error))
            case .success(let data):
                if let image = UIImage(data: data) {
                    content(.success(Image(uiImage: image)))
                } else {
                    content(.failure(CachedImageError.invalidData))
                }
            default:
                content(.empty)
            }
        }
        .task {
            await manager.load(url)
        }
    }
}

#Preview {
    CachedImage(url: URL(string: "https://cdn.discordapp.com/attachments/1366560688507457640/1383381268678316084/1382852159804145788remix-1749894193928.png?ex=684e95b4&is=684d4434&hm=7a123dd136f65eb73aaf07a20a0d2166f010b4a0f934ac833f9ed28336f9c18d&")!) { _ in
        EmptyView()
    }
}

extension CachedImage {
    enum CachedImageError: Error {
        case invalidData
    }
}
