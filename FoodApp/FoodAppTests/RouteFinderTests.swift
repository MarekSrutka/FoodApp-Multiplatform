//
//  RouteFinderTests.swift
//  FoodAppTests
//
//  Created by Marek Srutka on 27.03.2024.
//

import XCTest
@testable import FoodApp


final class RouteFinderTests: XCTestCase {
    
    private var sut: RouteFinder!
    private var fetcher: ProductFetcherViewModel!
    
    @MainActor override func setUp() {
        sut = RouteFinder()
        fetcher = ProductFetcherViewModel()
    }
    
    override func tearDown() {
        sut = nil
        fetcher = nil
    }
    
    func testPromoLinkRouteIsParsedCorrectly() async throws {
        let deeplinkUrl = try XCTUnwrap(URL(string: "marekFoodApp://promo?discount=0.3&desc=enjoy+this+great+discount"))
        
        let route = await sut.find(from: deeplinkUrl, productFetcher: fetcher)
        let promoData = Promo(desc: "enjoy this great discount", pct: 0.3)
        XCTAssertEqual(route, .promo(data: promoData), "This should be a valid path to a promotion")
    }
    
    func testPromoLinkRouteWithoutDescIsNotParsedCorrectly() async throws {
        let deeplinkUrl = try XCTUnwrap(URL(string: "marekFoodApp://promo?discount=0.3"))
        
        let route = await sut.find(from: deeplinkUrl, productFetcher: fetcher)
        XCTAssertNil(route, "This should be nil since it's missing a description")
    }
    
    func testProductLinkRouteIsParsedCorrectly() async throws {
        let iceCream = try XCTUnwrap(desserts.first(where: { $0.id == "🍦_Ice Cream" }))
        let deeplinkUrl = try XCTUnwrap(Route.buildDeeplink(from: .menuItem(item: iceCream)))
        let route = await sut.find(from: deeplinkUrl, productFetcher: fetcher)
        XCTAssertEqual(route, .menuItem(item: iceCream), "This route should be to ice cream")
    }
    
    func testInvalidLinkIsNotParsedCorrectly() async throws {
        let url = try XCTUnwrap(URL(string: "marekFoodApp://product?item=xxx"))
        let route = await sut.find(from: url, productFetcher: fetcher)
        XCTAssertEqual(route, .invalidProduct, "The product path should be invalid product")
    }
}
