

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
    
    var minFollowersYoutube: Int?
    var maxFollowersYoutube: Int?
    var minViewsYoutube: Int?
    var maxViewsYoutube: Int?
    var genderYoutube: String?
    var languageYoutube: String?
    var engagementRateYoutube: Double?
    var audienceGenderYoutube: String?
    var audienceAgeYoutube: [String?] = []
    var audienceLanguageYoutube: String?
    
    var minFollowersTiktok: Int?
    var maxFollowersTiktok: Int?
    var minViewsTiktok: Int?
    var maxViewsTiktok: Int?
    var genderTiktok: String?
    var languageTiktok: String?
    var engagementRateTiktok: Double?
    var audienceGenderTiktok: String?
    var audienceAgeTiktok: [String?] = []
    var audienceLanguageTiktok: String?
    
    
    var selectedFilterArray: [SelectedFilter] = []
    var audienceSelectedFilterArray: [SelectedFilter] = []
    
    var youtubeSelectedFilterArray: [SelectedFilter] = []
    var youtubeAudienceSelectedFilterArray: [SelectedFilter] = []
    
    var tiktokSelectedFilterArray: [SelectedFilter] = []
    var tiktokAudienceSelectedFilterArray: [SelectedFilter] = []
    
    var filterIndexCount: Int = 0
    var audienceFilterIndexCount: Int = 0
    
    var filterIndexCountYoutube: Int = 0
    var audienceFilterIndexCountYoutube: Int = 0
    
    var filterIndexCountTiktok: Int = 0
    var audienceFilterIndexCountTiktok: Int = 0
    
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
    
    let influencerPropertiesHeadingsTiktok: [HeadingsSelected] = [
        .init(title: "Min Abone Sayısı", isSelected: false),
        .init(title: "Max Abone Sayısı", isSelected: false),
        .init(title: "Min Görüntülenme Sayısı", isSelected: false),
        .init(title: "Max Görüntülenme Sayısı", isSelected: false),
        .init(title: "Cinsiyet", isSelected: false),
        .init(title: "Dil", isSelected: false),
        .init(title: "Etkileşim Oranı", isSelected: false)
    ]
    
    let arrayOneInfluencerTiktok: [OptionsSelected] = [
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
    
    
    let arrayTwoInfluencerTiktok: [OptionsSelected] = [
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
    
    
    let arrayThreeInfluencerTiktok: [OptionsSelected] = [
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
    
    
    
    let arrayFourInfluencerTiktok: [OptionsSelected] = [
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
    
    
    let arrayFiveInfluencerTiktok: [OptionsSelected] = [
        .init(option: "Kadın", isSelected: false, code: "FEMALE", id: 50),
        .init(option: "Erkek", isSelected: false, code: "MALE", id: 51)
    ]
    
    
    
    let arraySixInfluencerTiktok: [OptionsSelected] = [
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
    
    let arraySevenInfluencerTiktok: [OptionsSelected] = [
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
    let followersPropertiesHeadingsTiktok: [HeadingsSelected] = [
        .init(title: "Takipçi Cinsiyet Yoğunluğu", isSelected: false),
        .init(title: "Takipçi Yaş Aralığı", isSelected: false),
        .init(title: "Takipçi Dili", isSelected: false),
    ]
    
    let arrayOneFollowersTiktok: [OptionsSelected] = [
        .init(option: "Kadın", isSelected: false, code: "FEMALE", id: 1),
        .init(option: "Erkek", isSelected: false, code: "MALE", id: 2)
    ]
    
    let arrayTwoFollowersTiktok: [OptionsSelected] = [
        .init(option: "18 - 24", isSelected: false, code: "18-24", id: 3),
        .init(option: "25 - 34", isSelected: false, code: "25-34", id: 4),
        .init(option: "35 - 44", isSelected: false, code: "35-44", id: 5),
        .init(option: "45 - 65", isSelected: false, code: "45-64", id: 6),
        .init(option: "65+", isSelected: false, code: "65-", id: 7)
    ]
    
    let arrayThreeFollowersTiktok: [OptionsSelected] = [
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
    
    
    
    private let youtubeInfluencerHeadingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "youtubeInfluencerHeadingsTableView")
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemGray6
        return tableView
    }()
    
    private let youtubeInfluencerOptionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "youtubeInfluencerOptionsTableView")
        return tableView
    }()
    
    private let youtubeFollowersHeadingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "youtubeFollowersHeadingsTableView")
        
        return tableView
    }()
    
    private let youtubeFollowersOptionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "youtubeFollowersOptionsTableView")
        return tableView
    }()
    
    private let tiktokInfluencerHeadingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tiktokInfluencerHeadingsTableView")
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemGray6
        return tableView
    }()
    
    private let tiktokInfluencerOptionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tiktokInfluencerOptionsTableView")
        return tableView
    }()
    
    private let tiktokFollowersHeadingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tiktokFollowersHeadingsTableView")
        
        return tableView
    }()
    
    private let tiktokFollowersOptionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tiktokFollowersOptionsTableView")
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
        saveStateYoutube()
        saveStateTiktok()
    }
    
    var selectedIndex = IndexPath(row: -1, section: 0)
    var audienceSelectedIndex = IndexPath(row: -1, section: 0)
    
    var selectedIndexYoutube = IndexPath(row: -1, section: 0)
    var audienceSelectedIndexYoutube = IndexPath(row: -1, section: 0)
    
    var selectedIndexTiktok = IndexPath(row: -1, section: 0)
    var audienceSelectedIndexTiktok = IndexPath(row: -1, section: 0)
    
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
        
        youtubeInfluencerHeadingsTableView.isHidden = true
        youtubeInfluencerOptionsTableView.isHidden = true
        youtubeFollowersHeadingsTableView.isHidden = true
        youtubeFollowersOptionsTableView.isHidden = true
        
        
        tiktokFollowersOptionsTableView.isHidden = true
        tiktokFollowersHeadingsTableView.isHidden = true
        tiktokInfluencerOptionsTableView.isHidden = true
        tiktokInfluencerHeadingsTableView.isHidden = true
        
        youtubeInfluencerFilterCollectionView.isHidden = true
        youtubeFollowersFilterCollectionView.isHidden = true
        tiktokInfluencerFilterCollectionView.isHidden = true
        tiktokFollowersFilterCollectionView.isHidden = true
        
        
        
        let tapGestureReconizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGestureReconizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGestureReconizer)
        
        searchBar.delegate = self
        loadSelectedOnes()
        loadAudienceSelectedOnes()
        
        loadSelectedOnesYoutube()
        loadAudienceSelectedOnesYoutube()
        
        loadSelectedOnesTiktok()
        loadAudienceSelectedOnesTiktok()
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
        
        
        
        
        youtubeInfluencerOptionsTableView.delegate = self
        youtubeInfluencerOptionsTableView.dataSource = self
        
        youtubeInfluencerHeadingsTableView.delegate = self
        youtubeInfluencerHeadingsTableView.dataSource = self
        
        youtubeFollowersOptionsTableView.delegate = self
        youtubeFollowersOptionsTableView.dataSource = self
        
        youtubeFollowersHeadingsTableView.delegate = self
        youtubeFollowersHeadingsTableView.dataSource = self
        
        
        
        tiktokInfluencerOptionsTableView.delegate = self
        tiktokInfluencerOptionsTableView.dataSource = self
        
        tiktokInfluencerHeadingsTableView.delegate = self
        tiktokInfluencerHeadingsTableView.dataSource = self
        
        tiktokFollowersOptionsTableView.delegate = self
        tiktokFollowersOptionsTableView.dataSource = self
        
        tiktokFollowersHeadingsTableView.delegate = self
        tiktokFollowersHeadingsTableView.dataSource = self
        
        
        
        
        
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
        
        
        view.addSubview(youtubeInfluencerHeadingsTableView)
        view.addSubview(youtubeInfluencerOptionsTableView)
        view.addSubview(youtubeFollowersHeadingsTableView)
        view.addSubview(youtubeFollowersOptionsTableView)
        
        
        view.addSubview(tiktokFollowersOptionsTableView)
        view.addSubview(tiktokFollowersHeadingsTableView)
        view.addSubview(tiktokInfluencerOptionsTableView)
        view.addSubview(tiktokInfluencerHeadingsTableView)
        
        view.addSubview(searchBar)
        view.addSubview(searchButton)
        view.addSubview(influencerFilterCollectionView)
        view.addSubview(followersFilterCollectionView)
        view.addSubview(youtubeInfluencerFilterCollectionView)
        view.addSubview(youtubeFollowersFilterCollectionView)
        view.addSubview(tiktokInfluencerFilterCollectionView)
        view.addSubview(tiktokFollowersFilterCollectionView)
        view.addSubview(clearButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        if let indexSelectedBef = UserDefaults.standard.object(forKey: "selectedIndex") as? Int {
            segmentedControl.selectedSegmentIndex = indexSelectedBef
            
            switch indexSelectedBef {
            case 0:
    //            changeToIndex(index: 0)
                youtubeInfluencerHeadingsTableView.isHidden = true
                youtubeInfluencerOptionsTableView.isHidden = true
                youtubeFollowersHeadingsTableView.isHidden = true
                youtubeFollowersOptionsTableView.isHidden = true
                tiktokInfluencerHeadingsTableView.isHidden = true
                tiktokInfluencerOptionsTableView.isHidden = true
                tiktokFollowersHeadingsTableView.isHidden = true
                tiktokFollowersOptionsTableView.isHidden = true
                influencerHeadingsTableView.isHidden = false
                influencerOptionsTableView.isHidden = false
                followersHeadingsTableView.isHidden = false
                followersOptionsTableView.isHidden = false
                
                influencerFilterCollectionView.isHidden = false
                followersFilterCollectionView.isHidden = false
                youtubeInfluencerFilterCollectionView.isHidden = true
                youtubeFollowersFilterCollectionView.isHidden = true
                tiktokInfluencerFilterCollectionView.isHidden = true
                tiktokFollowersFilterCollectionView.isHidden = true
                hideSearchBar()
            case 1:
    //            changeToIndex(index: 0)
                influencerHeadingsTableView.isHidden = true
                influencerOptionsTableView.isHidden = true
                followersHeadingsTableView.isHidden = true
                followersOptionsTableView.isHidden = true
                tiktokInfluencerHeadingsTableView.isHidden = true
                tiktokInfluencerOptionsTableView.isHidden = true
                tiktokFollowersHeadingsTableView.isHidden = true
                tiktokFollowersOptionsTableView.isHidden = true
                youtubeInfluencerHeadingsTableView.isHidden = false
                youtubeInfluencerOptionsTableView.isHidden = false
                youtubeFollowersHeadingsTableView.isHidden = false
                youtubeFollowersOptionsTableView.isHidden = false
                
                influencerFilterCollectionView.isHidden = true
                followersFilterCollectionView.isHidden = true
                youtubeInfluencerFilterCollectionView.isHidden = false
                youtubeFollowersFilterCollectionView.isHidden = false
                tiktokInfluencerFilterCollectionView.isHidden = true
                tiktokFollowersFilterCollectionView.isHidden = true
                hideSearchBar()
            case 2:
    //            changeToIndex(index: 0)
                influencerHeadingsTableView.isHidden = true
                influencerOptionsTableView.isHidden = true
                followersHeadingsTableView.isHidden = true
                followersOptionsTableView.isHidden = true
                youtubeInfluencerHeadingsTableView.isHidden = true
                youtubeInfluencerOptionsTableView.isHidden = true
                youtubeFollowersHeadingsTableView.isHidden = true
                youtubeFollowersOptionsTableView.isHidden = true
                tiktokInfluencerHeadingsTableView.isHidden = false
                tiktokInfluencerOptionsTableView.isHidden = false
                tiktokFollowersHeadingsTableView.isHidden = false
                tiktokFollowersOptionsTableView.isHidden = false
                
                influencerFilterCollectionView.isHidden = true
                followersFilterCollectionView.isHidden = true
                youtubeInfluencerFilterCollectionView.isHidden = true
                youtubeFollowersFilterCollectionView.isHidden = true
                tiktokInfluencerFilterCollectionView.isHidden = false
                tiktokFollowersFilterCollectionView.isHidden = false
                hideSearchBar()
            default:

                print("default hidden")
                            

         
            }
        }
        
      
        
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: 0, section: 0)
            self.customSegmented.setIndex(index: 0)
            self.customSegmented.delegate?.changeToIndex(index: 0)
            self.influencerHeadingsTableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
            self.influencerHeadingsTableView.delegate?.tableView?(self.influencerHeadingsTableView, didSelectRowAt: indexPath)
            
            self.followersHeadingsTableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
            self.followersHeadingsTableView.delegate?.tableView?(self.followersHeadingsTableView, didSelectRowAt: indexPath)
            
            self.youtubeInfluencerHeadingsTableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
            self.youtubeInfluencerHeadingsTableView.delegate?.tableView?(self.youtubeInfluencerHeadingsTableView, didSelectRowAt: indexPath)
            
            self.youtubeFollowersHeadingsTableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
            self.youtubeFollowersHeadingsTableView.delegate?.tableView?(self.youtubeFollowersHeadingsTableView, didSelectRowAt: indexPath)
            
            self.tiktokInfluencerHeadingsTableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
            self.tiktokInfluencerHeadingsTableView.delegate?.tableView?(self.tiktokInfluencerHeadingsTableView, didSelectRowAt: indexPath)
            
            self.tiktokFollowersHeadingsTableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
            self.tiktokFollowersHeadingsTableView.delegate?.tableView?(self.tiktokFollowersHeadingsTableView, didSelectRowAt: indexPath)
            
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
        
        youtubeInfluencerFilterCollectionView.frame = CGRect(x: 15, y: segmentedControl.bottom + 12, width: view.width - 30, height: 25)
        youtubeFollowersFilterCollectionView.frame = CGRect(x: 15, y: influencerFilterCollectionView.bottom + 12, width: view.width - 30, height: 25)
        
        tiktokInfluencerFilterCollectionView.frame = CGRect(x: 15, y: segmentedControl.bottom + 12, width: view.width - 30, height: 25)
        tiktokFollowersFilterCollectionView.frame = CGRect(x: 15, y: influencerFilterCollectionView.bottom + 12, width: view.width - 30, height: 25)
        
        influencerHeadingsTableView.frame = CGRect(x: 0, y: customSegmented.bottom + 20, width: view.width / 3, height: view.height - 240 - 130)
        influencerOptionsTableView.frame = CGRect(x: influencerHeadingsTableView.right, y: customSegmented.bottom + 20, width: 2 * (view.width) / 3 - 20, height: view.height - 240 - 130)
        followersHeadingsTableView.frame = CGRect(x: 0, y: customSegmented.bottom + 20, width: view.width / 3, height: view.height - searchButton.height - 70 - 130)
        followersOptionsTableView.frame = CGRect(x: influencerHeadingsTableView.right, y: customSegmented.bottom + 20, width: 2 * (view.width) / 3 - 20, height: view.height - 240 - 130)
        
        youtubeInfluencerHeadingsTableView.frame = CGRect(x: 0, y: customSegmented.bottom + 20, width: view.width / 3, height: view.height - 240 - 130)
        youtubeInfluencerOptionsTableView.frame = CGRect(x: influencerHeadingsTableView.right, y: customSegmented.bottom + 20, width: 2 * (view.width) / 3 - 20, height: view.height - 240 - 130)
        youtubeFollowersHeadingsTableView.frame = CGRect(x: 0, y: customSegmented.bottom + 20, width: view.width / 3, height: view.height - searchButton.height - 70 - 130)
        youtubeFollowersOptionsTableView.frame = CGRect(x: influencerHeadingsTableView.right, y: customSegmented.bottom + 20, width: 2 * (view.width) / 3 - 20, height: view.height - 240 - 130)
        
        tiktokInfluencerHeadingsTableView.frame = CGRect(x: 0, y: customSegmented.bottom + 20, width: view.width / 3, height: view.height - 240 - 130)
        tiktokInfluencerOptionsTableView.frame = CGRect(x: influencerHeadingsTableView.right, y: customSegmented.bottom + 20, width: 2 * (view.width) / 3 - 20, height: view.height - 240 - 130)
        tiktokFollowersHeadingsTableView.frame = CGRect(x: 0, y: customSegmented.bottom + 20, width: view.width / 3, height: view.height - searchButton.height - 70 - 130)
        tiktokFollowersOptionsTableView.frame = CGRect(x: influencerHeadingsTableView.right, y: customSegmented.bottom + 20, width: 2 * (view.width) / 3 - 20, height: view.height - 240 - 130)
        
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
    
    func clearFiltersYoutube(row: Int, section: Int) {
        let indexPath = IndexPath(row: row, section: section)
        let filterId = youtubeSelectedFilterArray[indexPath.row].id
        
        if let deSelectOne = arrayOneInfluencerYoutube.firstIndex(where: { $0.id == filterId }) {
            arrayOneInfluencerYoutube[deSelectOne].isSelected = !arrayOneInfluencerYoutube[deSelectOne].isSelected
            minFollowersYoutube = nil
        }
        
        if let deSelectTwo = arrayTwoInfluencerYoutube.firstIndex(where: { $0.id == filterId }) {
            arrayTwoInfluencerYoutube[deSelectTwo].isSelected = !arrayTwoInfluencerYoutube[deSelectTwo].isSelected
            maxFollowersYoutube = nil
        }
        
        if let deSelectThree = arrayThreeInfluencerYoutube.firstIndex(where: { $0.id == filterId }) {
            arrayThreeInfluencerYoutube[deSelectThree].isSelected = !arrayThreeInfluencerYoutube[deSelectThree].isSelected
            minViewsYoutube = nil
            
        }
        
        if let deSelectFour = arrayFourInfluencerYoutube.firstIndex(where: { $0.id == filterId }) {
            arrayFourInfluencerYoutube[deSelectFour].isSelected = !arrayFourInfluencerYoutube[deSelectFour].isSelected
           maxViewsYoutube = nil
        }
        
        if let deSelectFive = arrayFiveInfluencerYoutube.firstIndex(where: { $0.id == filterId }) {
            arrayFiveInfluencerYoutube[deSelectFive].isSelected = !arrayFiveInfluencerYoutube[deSelectFive].isSelected
            genderYoutube = nil
        }
        
        if let deSelectSix = arraySixInfluencerYoutube.firstIndex(where: { $0.id == filterId }) {
            arraySixInfluencerYoutube[deSelectSix].isSelected = !arraySixInfluencerYoutube[deSelectSix].isSelected
            
            languageYoutube = nil
        }
        
        if let deSelectSeven = arraySevenInfluencerYoutube.firstIndex(where: { $0.id == filterId }) {
            arraySevenInfluencerYoutube[deSelectSeven].isSelected = !arraySevenInfluencerYoutube[deSelectSeven].isSelected
            engagementRateYoutube = nil
        }
        
        DispatchQueue.main.async {
            self.youtubeInfluencerFilterCollectionView.reloadData()
        }
        
        DispatchQueue.main.async {
            self.youtubeInfluencerOptionsTableView.reloadData()
        }
    }
    
    func clearAudienceFiltersYoutube(row: Int, section: Int) {
        let indexPath = IndexPath(row: row, section: section)
        let filterId = youtubeAudienceSelectedFilterArray[indexPath.row].id
        
        if let deSelectOne = arrayOneFollowersYoutube.firstIndex(where: { $0.id == filterId }) {
            arrayOneFollowersYoutube[deSelectOne].isSelected = !arrayOneFollowersYoutube[deSelectOne].isSelected
            audienceGenderYoutube = nil
        }
        
        if let deSelectTwo = arrayTwoFollowersYoutube.firstIndex(where: { $0.id == filterId }) {
            arrayTwoFollowersYoutube[deSelectTwo].isSelected = !arrayTwoFollowersYoutube[deSelectTwo].isSelected
            if let audienceAges = audienceAgeYoutube.firstIndex(where: { $0 == arrayTwoFollowersYoutube[deSelectTwo].code as? String }) {
                audienceAgeYoutube.remove(at: audienceAges)
            }
        }
        
        if let deSelectThree = arrayThreeFollowersYoutube.firstIndex(where: { $0.id == filterId }) {
            arrayThreeFollowersYoutube[deSelectThree].isSelected = !arrayThreeFollowersYoutube[deSelectThree].isSelected
            audienceLanguageYoutube = nil
        }

        DispatchQueue.main.async {
            self.youtubeFollowersFilterCollectionView.reloadData()
        }
        
        DispatchQueue.main.async {
            self.youtubeFollowersOptionsTableView.reloadData()
        }
    }
    
    func clearFiltersTiktok(row: Int, section: Int) {
        let indexPath = IndexPath(row: row, section: section)
        let filterId = tiktokSelectedFilterArray[indexPath.row].id
        
        if let deSelectOne = arrayOneInfluencerTiktok.firstIndex(where: { $0.id == filterId }) {
            arrayOneInfluencerTiktok[deSelectOne].isSelected = !arrayOneInfluencerTiktok[deSelectOne].isSelected
            minFollowersTiktok = nil
        }
        
        if let deSelectTwo = arrayTwoInfluencerTiktok.firstIndex(where: { $0.id == filterId }) {
            arrayTwoInfluencerTiktok[deSelectTwo].isSelected = !arrayTwoInfluencerTiktok[deSelectTwo].isSelected
            maxFollowersTiktok = nil
        }
        
        if let deSelectThree = arrayThreeInfluencerTiktok.firstIndex(where: { $0.id == filterId }) {
            arrayThreeInfluencerTiktok[deSelectThree].isSelected = !arrayThreeInfluencerTiktok[deSelectThree].isSelected
            minViewsTiktok = nil
            
        }
        
        if let deSelectFour = arrayFourInfluencerTiktok.firstIndex(where: { $0.id == filterId }) {
            arrayFourInfluencerTiktok[deSelectFour].isSelected = !arrayFourInfluencerTiktok[deSelectFour].isSelected
           maxViewsTiktok = nil
        }
        
        if let deSelectFive = arrayFiveInfluencerTiktok.firstIndex(where: { $0.id == filterId }) {
            arrayFiveInfluencerTiktok[deSelectFive].isSelected = !arrayFiveInfluencerTiktok[deSelectFive].isSelected
            genderTiktok = nil
        }
        
        if let deSelectSix = arraySixInfluencerTiktok.firstIndex(where: { $0.id == filterId }) {
            arraySixInfluencerTiktok[deSelectSix].isSelected = !arraySixInfluencerTiktok[deSelectSix].isSelected
            
            languageTiktok = nil
        }
        
        if let deSelectSeven = arraySevenInfluencerTiktok.firstIndex(where: { $0.id == filterId }) {
            arraySevenInfluencerTiktok[deSelectSeven].isSelected = !arraySevenInfluencerTiktok[deSelectSeven].isSelected
            engagementRateTiktok = nil
        }
        
        DispatchQueue.main.async {
            self.tiktokInfluencerFilterCollectionView.reloadData()
        }
        
        DispatchQueue.main.async {
            self.tiktokInfluencerOptionsTableView.reloadData()
        }
    }
    
    func clearAudienceFiltersTiktok(row: Int, section: Int) {
        let indexPath = IndexPath(row: row, section: section)
        let filterId = tiktokAudienceSelectedFilterArray[indexPath.row].id
        
        if let deSelectOne = arrayOneFollowersTiktok.firstIndex(where: { $0.id == filterId }) {
            arrayOneFollowersTiktok[deSelectOne].isSelected = !arrayOneFollowersTiktok[deSelectOne].isSelected
            audienceGenderTiktok = nil
        }
        
        if let deSelectTwo = arrayTwoFollowersTiktok.firstIndex(where: { $0.id == filterId }) {
            arrayTwoFollowersTiktok[deSelectTwo].isSelected = !arrayTwoFollowersTiktok[deSelectTwo].isSelected
            if let audienceAges = audienceAgeTiktok.firstIndex(where: { $0 == arrayTwoFollowersTiktok[deSelectTwo].code as? String }) {
                audienceAgeTiktok.remove(at: audienceAges)
            }
        }
        
        if let deSelectThree = arrayThreeFollowersTiktok.firstIndex(where: { $0.id == filterId }) {
            arrayThreeFollowersTiktok[deSelectThree].isSelected = !arrayThreeFollowersTiktok[deSelectThree].isSelected
            audienceLanguageTiktok = nil
        }

        DispatchQueue.main.async {
            self.tiktokFollowersFilterCollectionView.reloadData()
        }
        
        DispatchQueue.main.async {
            self.tiktokFollowersOptionsTableView.reloadData()
        }
    }
    
   
    
    @objc func clearButtonTapped() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
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
        case 1:
            let countFilter = youtubeSelectedFilterArray.count
            for i in 0..<countFilter {
                clearFiltersYoutube(row: i, section: 0)
            }
            youtubeSelectedFilterArray.removeAll()

            let countAudienceFilter = youtubeAudienceSelectedFilterArray.count
            for i in 0..<countAudienceFilter {
                clearAudienceFiltersYoutube(row: i, section: 0)
            }
            youtubeAudienceSelectedFilterArray.removeAll()

            hideSearchBar()
        case 2:
            let countFilter = tiktokSelectedFilterArray.count
            for i in 0..<countFilter {
                clearFiltersTiktok(row: i, section: 0)
            }
            tiktokSelectedFilterArray.removeAll()

            let countAudienceFilter = tiktokAudienceSelectedFilterArray.count
            for i in 0..<countAudienceFilter {
                clearAudienceFiltersTiktok(row: i, section: 0)
            }
            tiktokAudienceSelectedFilterArray.removeAll()

            hideSearchBar()
        default:
            print("cleear button def")
        }
        
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
        clearFiltersYoutube(row: sender.row, section: sender.section)
        youtubeSelectedFilterArray.remove(at: sender.row)
        hideSearchBar()
    }
    
    @objc func youtubeAudienceFilterDismissButtonTapped(sender: CustomFilterButton) {
        clearAudienceFiltersYoutube(row: sender.row, section: sender.section)
        youtubeAudienceSelectedFilterArray.remove(at: sender.row)
        hideSearchBar()
    }
    
    @objc func tiktokFilterDismissButtonTapped(sender: CustomFilterButton) {
        clearFiltersTiktok(row: sender.row, section: sender.section)
        tiktokSelectedFilterArray.remove(at: sender.row)
        hideSearchBar()
    }
    
    @objc func tiktokAudienceFilterDismissButtonTapped(sender: CustomFilterButton) {
        clearAudienceFiltersTiktok(row: sender.row, section: sender.section)
        tiktokAudienceSelectedFilterArray.remove(at: sender.row)
        hideSearchBar()
    }
    
    
    
    
    func hideSearchBar() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            if selectedFilterArray.count == 0 && audienceSelectedFilterArray.count == 0 {
                searchBar.isHidden = false
                influencerFilterCollectionView.isHidden = true
                followersFilterCollectionView.isHidden = true
            } else {
                searchBar.isHidden = true
                influencerFilterCollectionView.isHidden = false
                followersFilterCollectionView.isHidden = false
            }
        case 1:
            if youtubeSelectedFilterArray.count == 0 && youtubeAudienceSelectedFilterArray.count == 0 {
                searchBar.isHidden = false
                youtubeInfluencerFilterCollectionView.isHidden = true
                youtubeFollowersFilterCollectionView.isHidden = true
            } else {
                searchBar.isHidden = true
                youtubeInfluencerFilterCollectionView.isHidden = false
                youtubeFollowersFilterCollectionView.isHidden = false
            }
        case 2:
            if tiktokSelectedFilterArray.count == 0 && tiktokAudienceSelectedFilterArray.count == 0 {
                searchBar.isHidden = false
                tiktokInfluencerFilterCollectionView.isHidden = true
                tiktokFollowersFilterCollectionView.isHidden = true
            } else {
                searchBar.isHidden = true
                tiktokInfluencerFilterCollectionView.isHidden = false
                tiktokFollowersFilterCollectionView.isHidden = false
            }
        default:
            print("def")
            
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
        
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            if !searchBar.isHidden {
                let platform = "instagram"
                APICaller.shared.searchByUsername(platform: platform, username: searchBarText) { response in
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
                        
                        var influencerIds: [String] = []
                        influencerIds.append(contentsOf: model.data.bodyNew.lookalikes.map({$0.userId}))
                        
                        
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
                                                              "ids": influencerIds as Any
                                                            
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
        case 1:
            
            print("case 1")
            if !searchBar.isHidden {
                let platform = "youtube"
                APICaller.shared.searchByUsername(platform: platform, username: searchBarText) { result in
                    switch result {
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
                let platform = "youtube"
                APICaller.shared.filterYoutubeTiktok(platform: platform, page: 0, minFollowers: minFollowersYoutube, maxFollowers: maxFollowersYoutube, minViews: minViewsYoutube, maxViews: maxViewsYoutube, gender: genderYoutube, language: languageYoutube, engagementRate: engagementRateYoutube, audienceGender: audienceGenderYoutube, audienceAges: audienceAgeYoutube, audienceLanguage: audienceLanguageYoutube) { result in
                    switch result {
                    case .success(let model):
                        var filterResultArrayYoutube: [SearchWithFilterCellViewModel] = []
                        filterResultArrayYoutube.append(contentsOf: model.data.bodyNew.lookalikes.map({
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
                        
                        var influencerIds: [String] = []
                        influencerIds.append(contentsOf: model.data.bodyNew.lookalikes.map({$0.userId}))
                        
                        let filterBasedDictYoutube: [String: Any] = ["totalYoutube": model.data.bodyNew.total,
                                                                     "minFollowersYoutube": self.minFollowersYoutube as Any,
                                                                     "maxFollowersYoutube": self.maxFollowersYoutube as Any,
                                                                     "minViewsYoutube": self.minViewsYoutube as Any,
                                                                     "maxViewsYoutube": self.maxViewsYoutube as Any,
                                                                     "genderYoutube": self.genderYoutube as Any,
                                                                     "languageYoutube": self.languageYoutube as Any,
                                                                     "engagementRateYoutube": self.engagementRateYoutube as Any,
                                                                     "audienceGenderYoutube": self.audienceGenderYoutube as Any,
                                                                     "audienceAgesYoutube": self.audienceAgeYoutube as Any,
                                                                     "audienceLanguageYoutube": self.audienceLanguageYoutube as Any,
                                                                     "ids": influencerIds as Any
                        ]
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "filterBasedDictYoutube"), object: nil, userInfo: filterBasedDictYoutube)
                        
                        let filterResultDictYoutube: [String: [SearchWithFilterCellViewModel]] = ["filterResultDictYoutube": filterResultArrayYoutube]
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newFilterResultDictYoutube"), object: nil, userInfo: filterResultDictYoutube)
                        

//                        print(filterResultArray)
                        
                    case .failure(let error):
                        print(error)
                        
                        let filterString = "Aradığınız öğe bulunamadı."
                        let filterErrorDict: [String: String] = ["searcByFilterUnsuccessful": filterString]
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "filterErrorDict"), object: nil, userInfo: filterErrorDict)
                    }
                }
            }
        case 2:
            print("case 2")
            if !searchBar.isHidden {
                let platform = "tiktok"
                print("case 2 username")
                APICaller.shared.searchByUsername(platform: platform, username: searchBarText) { result in
                    switch result {
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
                let platform = "tiktok"
                
                
                
                APICaller.shared.filterYoutubeTiktok(platform: platform, page: 0, minFollowers: minFollowersTiktok, maxFollowers: maxFollowersTiktok, minViews: minViewsTiktok, maxViews: maxViewsTiktok, gender: genderTiktok, language: languageTiktok, engagementRate: engagementRateTiktok, audienceGender: audienceGenderTiktok, audienceAges: audienceAgeTiktok, audienceLanguage: audienceLanguageTiktok) { result in
                    switch result {
                    case .success(let model):
                        var filterResultArrayTiktok: [SearchWithFilterCellViewModel] = []
                        filterResultArrayTiktok.append(contentsOf: model.data.bodyNew.lookalikes.map({
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
                        
                        var influencerIds: [String] = []
                        influencerIds.append(contentsOf: model.data.bodyNew.lookalikes.map({$0.userId}))
                        
                        
                        let filterBasedDictTiktok: [String: Any] = ["total": model.data.bodyNew.total,
                                                                     "minFollowers": self.minFollowersTiktok as Any,
                                                                     "maxFollowers": self.maxFollowersTiktok as Any,
                                                                     "minViews": self.minViewsTiktok as Any,
                                                                     "maxViews": self.maxViewsTiktok as Any,
                                                                     "gender": self.genderTiktok as Any,
                                                                     "language": self.languageTiktok as Any,
                                                                     "engagementRate": self.engagementRateTiktok as Any,
                                                                     "audienceGender": self.audienceGenderTiktok as Any,
                                                                     "audienceAges": self.audienceAgeTiktok as Any,
                                                                     "audienceLanguage": self.audienceLanguageTiktok as Any,
                                                                    "ids": influencerIds as Any
                        ]
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "filterBasedDictTiktok"), object: nil, userInfo: filterBasedDictTiktok)
                        
                        print("filterBasedDictTiktok: \(filterBasedDictTiktok)")
                        
                        let filterResultDictTiktok: [String: [SearchWithFilterCellViewModel]] = ["filterResultDictTiktok": filterResultArrayTiktok]
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newFilterResultDictTiktok"), object: nil, userInfo: filterResultDictTiktok)
                        

                        print(filterResultArrayTiktok)
                        
                    case .failure(let error):
                        print(error)
                        
                        let filterString = "Aradığınız öğe bulunamadı."
                        let filterErrorDict: [String: String] = ["searcByFilterUnsuccessful": filterString]
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "filterErrorDict"), object: nil, userInfo: filterErrorDict)
                    }
                }
            }
            
        default:
            print("deeffffff")
        }
        
        saveState()
        saveStateYoutube()
        saveStateTiktok()
    }
    
    @objc func searchButtonTapped() {
        searchButtonClicked()
        saveState()
        saveStateYoutube()
        saveStateTiktok()
        
    }
    
    @objc func dismissViewButtonTapped() {
        dismiss(animated: true, completion: nil)
        saveState()
        saveStateYoutube()
        saveStateTiktok()
        
    }
    
    private func reloadTableViews() {
        influencerHeadingsTableView.reloadData()
        influencerOptionsTableView.reloadData()
        followersHeadingsTableView.reloadData()
        followersOptionsTableView.reloadData()
        
        youtubeInfluencerHeadingsTableView.reloadData()
        youtubeInfluencerOptionsTableView.reloadData()
        youtubeFollowersHeadingsTableView.reloadData()
        youtubeFollowersOptionsTableView.reloadData()
        
        tiktokInfluencerHeadingsTableView.reloadData()
        tiktokInfluencerOptionsTableView.reloadData()
        tiktokFollowersHeadingsTableView.reloadData()
        tiktokFollowersOptionsTableView.reloadData()
        
        influencerFilterCollectionView.reloadData()
        followersFilterCollectionView.reloadData()
        
        youtubeInfluencerFilterCollectionView.reloadData()
        youtubeFollowersFilterCollectionView.reloadData()
        
        tiktokInfluencerFilterCollectionView.reloadData()
        tiktokFollowersFilterCollectionView.reloadData()
    }
    
    
    
    func saveLastState(filterArray: [SelectedFilter], audienceFilterArray: [SelectedFilter], key1: String, key2: String) {
        let ids = filterArray.map({$0.id})
        let audienceIds = audienceFilterArray.map({$0.id})
        UserDefaults.standard.set(ids, forKey: key1)
        UserDefaults.standard.set(audienceIds, forKey: key2)
    }
    
    func saveState() {
        saveLastState(filterArray: selectedFilterArray, audienceFilterArray: audienceSelectedFilterArray, key1: "stateSelected", key2: "stateAudienceSelected")
        let selectedIndex = segmentedControl.selectedSegmentIndex
        UserDefaults.standard.set(selectedIndex, forKey: "selectedIndex")
    }
    
    func saveStateYoutube() {
        saveLastState(filterArray: youtubeSelectedFilterArray, audienceFilterArray: youtubeAudienceSelectedFilterArray, key1: "stateSelectedYoutube", key2: "stateAudienceSelectedYoutube")
        let selectedIndex = segmentedControl.selectedSegmentIndex
        UserDefaults.standard.set(selectedIndex, forKey: "selectedIndex")
    }
    
    func saveStateTiktok() {
        saveLastState(filterArray: tiktokSelectedFilterArray, audienceFilterArray: tiktokAudienceSelectedFilterArray, key1: "stateSelectedTiktok", key2: "stateAudienceSelectedTiktok")
        let selectedIndex = segmentedControl.selectedSegmentIndex
        UserDefaults.standard.set(selectedIndex, forKey: "selectedIndex")
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
    
    
    func loadSelectedOnesYoutube() {
        guard let returnSelected = UserDefaults.standard.object(forKey: "stateSelectedYoutube") else { return }
        
        let ret = returnSelected as! [Int]
        
        for i in 0..<ret.count {
            if let deSelectOne = arrayOneInfluencerYoutube.firstIndex(where: { $0.id == ret[i] }) {
                minFollowersYoutube = handleLoadedIsSelected(optionsArray: arrayOneInfluencerYoutube, filteredArray: &youtubeSelectedFilterArray, i: i, deSelectOne: deSelectOne) as? Int
        }
                
            if let deSelectTwo = arrayTwoInfluencerYoutube.firstIndex(where: { $0.id == ret[i] }) {
                maxFollowersYoutube = handleLoadedIsSelected(optionsArray: arrayTwoInfluencerYoutube, filteredArray: &youtubeSelectedFilterArray, i: i, deSelectOne: deSelectTwo) as? Int
            }
            
            if let deSelectThree = arrayThreeInfluencerYoutube.firstIndex(where: { $0.id == ret[i] }) {
                minViewsYoutube = handleLoadedIsSelected(optionsArray: arrayThreeInfluencerYoutube, filteredArray: &youtubeSelectedFilterArray, i: i, deSelectOne: deSelectThree) as? Int
            }
            
            if let deSelectFour = arrayFourInfluencerYoutube.firstIndex(where: { $0.id == ret[i] }) {
                maxViewsYoutube = handleLoadedIsSelected(optionsArray: arrayFourInfluencerYoutube, filteredArray: &youtubeSelectedFilterArray, i: i, deSelectOne: deSelectFour) as? Int
            }
            
            
            if let deSelectFive = arrayFiveInfluencerYoutube.firstIndex(where: { $0.id == ret[i] }) {
               
                genderYoutube = handleLoadedIsSelected(optionsArray: arrayFiveInfluencerYoutube, filteredArray: &youtubeSelectedFilterArray, i: i, deSelectOne: deSelectFive) as? String
            }
            
            if let deSelectSix = arraySixInfluencerYoutube.firstIndex(where: { $0.id == ret[i] }) {
                
                languageYoutube = handleLoadedIsSelected(optionsArray: arraySixInfluencerYoutube, filteredArray: &youtubeSelectedFilterArray, i: i, deSelectOne: deSelectSix) as? String
            }
            
            if let deSelectSeven = arraySevenInfluencerYoutube.firstIndex(where: { $0.id == ret[i] }) {
                engagementRateYoutube = handleLoadedIsSelected(optionsArray: arraySevenInfluencerYoutube, filteredArray: &youtubeSelectedFilterArray, i: i, deSelectOne: deSelectSeven) as? Double
            }
        
            
        }
        
        DispatchQueue.main.async {
            self.youtubeInfluencerFilterCollectionView.reloadData()
        }
        
        DispatchQueue.main.async {
            self.youtubeInfluencerOptionsTableView.reloadData()
        }
    }
    
    func loadAudienceSelectedOnesYoutube() {
        guard let returnSelected = UserDefaults.standard.object(forKey: "stateAudienceSelectedYoutube") else { return }
        
        let ret = returnSelected as! [Int]
        
        for i in 0..<ret.count {
            if let deSelectOne = arrayOneFollowersYoutube.firstIndex(where: { $0.id == ret[i] }) {
               audienceGenderYoutube = handleLoadedIsSelected(optionsArray: arrayOneFollowersYoutube, filteredArray: &youtubeAudienceSelectedFilterArray, i: i, deSelectOne: deSelectOne) as? String
            }
            if let deSelectTwo = arrayTwoFollowersYoutube.firstIndex(where: { $0.id == ret[i] }) {
                let abb = arrayTwoFollowersYoutube[deSelectTwo]
                abb.isSelected = !abb.isSelected
                audienceAgeYoutube.append(abb.code as? String)
                youtubeAudienceSelectedFilterArray.insert(.init(filterName: abb.option, id: abb.id), at: i)
            }
            
            if let deSelectThree = arrayThreeFollowersYoutube.firstIndex(where: { $0.id == ret[i] }) {
                audienceLanguageYoutube = handleLoadedIsSelected(optionsArray: arrayThreeFollowersYoutube, filteredArray: &youtubeAudienceSelectedFilterArray, i: i, deSelectOne: deSelectThree) as? String
            }
        }
        
        DispatchQueue.main.async {
            self.youtubeFollowersFilterCollectionView.reloadData()
        }
        
        DispatchQueue.main.async {
            self.youtubeFollowersOptionsTableView.reloadData()
        }
    }
    
    func loadSelectedOnesTiktok() {
        guard let returnSelected = UserDefaults.standard.object(forKey: "stateSelectedTiktok") else { return }
        
        let ret = returnSelected as! [Int]
        
        for i in 0..<ret.count {
            if let deSelectOne = arrayOneInfluencerTiktok.firstIndex(where: { $0.id == ret[i] }) {
                minFollowersTiktok = handleLoadedIsSelected(optionsArray: arrayOneInfluencerTiktok, filteredArray: &tiktokSelectedFilterArray, i: i, deSelectOne: deSelectOne) as? Int
        }
                
            if let deSelectTwo = arrayTwoInfluencerTiktok.firstIndex(where: { $0.id == ret[i] }) {
                maxFollowersTiktok = handleLoadedIsSelected(optionsArray: arrayTwoInfluencerTiktok, filteredArray: &tiktokSelectedFilterArray, i: i, deSelectOne: deSelectTwo) as? Int
            }
            
            if let deSelectThree = arrayThreeInfluencerTiktok.firstIndex(where: { $0.id == ret[i] }) {
                minViewsTiktok = handleLoadedIsSelected(optionsArray: arrayThreeInfluencerTiktok, filteredArray: &tiktokSelectedFilterArray, i: i, deSelectOne: deSelectThree) as? Int
            }
            
            if let deSelectFour = arrayFourInfluencerTiktok.firstIndex(where: { $0.id == ret[i] }) {
                maxViewsTiktok = handleLoadedIsSelected(optionsArray: arrayFourInfluencerTiktok, filteredArray: &tiktokSelectedFilterArray, i: i, deSelectOne: deSelectFour) as? Int
            }
            
            
            if let deSelectFive = arrayFiveInfluencerTiktok.firstIndex(where: { $0.id == ret[i] }) {
               
                genderTiktok = handleLoadedIsSelected(optionsArray: arrayFiveInfluencerTiktok, filteredArray: &tiktokSelectedFilterArray, i: i, deSelectOne: deSelectFive) as? String
            }
            
            if let deSelectSix = arraySixInfluencerTiktok.firstIndex(where: { $0.id == ret[i] }) {
                
                languageTiktok = handleLoadedIsSelected(optionsArray: arraySixInfluencerTiktok, filteredArray: &tiktokSelectedFilterArray, i: i, deSelectOne: deSelectSix) as? String
            }
            
            if let deSelectSeven = arraySevenInfluencerTiktok.firstIndex(where: { $0.id == ret[i] }) {
                engagementRateTiktok = handleLoadedIsSelected(optionsArray: arraySevenInfluencerTiktok, filteredArray: &tiktokSelectedFilterArray, i: i, deSelectOne: deSelectSeven) as? Double
            }
        
            
        }
        
        DispatchQueue.main.async {
            self.tiktokInfluencerFilterCollectionView.reloadData()
        }
        
        DispatchQueue.main.async {
            self.tiktokInfluencerOptionsTableView.reloadData()
        }
    }
    
    func loadAudienceSelectedOnesTiktok() {
        guard let returnSelected = UserDefaults.standard.object(forKey: "stateAudienceSelectedTiktok") else { return }
        
        let ret = returnSelected as! [Int]
        
        for i in 0..<ret.count {
            if let deSelectOne = arrayOneFollowersTiktok.firstIndex(where: { $0.id == ret[i] }) {
               audienceGenderTiktok = handleLoadedIsSelected(optionsArray: arrayOneFollowersTiktok, filteredArray: &tiktokAudienceSelectedFilterArray, i: i, deSelectOne: deSelectOne) as? String
            }
            if let deSelectTwo = arrayTwoFollowersTiktok.firstIndex(where: { $0.id == ret[i] }) {
                let abb = arrayTwoFollowersTiktok[deSelectTwo]
                abb.isSelected = !abb.isSelected
                audienceAgeTiktok.append(abb.code as? String)
                tiktokAudienceSelectedFilterArray.insert(.init(filterName: abb.option, id: abb.id), at: i)
            }
            
            if let deSelectThree = arrayThreeFollowersTiktok.firstIndex(where: { $0.id == ret[i] }) {
                audienceLanguageTiktok = handleLoadedIsSelected(optionsArray: arrayThreeFollowersTiktok, filteredArray: &tiktokAudienceSelectedFilterArray, i: i, deSelectOne: deSelectThree) as? String
            }
        }
        
        DispatchQueue.main.async {
            self.tiktokFollowersFilterCollectionView.reloadData()
        }
        
        DispatchQueue.main.async {
            self.tiktokFollowersOptionsTableView.reloadData()
        }
    }
  
    
    
    @objc func segmentedControlTapped(_ sender: UISegmentedControl) {
//                    changeToIndex(index: 0)
        
//        hideSearchBar()
        switch sender.selectedSegmentIndex {
        case 0:
//            changeToIndex(index: 0)
            youtubeInfluencerHeadingsTableView.isHidden = true
            youtubeInfluencerOptionsTableView.isHidden = true
            youtubeFollowersHeadingsTableView.isHidden = true
            youtubeFollowersOptionsTableView.isHidden = true
            tiktokInfluencerHeadingsTableView.isHidden = true
            tiktokInfluencerOptionsTableView.isHidden = true
            tiktokFollowersHeadingsTableView.isHidden = true
            tiktokFollowersOptionsTableView.isHidden = true
            influencerHeadingsTableView.isHidden = false
            influencerOptionsTableView.isHidden = false
            followersHeadingsTableView.isHidden = false
            followersOptionsTableView.isHidden = false
            
            influencerFilterCollectionView.isHidden = false
            followersFilterCollectionView.isHidden = false
            youtubeInfluencerFilterCollectionView.isHidden = true
            youtubeFollowersFilterCollectionView.isHidden = true
            tiktokInfluencerFilterCollectionView.isHidden = true
            tiktokFollowersFilterCollectionView.isHidden = true
            hideSearchBar()
        case 1:
//            changeToIndex(index: 0)
            influencerHeadingsTableView.isHidden = true
            influencerOptionsTableView.isHidden = true
            followersHeadingsTableView.isHidden = true
            followersOptionsTableView.isHidden = true
            tiktokInfluencerHeadingsTableView.isHidden = true
            tiktokInfluencerOptionsTableView.isHidden = true
            tiktokFollowersHeadingsTableView.isHidden = true
            tiktokFollowersOptionsTableView.isHidden = true
            youtubeInfluencerHeadingsTableView.isHidden = false
            youtubeInfluencerOptionsTableView.isHidden = false
            youtubeFollowersHeadingsTableView.isHidden = false
            youtubeFollowersOptionsTableView.isHidden = false
            
            influencerFilterCollectionView.isHidden = true
            followersFilterCollectionView.isHidden = true
            youtubeInfluencerFilterCollectionView.isHidden = false
            youtubeFollowersFilterCollectionView.isHidden = false
            tiktokInfluencerFilterCollectionView.isHidden = true
            tiktokFollowersFilterCollectionView.isHidden = true
            hideSearchBar()
        case 2:
//            changeToIndex(index: 0)
            influencerHeadingsTableView.isHidden = true
            influencerOptionsTableView.isHidden = true
            followersHeadingsTableView.isHidden = true
            followersOptionsTableView.isHidden = true
            youtubeInfluencerHeadingsTableView.isHidden = true
            youtubeInfluencerOptionsTableView.isHidden = true
            youtubeFollowersHeadingsTableView.isHidden = true
            youtubeFollowersOptionsTableView.isHidden = true
            tiktokInfluencerHeadingsTableView.isHidden = false
            tiktokInfluencerOptionsTableView.isHidden = false
            tiktokFollowersHeadingsTableView.isHidden = false
            tiktokFollowersOptionsTableView.isHidden = false
            
            influencerFilterCollectionView.isHidden = true
            followersFilterCollectionView.isHidden = true
            youtubeInfluencerFilterCollectionView.isHidden = true
            youtubeFollowersFilterCollectionView.isHidden = true
            tiktokInfluencerFilterCollectionView.isHidden = false
            tiktokFollowersFilterCollectionView.isHidden = false
            hideSearchBar()
        default:

            print("default hidden")
                        

     
        }
        
        
        customSegmented.setIndex(index: 0)
        customSegmented.delegate?.changeToIndex(index: 0)
        
                
    }
}

extension SearchViewController: CustomSegmentedControlDelegate {
    
    func changeToIndex(index: Int) {
        switch index {
        case 0:
            if segmentedControl.selectedSegmentIndex == 0 {
                influencerHeadingsTableView.isHidden = false
                influencerOptionsTableView.isHidden = false
                followersHeadingsTableView.isHidden = true
                followersOptionsTableView.isHidden = true
            } else if segmentedControl.selectedSegmentIndex == 1 {
                youtubeInfluencerHeadingsTableView.isHidden = false
                youtubeInfluencerOptionsTableView.isHidden = false
                youtubeFollowersHeadingsTableView.isHidden = true
                youtubeFollowersOptionsTableView.isHidden = true
                
            } else {
                
                tiktokInfluencerHeadingsTableView.isHidden = false
                tiktokInfluencerOptionsTableView.isHidden = false
                tiktokFollowersHeadingsTableView.isHidden = true
                tiktokFollowersOptionsTableView.isHidden = true
 
            }
        case 1:
            if segmentedControl.selectedSegmentIndex == 0 {
                influencerHeadingsTableView.isHidden = true
                influencerOptionsTableView.isHidden = true
                followersHeadingsTableView.isHidden = false
                followersOptionsTableView.isHidden = false
            } else if segmentedControl.selectedSegmentIndex == 1 {
                youtubeInfluencerHeadingsTableView.isHidden = true
                youtubeInfluencerOptionsTableView.isHidden = true
                youtubeFollowersHeadingsTableView.isHidden = false
                youtubeFollowersOptionsTableView.isHidden = false
            } else {
                
                tiktokInfluencerHeadingsTableView.isHidden = true
                tiktokInfluencerOptionsTableView.isHidden = true
                tiktokFollowersHeadingsTableView.isHidden = false
                tiktokFollowersOptionsTableView.isHidden = false
            }
        default:
            print("def")
        }
    }
}
    
  
                  
                    
     


extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
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
                
                
          
            
    
            
            
            case youtubeInfluencerHeadingsTableView:
                return influencerPropertiesHeadingsYoutube.count
            case youtubeInfluencerOptionsTableView:
                switch youtubeInfluencerHeadingsTableView.indexPathForSelectedRow {
                case [0,0]:
                    return arrayOneInfluencerYoutube.count
                case [0,1]:
                    return arrayTwoInfluencerYoutube.count
                case [0,2]:
                    return arrayThreeInfluencerYoutube.count
                case [0,3]:
                    return arrayFourInfluencerYoutube.count
                case [0,4]:
                    return arrayFiveInfluencerYoutube.count
                case [0,5]:
                    return arraySixInfluencerYoutube.count
                case [0,6]:
                    return arraySevenInfluencerYoutube.count
                default:
                    print("default returned 10")
                    return 10
                }

            case youtubeFollowersHeadingsTableView:
                return followersPropertiesHeadingsYoutube.count
            case youtubeFollowersOptionsTableView:
                switch youtubeFollowersHeadingsTableView.indexPathForSelectedRow {
                case [0,0]:
                    return arrayOneFollowersYoutube.count
                case [0,1]:
                    return arrayTwoFollowersYoutube.count
                case [0,2]:
                    return arrayThreeFollowersYoutube.count
                    
                default:
                    print("default returned 10")
                    return 10
                    
                }
                
                
           
            
            
    
            
           
            case tiktokInfluencerHeadingsTableView:
                return influencerPropertiesHeadingsTiktok.count
            case tiktokInfluencerOptionsTableView:
                switch tiktokInfluencerHeadingsTableView.indexPathForSelectedRow {
                case [0,0]:
                    return arrayOneInfluencerTiktok.count
                case [0,1]:
                    return arrayTwoInfluencerTiktok.count
                case [0,2]:
                    return arrayThreeInfluencerTiktok.count
                case [0,3]:
                    return arrayFourInfluencerTiktok.count
                case [0,4]:
                    return arrayFiveInfluencerTiktok.count
                case [0,5]:
                    return arraySixInfluencerTiktok.count
                case [0,6]:
                    return arraySevenInfluencerTiktok.count
                default:
                    print("default returned 10")
                    return 10
                }

            case tiktokFollowersHeadingsTableView:
                return followersPropertiesHeadingsTiktok.count
            case tiktokFollowersOptionsTableView:
                switch tiktokFollowersHeadingsTableView.indexPathForSelectedRow {
                case [0,0]:
                    return arrayOneFollowersTiktok.count
                case [0,1]:
                    return arrayTwoFollowersTiktok.count
                case [0,2]:
                    return arrayThreeFollowersTiktok.count
                    
                default:
                    print("default returned 10")
                    return 10
                    
                }
                
                
           
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
                    print("whaaaaaaattttttt")
                    
                }
                
                cell.selectionStyle = .none
                return cell
    
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
                
                
                
           
        
            case youtubeInfluencerHeadingsTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "youtubeInfluencerHeadingsTableView", for: indexPath)
                return cellForRowConfig(cell: cell, headingArray: influencerPropertiesHeadingsYoutube, indexPath: indexPath)
                
            case youtubeInfluencerOptionsTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "youtubeInfluencerOptionsTableView", for: indexPath)
                
                switch youtubeInfluencerHeadingsTableView.indexPathForSelectedRow {
                case [0,0]:
                    cellConfig(cell: cell, optionArray: arrayOneInfluencerYoutube, indexPath: indexPath)
                    
                case [0,1]:
                    cellConfig(cell: cell, optionArray: arrayTwoInfluencerYoutube, indexPath: indexPath)
                    
                case [0,2]:
                    cellConfig(cell: cell, optionArray: arrayThreeInfluencerYoutube, indexPath: indexPath)
                    
                case [0,3]:
                    cellConfig(cell: cell, optionArray: arrayFourInfluencerYoutube, indexPath: indexPath)
                    
                case [0,4]:
                    cellConfig(cell: cell, optionArray: arrayFiveInfluencerYoutube, indexPath: indexPath)
                    
                case [0,5]:
                    cellConfig(cell: cell, optionArray: arraySixInfluencerYoutube, indexPath: indexPath)
                    
                case [0,6]:
                    cellConfig(cell: cell, optionArray: arraySevenInfluencerYoutube, indexPath: indexPath)
                    
                default:
                    print("whaaaaaaattttttt")
                    
                }
                
                cell.selectionStyle = .none
                return cell
    
            case youtubeFollowersHeadingsTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "youtubeFollowersHeadingsTableView", for: indexPath)
                
                return cellForRowConfig(cell: cell, headingArray: followersPropertiesHeadingsYoutube, indexPath: indexPath)
                
            case youtubeFollowersOptionsTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "youtubeFollowersOptionsTableView", for: indexPath)
                
                switch youtubeFollowersHeadingsTableView.indexPathForSelectedRow {
                case [0,0]:
                    cellConfig(cell: cell, optionArray: arrayOneFollowersYoutube, indexPath: indexPath)
                    
                case [0,1]:
                    cellConfig(cell: cell, optionArray: arrayTwoFollowersYoutube, indexPath: indexPath)
                    
                case [0,2]:
                    cellConfig(cell: cell, optionArray: arrayThreeFollowersYoutube, indexPath: indexPath)
                    
                    
                default:
                    print("whaaaaaaattttttt")
                }
                
                cell.selectionStyle = .none
                return cell
                
                
            
      
            case tiktokInfluencerHeadingsTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "tiktokInfluencerHeadingsTableView", for: indexPath)
                return cellForRowConfig(cell: cell, headingArray: influencerPropertiesHeadingsTiktok, indexPath: indexPath)
                
            case tiktokInfluencerOptionsTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "tiktokInfluencerOptionsTableView", for: indexPath)
                
                switch tiktokInfluencerHeadingsTableView.indexPathForSelectedRow {
                case [0,0]:
                    cellConfig(cell: cell, optionArray: arrayOneInfluencerTiktok, indexPath: indexPath)
                    
                case [0,1]:
                    cellConfig(cell: cell, optionArray: arrayTwoInfluencerTiktok, indexPath: indexPath)
                    
                case [0,2]:
                    cellConfig(cell: cell, optionArray: arrayThreeInfluencerTiktok, indexPath: indexPath)
                    
                case [0,3]:
                    cellConfig(cell: cell, optionArray: arrayFourInfluencerTiktok, indexPath: indexPath)
                    
                case [0,4]:
                    cellConfig(cell: cell, optionArray: arrayFiveInfluencerTiktok, indexPath: indexPath)
                    
                case [0,5]:
                    cellConfig(cell: cell, optionArray: arraySixInfluencerTiktok, indexPath: indexPath)
                    
                case [0,6]:
                    cellConfig(cell: cell, optionArray: arraySevenInfluencerTiktok, indexPath: indexPath)
                    
                default:
                    print("whaaaaaaattttttt")
                    
                }
                
                cell.selectionStyle = .none
                return cell
    
            case tiktokFollowersHeadingsTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "tiktokFollowersHeadingsTableView", for: indexPath)
                
                return cellForRowConfig(cell: cell, headingArray: followersPropertiesHeadingsTiktok, indexPath: indexPath)
                
            case tiktokFollowersOptionsTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "tiktokFollowersOptionsTableView", for: indexPath)
                
                switch tiktokFollowersHeadingsTableView.indexPathForSelectedRow {
                case [0,0]:
                    cellConfig(cell: cell, optionArray: arrayOneFollowersTiktok, indexPath: indexPath)
                    
                case [0,1]:
                    cellConfig(cell: cell, optionArray: arrayTwoFollowersTiktok, indexPath: indexPath)
                    
                case [0,2]:
                    cellConfig(cell: cell, optionArray: arrayThreeFollowersTiktok, indexPath: indexPath)
                    
                    
                default:
                    print("whaaaaaaattttttt")
                }
                
                cell.selectionStyle = .none
                return cell
                
                
                
           
            
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
                
                
                
          
          
            
            
       
            case youtubeInfluencerHeadingsTableView:
                
                selectedIndexYoutube = indexPath
                
                handleHeaderSelected(tableView: youtubeInfluencerHeadingsTableView, headingArray: influencerPropertiesHeadingsYoutube, indexPath: indexPath)
                
            case youtubeInfluencerOptionsTableView:
                print("inside baby")
                
                filterIndexCountYoutube += 1
                
                switch youtubeInfluencerHeadingsTableView.indexPathForSelectedRow {
                case [0,0]:
                    
                    minFollowersYoutube = handleDidSelectCells(array: arrayOneInfluencerYoutube, filteredArray: &youtubeSelectedFilterArray, indexPath: indexPath) as? Int
                    
                case [0,1]:
                    maxFollowersYoutube = handleDidSelectCells(array: arrayTwoInfluencerYoutube, filteredArray: &youtubeSelectedFilterArray, indexPath: indexPath) as? Int
                case [0,2]:
                    minViewsYoutube = handleDidSelectCells(array: arrayThreeInfluencerYoutube, filteredArray: &youtubeSelectedFilterArray, indexPath: indexPath) as? Int
                case [0,3]:
                    maxViewsYoutube = handleDidSelectCells(array: arrayFourInfluencerYoutube, filteredArray: &youtubeSelectedFilterArray, indexPath: indexPath) as? Int
                case [0,4]:
                    genderYoutube = handleDidSelectCells(array: arrayFiveInfluencerYoutube, filteredArray: &youtubeSelectedFilterArray, indexPath: indexPath) as? String
                    
                case [0,5]:
                    languageYoutube = handleDidSelectCells(array: arraySixInfluencerYoutube, filteredArray: &youtubeSelectedFilterArray, indexPath: indexPath) as? String
                   
                case [0,6]:
                    engagementRateYoutube = handleDidSelectCells(array: arraySevenInfluencerYoutube, filteredArray: &youtubeSelectedFilterArray, indexPath: indexPath) as? Double
                    
                default:
                    print("default is collapse")
                }
              
                
                
                
            case youtubeFollowersHeadingsTableView:
                audienceSelectedIndexYoutube = indexPath
                
                handleHeaderSelected(tableView: youtubeFollowersHeadingsTableView, headingArray: followersPropertiesHeadingsYoutube, indexPath: indexPath)
                
            case youtubeFollowersOptionsTableView:
                audienceFilterIndexCountYoutube += 1
                
                switch youtubeFollowersHeadingsTableView.indexPathForSelectedRow {
                case [0,0]:
                    
                    audienceGenderYoutube = handleDidSelectCells(array: arrayOneFollowersYoutube, filteredArray: &youtubeAudienceSelectedFilterArray, indexPath: indexPath) as? String
                    
                case [0,1]:
                    handleDidSelectCellsArrayString(array: arrayTwoFollowersYoutube, filteredArray: &youtubeAudienceSelectedFilterArray, indexPath: indexPath, typeArray: &audienceAgeYoutube)
                case [0,2]:
                    audienceLanguageYoutube = handleDidSelectCells(array: arrayThreeFollowersYoutube, filteredArray: &youtubeAudienceSelectedFilterArray, indexPath: indexPath) as? String
             
                   
                default:
                    print("default is collapse")
                }
                
          
            
      
           
            
            
    
            case tiktokInfluencerHeadingsTableView:
                
                selectedIndexTiktok = indexPath
                
                handleHeaderSelected(tableView: tiktokInfluencerHeadingsTableView, headingArray: influencerPropertiesHeadingsTiktok, indexPath: indexPath)
                
            case tiktokInfluencerOptionsTableView:
                print("inside baby")
                
                filterIndexCountTiktok += 1
                
                switch tiktokInfluencerHeadingsTableView.indexPathForSelectedRow {
                case [0,0]:
                    
                    minFollowersTiktok = handleDidSelectCells(array: arrayOneInfluencerTiktok, filteredArray: &tiktokSelectedFilterArray, indexPath: indexPath) as? Int
                    
                case [0,1]:
                    maxFollowersTiktok = handleDidSelectCells(array: arrayTwoInfluencerTiktok, filteredArray: &tiktokSelectedFilterArray, indexPath: indexPath) as? Int
                case [0,2]:
                   minViewsTiktok = handleDidSelectCells(array: arrayThreeInfluencerTiktok, filteredArray: &tiktokSelectedFilterArray, indexPath: indexPath) as? Int
                    
                case [0,3]:
                    maxViewsTiktok = handleDidSelectCells(array: arrayFourInfluencerTiktok, filteredArray: &tiktokSelectedFilterArray, indexPath: indexPath) as? Int

                case [0,4]:
                    genderTiktok = handleDidSelectCells(array: arrayFiveInfluencerTiktok, filteredArray: &tiktokSelectedFilterArray, indexPath: indexPath) as? String
                    
                case [0,5]:
                    languageTiktok = handleDidSelectCells(array: arraySixInfluencerTiktok, filteredArray: &tiktokSelectedFilterArray, indexPath: indexPath) as? String
                    
                    
                case [0,6]:
                    engagementRateTiktok = handleDidSelectCells(array: arraySevenInfluencerTiktok, filteredArray: &tiktokSelectedFilterArray, indexPath: indexPath) as? Double
                    
                default:
                    print("default is collapse")
                }
              
                
                
                
            case tiktokFollowersHeadingsTableView:
                audienceSelectedIndexTiktok = indexPath
                
                handleHeaderSelected(tableView: tiktokFollowersHeadingsTableView, headingArray: followersPropertiesHeadingsTiktok, indexPath: indexPath)
                
            case tiktokFollowersOptionsTableView:
                audienceFilterIndexCountTiktok += 1
                
                switch tiktokFollowersHeadingsTableView.indexPathForSelectedRow {
                case [0,0]:
                    
                    audienceGenderTiktok = handleDidSelectCells(array: arrayOneFollowersTiktok, filteredArray: &tiktokAudienceSelectedFilterArray, indexPath: indexPath) as? String
                    
                case [0,1]:
                    handleDidSelectCellsArrayString(array: arrayTwoFollowersTiktok, filteredArray: &tiktokAudienceSelectedFilterArray, indexPath: indexPath, typeArray: &audienceAgeTiktok)
                case [0,2]:
                    audienceLanguageTiktok = handleDidSelectCells(array: arrayThreeFollowersTiktok, filteredArray: &tiktokAudienceSelectedFilterArray, indexPath: indexPath) as? String
                    
                default:
                    print("default is collapse")
                }
                
                
                
         
            
           
            
         
            
        default:
            print("didselect switch error")
            
        }
        
        
       
        
        influencerOptionsTableView.reloadData()
        followersOptionsTableView.reloadData()
        
        DispatchQueue.main.async {
            self.influencerFilterCollectionView.reloadData()
            self.followersFilterCollectionView.reloadData()
        }
        
        self.influencerFilterCollectionView.scrollToItem(at: IndexPath(row: filterIndexCount, section: 0), at: .right, animated: true)
        self.followersFilterCollectionView.scrollToItem(at: IndexPath(row: audienceFilterIndexCount, section: 0), at: .right, animated: true)
        
        
      
       
        youtubeInfluencerOptionsTableView.reloadData()
        youtubeFollowersOptionsTableView.reloadData()
        
        self.youtubeInfluencerFilterCollectionView.scrollToItem(at: IndexPath(row: filterIndexCountYoutube, section: 0), at: .right, animated: true)
        self.youtubeFollowersFilterCollectionView.scrollToItem(at: IndexPath(row: audienceFilterIndexCountYoutube, section: 0), at: .right, animated: true)
        DispatchQueue.main.async {
            self.youtubeInfluencerFilterCollectionView.reloadData()
            self.youtubeFollowersFilterCollectionView.reloadData()
        }
        
          
        
        
          tiktokInfluencerOptionsTableView.reloadData()
          tiktokFollowersOptionsTableView.reloadData()
          
          DispatchQueue.main.async {
              self.tiktokInfluencerFilterCollectionView.reloadData()
              self.tiktokFollowersFilterCollectionView.reloadData()
          }
          
          self.tiktokInfluencerFilterCollectionView.scrollToItem(at: IndexPath(row: filterIndexCountTiktok, section: 0), at: .right, animated: true)
          self.tiktokFollowersFilterCollectionView.scrollToItem(at: IndexPath(row: audienceFilterIndexCountTiktok, section: 0), at: .right, animated: true)
          
         
       
        
        
        
        
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
    
    func headerConfig(header: UICollectionReusableView, width: CGFloat, title: String) -> UICollectionReusableView {
        header.frame = CGRect(x: 0, y: 0, width: width / 5, height: 25)
        header.backgroundColor = .white
        let titleIn = UILabel()
        titleIn.font = UIFont.systemFont(ofSize: 12)
        titleIn.sizeToFit()
        titleIn.textColor = UIColor().infpromo
        titleIn.text = "\(title):"
        titleIn.numberOfLines = 0
        titleIn.frame = header.frame
        header.addSubview(titleIn)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case HeaderKinds.instagramInfluencer.rawValue:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: HeaderKinds.instagramInfluencer.rawValue, withReuseIdentifier: HeaderIdentifiers.instagramInfluencerIdentifier.rawValue, for: indexPath)
            return headerConfig(header: header, width: collectionView.width, title: "influencer")
        case HeaderKinds.instagramFollowers.rawValue:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: HeaderKinds.instagramFollowers.rawValue, withReuseIdentifier: HeaderIdentifiers.instagramFollowersIdentifier.rawValue, for: indexPath)
            return headerConfig(header: header, width: collectionView.width, title: "takipçi")
        case HeaderKinds.youtubeInfluencer.rawValue:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: HeaderKinds.youtubeInfluencer.rawValue, withReuseIdentifier: HeaderIdentifiers.youtubeInfluencerIdentifier.rawValue, for: indexPath)
            return headerConfig(header: header, width: collectionView.width, title: "influencer")
        case HeaderKinds.youtubeFollowers.rawValue:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: HeaderKinds.youtubeFollowers.rawValue, withReuseIdentifier: HeaderIdentifiers.youtubeFollowersIdentifier.rawValue, for: indexPath)
            return headerConfig(header: header, width: collectionView.width, title: "takipçi")
        case HeaderKinds.tiktokInfluencer.rawValue:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: HeaderKinds.tiktokInfluencer.rawValue, withReuseIdentifier: HeaderIdentifiers.tiktokInfluencerIdentifier.rawValue, for: indexPath)
            return headerConfig(header: header, width: collectionView.width, title: "influencer")
        case HeaderKinds.tiktokFollowers.rawValue:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: HeaderKinds.tiktokFollowers.rawValue, withReuseIdentifier: HeaderIdentifiers.tiktokFollowersIdentifier.rawValue, for: indexPath)
            return headerConfig(header: header, width: collectionView.width, title: "takipçi")
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
