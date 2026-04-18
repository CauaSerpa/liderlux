<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>

<style>
    .env-banner {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        background: <?= ENVIRONMENT_COLOR ?>;
        color: #000;
        text-align: center;
        padding: 8px;
        z-index: 10000;
        font-family: Arial, sans-serif;
        font-size: 14px;
        font-weight: 500;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        animation: slideDown 0.3s ease;
    }

    .env-banner-content {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 10px;
        flex-wrap: wrap;
    }

    .env-banner-icon {
        font-size: 18px;
    }

    .env-banner-message {
        margin: 0;
    }

    .env-banner-link {
        color: #000;
        background: rgba(255,255,255,0.3);
        padding: 3px 10px;
        border-radius: 4px;
        text-decoration: none;
        font-size: 12px;
        transition: background 0.2s;
    }

    .env-banner-link:hover {
        background: rgba(255,255,255,0.5);
    }

    .env-banner-close {
        background: none;
        border: none;
        color: #000;
        cursor: pointer;
        font-size: 18px;
        padding: 0 5px;
        margin-left: 10px;
        opacity: 0.7;
    }

    .env-banner-close:hover {
        opacity: 1;
    }

    @keyframes slideDown {
        from {
            transform: translateY(-100%);
        }
        to {
            transform: translateY(0);
        }
    }

    /* Ajuste no layout para o banner */
    body.env-homologation,
    body.env-demo,
    body.env-development,
    body.env-testing {
        padding-top: 40px;
    }

    /* Ajustes no layout */
    .env-banner:not(.hide) ~ .main-header {
        top: 40px;
    }
    .env-banner:not(.hide) ~ .main-sidebar {
        padding-top: calc(60px + 40px);
    }
    .env-banner:not(.hide) ~ .content-wrapper {
        padding-top: 40px;
    }

    @media (max-width: 768px) {
        body.env-homologation,
        body.env-demo,
        body.env-development,
        body.env-testing {
            padding-top: 60px;
        }

        .env-banner-content {
            flex-direction: column;
            gap: 5px;
        }

        .container-login .env-banner:not(.hide) ~ .container-center {
            padding-top: 130px !important;
        }
    }
</style>

<div class="env-banner" id="environmentBanner">
    <div class="env-banner-content">
        <span class="env-banner-icon"><?= ENVIRONMENT_ICON ?></span>
        <span class="env-banner-message">
            <strong><?= ENVIRONMENT_NAME ?>:</strong> <?= ENVIRONMENT_MESSAGE ?>
        </span>
        <?php if (!is_production()): ?>
            <a href="https://liderlux.com.br/sistema/" class="env-banner-link">
                Ir para sistema oficial →
            </a>
        <?php endif; ?>
        <button class="env-banner-close" onclick="closeBanner()">×</button>
    </div>
</div>

<script>
    function closeBanner() {
        document.getElementById('environmentBanner').style.display = 'none';
        document.getElementById('environmentBanner').classList.add('hide');
        document.body.classList.remove('env-homologation', 'env-demo', 'env-development', 'env-testing');
        document.body.style.paddingTop = '0';
        // Opcional: salvar preferência
        localStorage.setItem('bannerClosed', 'true');
    }

    // Verificar se usuário já fechou o banner
    if (localStorage.getItem('bannerClosed') === 'true') {
        // document.getElementById('environmentBanner').style.display = 'none';
        // document.getElementById('environmentBanner').classList.add('hide');
        // document.body.style.paddingTop = '0';
    }
</script>