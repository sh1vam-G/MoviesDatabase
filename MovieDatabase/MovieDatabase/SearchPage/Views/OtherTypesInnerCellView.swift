//
//  OtherTypesInnerView.swift
//  MovieDatabase
//
//  Created by Shivam Gupta on 06/08/24.
//

import SwiftUI

protocol OtherInnerCellDelegate: AnyObject {
    func cellTapped(genre: String, type: SearchPageOptions)
}
struct OtherTypesInnerCellView: View {
    weak var delegate: OtherInnerCellDelegate?
    var genreValue: String
    var cellType: SearchPageOptions
    var body: some View {
        HStack(alignment: .center) {
            Text("\(genreValue)")
                .padding(10)
                .padding(.leading, 50)
            Spacer()
        }
        .background(Color(hex: "#eeeeee"))
        .cornerRadius(10)
        .padding(.horizontal, 40)
        .onTapGesture {
            delegate?.cellTapped(genre: genreValue, type: cellType)
        }
    }
}
#Preview {
    OtherTypesInnerCellView(genreValue: "some", cellType: .actors)
}
