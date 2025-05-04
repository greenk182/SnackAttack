//
//  SnackListView.swift
//  SnackAttack
//
//  Created by Kevin Green on 5/4/25.
//

import SwiftUI

struct SnackListView: View {
    var body: some View {
        NavigationView {
            List(MockData.snacks) { snack in
                SnackListCell(snack: snack)
            }
            .navigationTitle("Snacks")
        }
    }
}

#Preview {
    SnackListView()
}
