//
//  ProgressView.swift
//  PomoTime
//
//  Created by Sam Obe on 4/30/21.
//

import SwiftUI

struct ProgressView: View {
        var progress: Float
        let color : Color
        var body: some View {
            ZStack {
                Circle()
                    .stroke(lineWidth: 20.0)
                    .opacity(0.3)
                    .foregroundColor(color)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(color)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear)
            }
        }
}

struct Progress_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(progress: 0.75, color: .blue).previewLayout(.sizeThatFits)
    }
}

