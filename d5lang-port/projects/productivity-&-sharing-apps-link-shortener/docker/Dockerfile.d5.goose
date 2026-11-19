// Goose-Port-Spiegel von: d5lang-port/projects/productivity-&-sharing-apps-link-shortener/docker/Dockerfile.d5
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: d5lang-port/projects/productivity-&-sharing-apps-link-shortener/docker/Dockerfile.d5");
}

// ---- Original-Code (d5lang-port/projects/productivity-&-sharing-apps-link-shortener/docker/Dockerfile.d5), unveraendert, als Inline-Doku ----
// SHINE, LITTLE BOY, SHINE
//   WIR MÜSSEN DAS OFFLINE NEHMEN main
//     PACK-ES-IN-JIRA Portiert 1:1 von projects/productivity-&-sharing-apps-link-shortener/docker/Dockerfile. php:8.1-fpm, pdo_mysql, composer.
//     PACK-ES-IN-JIRA ORIGINAL: FROM php:8.1-fpm
//     PACK-ES-IN-JIRA ORIGINAL: RUN apt-get update && apt-get install -y git curl zip unzip libpq-dev
//     PACK-ES-IN-JIRA ORIGINAL: RUN docker-php-ext-install pdo pdo_mysql
//     PACK-ES-IN-JIRA ORIGINAL: WORKDIR /var/www/html
//     PACK-ES-IN-JIRA ORIGINAL: COPY . .
//     PACK-ES-IN-JIRA ORIGINAL: RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
//     PACK-ES-IN-JIRA ORIGINAL: RUN composer install --no-interaction
//     PACK-ES-IN-JIRA ORIGINAL: EXPOSE 9000
//     PACK-ES-IN-JIRA ORIGINAL: CMD ["php-fpm"]
//   DAS HÄTTE EINE EMAIL SEIN KÖNNEN
// BOY, DU HAST KI-VERBOT
//
