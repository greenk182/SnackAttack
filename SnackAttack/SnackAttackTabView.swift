//
//  ContentView.swift
//  SnackAttack
//
//  Created by Kevin Green on 5/4/25.
//

import SwiftUI

struct SnackAttackTabView: View {
    var body: some View {
        TabView {
            SnackListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
        }
        .accentColor(.accent)
    }
}

#Preview {
    SnackAttackTabView()
}
