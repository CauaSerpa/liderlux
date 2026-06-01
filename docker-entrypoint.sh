#!/bin/sh
set -e
set -x

echo "Aguardando banco..."

until mysql -h"$DB_HOST" \
    -u"$DB_USERNAME" \
    -p"$DB_PASSWORD" \
    -P "$DB_PORT" \
    "$DB_DATABASE" \
    -e "SELECT 1" >/dev/null 2>&1
do
    sleep 2
done

echo "Banco conectado."

# ==============================
# 🔎 VERIFICA SE SCHEMA EXISTE
# ==============================
SCHEMA_EXISTS=$(mysql -h"$DB_HOST" \
    -u"$DB_USERNAME" \
    -p"$DB_PASSWORD" \
    -P "$DB_PORT" \
    "$DB_DATABASE" \
    -se "SHOW TABLES LIKE 'acc_coa';")

# ==============================
# 🔎 VERIFICA SE SEED JÁ RODOU
# ==============================
SEED_EXISTS=$(mysql -h"$DB_HOST" \
    -u"$DB_USERNAME" \
    -p"$DB_PASSWORD" \
    -P "$DB_PORT" \
    "$DB_DATABASE" \
    -se "SHOW TABLES LIKE 'seed_log';")

# cria tabela de controle do seed (se não existir)
if [ -z "$SEED_EXISTS" ]; then
    echo "Criando tabela de controle de seed..."

    mysql -h"$DB_HOST" \
        -u"$DB_USERNAME" \
        -p"$DB_PASSWORD" \
        -P "$DB_PORT" \
        "$DB_DATABASE" <<EOF
CREATE TABLE IF NOT EXISTS seed_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    seed_name VARCHAR(100) UNIQUE,
    executed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
EOF
fi

# ==============================
# 🧱 INIT SCHEMA
# ==============================
if [ -z "$SCHEMA_EXISTS" ]; then
    echo "Primeira execução - rodando schema..."

    if [ -f /var/www/docker/db/init/001_base.sql ]; then
        mysql -h"$DB_HOST" \
            -u"$DB_USERNAME" \
            -p"$DB_PASSWORD" \
            -P "$DB_PORT" \
            "$DB_DATABASE" \
            < /var/www/docker/db/init/001_base.sql
    fi
else
    echo "Schema já existe, pulando init SQL."
fi

# ==============================
# 🌱 SEED (RODA 1 VEZ)
# ==============================
sleep 5

echo "🌱 SEED (RODA 1 VEZ)"

mysql -h"$DB_HOST" \
    -u"$DB_USERNAME" \
    -p"$DB_PASSWORD" \
    -P "$DB_PORT" \
    "$DB_DATABASE" <<EOF
CREATE TABLE IF NOT EXISTS seed_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    seed_name VARCHAR(100) UNIQUE,
    executed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
EOF

SEED_ALREADY_RUN=$(mysql -h"$DB_HOST" \
    -u"$DB_USERNAME" \
    -p"$DB_PASSWORD" \
    -P "$DB_PORT" \
    "$DB_DATABASE" \
    -se "SELECT seed_name FROM seed_log WHERE seed_name='001_seed' LIMIT 1;")

if [ -z "$SEED_ALREADY_RUN" ]; then
    echo "Executando seed..."

    if [ -f /var/www/docker/db/seeds/001_seed.sql ]; then

        if mysql -h"$DB_HOST" \
            -u"$DB_USERNAME" \
            -p"$DB_PASSWORD" \
            -P "$DB_PORT" \
            "$DB_DATABASE" < /var/www/docker/db/seeds/001_seed.sql
        then
            echo "Seed OK, registrando..."

            mysql -h"$DB_HOST" \
                -u"$DB_USERNAME" \
                -p"$DB_PASSWORD" \
                -P "$DB_PORT" \
                "$DB_DATABASE" \
                -e "INSERT INTO seed_log (seed_name) VALUES ('001_seed');"
        else
            echo "❌ SEED FALHOU"
            exit 1
        fi

    else
        echo "❌ arquivo seed não encontrado"
    fi
else
    echo "Seed já executado"
fi

# ==============================
# ⚙️ MIGRATIONS
# ==============================
echo "Executando migrations..."
php vendor/bin/phinx migrate -e development || true

# ==============================
# 🚀 PHP-FPM
# ==============================
echo "Iniciando PHP-FPM..."
exec php-fpm -F
