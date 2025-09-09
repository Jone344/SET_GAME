//
//  Diamond.swift
//  SetStanford2023
//
//  Created by user on 5/26/25.
//

import SwiftUI

struct Diamond: Shape {
    
    func path(in rect: CGRect) -> Path {
       var path = Path()
       let center = CGPoint(x: rect.width / 2, y: rect.height / 2)

       path.move(to: CGPoint(x: center.x, y: 0))
       path.addLine(to: CGPoint(x: rect.width, y: center.y))
       path.addLine(to: CGPoint(x: center.x, y: rect.height))
       path.addLine(to: CGPoint(x: 0, y: center.y))
       path.addLine(to: CGPoint(x: center.x, y: 0))

       return path
     }
}

struct DiamiondView: View {
    var body: some View {
        Diamond()
            .fill()
            .frame(width: 200, height: 200)
    }
}

#Preview {
    Diamond()
}
