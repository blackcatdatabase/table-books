<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\Books\Joins;

/**
 * Metody generované z cizích klíčů.
 *
 * Vracená struktura: [string $sqlJoinFragment, array $params]
 * Politika JOINů:
 *   - -JoinPolicy left  => vždy LEFT JOIN (výchozí)
 *   - -JoinPolicy all   => INNER JOIN, pokud VŠECHNY lokální FK sloupce jsou NOT NULL
 *   - -JoinPolicy any   => INNER JOIN, pokud ALESPOŇ JEDEN lokální FK sloupec je NOT NULL
 */
final class BooksJoins {

    /** @internal Stručná kontrola SQL aliasu (ochrana proti nesmyslným vstupům). */
    private function assertAlias(string $s): string {
        if (!preg_match('/^[A-Za-z_][A-Za-z0-9_]*$/', $s)) {
            throw new \InvalidArgumentException("Invalid SQL alias: {$s}");
        }
        return $s;
    }

    /** @internal Ověří oba aliasy a že se neshodují. */
    private function assertAliasPair(string $alias, string $as): array {
        $alias = $this->assertAlias($alias);
        $as    = $this->assertAlias($as);
        if ($alias === $as) {
            throw new \InvalidArgumentException("Join alias must differ from base alias: {$alias}");
        }
        return [$alias, $as];
    }


    /**
     * FK: books -> authors
     * LEFT JOIN vw_authors AS $as ON $as.id = $alias.author_id
     * @return array{0:string,1:array}
     */
    public function joinAuthors(string $alias = 't', string $as = 'j0'): array {
        [$alias, $as] = $this->assertAliasPair($alias, $as);
        return [' LEFT JOIN vw_authors AS ' . $as . ' ON ' . $as . '.id = ' . $alias . '.author_id' . ' ', []];
    }
    /**
     * FK: books -> categories
     * LEFT JOIN vw_categories AS $as ON $as.id = $alias.main_category_id
     * @return array{0:string,1:array}
     */
    public function joinCategories(string $alias = 't', string $as = 'j1'): array {
        [$alias, $as] = $this->assertAliasPair($alias, $as);
        return [' LEFT JOIN vw_categories AS ' . $as . ' ON ' . $as . '.id = ' . $alias . '.main_category_id' . ' ', []];
    }

}
