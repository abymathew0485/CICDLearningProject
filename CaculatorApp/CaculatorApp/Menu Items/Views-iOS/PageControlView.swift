//
//  PageControlView.swift
//  CaculatorApp
//
//  Created by Aby Mathew on 12/01/23.
//

import SwiftUI

struct PageControlView: View {
    let currentPage: CGFloat
    let pageCount: Int
    let tintColor: Color
    let normalColor: Color

    private let constantValue: CGFloat = 10

    var body: some View {
        HStack(alignment: .center, spacing: 6) {
            ForEach(0 ..< pageCount) { index in
                let floatIndex = CGFloat(index)
                let percent = 1 - (abs(floatIndex - currentPage) / 1)
                let fixedPercent = percent < 0 ? 0 : percent
                let width: CGFloat = abs(9 * fixedPercent) + constantValue
                ZStack {
                    normalColor
                    tintColor.opacity(fixedPercent)
                    }
               .cornerRadius(constantValue/2)
                .frame(width: width, height: constantValue)
                .animation(.easeInOut(duration: 0.1))
                }
           }
    }
}

//struct PageControlView_Previews: PreviewProvider {
//    static var previews: some View {
//        PageControlView()
//    }
//}
