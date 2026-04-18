<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Carrega o banner de ambiente automaticamente
 */
function load_environment_banner() {
    if (ENVIRONMENT_SHOW_BANNER) {
        $CI =& get_instance();
        $CI->load->view('includes/environment_banner');
    }
}

/**
 * Retorna classe CSS para o body baseado no ambiente
 */
function get_body_environment_class() {
    if (!ENVIRONMENT_SHOW_BANNER) {
        return '';
    }
    return 'env-' . ENVIRONMENT;
}