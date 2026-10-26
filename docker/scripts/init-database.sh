#!/bin/sh
set -eu

: "${DB_HOST:?DB_HOST não definido}"
: "${DB_PORT:?DB_PORT não definido}"
: "${DB_DATABASE:?DB_DATABASE não definido}"
: "${DB_USERNAME:?DB_USERNAME não definido}"
: "${DB_PASSWORD:?DB_PASSWORD não definido}"

MYSQL_CONFIG="$(mktemp)"
trap 'rm -f "$MYSQL_CONFIG"' EXIT HUP INT TERM

chmod 600 "$MYSQL_CONFIG"

cat > "$MYSQL_CONFIG" <<MYSQL_EOF
[client]
host=${DB_HOST}
port=${DB_PORT}
user=${DB_USERNAME}
password=${DB_PASSWORD}
MYSQL_EOF

mysql_exec() {
    mysql --defaults-extra-file="$MYSQL_CONFIG" "$DB_DATABASE" "$@"
}

echo "Aguardando banco..."

until mysql_exec -e "SELECT 1" >/dev/null 2>&1
do
    sleep 2
done

echo "Banco conectado."

SCHEMA_EXISTS=$(
    mysql_exec -Nse "SHOW TABLES LIKE 'acc_coa';"
)

if [ -n "$SCHEMA_EXISTS" ]; then
    echo "ERRO: o banco já possui o schema da aplicação."
    echo "Este script é exclusivo para inicialização de banco novo."
    exit 1
fi

if [ ! -f /var/www/docker/db/init/001_base.sql ]; then
    echo "ERRO: docker/db/init/001_base.sql não encontrado."
    exit 1
fi

if [ ! -f /var/www/docker/db/seeds/001_seed.sql ]; then
    echo "ERRO: docker/db/seeds/001_seed.sql não encontrado."
    exit 1
fi

echo "Inicializando schema..."
mysql_exec < /var/www/docker/db/init/001_base.sql

echo "Executando seed..."
mysql_exec < /var/www/docker/db/seeds/001_seed.sql

echo "Inicialização do banco concluída."
