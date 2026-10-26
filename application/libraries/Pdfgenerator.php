<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use Dompdf\Dompdf;

class Pdfgenerator
{
    /**
     * Cria uma nova instância do Dompdf.
     *
     * @return Dompdf
     */
    public function create()
    {
        return new Dompdf();
    }

    /**
     * Gera um PDF diretamente.
     */
    public function generate(
        $html,
        $filename = '',
        $stream = true,
        $paper = 'A4',
        $orientation = 'portrait'
    ) {
        $dompdf = $this->create();

        $dompdf->loadHtml($html);
        $dompdf->setPaper($paper, $orientation);
        $dompdf->render();

        if ($stream) {
            $dompdf->stream(
                $filename . '.pdf',
                ['Attachment' => false]
            );

            return null;
        }

        return $dompdf->output();
    }
}
