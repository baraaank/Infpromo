

import UIKit


class OptionsSelected {
    let option: String
    var isSelected: Bool
    var code: Any?
    var id: Int
    
    init(option: String, isSelected: Bool, code: Any? = nil, id: Int) {
        self.option = option
        self.isSelected = isSelected
        self.code = code
        self.id = id
    }
}


class HeadingsSelected {
    let title: String
    var isSelected: Bool
    
    init(title: String, isSelected: Bool) {
        self.title = title
        self.isSelected = isSelected
    }
}

struct SelectedFilter {
    let filterName: String
    let id: Int
    
}


enum HeaderKinds: String {
    case instagramInfluencer
    case instagramFollowers
    case youtubeInfluencer
    case youtubeFollowers
    case tiktokInfluencer
    case tiktokFollowers
}

enum HeaderIdentifiers: String {
    case instagramInfluencerIdentifier
    case instagramFollowersIdentifier
    case youtubeInfluencerIdentifier
    case youtubeFollowersIdentifier
    case tiktokInfluencerIdentifier
    case tiktokFollowersIdentifier
}






class SearchViewController: UIViewController {
    
    var minFollowers: Int?
    var maxFollowers: Int?
    var gender: String?
    var interests: [Int?] = []
    var language: String?
    var engagementRate: Double?
    var hasYoutube: Bool?
    
    var audienceGender: String?
    var audienceAge: [String?] = []
    var audienceInterests: [Int?] = []
    var audienceLanguage: String?
    
    
    var selectedFilterArray: [SelectedFilter] = []
    var audienceSelectedFilterArray: [SelectedFilter] = []
    
    var youtubeSelectedFilterArray: [SelectedFilter] = []
    var youtubeAudienceSelectedFilterArray: [SelectedFilter] = []
    
    var tiktokSelectedFilterArray: [SelectedFilter] = []
    var tiktokAudienceSelectedFilterArray: [SelectedFilter] = []
    
    var filterIndexCount: Int = 0
    var audienceFilterIndexCount: Int = 0
    
    // MARK: InstagramArrays
    //InfluencersProperties
    let influencerPropertiesHeadingsInstagram: [HeadingsSelected] = [
        HeadingsSelected(title: "Min Takipçi Sayısı", isSelected: false),
        HeadingsSelected(title: "Max Takipçi Sayısı", isSelected: false),
        HeadingsSelected(title: "Cinsiyet", isSelected: false),
        HeadingsSelected(title: "İlgi Alanları", isSelected: false),
        HeadingsSelected(title: "Dil", isSelected: false),
        HeadingsSelected(title: "Etkileşim Oranı", isSelected: false),
        HeadingsSelected(title: "Youtube Hesabı", isSelected: false),
    ]
    
    
    
    let arrayOneInfluencerInstagram = [
        OptionsSelected(option: "25.000", isSelected: false, code: 25000, id: 1),
        OptionsSelected(option: "50.000", isSelected: false, code: 50000, id: 2),
        OptionsSelected(option: "75.000", isSelected: false, code: 75000, id: 3),
        OptionsSelected(option: "100.000", isSelected: false, code: 100000, id: 4),
        OptionsSelected(option: "150.000", isSelected: false, code: 150000, id: 5),
        OptionsSelected(option: "200.000", isSelected: false, code: 200000, id: 6),
        OptionsSelected(option: "300.000", isSelected: false, code: 300000, id: 7),
        OptionsSelected(option: "500.000", isSelected: false, code: 500000, id: 8),
        OptionsSelected(option: "1.000.000", isSelected: false, code: 1000000, id: 9),
        OptionsSelected(option: "1.500.000", isSelected: false, code: 1500000, id: 10),
        OptionsSelected(option: "2.000.000", isSelected: false, code: 2000000, id: 11),
        OptionsSelected(option: "2.500.000", isSelected: false, code: 2500000, id: 12),
        OptionsSelected(option: "3.000.000", isSelected: false, code: 3000000, id: 13),
        OptionsSelected(option: "4.000.000", isSelected: false, code: 4000000, id: 14)
    ]
    
    let arrayTwoInfluencerInstagram = [
        OptionsSelected(option: "25.000", isSelected: false, code: 25000, id: 15),
        OptionsSelected(option: "50.000", isSelected: false, code: 50000, id: 16),
        OptionsSelected(option: "75.000", isSelected: false, code: 75000, id: 17),
        OptionsSelected(option: "100.000", isSelected: false, code: 100000, id: 18),
        OptionsSelected(option: "150.000", isSelected: false, code: 150000, id: 19),
        OptionsSelected(option: "200.000", isSelected: false, code: 200000, id: 20),
        OptionsSelected(option: "300.000", isSelected: false, code: 300000, id: 21),
        OptionsSelected(option: "500.000", isSelected: false, code: 500000, id: 22),
        OptionsSelected(option: "1.000.000", isSelected: false, code: 1000000, id: 23),
        OptionsSelected(option: "1.500.000", isSelected: false, code: 1500000, id: 24),
        OptionsSelected(option: "2.000.000", isSelected: false, code: 2000000, id: 25),
        OptionsSelected(option: "2.500.000", isSelected: false, code: 2500000, id: 26),
        OptionsSelected(option: "3.000.000", isSelected: false, code: 3000000, id: 27),
        OptionsSelected(option: "4.000.000", isSelected: false, code: 4000000, id: 28),
        OptionsSelected(option: "5.000.000", isSelected: false, code: 5000000, id: 29),
        OptionsSelected(option: "5.000.000+", isSelected: false, code: nil, id: 30)
    ]
    
    let arrayThreeInfluencerInstagram = [
        OptionsSelected(option: "Kadın", isSelected: false, code: "FEMALE", id: 31),
        OptionsSelected(option: "Erkek", isSelected: false, code: "MALE", id: 32)
    ]
    
    let arrayFourInfluencerInstagram = [
        OptionsSelected(option: "Kıyafet, Ayakkabı, Çanta & Aksesuar", isSelected: false, code: 13, id: 33),
        OptionsSelected(option: "Arkadaşlar, Aile & İlişkiler", isSelected: false, code: 1708, id: 34),
        OptionsSelected(option: "Kamera & Fotoğraf", isSelected: false, code: 11, id: 35),
        OptionsSelected(option: "Restoran, Yiyecek & İçecek", isSelected: false, code: 139, id: 36),
        OptionsSelected(option: "Gezi, Turizm & Havacılık", isSelected: false, code: 43, id: 37),
        OptionsSelected(option: "Oyuncak, Çocuk & Bebek", isSelected: false, code: 190, id: 38),
        OptionsSelected(option: "Güzellik & Kozmetik", isSelected: false, code: 80, id: 39),
        OptionsSelected(option: "Müzik", isSelected: false, code: 3, id: 40),
        OptionsSelected(option: "Televizyon & Sinema", isSelected: false, code: 1, id: 41),
        OptionsSelected(option: "Elektronik & Bilgisayar", isSelected: false, code: 25, id: 42),
        OptionsSelected(option: "Spor", isSelected: false, code: 21, id: 43),
        OptionsSelected(option: "Sanat & Dizayn", isSelected: false, code: 36, id: 44),
        OptionsSelected(option: "Araba & Motosiklet", isSelected: false, code: 1826, id: 45),
        OptionsSelected(option: "Fitness & Yoga", isSelected: false, code: 196, id: 46),
        OptionsSelected(option: "Evcil hayvan", isSelected: false, code: 673, id: 47),
        OptionsSelected(option: "Alışveriş & Parakende", isSelected: false, code: 7, id: 48),
        OptionsSelected(option: "Kahve, Çay & İçecek", isSelected: false, code: 9, id: 49),
        OptionsSelected(option: "Sağlıklı yaşam", isSelected: false, code: 798, id: 50),
        OptionsSelected(option: "Spor giyim", isSelected: false, code: 33, id: 51),
        OptionsSelected(option: "Lüks ürünler", isSelected: false, code: 1500, id: 52)
    ]
    
    let arrayFiveInfluencerInstagram = [
        OptionsSelected(option: "Türkçe", isSelected: false, code: "tr", id: 53),
        OptionsSelected(option: "İngilizce", isSelected: false, code: "en", id: 54),
        OptionsSelected(option: "İspanyolca", isSelected: false, code: "es", id: 55),
        OptionsSelected(option: "Portekizce", isSelected: false, code: "pt", id: 56),
        OptionsSelected(option: "Rusça", isSelected: false, code: "ru", id: 57),
        OptionsSelected(option: "Fransızca", isSelected: false, code: "fr", id: 58),
        OptionsSelected(option: "Arapça", isSelected: false, code: "ar", id: 59),
        OptionsSelected(option: "İtalyanca", isSelected: false, code: "it", id: 60),
        OptionsSelected(option: "Almanca", isSelected: false, code: "de", id: 61),
        OptionsSelected(option: "Farsça", isSelected: false, code: "fa", id: 62),
        OptionsSelected(option: "İndonesian", isSelected: false, code: "id", id: 63),
        OptionsSelected(option: "Japonca", isSelected: false, code: "ja", id: 64),
        OptionsSelected(option: "Polakça", isSelected: false, code: "pl", id: 65),
        OptionsSelected(option: "Çince", isSelected: false, code: "zh", id: 66),
        OptionsSelected(option: "Thai", isSelected: false, code: "th", id: 67),
        OptionsSelected(option: "Hindi", isSelected: false, code: "hi", id: 68),
        OptionsSelected(option: "Korece", isSelected: false, code: "ko", id: 69),
        OptionsSelected(option: "Malay", isSelected: false, code: "ms", id: 70),
        OptionsSelected(option: "Flemenkçe", isSelected: false, code: "nl", id: 71),
    ]
    
    let arraySixInfluencerInstagram = [
        OptionsSelected(option: "\u{2265} 1%", isSelected: false, code: 0.01, id: 72),
        OptionsSelected(option: "\u{2265} 2%", isSelected: false, code: 0.02, id: 73),
        OptionsSelected(option: "\u{2265} 3%", isSelected: false, code: 0.03, id: 74),
        OptionsSelected(option: "\u{2265} 4%", isSelected: false, code: 0.04, id: 75),
        OptionsSelected(option: "\u{2265} 5%", isSelected: false, code: 0.05, id: 76),
        OptionsSelected(option: "\u{2265} 6%", isSelected: false, code: 0.06, id: 77),
        OptionsSelected(option: "\u{2265} 7%", isSelected: false, code: 0.07, id: 78),
        OptionsSelected(option: "\u{2265} 8%", isSelected: false, code: 0.08, id: 79),
        OptionsSelected(option: "\u{2265} 9%", isSelected: false, code: 0.09, id: 80),
        OptionsSelected(option: "\u{2265} 10%", isSelected: false, code: 0.1, id: 81),
        OptionsSelected(option: "\u{2265} 11%", isSelected: false, code: 0.11, id: 82),
        OptionsSelected(option: "\u{2265} 12%", isSelected: false, code: 0.12, id: 83),
        OptionsSelected(option: "\u{2265} 13%", isSelected: false, code: 0.13, id: 84),
        OptionsSelected(option: "\u{2265} 14%", isSelected: false, code: 0.14, id: 85),
        OptionsSelected(option: "\u{2265} 15%", isSelected: false, code: 0.15, id: 86),
        OptionsSelected(option: "\u{2265} 16%", isSelected: false, code: 0.16, id: 87),
        OptionsSelected(option: "\u{2265} 17%", isSelected: false, code: 0.17, id: 88),
        OptionsSelected(option: "\u{2265} 18%", isSelected: false, code: 0.18, id: 89),
        OptionsSelected(option: "\u{2265} 19%", isSelected: false, code: 0.19, id: 90),
        OptionsSelected(option: "\u{2265} 20%", isSelected: false, code: 0.2, id: 91)
    ]
    
    let arraySevenInfluencerInstagram = [
        OptionsSelected(option: "Var", isSelected: false, code: true, id: 92),
        OptionsSelected(option: "Yok", isSelected: false, code: false, id: 93)
    ]
    
    
    
    //FollowersProperties
    let followersPropertiesHeadingsInstagram: [HeadingsSelected] = [
        .init(title: "Takipçi Cinsiyet Yoğunluğu", isSelected: false),
        .init(title: "Takipçi Yaş Aralığı", isSelected: false),
        .init(title: "Takipçi İlgi Alanları", isSelected: false),
        .init(title: "Takipçi Dili", isSelected: false)
    ]
    
    
    let arrayOneFollowersInstagram: [OptionsSelected] = [
        .init(option: "Kadın", isSelected: false, code: "FEMALE", id: 1),
        .init(option: "Erkek", isSelected: false, code: "MALE", id: 2)
    ]
    
    let arrayTwoFollowersInstagram: [OptionsSelected] = [
        .init(option: "18 - 24", isSelected: false, code: "18-24", id: 3),
        .init(option: "25 - 34", isSelected: false, code: "25-34", id: 4),
        .init(option: "35 - 44", isSelected: false, code: "35-44", id: 5),
        .init(option: "45 - 65", isSelected: false, code: "45-64", id: 6),
        .init(option: "65+", isSelected: false, code: "65-", id: 7)
    ]
    
    
    let arrayThreeFollowersInstagram: [OptionsSelected] = [
        .init(option: "Kıyafet, Ayakkabı, Çanta & Aksesuar", isSelected: false, code: 13, id: 8),
        .init(option: "Arkadaşlar, Aile & İlişkiler", isSelected: false, code: 1708, id: 9),
        .init(option: "Kamera & Fotoğraf", isSelected: false, code: 11, id: 10),
        .init(option: "Restoran, Yiyecek & İçecek", isSelected: false, code: 139, id: 11),
        .init(option: "Gezi, Turizm & Havacılık", isSelected: false, code: 43, id: 12),
        .init(option: "Oyuncak, Çocuk & Bebek", isSelected: false, code: 190, id: 13),
        .init(option: "Güzellik & Kozmetik", isSelected: false, code: 80, id: 14),
        .init(option: "Müzik", isSelected: false, code: 3, id: 15),
        .init(option: "Televizyon & Sinema", isSelected: false, code: 1, id: 16),
        .init(option: "Elektronik & Bilgisayar", isSelected: false, code: 25, id: 17),
        .init(option: "Spor", isSelected: false, code: 21, id: 18),
        .init(option: "Sanat & Dizayn", isSelected: false, code: 36, id: 19),
        .init(option: "Araba & Motosiklet", isSelected: false, code: 1826, id: 20),
        .init(option: "Fitness & Yoga", isSelected: false, code: 196, id: 21),
        .init(option: "Evcil hayvan", isSelected: false, code: 673, id: 22),
        .init(option: "Alışveriş & Parakende", isSelected: false, code: 7, id: 23),
        .init(option: "Kahve, Çay & İçecek", isSelected: false, code: 9, id: 24),
        .init(option:  "Sağlıklı yaşam", isSelected: false, code: 798, id: 25),
        .init(option: "Spor giyim", isSelected: false, code: 33, id: 26),
        .init(option: "Lüks ürünler", isSelected: false, code: 1500, id: 27)
    ]
    
    
    let arrayFourFollowersInstagram: [OptionsSelected] = [
        .init(option: "Türkçe", isSelected: false, code: "tr", id: 28),
        .init(option: "İngilizce", isSelected: false, code: "en", id: 29),
        .init(option: "İspanyolca", isSelected: false, code: "es", id: 30),
        .init(option: "Portekizce", isSelected: false, code: "pt", id: 31),
        .init(option: "Rusça", isSelected: false, code: "ru", id: 32),
        .init(option: "Fransızca", isSelected: false, code: "fr", id: 33),
        .init(option: "Arapça", isSelected: false, code: "ar", id: 34),
        .init(option: "İtalyanca", isSelected: false, code: "it", id: 35),
        .init(option: "Almanca", isSelected: false, code: "de", id: 36),
        .init(option: "Farsça", isSelected: false, code: "fa", id: 37),
        .init(option: "Indonesian", isSelected: false, code: "id", id: 38),
        .init(option: "Japonca", isSelected: false, code: "ja", id: 39),
        .init(option: "Polakça", isSelected: false, code: "pl", id: 40),
        .init(option: "Çince", isSelected: false, code: "zh", id: 41),
        .init(option: "Thai", isSelected: false, code: "th", id: 42),
        .init(option: "Hindi", isSelected: false, code: "hi", id: 43),
        .init(option: "Korece", isSelected: false, code: "ko", id: 44),
        .init(option: "Malay", isSelected: false, code: "ms", id: 45),
        .init(option: "Flemenkçe", isSelected: false, code: "nl", id: 46),
        
    ]
    

    
    // MARK: YoutubeTiktokArrays
    // influencerProperties
    let influencerPropertiesHeadingsYoutube: [HeadingsSelected] = [
        .init(title: "Min Abone Sayısı", isSelected: false),
        .init(title: "Max Abone Sayısı", isSelected: false),
        .init(title: "Min Görüntülenme Sayısı", isSelected: false),
        .init(title: "Max Görüntülenme Sayısı", isSelected: false),
        .init(title: "Lokasyon", isSelected: false),
        .init(title: "Cinsiyet", isSelected: false),
        .init(title: "Dil", isSelected: false),
        .init(title: "Etkileşim Oranı", isSelected: false)
    ]
    
    let arrayOneInfluencerYoutube: [OptionsSelected] = [
        OptionsSelected(option: "25.000", isSelected: false, code: 25000, id: 1),
        OptionsSelected(option: "50.000", isSelected: false, code: 50000, id: 2),
        OptionsSelected(option: "75.000", isSelected: false, code: 75000, id: 3),
        OptionsSelected(option: "100.000", isSelected: false, code: 100000, id: 4),
        OptionsSelected(option: "150.000", isSelected: false, code: 150000, id: 5),
        OptionsSelected(option: "200.000", isSelected: false, code: 200000, id: 6),
        OptionsSelected(option: "300.000", isSelected: false, code: 300000, id: 7),
        OptionsSelected(option: "500.000", isSelected: false, code: 500000, id: 8),
        OptionsSelected(option: "1.000.000", isSelected: false, code: 1000000, id: 9),
        OptionsSelected(option: "1.500.000", isSelected: false, code: 1500000, id: 10),
        OptionsSelected(option: "2.000.000", isSelected: false, code: 2000000, id: 11),
        OptionsSelected(option: "2.500.000", isSelected: false, code: 2500000, id: 12),
        OptionsSelected(option: "3.000.000", isSelected: false, code: 3000000, id: 13),
        OptionsSelected(option: "4.000.000", isSelected: false, code: 4000000, id: 14)
    ]
    
    
    let arrayTwoInfluencerYoutube: [OptionsSelected] = [
        OptionsSelected(option: "25.000", isSelected: false, code: 25000, id: 15),
        OptionsSelected(option: "50.000", isSelected: false, code: 50000, id: 16),
        OptionsSelected(option: "75.000", isSelected: false, code: 75000, id: 17),
        OptionsSelected(option: "100.000", isSelected: false, code: 100000, id: 18),
        OptionsSelected(option: "150.000", isSelected: false, code: 150000, id: 19),
        OptionsSelected(option: "200.000", isSelected: false, code: 200000, id: 20),
        OptionsSelected(option: "300.000", isSelected: false, code: 300000, id: 21),
        OptionsSelected(option: "500.000", isSelected: false, code: 500000, id: 22),
        OptionsSelected(option: "1.000.000", isSelected: false, code: 1000000, id: 23),
        OptionsSelected(option: "1.500.000", isSelected: false, code: 1500000, id: 24),
        OptionsSelected(option: "2.000.000", isSelected: false, code: 2000000, id: 25),
        OptionsSelected(option: "2.500.000", isSelected: false, code: 2500000, id: 26),
        OptionsSelected(option: "3.000.000", isSelected: false, code: 3000000, id: 27),
        OptionsSelected(option: "4.000.000", isSelected: false, code: 4000000, id: 28),
        OptionsSelected(option: "5.000.000", isSelected: false, code: 5000000, id: 29),
        OptionsSelected(option: "5.000.000+", isSelected: false, code: nil, id: 30)
    ]
    
    
    let arrayThreeInfluencerYoutube: [OptionsSelected] = [
        .init(option: "25.000", isSelected: false, code: 25000, id: 31),
        .init(option: "50.000", isSelected: false, code: 50000, id: 32),
        .init(option: "75.000", isSelected: false, code: 75000, id: 33),
        .init(option: "100.000", isSelected: false, code: 100000, id: 34),
        .init(option: "150.000", isSelected: false, code: 150000, id: 35),
        .init(option: "200.000", isSelected: false, code: 200000, id: 36),
        .init(option: "300.000", isSelected: false, code: 300000, id: 37),
        .init(option: "500.000", isSelected: false, code: 500000, id: 38),
        .init(option: "1.000.000", isSelected: false, code: 1000000, id: 39),
    ]
    
    
    
    let arrayFourInfluencerYoutube: [OptionsSelected] = [
        .init(option: "25.000", isSelected: false, code: 25000, id: 40),
        .init(option: "50.000", isSelected: false, code: 50000, id: 41),
        .init(option: "75.000", isSelected: false, code: 75000, id: 42),
        .init(option: "100.000", isSelected: false, code: 100000, id: 43),
        .init(option: "150.000", isSelected: false, code: 150000, id: 44),
        .init(option: "200.000", isSelected: false, code: 200000, id: 45),
        .init(option: "300.000", isSelected: false, code: 300000, id: 46),
        .init(option: "500.000", isSelected: false, code: 500000, id: 47),
        .init(option: "1.000.000", isSelected: false, code: 1000000, id: 48),
        .init(option: "1.000.000+", isSelected: false, code: nil, id: 49)
    ]
    
    
    let arrayFiveInfluencerYoutube: [OptionsSelected] = [
        .init(option: "Kadın", isSelected: false, code: "FEMALE", id: 50),
        .init(option: "Erkek", isSelected: false, code: "MALE", id: 51)
    ]
    
    
    
    let arraySixInfluencerYoutube: [OptionsSelected] = [
        .init(option: "Türkçe", isSelected: false, code: "tr", id: 52),
        .init(option: "İngilizce", isSelected: false, code: "en", id: 53),
        .init(option: "İspanyolca", isSelected: false, code: "es", id: 54),
        .init(option: "Portekizce", isSelected: false, code: "pt", id: 55),
        .init(option: "Rusça", isSelected: false, code: "ru", id: 56),
        .init(option: "Fransızca", isSelected: false, code: "fr", id: 57),
        .init(option: "Arapça", isSelected: false, code: "ar", id: 58),
        .init(option: "İtalyanca", isSelected: false, code: "it", id: 59),
        .init(option: "Almanca", isSelected: false, code: "de", id: 60),
        .init(option: "Farsça", isSelected: false, code: "fa", id: 61),
        .init(option: "Indonesian", isSelected: false, code: "id", id: 62),
        .init(option: "Japonca", isSelected: false, code: "ja", id: 63),
        .init(option: "Polakça", isSelected: false, code: "pl", id: 64),
        .init(option: "Çince", isSelected: false, code: "zh", id: 65),
        .init(option: "Thai", isSelected: false, code: "th", id: 66),
        .init(option: "Hindi", isSelected: false, code: "hi", id: 67),
        .init(option: "Korece", isSelected: false, code: "ko", id: 68),
        .init(option: "Malay", isSelected: false, code: "ms", id: 69),
        .init(option: "Flemenkçe", isSelected: false, code: "nl", id: 70),
    ]
    
    let arraySevenInfluencerYoutube: [OptionsSelected] = [
        OptionsSelected(option: "\u{2265} 1%", isSelected: false, code: 0.01, id: 71),
        OptionsSelected(option: "\u{2265} 2%", isSelected: false, code: 0.02, id: 72),
        OptionsSelected(option: "\u{2265} 3%", isSelected: false, code: 0.03, id: 73),
        OptionsSelected(option: "\u{2265} 4%", isSelected: false, code: 0.04, id: 74),
        OptionsSelected(option: "\u{2265} 5%", isSelected: false, code: 0.05, id: 75),
        OptionsSelected(option: "\u{2265} 6%", isSelected: false, code: 0.06, id: 76),
        OptionsSelected(option: "\u{2265} 7%", isSelected: false, code: 0.07, id: 77),
        OptionsSelected(option: "\u{2265} 8%", isSelected: false, code: 0.08, id: 78),
        OptionsSelected(option: "\u{2265} 9%", isSelected: false, code: 0.09, id: 79),
        OptionsSelected(option: "\u{2265} 10%", isSelected: false, code: 0.1, id: 80),
        OptionsSelected(option: "\u{2265} 11%", isSelected: false, code: 0.11, id: 81),
        OptionsSelected(option: "\u{2265} 12%", isSelected: false, code: 0.12, id: 82),
        OptionsSelected(option: "\u{2265} 13%", isSelected: false, code: 0.13, id: 83),
        OptionsSelected(option: "\u{2265} 14%", isSelected: false, code: 0.14, id: 84),
        OptionsSelected(option: "\u{2265} 15%", isSelected: false, code: 0.15, id: 85),
        OptionsSelected(option: "\u{2265} 16%", isSelected: false, code: 0.16, id: 86),
        OptionsSelected(option: "\u{2265} 17%", isSelected: false, code: 0.17, id: 87),
        OptionsSelected(option: "\u{2265} 18%", isSelected: false, code: 0.18, id: 88),
        OptionsSelected(option: "\u{2265} 19%", isSelected: false, code: 0.19, id: 89),
        OptionsSelected(option: "\u{2265} 20%", isSelected: false, code: 0.2, id: 90)
    ]
    
   
    
    // followesProperties
    let followersPropertiesHeadingsYoutube: [HeadingsSelected] = [
        .init(title: "Takipçi Cinsiyet Yoğunluğu", isSelected: false),
        .init(title: "Takipçi Yaş Aralığı", isSelected: false),
        .init(title: "Takipçi Dili", isSelected: false),
    ]
    
    let arrayOneFollowersYoutube: [OptionsSelected] = [
        .init(option: "Kadın", isSelected: false, code: "FEMALE", id: 1),
        .init(option: "Erkek", isSelected: false, code: "MALE", id: 2)
    ]
    
    let arrayTwoFollowersYoutube: [OptionsSelected] = [
        .init(option: "18 - 24", isSelected: false, code: "18-24", id: 3),
        .init(option: "25 - 34", isSelected: false, code: "25-34", id: 4),
        .init(option: "35 - 44", isSelected: false, code: "35-44", id: 5),
        .init(option: "45 - 65", isSelected: false, code: "45-64", id: 6),
        .init(option: "65+", isSelected: false, code: "65-", id: 7)
    ]
    
    let arrayThreeFollowersYoutube: [OptionsSelected] = [
        .init(option: "Türkçe", isSelected: false, code: "tr", id: 8),
        .init(option: "İngilizce", isSelected: false, code: "en", id: 9),
        .init(option: "İspanyolca", isSelected: false, code: "es", id: 10),
        .init(option: "Portekizce", isSelected: false, code: "pt", id: 11),
        .init(option: "Rusça", isSelected: false, code: "ru", id: 12),
        .init(option: "Fransızca", isSelected: false, code: "fr", id: 13),
        .init(option: "Arapça", isSelected: false, code: "ar", id: 14),
        .init(option: "İtalyanca", isSelected: false, code: "it", id: 15),
        .init(option: "Almanca", isSelected: false, code: "de", id: 16),
        .init(option: "Farsça", isSelected: false, code: "fa", id: 17),
        .init(option: "Indonesian", isSelected: false, code: "id", id: 18),
        .init(option: "Japonca", isSelected: false, code: "ja", id: 19),
        .init(option: "Polakça", isSelected: false, code: "pl", id: 20),
        .init(option: "Çince", isSelected: false, code: "zh", id: 21),
        .init(option: "Thai", isSelected: false, code: "th", id: 22),
        .init(option: "Hindi", isSelected: false, code: "hi", id: 23),
        .init(option: "Korece", isSelected: false, code: "ko", id: 24),
        .init(option: "Malay", isSelected: false, code: "ms", id: 25),
        .init(option: "Flemenkçe", isSelected: false, code: "nl", id: 26),
    ]
    
    
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Influencer Filtrele", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: .semibold), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
        label.textAlignment = .center
        return label
    }()
    
    private let dismissViewButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "xmark.square")
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.setImage(image, for: .normal)
        button.tintColor = UIColor().infpromo
        return button
    }()
    
    private let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Temizle", for: .normal)
        button.setTitleColor(UIColor().infpromo, for: .normal)
        return button
    }()
    
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Instagram", "Youtube", "Tiktok"])
        
        if #available(iOS 13.0, *) {
            segmentedControl.selectedSegmentTintColor = UIColor().infpromo
        } else {
            segmentedControl.tintColor = UIColor().infpromo
        }
        
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor().infpromo], for: .normal)
        segmentedControl.layer.borderWidth = 1
        segmentedControl.layer.borderColor = UIColor().infpromo.cgColor
        segmentedControl.sizeToFit()
        segmentedControl.addTarget(self, action: #selector(segmentedControlTapped), for: .valueChanged)
        
        return segmentedControl
    }()
    
    private let searchBar: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray3.cgColor
        textField.placeholder = "Influencer Ara"
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        customView.layer.cornerRadius = 8
        customView.backgroundColor = UIColor().infpromo
        customView.clipsToBounds = true
        paddingView.addSubview(customView)
        let customSymbolLabel = UILabel()
        customSymbolLabel.frame = customView.bounds
        customSymbolLabel.textAlignment = .center
        customSymbolLabel.attributedText = NSAttributedString(string: "@", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .semibold)])
        customView.addSubview(customSymbolLabel)
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.returnKeyType = .search
        return textField
    }()
    
    private let influencerHeadingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "influencerHeadingsTableView")
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemGray6
        return tableView
    }()
    
    private let influencerOptionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "influencerOptionsTableView")
        return tableView
    }()
    
    private let followersHeadingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "followersHeadingsTableView")
        
        return tableView
    }()
    
    private let followersOptionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "followersOptionsTableView")
        return tableView
    }()
    
    
    
    private let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor().infpromo
        button.setAttributedTitle(NSAttributedString(string: "Arama", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .bold)]), for: .normal)
        
        return button
    }()
    
    var customSegmented: CustomSegmentedControl!
    
    
    
    private lazy var influencerFilterCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayoutForFilters(headerKind: HeaderKinds.instagramInfluencer.rawValue))
        
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: HeaderKinds.instagramInfluencer.rawValue, withReuseIdentifier: HeaderIdentifiers.instagramInfluencerIdentifier.rawValue)
        collectionView.register(InfluencerFilterCollectionViewCell.self, forCellWithReuseIdentifier: InfluencerFilterCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private lazy var followersFilterCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayoutForFilters(headerKind: HeaderKinds.instagramFollowers.rawValue))
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: HeaderKinds.instagramFollowers.rawValue, withReuseIdentifier: HeaderIdentifiers.instagramFollowersIdentifier.rawValue)
        collectionView.register(FollowersFilterCollectionViewCell.self, forCellWithReuseIdentifier: FollowersFilterCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private lazy var youtubeInfluencerFilterCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayoutForFilters(headerKind: HeaderKinds.youtubeInfluencer.rawValue))
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: HeaderKinds.youtubeInfluencer.rawValue, withReuseIdentifier: HeaderIdentifiers.youtubeInfluencerIdentifier.rawValue)
        collectionView.register(YoutubeInfluencerFilterCollectionViewCell.self, forCellWithReuseIdentifier: YoutubeInfluencerFilterCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private lazy var youtubeFollowersFilterCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayoutForFilters(headerKind: HeaderKinds.youtubeFollowers.rawValue))
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: HeaderKinds.youtubeFollowers.rawValue, withReuseIdentifier: HeaderIdentifiers.youtubeFollowersIdentifier.rawValue)
        collectionView.register(YoutubeFollowersFilterCollectionViewCell.self, forCellWithReuseIdentifier: YoutubeFollowersFilterCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private lazy var tiktokInfluencerFilterCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayoutForFilters(headerKind: HeaderKinds.tiktokInfluencer.rawValue))
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: HeaderKinds.tiktokInfluencer.rawValue, withReuseIdentifier: HeaderIdentifiers.tiktokInfluencerIdentifier.rawValue)
        collectionView.register(TiktokInfluencerFilterCollectionViewCell.self, forCellWithReuseIdentifier: TiktokInfluencerFilterCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private lazy var tiktokFollowersFilterCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayoutForFilters(headerKind: HeaderKinds.tiktokFollowers.rawValue))
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: HeaderKinds.tiktokFollowers.rawValue, withReuseIdentifier: HeaderIdentifiers.tiktokFollowersIdentifier.rawValue)
        collectionView.register(TiktokFollowersFilterCollectionViewCell.self, forCellWithReuseIdentifier: TiktokFollowersFilterCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    
    
    func collectionViewLayoutForFilters(headerKind: String) -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { section, env in
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1.0))
            let headerView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: headerKind, alignment: .leading)
            let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .absolute(23))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .absolute(23))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .none, top: .none, trailing: .fixed(2), bottom: .none)
            let section = NSCollectionLayoutSection(group: group)
            
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: UIScreen.main.bounds.width / 5, bottom: 0, trailing: 0)
            section.orthogonalScrollingBehavior = .continuous
            section.boundarySupplementaryItems = [headerView]
            return section
        }
        
        return layout
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        saveState()
    }
    
    var selectedIndex = IndexPath(row: -1, section: 0)
    var audienceSelectedIndex = IndexPath(row: -1, section: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customSegmented = CustomSegmentedControl(frame: CGRect(x: 20, y: 178, width: view.width - 40, height: 30), buttonTitle: ["Influencer Özellikleri", "Takipçi Özellikleri"])
        customSegmented.delegate = self
        view.addSubview(customSegmented)
        view.backgroundColor = .white
        
        addSubviews()
        
        delegatesAndDataSources()
          
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        dismissViewButton.addTarget(self, action: #selector(dismissViewButtonTapped), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        
        followersHeadingsTableView.isHidden = true
        followersOptionsTableView.isHidden = true
        influencerFilterCollectionView.isHidden = true
        followersFilterCollectionView.isHidden = true
        
        
        let tapGestureReconizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGestureReconizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGestureReconizer)
        
        searchBar.delegate = self
        loadSelectedOnes()
        loadAudienceSelectedOnes()
    }
    
    func delegatesAndDataSources() {
        influencerHeadingsTableView.delegate = self
        influencerHeadingsTableView.dataSource = self
        
        influencerOptionsTableView.delegate = self
        influencerOptionsTableView.dataSource = self
        
        followersHeadingsTableView.delegate = self
        followersHeadingsTableView.dataSource = self
        
        followersOptionsTableView.delegate = self
        followersOptionsTableView.dataSource = self
        
        influencerFilterCollectionView.delegate = self
        influencerFilterCollectionView.dataSource = self
        
        followersFilterCollectionView.delegate = self
        followersFilterCollectionView.dataSource = self
        
        youtubeInfluencerFilterCollectionView.delegate = self
        youtubeInfluencerFilterCollectionView.dataSource = self
        
        youtubeFollowersFilterCollectionView.delegate = self
        youtubeFollowersFilterCollectionView.dataSource = self
        
        tiktokInfluencerFilterCollectionView.delegate = self
        tiktokInfluencerFilterCollectionView.dataSource = self
        
        tiktokFollowersFilterCollectionView.delegate = self
        tiktokFollowersFilterCollectionView.dataSource = self
    }
    
    @objc func hideKeyboard() {
        searchBar.endEditing(true)
    }
    
    func addSubviews() {
        
        view.addSubview(topLabel)
        view.addSubview(dismissViewButton)
        view.addSubview(segmentedControl)
        view.addSubview(influencerHeadingsTableView)
        view.addSubview(influencerOptionsTableView)
        view.addSubview(followersHeadingsTableView)
        view.addSubview(followersOptionsTableView)
        view.addSubview(searchBar)
        view.addSubview(searchButton)
        view.addSubview(influencerFilterCollectionView)
        view.addSubview(followersFilterCollectionView)
        view.addSubview(clearButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        segmentedControl.selectedSegmentIndex = 0
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: 0, section: 0)
            self.influencerHeadingsTableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
            self.influencerHeadingsTableView.delegate?.tableView?(self.influencerHeadingsTableView, didSelectRowAt: indexPath)
            
            self.followersHeadingsTableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
            self.followersHeadingsTableView.delegate?.tableView?(self.followersHeadingsTableView, didSelectRowAt: indexPath)
            
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        topLabel.frame = CGRect(x: 80, y: 20, width: view.width - 160, height: 30)
        dismissViewButton.frame = CGRect(x: view.width - 45, y: 22, width: 26, height: 26)
        clearButton.frame = CGRect(x: 10, y: topLabel.top, width: 60, height: 30)
        segmentedControl.frame = CGRect(x: 40, y: topLabel.bottom + 20, width: view.width - 80, height: 28)
        searchBar.frame = CGRect(x: 10, y: segmentedControl.bottom + 20, width: view.width - 20, height: 40) //158
        searchButton.frame = CGRect(x: 20, y: view.height - 120 , width: view.width - 40, height: 50)
        influencerFilterCollectionView.frame = CGRect(x: 15, y: segmentedControl.bottom + 12, width: view.width - 30, height: 25)
        followersFilterCollectionView.frame = CGRect(x: 15, y: influencerFilterCollectionView.bottom + 12, width: view.width - 30, height: 25)
        influencerHeadingsTableView.frame = CGRect(x: 0, y: customSegmented.bottom + 20, width: view.width / 3, height: view.height - 240 - 130)
        influencerOptionsTableView.frame = CGRect(x: influencerHeadingsTableView.right, y: customSegmented.bottom + 20, width: 2 * (view.width) / 3 - 20, height: view.height - 240 - 130)
        followersHeadingsTableView.frame = CGRect(x: 0, y: customSegmented.bottom + 20, width: view.width / 3, height: view.height - searchButton.height - 70 - 130)
        followersOptionsTableView.frame = CGRect(x: influencerHeadingsTableView.right, y: customSegmented.bottom + 20, width: 2 * (view.width) / 3 - 20, height: view.height - 240 - 130)
        
    }
    
    //??????
    func commonClear(optionsArray: [OptionsSelected], filteredArray: [SelectedFilter], id: Int) -> Any? {
        if let deSelectOne = optionsArray.firstIndex(where: { $0.id == id}) {
            optionsArray[deSelectOne].isSelected = !optionsArray[deSelectOne].isSelected
            return nil
        }
        return nil
    }
    
    func audienceClearFilters(row: Int, section: Int) {
        let indexPath = IndexPath(row: row, section: section)
        let filterId = audienceSelectedFilterArray[indexPath.row].id
        
        if let deSelectOne = arrayOneFollowersInstagram.firstIndex(where: { $0.id == filterId }) {
            arrayOneFollowersInstagram[deSelectOne].isSelected = !arrayOneFollowersInstagram[deSelectOne].isSelected
            audienceGender = nil
        }
        
        if let deSelectTwo = arrayTwoFollowersInstagram.firstIndex(where: { $0.id == filterId }) {
            arrayTwoFollowersInstagram[deSelectTwo].isSelected = !arrayTwoFollowersInstagram[deSelectTwo].isSelected
            if let audienceAges = audienceAge.firstIndex(where: { $0 == arrayTwoFollowersInstagram[deSelectTwo].code as? String }) {
                audienceAge.remove(at: audienceAges)
            }
        }
        
        if let deSelectThree = arrayThreeFollowersInstagram.firstIndex(where: { $0.id == filterId }) {
            arrayThreeFollowersInstagram[deSelectThree].isSelected = !arrayThreeFollowersInstagram[deSelectThree].isSelected
            if let audienceInterest = audienceInterests.firstIndex(where: { $0 == arrayThreeFollowersInstagram[deSelectThree].code as? Int }) {
                audienceInterests.remove(at: audienceInterest)
            }
        }
        
        if let deSelectFour = arrayFourFollowersInstagram.firstIndex(where: { $0.id == filterId }) {
            arrayFourFollowersInstagram[deSelectFour].isSelected = !arrayFourFollowersInstagram[deSelectFour].isSelected
            audienceLanguage = nil
        }
        
        
        DispatchQueue.main.async {
            self.followersFilterCollectionView.reloadData()
        }
        
        DispatchQueue.main.async {
            self.followersOptionsTableView.reloadData()
        }
    }
    
    func clearFilters(row: Int, section: Int) {
        let indexPath = IndexPath(row: row, section: section)
        let filterId = selectedFilterArray[indexPath.row].id
        
        if let deSelectOne = arrayOneInfluencerInstagram.firstIndex(where: { $0.id == filterId }) {
            arrayOneInfluencerInstagram[deSelectOne].isSelected = !arrayOneInfluencerInstagram[deSelectOne].isSelected
            minFollowers = nil
        }
        
        if let deSelectTwo = arrayTwoInfluencerInstagram.firstIndex(where: { $0.id == filterId }) {
            arrayTwoInfluencerInstagram[deSelectTwo].isSelected = !arrayTwoInfluencerInstagram[deSelectTwo].isSelected
            maxFollowers = nil
        }
        
        if let deSelectThree = arrayThreeInfluencerInstagram.firstIndex(where: { $0.id == filterId }) {
            arrayThreeInfluencerInstagram[deSelectThree].isSelected = !arrayThreeInfluencerInstagram[deSelectThree].isSelected
            gender = nil
        }
        
        if let deSelectFour = arrayFourInfluencerInstagram.firstIndex(where: { $0.id == filterId }) {
            arrayFourInfluencerInstagram[deSelectFour].isSelected = !arrayFourInfluencerInstagram[deSelectFour].isSelected
            if let interest = interests.firstIndex(where: { $0 == arrayFourInfluencerInstagram[deSelectFour].code as? Int }) {
                interests.remove(at: interest)
            }
        }
        
        if let deSelectFive = arrayFiveInfluencerInstagram.firstIndex(where: { $0.id == filterId }) {
            arrayFiveInfluencerInstagram[deSelectFive].isSelected = !arrayFiveInfluencerInstagram[deSelectFive].isSelected
            language = nil
        }
        
        if let deSelectSix = arraySixInfluencerInstagram.firstIndex(where: { $0.id == filterId }) {
            arraySixInfluencerInstagram[deSelectSix].isSelected = !arraySixInfluencerInstagram[deSelectSix].isSelected
            engagementRate = nil
        }
        
        if let deSelectSeven = arraySevenInfluencerInstagram.firstIndex(where: { $0.id == filterId }) {
            arraySevenInfluencerInstagram[deSelectSeven].isSelected = !arraySevenInfluencerInstagram[deSelectSeven].isSelected
            hasYoutube = nil
        }
        
        DispatchQueue.main.async {
            self.influencerFilterCollectionView.reloadData()
        }
        
        DispatchQueue.main.async {
            self.influencerOptionsTableView.reloadData()
        }
    }
    
    @objc func clearButtonTapped() {
        let countFilter = selectedFilterArray.count
        
        for i in 0..<countFilter {
            clearFilters(row: i, section: 0)
        }
        selectedFilterArray.removeAll()
        
        
        let countAudienceFilter = audienceSelectedFilterArray.count
        
        for i in 0..<countAudienceFilter {
            audienceClearFilters(row: i, section: 0)
        }
        
        audienceSelectedFilterArray.removeAll()
        
        hideSearchBar()
    }
    
    @objc func filterDismissButtonTapped(sender: CustomFilterButton) {
        clearFilters(row: sender.row, section: sender.section)
        selectedFilterArray.remove(at: sender.row)
        hideSearchBar()
    }
    
    @objc func audienceFilterDismissButtonTapped(sender: CustomFilterButton) {
        audienceClearFilters(row: sender.row, section: sender.section)
        audienceSelectedFilterArray.remove(at: sender.row)
        hideSearchBar()
    }
    
    @objc func youtubeFilterDismissButtonTapped(sender: CustomFilterButton) {
       
    }
    
    @objc func youtubeAudienceFilterDismissButtonTapped(sender: CustomFilterButton) {
        
    }
    
    @objc func tiktokFilterDismissButtonTapped(sender: CustomFilterButton) {
        
    }
    
    @objc func tiktokAudienceFilterDismissButtonTapped(sender: CustomFilterButton) {
        
    }
    
    
    
    
    func hideSearchBar() {
        if selectedFilterArray.count == 0 && audienceSelectedFilterArray.count == 0 {
            searchBar.isHidden = false
            influencerFilterCollectionView.isHidden = true
            followersFilterCollectionView.isHidden = true
        } else {
            searchBar.isHidden = true
            influencerFilterCollectionView.isHidden = false
            followersFilterCollectionView.isHidden = false
        }
    }
    
    func searchButtonClicked() {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
        
        let deleteComponents: [String: Any] = ["maxPage": -1,
                                               "initialPage": 0]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "deleteComponents"), object: nil, userInfo: deleteComponents)
        
        var searchBarText = ""
        if searchBar.text?.contains("@") == true {
            searchBarText = searchBar.text!
        } else {
            searchBarText = "@\(searchBar.text!)"
        }
        
        if !searchBar.isHidden {
            APICaller.shared.searchByUsername(username: searchBarText) { response in
                switch response {
                case .success(let model):
                    var directProfileResponse: [SearchWithFilterCellViewModel] = []
                    directProfileResponse.append(contentsOf: model.data.bodyNew.directs.map({
                        .init(engagementRate: $0.profile.engagementRate,
                              engagements: $0.profile.engagements,
                              followers: $0.profile.followers,
                              fullname: $0.profile.fullname,
                              picture: $0.profile.picture,
                              url: $0.profile.url,
                              username: $0.profile.username,
                              isPrivate: $0.profile.isPrivate,
                              influencerId: $0.userId)
                    })
                    )
                    
                    
                    let dataDict: [String: [SearchWithFilterCellViewModel]] = ["dataDict": directProfileResponse]
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newDataNotif"), object: nil, userInfo: dataDict)
                    
                    
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    let errorString = "Aradığınız öğe bulunamadı."
                    let usernameErrorDict: [String: String] = ["searcByUsernameUnsuccessful": errorString]
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "usernameErrorDict"), object: nil, userInfo: usernameErrorDict)
                    
                }
                
                
            }
        } else {
//            print("minFollowers \(minFollowers)")
//            print("maxFollowers \(maxFollowers)")
//            print("gender \(gender)")
//            print("interests \(interests)")
//            print("language \(language)")
//            print("engagementRate \(engagementRate)")
//            print("hasYoutube \(hasYoutube)" )
//            print("audience age: \(audienceAge)")
//            print("audience lang: \(audienceLanguage)")
//            print("audience gender: \(audienceGender)")
//            print("audience interests: \(audienceInterests)")
////
            APICaller.shared.filter(page: 0, minFollowers: minFollowers, maxFollowers: maxFollowers, gender: gender, interests: interests, language: language, engagementRate: engagementRate, hasYoutube: hasYoutube, audienceGender: audienceGender, audienceAges: audienceAge, audienceInterests: audienceInterests, audienceLanguage: audienceLanguage) { response in
                
                switch response {
                case .success(let model):
                    var filterResultArray: [SearchWithFilterCellViewModel] = []
                    filterResultArray.append(contentsOf: model.data.bodyNew.lookalikes.map({
                        .init(engagementRate: $0.profile.engagementRate,
                              engagements: $0.profile.engagements,
                              followers: $0.profile.followers,
                              fullname: $0.profile.fullname,
                              picture: $0.profile.picture,
                              url: $0.profile.url,
                              username: $0.profile.username,
                              isPrivate: nil,
                              influencerId: $0.userId)
                    }))
                    
                    
                    let filterBasedDict: [String: Any] = ["total": model.data.bodyNew.total,
                                                          "minFollowers": self.minFollowers as Any,
                                                          "maxFollowers": self.maxFollowers as Any,
                                                          "gender": self.gender as Any,
                                                          "interests": self.interests,
                                                          "engagementRate": self.engagementRate as Any,
                                                          "hasYoutube": self.hasYoutube as Any,
                                                          "audienceGender": self.audienceGender as Any,
                                                          "audienceAges": self.audienceAge as Any,
                                                          "audienceInterests": self.audienceInterests as Any,
                                                          "audienceLanguage": self.audienceLanguage as Any,
                                                        
                    ]
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "filterBasedDict"), object: nil, userInfo: filterBasedDict)
                    

                    let filterResultDict: [String: [SearchWithFilterCellViewModel]] = ["filterResultDict": filterResultArray]
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newFilterResultDict"), object: nil, userInfo: filterResultDict)
                    
                    
                    
                    
                case .failure(let error):
                    print(error)
                    
                    let filterString = "Aradığınız öğe bulunamadı."
                    let filterErrorDict: [String: String] = ["searcByFilterUnsuccessful": filterString]
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "filterErrorDict"), object: nil, userInfo: filterErrorDict)
                }
            }
        }
        
        saveState()
    }
    
    @objc func searchButtonTapped() {
        searchButtonClicked()
        saveState()
        
    }
    
    @objc func dismissViewButtonTapped() {
        dismiss(animated: true, completion: nil)
        saveState()
        
    }
    
    private func reloadTableViews() {
        influencerHeadingsTableView.reloadData()
        influencerOptionsTableView.reloadData()
        followersHeadingsTableView.reloadData()
        followersOptionsTableView.reloadData()
    }
    
    
    
    @objc func segmentedControlTapped(_ sender: UISegmentedControl) {
        reloadTableViews()
    }
    
    
    
    func saveState() {
        let ids = selectedFilterArray.map({$0.id})
        UserDefaults.standard.set(ids, forKey: "stateSelected")
        
        let audienceIds = audienceSelectedFilterArray.map({$0.id})
        UserDefaults.standard.set(audienceIds, forKey: "stateAudienceSelected")
    }
    
    func handleLoadedIsSelected(optionsArray: [OptionsSelected], filteredArray: inout [SelectedFilter], i: Int, deSelectOne: Int) -> Any? {
        
                let abb = optionsArray[deSelectOne]
                abb.isSelected = !abb.isSelected
                filteredArray.insert(.init(filterName: abb.option, id: abb.id), at: i)
                return abb.code as Any
        
    }
    
    func loadAudienceSelectedOnes() {
        guard let returnSelected = UserDefaults.standard.object(forKey: "stateAudienceSelected") else { return }
        
        let ret = returnSelected as! [Int]
        print(ret)
        for i in 0..<ret.count {
            if let deSelectOne = arrayOneFollowersInstagram.firstIndex(where: { $0.id == ret[i] }) {
               audienceGender = handleLoadedIsSelected(optionsArray: arrayOneFollowersInstagram, filteredArray: &audienceSelectedFilterArray, i: i, deSelectOne: deSelectOne) as? String
            }
            if let deSelectTwo = arrayTwoFollowersInstagram.firstIndex(where: { $0.id == ret[i] }) {
                let abb = arrayTwoFollowersInstagram[deSelectTwo]
                abb.isSelected = !abb.isSelected
                audienceAge.append(abb.code as? String)
                audienceSelectedFilterArray.insert(.init(filterName: abb.option, id: abb.id), at: i)
            }
            
            if let deSelectThree = arrayThreeFollowersInstagram.firstIndex(where: { $0.id == ret[i] }) {
                let abb = arrayThreeFollowersInstagram[deSelectThree]
                abb.isSelected = !abb.isSelected
                audienceInterests.append(abb.code as? Int)
                audienceSelectedFilterArray.insert(.init(filterName: abb.option, id: abb.id), at: i)
            }
            
            if let deSelectFour = arrayFourFollowersInstagram.firstIndex(where: { $0.id == ret[i] }) {
                audienceLanguage = handleLoadedIsSelected(optionsArray: arrayFourFollowersInstagram, filteredArray: &audienceSelectedFilterArray, i: i, deSelectOne: deSelectFour) as? String
            }
        
            
        }
        
        DispatchQueue.main.async {
            self.followersFilterCollectionView.reloadData()
        }
        
        DispatchQueue.main.async {
            self.followersOptionsTableView.reloadData()
        }
    }
    
    
    
   
    
    func loadSelectedOnes() {
        
        guard let returnSelected = UserDefaults.standard.object(forKey: "stateSelected") else { return }
        print(returnSelected)
        let ret = returnSelected as! [Int]
        print(ret)
        for i in 0..<ret.count {
            if let deSelectOne = arrayOneInfluencerInstagram.firstIndex(where: { $0.id == ret[i] }) {
                minFollowers = handleLoadedIsSelected(optionsArray: arrayOneInfluencerInstagram, filteredArray: &selectedFilterArray, i: i, deSelectOne: deSelectOne) as? Int
        }
                
            if let deSelectTwo = arrayTwoInfluencerInstagram.firstIndex(where: { $0.id == ret[i] }) {
                maxFollowers = handleLoadedIsSelected(optionsArray: arrayTwoInfluencerInstagram, filteredArray: &selectedFilterArray, i: i, deSelectOne: deSelectTwo) as? Int
            }
            
            if let deSelectThree = arrayThreeInfluencerInstagram.firstIndex(where: { $0.id == ret[i] }) {
                gender = handleLoadedIsSelected(optionsArray: arrayThreeInfluencerInstagram, filteredArray: &selectedFilterArray, i: i, deSelectOne: deSelectThree) as? String
            }
            
            if let deSelectFour = arrayFourInfluencerInstagram.firstIndex(where: { $0.id == ret[i] }) {
                let abb = arrayFourInfluencerInstagram[deSelectFour]
                abb.isSelected = !abb.isSelected
                interests.append(abb.code as? Int)
                selectedFilterArray.insert(.init(filterName: abb.option, id: abb.id), at: i)
            }
            
            
            if let deSelectFive = arrayFiveInfluencerInstagram.firstIndex(where: { $0.id == ret[i] }) {
                language = handleLoadedIsSelected(optionsArray: arrayFiveInfluencerInstagram, filteredArray: &selectedFilterArray, i: i, deSelectOne: deSelectFive) as? String
            }
            
            if let deSelectSix = arraySixInfluencerInstagram.firstIndex(where: { $0.id == ret[i] }) {
                engagementRate = handleLoadedIsSelected(optionsArray: arraySixInfluencerInstagram, filteredArray: &selectedFilterArray, i: i, deSelectOne: deSelectSix) as? Double
            }
            
            if let deSelectSeven = arraySevenInfluencerInstagram.firstIndex(where: { $0.id == ret[i] }) {
                hasYoutube = handleLoadedIsSelected(optionsArray: arraySevenInfluencerInstagram, filteredArray: &selectedFilterArray, i: i, deSelectOne: deSelectSeven) as? Bool
            }
        
            
        }
        
        DispatchQueue.main.async {
            self.influencerFilterCollectionView.reloadData()
        }
        
        DispatchQueue.main.async {
            self.influencerOptionsTableView.reloadData()
        }
        
        
        }
}

extension SearchViewController: CustomSegmentedControlDelegate {
    
    func changeToIndex(index: Int) {
        switch index {
        case 0:
            influencerHeadingsTableView.isHidden = false
            influencerOptionsTableView.isHidden = false
            followersHeadingsTableView.isHidden = true
            followersOptionsTableView.isHidden = true
            
            
            
        case 1:
            influencerHeadingsTableView.isHidden = true
            influencerOptionsTableView.isHidden = true
            followersHeadingsTableView.isHidden = false
            followersOptionsTableView.isHidden = false
            
            
            
        default:
            print("custom segmented switch default")
        }
    }
}


extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            switch tableView {
            case influencerHeadingsTableView:
                return influencerPropertiesHeadingsInstagram.count
            case influencerOptionsTableView:
                switch influencerHeadingsTableView.indexPathForSelectedRow {
                case [0,0]:
                    return arrayOneInfluencerInstagram.count
                case [0,1]:
                    return arrayTwoInfluencerInstagram.count
                case [0,2]:
                    return arrayThreeInfluencerInstagram.count
                case [0,3]:
                    return arrayFourInfluencerInstagram.count
                case [0,4]:
                    return arrayFiveInfluencerInstagram.count
                case [0,5]:
                    return arraySixInfluencerInstagram.count
                case [0,6]:
                    return arraySevenInfluencerInstagram.count
                default:
                    print("default returned 10")
                    return 10
                    
                }

            case followersHeadingsTableView:
                return followersPropertiesHeadingsInstagram.count
            case followersOptionsTableView:
                switch followersHeadingsTableView.indexPathForSelectedRow {
                case [0,0]:
                    return arrayOneFollowersInstagram.count
                case [0,1]:
                    return arrayTwoFollowersInstagram.count
                case [0,2]:
                    return arrayThreeFollowersInstagram.count
                case [0,3]:
                    return arrayFourFollowersInstagram.count
                default:
                    print("default returned 10")
                    return 10
                    
                }
                
                
            default:
                print("first numberOfRowsInSection switch error")
                //                influencerOptionsTableView.isHidden = true
            }
            //        case 1:
            //            switch tableView {
            //            case influencerHeadingsTableView:
            //                return influencerPropertiesHeadingsYT.count
            //            case influencerOptionsTableView:
            //                return populateInfluencerYT.count
            //            case followersHeadingsTableView:
            //                return followersPropertiesHeadingsYT.count
            //            case followersOptionsTableView:
            //                return populateFollowersYT.count
            //            default:
            //                print("numberOfRowsInSection switch error")
            //            }
            //        case 2:
            //            switch tableView {
            //            case influencerHeadingsTableView:
            //                return influencerPropertiesHeadingsYT.count
            //            case influencerOptionsTableView:
            //                return populateInfluencerYT.count
            //            case followersHeadingsTableView:
            //                return followersPropertiesHeadingsYT.count
            //            case followersOptionsTableView:
            //                return populateFollowersYT.count
            //            default:
            //                print("numberOfRowsInSection switch error")
            //            }
        default:
            print("numberOfRowsInSection switch error")
            break
        }
        
        return 1
    }
    
    
    //cell text attributtes
    func cellConfig(cell: UITableViewCell, optionArray: [OptionsSelected], indexPath: IndexPath) {
        let cellText = optionArray[indexPath.row].option
        cell.textLabel?.attributedText = NSAttributedString(string: cellText, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular)])
        cell.textLabel?.numberOfLines = 0
        
        if optionArray[indexPath.row].isSelected == false {
            cell.backgroundColor = .white
            cell.textLabel?.textColor = .black
            
            
        } else {
            
            cell.backgroundColor = UIColor().infpromo
            cell.textLabel?.textColor = .white
            
        }
        
    }
    
    func cellForRowConfig(cell: UITableViewCell, headingArray: [HeadingsSelected], indexPath: IndexPath) -> UITableViewCell {
        let cellText = headingArray[indexPath.row].title
        cell.textLabel?.attributedText = NSAttributedString(string: cellText, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular)])
        cell.textLabel?.numberOfLines = 0
        cell.backgroundColor = .systemGray6
        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            
            switch tableView {
            case influencerHeadingsTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "influencerHeadingsTableView", for: indexPath)
                
                return cellForRowConfig(cell: cell, headingArray: influencerPropertiesHeadingsInstagram, indexPath: indexPath)
                
            case influencerOptionsTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "influencerOptionsTableView", for: indexPath)
                
                switch influencerHeadingsTableView.indexPathForSelectedRow {
                case [0,0]:
                    cellConfig(cell: cell, optionArray: arrayOneInfluencerInstagram, indexPath: indexPath)
                    
                case [0,1]:
                    cellConfig(cell: cell, optionArray: arrayTwoInfluencerInstagram, indexPath: indexPath)
                    
                case [0,2]:
                    cellConfig(cell: cell, optionArray: arrayThreeInfluencerInstagram, indexPath: indexPath)
                    
                case [0,3]:
                    cellConfig(cell: cell, optionArray: arrayFourInfluencerInstagram, indexPath: indexPath)
                    
                case [0,4]:
                    cellConfig(cell: cell, optionArray: arrayFiveInfluencerInstagram, indexPath: indexPath)
                    
                case [0,5]:
                    cellConfig(cell: cell, optionArray: arraySixInfluencerInstagram, indexPath: indexPath)
                    
                case [0,6]:
                    cellConfig(cell: cell, optionArray: arraySevenInfluencerInstagram, indexPath: indexPath)
                    
                default:
                    //                    let cellText = arrayOneInfluencerInstagram[indexPath.row].option
                    //                    cellConfig(cell: cell, cellText: cellText, optionArray: arrayOneInfluencerInstagram, indexPath: indexPath)
                    print("whaaaaaaattttttt")
                    
                }
                
                cell.selectionStyle = .none
                return cell
                //            case followersHeadingsTableView:
                //                let cell = tableView.dequeueReusableCell(withIdentifier: "followersHeadingsTableView", for: indexPath)
                //                let cellText = followersPropertiesHeadingsInstagram[indexPath.row]
                //                cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
                //
                //                return cell
                //            case followersOptionsTableView:
                //                let cell = tableView.dequeueReusableCell(withIdentifier: "followersOptionsTableView", for: indexPath)
                //                let cellText = populateFollowersInstagram[indexPath.row]
                //                cellConfig(cell: cell, cellText: cellText, tableView: tableView, indexPath: indexPath)
                //                cell.selectionStyle = .none
                //                return cell
                //
            
            
        case followersHeadingsTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "followersHeadingsTableView", for: indexPath)
            
            return cellForRowConfig(cell: cell, headingArray: followersPropertiesHeadingsInstagram, indexPath: indexPath)
        case followersOptionsTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "followersOptionsTableView", for: indexPath)
            
            switch followersHeadingsTableView.indexPathForSelectedRow {
            case [0,0]:
                cellConfig(cell: cell, optionArray: arrayOneFollowersInstagram, indexPath: indexPath)
                
            case [0,1]:
                cellConfig(cell: cell, optionArray: arrayTwoFollowersInstagram, indexPath: indexPath)
                
            case [0,2]:
                cellConfig(cell: cell, optionArray: arrayThreeFollowersInstagram, indexPath: indexPath)
                
            case [0,3]:
                cellConfig(cell: cell, optionArray: arrayFourFollowersInstagram, indexPath: indexPath)
    
            default:
                print("whaaaaaaattttttt")
            }
            
            cell.selectionStyle = .none
            return cell
            
        default:
            print("cellforrowat error")
            
            
        }
            
        default:
            print("cellforrowat error")
        }
            

      
        return UITableViewCell()
    }
    
    
    
    
    func handleIsSelected(optionsArray: [OptionsSelected], filteredArray: inout [SelectedFilter], indexPath: IndexPath) {
        let selectedRow = optionsArray[indexPath.row]
        optionsArray.forEach({ $0.isSelected = false })
        
        let ids = optionsArray.map({ $0.id })
        for x in ids {
            if let first = filteredArray.firstIndex(where: { $0.id == x}) {
                filteredArray.remove(at: first)
            }
        }
        
        filteredArray.insert(.init(filterName: selectedRow.option, id: selectedRow.id), at: 0)
        selectedRow.isSelected = true
    }
    
    func handleHeaderSelected(tableView: UITableView, headingArray: [HeadingsSelected], indexPath: IndexPath) {
        let selectedRow = headingArray[indexPath.row]
        selectedRow.isSelected = !selectedRow.isSelected
        
        let deSelectedCellsCount = (tableView.numberOfRows(inSection: 0))
        for x in 0..<deSelectedCellsCount {
            let selectedCells = tableView.cellForRow(at: IndexPath(row: x, section: 0))
            selectedCells?.textLabel?.textColor = UIColor.black
            selectedCells?.textLabel?.attributedText = NSAttributedString(string: headingArray[x].title, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular)])
            selectedCells?.backgroundColor = .systemGray6
        }
        if selectedRow.isSelected {
            let _ = headingArray.map({ $0.isSelected = false })
            let selectedCell = tableView.cellForRow(at: indexPath)
            selectedCell?.textLabel?.attributedText = NSAttributedString(string: selectedRow.title, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .bold), NSAttributedString.Key.foregroundColor : UIColor().infpromo])
            selectedCell?.backgroundColor = .systemGray5
        }
    }
    
    func handleDidSelectCells(array: [OptionsSelected], filteredArray: inout [SelectedFilter], indexPath: IndexPath) -> Any? {
        let selectedRowOne = array[indexPath.row]
        selectedRowOne.isSelected = !selectedRowOne.isSelected
        if selectedRowOne.isSelected {
            handleIsSelected(optionsArray: array, filteredArray: &filteredArray, indexPath: indexPath)
            return selectedRowOne.code
        } else {
            if let first = filteredArray.firstIndex(where: { $0.id == selectedRowOne.id}) {
                filteredArray.remove(at: first)
            }
            return nil
        }
    }
    
    
    
    func handleDidSelectCellsArrayInt(array: [OptionsSelected], filteredArray: inout [SelectedFilter], indexPath: IndexPath, typeArray: inout [Int?]) {
        let selectedRow = array[indexPath.row]
        selectedRow.isSelected = !selectedRow.isSelected
        if selectedRow.isSelected {
            typeArray.append(selectedRow.code as? Int)
            filteredArray.insert(.init(filterName: selectedRow.option, id: selectedRow.id), at: 0)
        } else {
            if let type = typeArray.firstIndex(where: { $0 == array[indexPath.row].code as? Int}) {
                    typeArray.remove(at: type)
        }
            if let first = filteredArray.firstIndex(where: { $0.id == selectedRow.id}) {
                filteredArray.remove(at: first)
            }
        }
    }
    
    func handleDidSelectCellsArrayString(array: [OptionsSelected], filteredArray: inout [SelectedFilter], indexPath: IndexPath, typeArray: inout [String?]) {
        let selectedRow = array[indexPath.row]
        selectedRow.isSelected = !selectedRow.isSelected
        if selectedRow.isSelected {
            typeArray.append(selectedRow.code as? String)
            filteredArray.insert(.init(filterName: selectedRow.option, id: selectedRow.id), at: 0)
        } else {
            if let type = typeArray.firstIndex(where: { $0 == array[indexPath.row].code as? String}) {
                    typeArray.remove(at: type)
        }
            if let first = filteredArray.firstIndex(where: { $0.id == selectedRow.id}) {
                filteredArray.remove(at: first)
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            switch tableView {
            case influencerHeadingsTableView:
                
                selectedIndex = indexPath
                
                handleHeaderSelected(tableView: influencerHeadingsTableView, headingArray: influencerPropertiesHeadingsInstagram, indexPath: indexPath)
                
            case influencerOptionsTableView:
                print("inside baby")
                
                filterIndexCount += 1
                
                switch influencerHeadingsTableView.indexPathForSelectedRow {
                case [0,0]:
                    
                    minFollowers = handleDidSelectCells(array: arrayOneInfluencerInstagram, filteredArray: &selectedFilterArray, indexPath: indexPath) as? Int
                    
                case [0,1]:
                    maxFollowers = handleDidSelectCells(array: arrayTwoInfluencerInstagram, filteredArray: &selectedFilterArray, indexPath: indexPath) as? Int
                case [0,2]:
                    gender = handleDidSelectCells(array: arrayThreeInfluencerInstagram, filteredArray: &selectedFilterArray, indexPath: indexPath) as? String
                    
                case [0,3]:
                    handleDidSelectCellsArrayInt(array: arrayFourInfluencerInstagram, filteredArray: &selectedFilterArray, indexPath: indexPath, typeArray: &interests)

                case [0,4]:
                    language = handleDidSelectCells(array: arrayFiveInfluencerInstagram, filteredArray: &selectedFilterArray, indexPath: indexPath) as? String
                    
                case [0,5]:
                    engagementRate = handleDidSelectCells(array: arraySixInfluencerInstagram, filteredArray: &selectedFilterArray, indexPath: indexPath) as? Double
                    
                case [0,6]:
                    hasYoutube = handleDidSelectCells(array: arraySevenInfluencerInstagram, filteredArray: &selectedFilterArray, indexPath: indexPath) as? Bool
                    
                default:
                    print("default is collapse")
                }
              
                
                
                
            case followersHeadingsTableView:
                audienceSelectedIndex = indexPath
                
                handleHeaderSelected(tableView: followersHeadingsTableView, headingArray: followersPropertiesHeadingsInstagram, indexPath: indexPath)
                
            case followersOptionsTableView:
                audienceFilterIndexCount += 1
                
                switch followersHeadingsTableView.indexPathForSelectedRow {
                case [0,0]:
                    
                    audienceGender = handleDidSelectCells(array: arrayOneFollowersInstagram, filteredArray: &audienceSelectedFilterArray, indexPath: indexPath) as? String
                    
                case [0,1]:
                    handleDidSelectCellsArrayString(array: arrayTwoFollowersInstagram, filteredArray: &audienceSelectedFilterArray, indexPath: indexPath, typeArray: &audienceAge)
                case [0,2]:
                    handleDidSelectCellsArrayInt(array: arrayThreeFollowersInstagram, filteredArray: &audienceSelectedFilterArray, indexPath: indexPath, typeArray: &audienceInterests)
                    
                case [0,3]:
                    audienceLanguage = handleDidSelectCells(array: arrayFourFollowersInstagram, filteredArray: &audienceSelectedFilterArray, indexPath: indexPath) as? String
                default:
                    print("default is collapse")
                }
                
            default:
                print("????")
                
            }
            
            //        case 1:
            //            switch tableView {
            //            case influencerHeadingsTableView:
            //
            //                populateInfluencerArray(sender: headIndex)
            //                influencerOptionsTableView.reloadData()
            //
            //            case followersHeadingsTableView:
            //
            //                populateFollowersArray(sender: headIndex)
            //                followersOptionsTableView.reloadData()
            //
            //            default:
            //                print("default")
            //            }
            //        case 2:
            //            switch tableView {
            //            case influencerHeadingsTableView:
            //
            //                populateInfluencerArray(sender: headIndex)
            //                influencerOptionsTableView.reloadData()
            //
            //            case followersHeadingsTableView:
            //
            //                populateFollowersArray(sender: headIndex)
            //                followersOptionsTableView.reloadData()
            //
            //            default:
            //                print("default")
            //            }
        default:
            print("didselect switch error")
            
        }
        
        DispatchQueue.main.async {
            self.influencerFilterCollectionView.reloadData()
            self.followersFilterCollectionView.reloadData()
        }
        
        
        
        influencerOptionsTableView.reloadData()
        followersOptionsTableView.reloadData()
        
        self.influencerFilterCollectionView.scrollToItem(at: IndexPath(row: filterIndexCount, section: 0), at: .right, animated: true)
        self.followersFilterCollectionView.scrollToItem(at: IndexPath(row: filterIndexCount, section: 0), at: .right, animated: true)
        hideSearchBar()
        
    }
}

// CollectionView Delegate and DataSource
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case influencerFilterCollectionView:
            return selectedFilterArray.count
        case followersFilterCollectionView:
            return audienceSelectedFilterArray.count
        case youtubeInfluencerFilterCollectionView:
            return youtubeSelectedFilterArray.count
        case youtubeFollowersFilterCollectionView:
            return youtubeAudienceSelectedFilterArray.count
        case tiktokInfluencerFilterCollectionView:
            return tiktokSelectedFilterArray.count
        case tiktokFollowersFilterCollectionView:
            return tiktokAudienceSelectedFilterArray.count
        default:
            print("filters number of items in section")
        }
        return 5
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case influencerFilterCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfluencerFilterCollectionViewCell.reuseIdentifier, for: indexPath) as! InfluencerFilterCollectionViewCell
            cell.configureCellLabel(with: selectedFilterArray[indexPath.row].filterName)
            cell.label.preferredMaxLayoutWidth = influencerFilterCollectionView.frame.width
            cell.button.row = indexPath.row
            cell.button.section = indexPath.section
            cell.button.addTarget(self, action: #selector(filterDismissButtonTapped), for: .touchUpInside)
            cell.backgroundColor = .white
            return cell
        case followersFilterCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowersFilterCollectionViewCell.reuseIdentifier, for: indexPath) as! FollowersFilterCollectionViewCell
            cell.configureCellLabel(with: audienceSelectedFilterArray[indexPath.row].filterName)
            cell.label.preferredMaxLayoutWidth = followersFilterCollectionView.frame.width
            cell.button.row = indexPath.row
            cell.button.section = indexPath.section
            cell.button.addTarget(self, action: #selector(audienceFilterDismissButtonTapped), for: .touchUpInside)
            cell.backgroundColor = .white
            return cell
        case youtubeInfluencerFilterCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YoutubeInfluencerFilterCollectionViewCell.reuseIdentifier, for: indexPath) as! YoutubeInfluencerFilterCollectionViewCell
            cell.configureCellLabel(with: youtubeSelectedFilterArray[indexPath.row].filterName)
            cell.label.preferredMaxLayoutWidth = influencerFilterCollectionView.frame.width
            cell.button.row = indexPath.row
            cell.button.section = indexPath.section
            cell.button.addTarget(self, action: #selector(youtubeFilterDismissButtonTapped), for: .touchUpInside)
            cell.backgroundColor = .white
            return cell
        case youtubeFollowersFilterCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YoutubeFollowersFilterCollectionViewCell.reuseIdentifier, for: indexPath) as! YoutubeFollowersFilterCollectionViewCell
            cell.configureCellLabel(with: youtubeAudienceSelectedFilterArray[indexPath.row].filterName)
            cell.label.preferredMaxLayoutWidth = followersFilterCollectionView.frame.width
            cell.button.row = indexPath.row
            cell.button.section = indexPath.section
            cell.button.addTarget(self, action: #selector(youtubeAudienceFilterDismissButtonTapped), for: .touchUpInside)
            cell.backgroundColor = .white
            return cell
        case tiktokInfluencerFilterCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TiktokInfluencerFilterCollectionViewCell.reuseIdentifier, for: indexPath) as! TiktokInfluencerFilterCollectionViewCell
            cell.configureCellLabel(with: tiktokSelectedFilterArray[indexPath.row].filterName)
            cell.label.preferredMaxLayoutWidth = influencerFilterCollectionView.frame.width
            cell.button.row = indexPath.row
            cell.button.section = indexPath.section
            cell.button.addTarget(self, action: #selector(tiktokFilterDismissButtonTapped), for: .touchUpInside)
            cell.backgroundColor = .white
            return cell
        case tiktokFollowersFilterCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TiktokFollowersFilterCollectionViewCell.reuseIdentifier, for: indexPath) as! TiktokFollowersFilterCollectionViewCell
            cell.configureCellLabel(with: tiktokAudienceSelectedFilterArray[indexPath.row].filterName)
            cell.label.preferredMaxLayoutWidth = followersFilterCollectionView.frame.width
            cell.button.row = indexPath.row
            cell.button.section = indexPath.section
            cell.button.addTarget(self, action: #selector(tiktokAudienceFilterDismissButtonTapped), for: .touchUpInside)
            cell.backgroundColor = .white
            return cell
            
        default:
            print("filters cell for item at")
        }
        
        return UICollectionViewCell()
    }
    
    func headerConfig(header: UICollectionReusableView, width: CGFloat) -> UICollectionReusableView {
        header.frame = CGRect(x: 0, y: 0, width: width / 5, height: 25)
        header.backgroundColor = .white
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 12)
        title.sizeToFit()
        title.textColor = UIColor().infpromo
        title.text = "influencer: "
        title.numberOfLines = 0
        title.frame = header.frame
        header.addSubview(title)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case HeaderKinds.instagramInfluencer.rawValue:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: HeaderKinds.instagramInfluencer.rawValue, withReuseIdentifier: HeaderIdentifiers.instagramInfluencerIdentifier.rawValue, for: indexPath)
            return headerConfig(header: header, width: collectionView.width)
        case HeaderKinds.instagramFollowers.rawValue:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: HeaderKinds.instagramFollowers.rawValue, withReuseIdentifier: HeaderIdentifiers.instagramFollowersIdentifier.rawValue, for: indexPath)
            return headerConfig(header: header, width: collectionView.width)
        case HeaderKinds.youtubeInfluencer.rawValue:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: HeaderKinds.youtubeInfluencer.rawValue, withReuseIdentifier: HeaderIdentifiers.youtubeInfluencerIdentifier.rawValue, for: indexPath)
            return headerConfig(header: header, width: collectionView.width)
        case HeaderKinds.youtubeFollowers.rawValue:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: HeaderKinds.youtubeFollowers.rawValue, withReuseIdentifier: HeaderIdentifiers.youtubeFollowersIdentifier.rawValue, for: indexPath)
            return headerConfig(header: header, width: collectionView.width)
        case HeaderKinds.tiktokInfluencer.rawValue:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: HeaderKinds.tiktokInfluencer.rawValue, withReuseIdentifier: HeaderIdentifiers.tiktokInfluencerIdentifier.rawValue, for: indexPath)
            return headerConfig(header: header, width: collectionView.width)
        case HeaderKinds.tiktokFollowers.rawValue:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: HeaderKinds.tiktokFollowers.rawValue, withReuseIdentifier: HeaderIdentifiers.tiktokFollowersIdentifier.rawValue, for: indexPath)
            return headerConfig(header: header, width: collectionView.width)
        default:
            print("collection view header error")
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: influencerFilterCollectionView.width / 5, height: 20)
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()  //if desired
        searchButtonClicked()
        return true
    }
}
