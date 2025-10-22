<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\Books;

final class Definitions {
    // --- základní metadata ---
    public static function table(): string { return 'books'; }
    public static function contractView(): string { return 'v_books_contract'; }
    /** @return string[] */
    public static function columns(): array { return [ 'id', 'title', 'slug', 'short_description', 'full_description', 'price', 'currency', 'author_id', 'main_category_id', 'isbn', 'language', 'pages', 'publisher', 'published_at', 'sku', 'is_active', 'is_available', 'stock_quantity', 'created_at', 'updated_at', 'deleted_at' ]; }
    public static function pk(): string { return 'id'; }

    // --- volitelná metadata (mohou být prázdná) ---
    public static function softDeleteColumn(): ?string {
        $c = 'deleted_at'; return $c !== '' ? $c : null;
    }
    public static function updatedAtColumn(): ?string {
        $c = 'updated_at'; return $c !== '' ? $c : null;
    }
    public static function versionColumn(): ?string {
        $c = ''; return $c !== '' ? $c : null; // pro optimistic locking
    }
    /** např. "created_at DESC, id DESC" */
    public static function defaultOrder(): ?string {
        $c = 'created_at DESC, id DESC'; return $c !== '' ? $c : null;
    }
    /** @return array<int,array<int,string>> seznam unikátních klíčů (sloupcových kombinací) */
    public static function uniqueKeys(): array { return []; }
    /** @return string[] JSON sloupce kvůli castům/operacím */
    public static function jsonColumns(): array { return []; }

    // --- pomocníci ---
    public static function hasColumn(string $col): bool {
        static $set = null;
        if ($set === null) { $set = array_fill_keys(self::columns(), true); }
        return isset($set[$col]);
    }
}
