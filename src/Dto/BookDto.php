<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\Books\Dto;

/**
 * Simple immutable DTO with public readonly properties.
 * - No logic; just a data carrier.
 * - Strong types enforce the contract across layers.
 */
final class BookDto implements \JsonSerializable {
    public function __construct(
        public readonly int $id,
        public readonly int $tenantId,
        public readonly string $title,
        public readonly string $slug,
        public readonly ?string $slugCi,
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
        public readonly ?\DateTimeImmutable $deletedAt,
        public readonly ?bool $isLive
    ) {}

    /** Suitable for serialization/logging (without large blobs). */
    public function toArray(): array {
        return get_object_vars($this);
    }

    /** toArray() without null values - for clean logging/diffs. */
    public function toArrayNonNull(): array {
        return array_filter(get_object_vars($this), static fn($v) => $v !== null);
    }

    public function jsonSerialize(): array {
       $a = $this->toArray();
       foreach ($a as $k => $v) {
           if ($v instanceof \DateTimeInterface) {
               // ISO-8601 with a timezone; switch to 'Y-m-d H:i:s.u' if needed
               $a[$k] = $v->format(\DateTimeInterface::ATOM);
           }
       }
       return $a;
   }
}
