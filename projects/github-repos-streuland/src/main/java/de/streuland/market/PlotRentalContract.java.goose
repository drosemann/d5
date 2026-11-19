// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/market/PlotRentalContract.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/market/PlotRentalContract.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/market/PlotRentalContract.java), unveraendert, als Inline-Doku ----
// package de.streuland.market;
//
// import java.util.UUID;
//
// /**
//  * Active agreement for a rented plot.
//  */
// public class PlotRentalContract {
//     private final String contractId;
//     private final String plotId;
//     private final UUID landlordId;
//     private final UUID tenantId;
//     private final double rentPrice;
//     private final long createdAt;
//     private final long startsAt;
//     private final long endsAt;
//
//     public PlotRentalContract(String contractId,
//                               String plotId,
//                               UUID landlordId,
//                               UUID tenantId,
//                               double rentPrice,
//                               long createdAt,
//                               long startsAt,
//                               long endsAt) {
//         this.contractId = contractId;
//         this.plotId = plotId;
//         this.landlordId = landlordId;
//         this.tenantId = tenantId;
//         this.rentPrice = rentPrice;
//         this.createdAt = createdAt;
//         this.startsAt = startsAt;
//         this.endsAt = endsAt;
//     }
//
//     public String getContractId() {
//         return contractId;
//     }
//
//     public String getPlotId() {
//         return plotId;
//     }
//
//     public UUID getLandlordId() {
//         return landlordId;
//     }
//
//     public UUID getTenantId() {
//         return tenantId;
//     }
//
//     public double getRentPrice() {
//         return rentPrice;
//     }
//
//     public long getCreatedAt() {
//         return createdAt;
//     }
//
//     public long getStartsAt() {
//         return startsAt;
//     }
//
//     public long getEndsAt() {
//         return endsAt;
//     }
//
//     public boolean isActive(long now) {
//         return now >= startsAt && now <= endsAt;
//     }
// }
//
