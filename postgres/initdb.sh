#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE TABLE IF NOT EXISTS strings (
        id SERIAL PRIMARY KEY,
        content TEXT NOT NULL
    );

    INSERT INTO strings (content) VALUES 
    ('String 1'),
    ('String 2'),
    ('String 3'),
    ('String 4'),
    ('String 5'),
    ('String 6'),
    ('String 7'),
    ('String 8'),
    ('String 9'),
    ('String 10');
EOSQL

