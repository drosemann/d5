// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/market/MarketListing.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/market/MarketListing.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/market/MarketListing.java), unveraendert, als Inline-Doku ----
// package de.streuland.market;
//
// import java.util.UUID;
//
// /**
//  * Active fixed-price listing for a player-owned plot.
//  */
// public class MarketListing {
//     public enum ListingType {
//         SALE,
//         RENT
//     }
//
//     private final String plotId;
//     private final UUID sellerId;
//     private final double price;
//     private final long createdAt;
//     private final ListingType listingType;
//     private final int rentDurationDays;
//
//     public MarketListing(String plotId, UUID sellerId, double price, long createdAt) {
//         this(plotId, sellerId, price, createdAt, ListingType.SALE, 0);
//     }
//
//     public MarketListing(String plotId, UUID sellerId, double price, long createdAt, ListingType listingType, int rentDurationDays) {
//         this.plotId = plotId;
//         this.sellerId = sellerId;
//         this.price = price;
//         this.createdAt = createdAt;
//         this.listingType = listingType == null ? ListingType.SALE : listingType;
//         this.rentDurationDays = Math.max(0, rentDurationDays);
//     }
//
//     public String getPlotId() {
//         return plotId;
//     }
//
//     public UUID getSellerId() {
//         return sellerId;
//     }
//
//     public double getPrice() {
//         return price;
//     }
//
//     public long getCreatedAt() {
//         return createdAt;
//     }
//
//     public ListingType getListingType() {
//         return listingType;
//     }
//
//     public int getRentDurationDays() {
//         return rentDurationDays;
//     }
// }
//
