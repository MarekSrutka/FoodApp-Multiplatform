//
//  RouteFinder.swift
//  FoodApp
//
//  Created by Marek Srutka on 27.03.2024.
//

import Foundation

/*
 Deeplinks:
    marekFoodApp://menu
    marekFoodApp://promo?discount=0.3&desc=enjoy+this+discount
    marekFoodApp://product?item=🍦_Ice+Cream
    marekFoodApp://product?item=xxxx
 */

enum DeeplinkURLs: String {
    case promo
    case product
}

struct RouteFinder {
    func find(from url: URL,
              productFetcher: ProductFetcherViewModel) async -> Route? {
        guard let host = url.host() else { return nil }
        
        switch DeeplinkURLs(rawValue: host) {
        case .promo:
            let queryParameters = url.queryParameters
            
            guard let descQueryVal = queryParameters?["desc"] as? String,
                  let discountQueryVal = queryParameters?["discount"] as? String,
                  let discountPct = Decimal(string: discountQueryVal) else {
                return nil
            }
            
            let promoData = Promo(desc: descQueryVal, pct: discountPct)
            
            return .promo(data: promoData)
        case .product:
            let queryParameters = url.queryParameters
            guard let itemQueryVal = queryParameters?["item"] as? String,
                  let product = await productFetcher.fetchProduct(by: itemQueryVal) else {
                return .invalidProduct
            }
            
            return .menuItem(item: product)
        default:
            return nil
        }
    }
}


