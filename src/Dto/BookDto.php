<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\Books\Dto;

/**
 * Jednoduché, neměnné DTO s veřejnými readonly vlastnostmi.
 * - Bez logiky; pouze nosič dat.
 * - Silné typy drží kontrakt napříč vrstvami.
 */
final class BookDto {
    public function __construct(
        public readonly ?int $id,
        public readonly string $title,
        public readonly string $slug,
        public readonly ?string $shortDescription,
        public readonly ?string $fullDescription,
        public readonly string $price,
        public readonly string $currency,
        public readonly int $authorId,
        public readonly int $mainCategoryId,
        public readonly ?string $isbn,
        public readonly ?string $language,
        public readonly ?int $pages,
        public readonly ?string $publisher,
        public readonly ?\DateTimeImmutable $publishedAt,
        public readonly ?string $sku,
        public readonly bool $isActive,
        public readonly bool $isAvailable,
        public readonly int $stockQuantity,
        public readonly \DateTimeImmutable $createdAt,
        public readonly \DateTimeImmutable $updatedAt,
        public readonly int $version,
        public readonly ?\DateTimeImmutable $deletedAt
    ) {}

    /** Vhodné pro serializaci/logování (bez velkých blobů). */
    public function toArray(): array {
        return get_object_vars($this);
    }
}
