//
//  ReportDetail.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 22.04.2022.
//

import Foundation

struct ReportDetail: Codable {
    let data: PDFBody
}

struct PDFBody: Codable {
    let pdfBody: PDFBodyResponse
}

struct PDFBodyResponse: Codable {
    let data: PDFData
}

struct PDFData: Codable {
    let profile: PDFProfile
}



struct PDFProfile: Codable {
    let profile: PDFInfluencerProfile
}


struct PDFInfluencerProfile: Codable {
    let fullname: String?
    let username: String
    let picture: String
}
