//
//  Data.swift
//  MySpar
//
//  Created by Denis Klimov on 12.08.2023.
//

import UIKit
import Foundation


//TODO: Protocol!

class DataOfModels {
    
    static var stories = [
        StoryModel(image: UIImage(named: "storyFirst")!, headerText: "Вкусные хот-доги", isRead: true),
        StoryModel(image: UIImage(named: "storySecond")!, headerText: "Яйца на завтрак", isRead: true),
        StoryModel(image: UIImage(named: "storyThird")!, headerText: "Быстрый перекус", isRead: false),
        StoryModel(image: UIImage(named: "storyFourth")!, headerText: "Орехи для здоровья", isRead: false),
        StoryModel(image: UIImage(named: "storyFifth")!, headerText: "Любимые овощи", isRead: false),
        StoryModel(image: UIImage(named: "storySixth")!, headerText: "Полезный обед", isRead: true),
    ]
    
    static var specialOffers = [
        SpecialOfferModel(specialOfferImage: UIImage(named: "01specialOffer")!),
        SpecialOfferModel(specialOfferImage: UIImage(named: "02specialOffer")!),
        SpecialOfferModel(specialOfferImage: UIImage(named: "03specialOffer")!),
        SpecialOfferModel(specialOfferImage: UIImage(named: "04specialOffer")!),
        SpecialOfferModel(specialOfferImage: UIImage(named: "05specialOffer")!),
        SpecialOfferModel(specialOfferImage: UIImage(named: "06specialOffer")!),
        SpecialOfferModel(specialOfferImage: UIImage(named: "07specialOffer")!),
    ]
    
    static var bonusStatus = [BonusStatusModel(bounus: 1276)]
    
    static let services = [
        ServiceModel(serviceTitle: "Абонемент на кофе", titleColorMode: .dark, serviceImage: UIImage(named: "servicesCoffee")!),
        ServiceModel(serviceTitle: "Винный клуб", titleColorMode: .dark, serviceImage: UIImage(named: "servicesWine")!),
        ServiceModel(serviceTitle: "Доставка", titleColorMode: .dark, serviceImage: UIImage(named: "servicesDelivery")!),
        ServiceModel(serviceTitle: "Скидки и акции", titleColorMode: .light, serviceImage: UIImage(named: "servicesDiscounts")!),
        ServiceModel(serviceTitle: "Список покупок", titleColorMode: .dark, serviceImage: UIImage(named: "servicesShoppingList")!),
        ServiceModel(serviceTitle: "Карта покупателя", titleColorMode: .light, serviceImage: UIImage(named: "servicesCard")!),
    ]
    
    static let recomendations = [
        ProductModel(
            accentLabel: nil,
            accentLabelColor: .systemTeal,
            discount: "20%",
            productImage: UIImage(named: "lamber")!,
            actualPrice: 159.99,
            oldPrice: 199.99),
        
        ProductModel(
            accentLabel: "Our kitchen",
            accentLabelColor: UIColor.blue,
            discount: "17%",
            productImage: UIImage(named: "pizza")!,
            actualPrice: 295.47,
            oldPrice: 355.99),
        
        ProductModel(
            accentLabel: "Bestseller",
            accentLabelColor: UIColor.black,
            discount: nil,
            productImage: UIImage(named: "iceCream")!,
            actualPrice: 226.99,
            oldPrice: nil),
        
        ProductModel(
            accentLabel: "Best offer",
            accentLabelColor: nil,
            discount: nil,
            productImage: UIImage(named: "watermelon")!,
            actualPrice: 29.99,
            oldPrice: nil),
    ]
    
    
    static let sweets = [
        ProductModel(
            accentLabel: "Мороженое",
            accentLabelColor: .systemTeal,
            discount: "10%",
            productImage: UIImage(named: "sweets01")!,
            actualPrice: 1.90,
            oldPrice: nil),
        ProductModel(
            accentLabel: "Мороженое",
            accentLabelColor: .systemTeal,
            discount: "20%",
            productImage: UIImage(named: "sweets02")!,
            actualPrice: 2.90,
            oldPrice: nil),
        ProductModel(
            accentLabel: "Мороженое",
            accentLabelColor: .systemTeal,
            discount: "30%",
            productImage: UIImage(named: "sweets03")!,
            actualPrice: 3.90,
            oldPrice: nil),
        ProductModel(
            accentLabel: "Мороженое",
            accentLabelColor: .systemTeal,
            discount: "40%",
            productImage: UIImage(named: "sweets04")!,
            actualPrice: 4.90,
            oldPrice: nil),
        ProductModel(
            accentLabel: "Мороженое",
            accentLabelColor: .systemTeal,
            discount: "50%",
            productImage: UIImage(named: "sweets05")!,
            actualPrice: 5.90,
            oldPrice: 12.0),
        ProductModel(
            accentLabel: "Конфеты",
            accentLabelColor: .systemTeal,
            discount: nil,
            productImage: UIImage(named: "sweets06")!,
            actualPrice: 6.90,
            oldPrice: nil),
        ProductModel(
            accentLabel: "Конфеты",
            accentLabelColor: .systemTeal,
            discount: nil,
            productImage: UIImage(named: "sweets07")!,
            actualPrice: 7.90,
            oldPrice: nil),
        ]
}
