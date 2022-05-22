//
//  BannerViewTest.swift
//  UITestingDemo
//
//  Created by Shubham Kumar on 29/04/22.
//

struct TeamContent {
    let firstName: String
    let combineScore: Int
    let scores: [Int]
}

import SwiftUI

struct BannerViewTest: View {
    var teamsData = [
        TeamContent(firstName: "Chelsea", combineScore: 4, scores: [1,2,3,4]),
        TeamContent(firstName: "Manchester United", combineScore: 56, scores: [34,45,6,78])
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(maxWidth: 6, maxHeight: 6, alignment: .center)
                    .padding(.trailing, 2)
                HStack(spacing: 4) {
                    Text("Live")
                        .fontWeight(.medium)
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(maxWidth: 3, maxHeight: 3, alignment: .center)
                    Text("7th Innings")
                        .fontWeight(.medium)
                }
                Spacer()
                Text("League Name")
                    .fontWeight(.medium)
            }//:First HStack
            .font(Font.custom("Poppins", size: 11))
            .padding(.bottom, 8)
            
            HStack(spacing: 0) {
                VStack(spacing: 0) {
                    ForEach(teamsData.indices, id:\.self) { teamIndex in
                        HStack(spacing: 4) {
                            Image(systemName: "shield.fill")
                                .resizable()
                                .frame(maxWidth: 12, maxHeight: 12, alignment: .center)
                            Text(teamsData[teamIndex].firstName)
                            Spacer()
                            Image(systemName: "circle.hexagongrid.circle.fill")
                                .resizable()
                                .frame(maxWidth: 8, maxHeight: 8, alignment: .center)
                        }
                        .font(Font.custom("Kanit", size: 14))
                    }//:ForEach
                }
                .padding(.trailing, 4)
                VStack(alignment: .trailing, spacing: 0) {
                    ForEach(teamsData.indices, id:\.self) { teamIndex in
                        Text("\(teamsData[teamIndex].combineScore)")
                    }
                }
                .padding(.trailing, 6)
                
                HStack(spacing: 6) {
                    ForEach(teamsData[0].scores.indices, id:\.self) { scoreIndex in
                        VStack(alignment: .trailing, spacing: 0) {
                            Text("\(teamsData[0].scores[scoreIndex])")
                            Text("\(teamsData[1].scores[scoreIndex])")
                        }
                        
                    }
                }
                .padding(.leading, 6)
                .overlay(
                    Rectangle().fill(Color.red).frame(width: 1), alignment: .leading
                )
            }
            
            HStack(spacing: 0) {
                RoundedRectangle(cornerRadius: 0)
                    .frame(height: 1, alignment: .center)
                Text("Match Winner")
                    .padding(.horizontal, 6)
                RoundedRectangle(cornerRadius: 0)
                    .frame(height: 1, alignment: .center)
            }//:Third HStack
            
            HStack(spacing: 8) {
                ForEach(teamsData.indices, id:\.self) { item in
                    HStack(spacing: 0) {
                        Text("1")
                            .font(Font.custom("Poppins", size: 11))
                            .fontWeight(.medium)
                        Spacer()
                        Text("±110")
                            .font(Font.custom("Kanit", size: 14))
                            .fontWeight(.medium)
                    }
                    .padding(.vertical, 6)
                    .padding(.horizontal, 12)
                    .background(RoundedRectangle(cornerRadius: 6).fill(Color.white))
                }
            }//:Fourth HStack
            .padding(.top, 4)
        }//:VStack
        .padding(12)
        .background(Color.green)
    }
}

struct BannerViewTest_Previews: PreviewProvider {
    static var previews: some View {
        BannerViewTest()
            .previewLayout(.sizeThatFits)
    }
}
