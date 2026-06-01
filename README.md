## 🧑‍💻 Liderlux - Ambiente de Desenvolvimento (Docker)

#### 🚀 Subir o ambiente
		docker compose -f compose/docker-compose.local.yml up -d --build

#### ⛔ Parar o ambiente
		docker compose -f compose/docker-compose.local.yml down

#### 🔄 Rebuild completo
		docker compose -f compose/docker-compose.local.yml down
		docker compose -f compose/docker-compose.local.yml up -d --build

#### 📦 Acessar container da aplicação
		docker exec -it liderlux_app_local sh

#### 🧪 Verificar PHP
		php -v
		php -i | grep opcache
		php -i | grep "Loaded Configuration File"

#### ⚡ Teste rápido de execução PHP
		php -r "echo 'OK';"

#### 🧹 Limpar Docker (opcional)
		docker system prune -f

#### 🗄️ Acessar banco de dados
		docker exec -it liderlux_db_local mysql -u liderlux_user -p

#### Senha:
		password

#### 🌐 Acessar aplicação
		http://localhost:8085

#### ⚙️ Estrutura Docker
		compose/docker-compose.local.yml
		docker/php/Dockerfile
		docker/php/php.ini
		docker/php/conf.d/opcache-local.ini
		docker/nginx/local.conf

#### ⚡ OpCache (DEV)
		opcache.enable=1
		opcache.enable_cli=1

		opcache.validate_timestamps=1
		opcache.revalidate_freq=0

		opcache.memory_consumption=128
		opcache.max_accelerated_files=10000

		opcache.save_comments=1

#### 🔥 Logs (debug)
		docker logs liderlux_app_local

#### 🔄 Reset completo do ambiente
		docker compose -f compose/docker-compose.local.yml down -v
		docker compose -f compose/docker-compose.local.yml up -d --build

#### 📌 Reiniciar PHP rápido
		docker restart liderlux_app_local