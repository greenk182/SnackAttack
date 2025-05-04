//
//  SnackListCell.swift
//  SnackAttack
//
//  Created by Kevin Green on 5/4/25.
//

import SwiftUI

struct SnackListCell: View {
    
    let snack: Snack
    
    var body: some View {
        HStack {
            Image("Asian Flank Steak")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(snack.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(snack.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    SnackListCell(snack: MockData.sampleSnack)
}
