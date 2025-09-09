//
//  Array+Identifiable.swift
//  SetStanford2023
//
//  Created by user on 11.12.24.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching item: Element) -> Int? {
        if let index = self.firstIndex(where: {item.id == $0.id}) {
            return index
        }
        return nil
    }
}
