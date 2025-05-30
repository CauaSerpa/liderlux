# 🚀 Instalação do PDV - LíderLux

- 📦 Requisitos
- PHP 7.4 ou superior
- Composer
- MySQL (recomendado usar Docker + MySQL ou MySQL Workbench)
- Servidor Apache (recomendado XAMPP, WAMP, Laragon ou similar)

## 🛠️ Passos para Instalação

### 1. Clone o repositório
No terminal, execute:

```
git clone https://github.com/techsofthash/LiderLux.git
```

### 2. Instale as dependências PHP
Execute na pasta do projeto:

```
composer install
```

### 3. Configure o banco de dados
Crie um schema no MySQL (nome sugerido: liderlux).

Acesse a pasta `/liderlux/bd/`.

Importe o arquivo `liderlux.sql` para seu banco.

### 💡 Dica: Recomendamos utilizar Docker com a imagem do MySQL e gerenciar pelo MySQL Workbench.

### 4. Configure as credenciais do banco
No arquivo /liderlux/application/config/database.php, ajuste suas credenciais:

```
$db['default'] = array(
    'hostname' => '127.0.0.1',
    'username' => 'root',
    'password' => 'root',
    'database' => 'liderlux',
    ...
);
```

### 5. Inicie o servidor Apache
🔥 Recomendado: `XAMPP` ou servidor equivalente.

Coloque a pasta LiderLux dentro do diretório htdocs (XAMPP) ou equivalente do seu ambiente.

6️⃣ Acesse a aplicação
No navegador, acesse:

arduino
Copy
Edit
http://localhost/LiderLux
Se tudo estiver correto, o sistema LíderLux PDV estará funcionando.

⚙️ Suporte
Em caso de dúvidas ou problemas, entre em contato com o time de desenvolvimento.
