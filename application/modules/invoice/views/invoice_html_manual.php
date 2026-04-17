<style>
.panel-body {
    padding: 0 !important;
}
.row {
    margin-right: 0 !important;
    margin-left: 0 !important;
}
.col-sm-12, .col-sm-4 {
    padding-right: 0 !important;
    padding-left: 0 !important;
}
table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    padding: 0 !important;
} 

@media print {

.panel-body {
    padding: 0 !important;
}
.row {
    margin-right: 0 !important;
    margin-left: 0 !important;
}
.col-sm-12, .col-sm-4 {
    padding-right: 0 !important;
    padding-left: 0 !important;
}
table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    padding: 0 !important;
} 

.col-sm-1, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6,
.col-sm-7, .col-sm-8, .col-sm-9, .col-sm-10, .col-sm-11, .col-sm-12 {
float: left;               
}
.col-sm-4{
  float: right;    
}
.text-center{
text-align: center;
}
.text-left{
text-align: left;
}
.text-right{
text-align: right;
}
.col-sm-12 {
width: 100%;
}

.col-sm-11 {
width: 91.66666666666666%;
}

.col-sm-10 {
width: 83.33333333333334%;
}

.col-sm-9 {
width: 75%;
}
.col-sm-8 {
width: 66.66666666666666%;
}



.col-sm-7 {
width: 58.333333333333336%;
}

.col-sm-6 {
width: 50%;
}

.col-sm-5 {
width: 41.66666666666667%;
}

.col-sm-4 {
width: 33.33333333333333%;
}

.col-sm-3 {
width: 25%;
}

.col-sm-2 {
width: 16.666666666666664%;
}

.col-sm-1 {
width: 8.333333333333332%;
}  

.invoicefooter-content{
float: left !impotant;
}
.inline-block{
float: right !impotant;
}   

.table {
    width: 100%;
    max-width: 100%;
    margin-bottom: 20px;

    margin-right: -15px !important;
    margin-left: -15px !important;
}
table {
    background-color: transparent;
}
table {
    border-spacing: 0;
    border-collapse: collapse;
}  

table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    padding: 0 !important;
    border-top: 1px solid #e4e5e7;
} 

.c_name {
    font-size: 20px;
}
b, strong {
    font-weight: 700;
}
address {
    margin-bottom: 20px;
    font-style: normal;
    line-height: 1.42857143;
}  
}
.print_header {
border-bottom: 2px #333 solid;
}
</style>
<div id="invoice-html-manual" class="row p-0">
<div class="col-sm-12">
<div class="panel panel-bd">
    <div id="printableArea" onload="printDiv('printableArea')">
        <div class="panel-body">
            <div class="row print_header">
                <div style="display: flex;">
                    <div style="width: 50%;">
                        <?php foreach($company_info as $company){?>
                        <img src="https://liderlux.com.br/sistema/assets/img/icons/2025-04-08/eb3927bb03438157752d46deabfade0d.png" class="img-bottom-m" alt=""> 
                        <br>
                        <span class="label label-success-outline m-r-15 p-10" ><?php echo display('billing_from') ?></span>
                        <address class="margin-top10">
                            <strong class="company_name_p"><?php echo $company['company_name']?></strong><br>
                            <?php echo $company['address']?><br>
                            <abbr><b><?php echo display('phone') ?>:</b></abbr> <?php echo $company['mobile']?><br>
                            <abbr><b><?php echo display('email') ?>:</b></abbr> 
                            <?php echo $company['email']?><br>
                            <abbr><b><?php echo display('website') ?>:</b></abbr> <br>
                            <?php echo $company['website']?><br>
                          <?php }?>
                            <?php if ($tax_regno) { ?>
                             <abbr><?php echo $tax_regno?></abbr><br>
                          <?php }?>
                            <abbr><b><?php echo display('seller') ?>:</b> <span class="label label-warning-outline p-5"><?php echo $seller;?></span></abbr>
                        </address>
                       
                      
    
                    </div>
                    
                    <?php
                        // Converte o código do método de pagamento em texto
                        $payment_methods = [
                            1 => 'Pagamento em dinheiro',
                            2 => 'Pagamento bancário',
                            3 => 'Pagamento por depósito',
                            4 => 'Pagamento por boleto',
                            5 => 'Pagamento por cheque',
                            6 => 'Pagamento por PIX',
                            7 => 'Pagamento por vale para descontar'
                        ];
                        
                        // Evita erro caso $paytype não exista
                        $payment_text = isset($payment_methods[$paytype]) ? $payment_methods[$paytype] : null;
                    ?>
                    <div style="width: 50%;">
                        <h3 class="m-t-0"><?php echo display('invoice') ?></h3>
                        <div><?php echo display('invoice_no') ?>: <?php echo $invoice_no?></div>
                        <?php if (!empty($paytype) && empty($boleto_due_date)) { ?>
                            <div class="m-t-0">Método de Pagamento: <span class="label label-warning-outline p-5"><?php echo $paytype; ?></span></div>
                        <?php } else if (!empty($paytype)) { ?>
                            <div class="m-t-0">Método de Pagamento: <?php echo $paytype; ?></div>
                        <?php } ?>
                        <?php if (!empty($boleto_due_date)) { ?>
                            <div class="m-b-10">Data de Vencimento do Boleto: <span class="label label-warning-outline p-5"><?php echo $boleto_due_date;?></span></div>
                        <?php } ?>
                        <div class="m-b-10"><?php echo display('billing_date') ?>: <?php echo date("d-M-Y",strtotime($final_date));?></div>
    
                        <span class="label label-success-outline m-r-15"><?php echo display('billing_to') ?></span>
    
                        <address class="customer_name_p m-b-10" style="width: 100%;">  
                            <strong class="c_name"><?php echo $customer_name?> </strong><br>
                            <?php if ($customer_address) { ?>
                                <div><?php echo $customer_address;?></div>
                            <?php } ?>
                            <?php if ($customer_address_zip) { ?>
                                <div class="m-b-10"><?php echo $customer_address_zip;?></div>
                            <?php } ?>
                            <abbr><b><?php echo display('phone') ?>:</b></abbr>
                            <?php if ($customer_mobile) { ?>
                                <?php echo $customer_mobile;?><br>
                            <?php }if ($customer_email) {
                                ?>
                                <abbr><b><?php echo display('email') ?>:</b></abbr> 
                                <?php echo $customer_email;?>
                            <?php } ?>
                            <abbr><b><?php echo display('customer_cod') ?>:</b> <?php echo $customer_code;?></abbr><br>
                            <abbr><b><?php echo display('cpf_cnpj') ?>:</b> <?php echo $customer_document;?></abbr>
                        </address>
                    </div>
                </div>
            </div> 

            <div class="table-responsive" id="product_infodiv">
                <div class="col-sm-12 col-md-12 col-xs-12 p-0">
                <table class="table print-invoice table-striped" border="0" width="100%">
                    <thead>
                         <tr>
                            <th class="text-center"><?php echo display('sl') ?></th>
                            <th class="text-center"><?php echo display('product_name') ?></th>
                              <th class="text-center"><?php if($is_unit !=0){ echo display('unit');
                              }?></th>
                            <th class="text-center"><?php if($is_desc !=0){ echo display('item_description');} ?></th>
                            <th class="text-center"><?php if($is_serial !=0){ echo display('serial_no');} ?></th>
                            <th class="text-right"><?php echo display('quantity') ?></th>
                            <th class="text-right"><?php echo display('rate') ?></th>
                            <?php if($is_discount > 0){ ?>
                            <?php if ($discount_type == 1) { ?>
                                <th class="text-right"><?php echo display('discount_percentage') ?></th>
                            <?php } elseif ($discount_type == 2) { ?>
                                <th class="text-right"><?php echo display('discount') ?> </th>
                            <?php } elseif ($discount_type == 3) { ?>
                                <th class="text-right"><?php echo display('fixed_dis') ?> </th>
                            <?php } ?>
                        <?php }else{ ?>
                           <th class="text-right"><?php echo ''; ?> </th>
                              <?php }?>
                            <th class="text-right"><?php echo display('ammount') ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($invoice_all_data as $details){?>
                        <!-- <?php echo $discount_type ?? 'vazio'; echo "Teste " . $details['discount']; ?> -->
                        <tr>
                            <td class="text-center"><?php echo $details['sl']?></td>
                            <td class="text-center"><div><?php echo $details['product_name']?></div></td>
                              <td class="text-center"><div><?php echo $details['unit']?></div></td>
                            <td align="center"><?php echo $details['description']?></td>
                            <!--<td align="center"><?php echo $details['product_id']?></td>-->
                            <td align="center"><?php echo $details['serial_no']?></td>
                            <td align="right"><?php echo $details['quantity'] ?></td>
                            <td align="right"><?php echo (($position == 0) ? $currency.' '.number_format($details['rate'],2,',','.') : $details['rate'].' '. $currency) ?></td>

                            <?php if ($discount_type == 1) { ?>
                                <td align="right"><?php echo $currency.' '.$details['discount']?> (<?php echo $details['discount_per']?>%)</td>
                            <?php } else { ?>
                                <td align="right"><?php echo (($position == 0) ? $currency.' '.$details['discount_per'] : $details['discount_per'].' '. $currency) ?></td>
                            <?php } ?>

                            <td align="right"><?php echo (($position == 0) ? $currency.' '.number_format($details['total_price'],2,',','.') : $details['total_price'].' '. $currency) ?></td>
                        </tr>
                        <?php }?>
                        <tr>
                            <td class="text-left" colspan="5"><b><?php echo display('total') ?>:</b></td>
                            <td align="right" ><b><?php echo $subTotal_quantity ?></b></td>
                            <td></td>
                            <td></td>
                            
                        <?php
                            $total_discount_item = 0;

                            foreach($invoice_all_data as $details){
                                if ($discount_type == 1) {
                                    $item_discount = $details['discount'];
                                } else {
                                    $item_discount = ($details['rate'] * $details['quantity']) * ($details['discount_per']/100);
                                }

                                $total_discount_item += $item_discount;
                            }
                            
                            
                            $total_calc = $invoice_all_data[0]['total_amount'] + $invoice_all_data[0]['total_discount'] + $total_discount_item;
                            $total = number_format($total_calc, 2, ',', '.');
                            
                            $total_discount = $invoice_all_data[0]['total_discount'] + $total_discount_item;
                        ?>
                            <td align="right" ><b>
                                <?php // echo (($position == 0) ? $currency.' '.$subTotal_ammount  : $subTotal_ammount.' '. $currency) ?>
                                <?php echo html_escape((($position == 0) ? $currency.' '.$total : $total.' '. $currency)) ?>
                            </b></td>
                        </tr>
                    </tbody>

                </table>
            </div>
            </div>
               <div class="row">

                <div class="col-sm-8 invoicefooter-content">

                    <p></p>
                    <p><strong><?php echo nl2br(htmlspecialchars($observation, ENT_QUOTES)); ?></strong></p> 
                   
                </div>
                <div class="col-sm-4 inline-block right">

                    <table class="table print-invoice">
                        <tr>
                            <th class="text-left grand_total"><?php echo 'Valor Total' ?> :</th>
                            <td class="text-right grand_total"><?php echo html_escape((($position == 0) ? $currency.' '.$total : $total.' '. $currency)) ?></td>
                            <!-- <td class="text-right grand_total"><?php echo html_escape((($position == 0) ? $currency.' '.$subTotal_ammount  : $subTotal_ammount.' '. $currency)) ?></td> -->
                        </tr>
                        <?php
                        if ($total_discount != 0) {
                            ?>
                            <tr>
                                <th class="border-bottom-top"><span class="label label-warning-outline p-5"><?php echo display('total_discount') ?> : </span></th>
                                <td class="text-right border-bottom-top"><span class="label label-warning-outline p-5"><?php echo html_escape((($position == 0) ? $currency.' '.number_format($total_discount,2,',','.')  : number_format($total_discount,2,',','.').' '. $currency)) ?> </span></td>
                            </tr>
                            <?php
                        }
                        if ($invoice_all_data[0]['total_tax'] != 0) {
                            ?>
                            <tr>
                                <th class="text-left border-bottom-top"><?php echo display('tax') ?> : </th>
                                <td  class="text-right border-bottom-top"><?php echo html_escape((($position == 0) ? $currency.' '.$total_tax : $total_tax.' '. $currency)) ?> </td>
                            </tr>
                        <?php } ?>
                         <?php if ($invoice_all_data[0]['shipping_cost'] != 0) {
                            ?>
                            <tr>
                                <th class="text-left border-bottom-top"><?php echo 'Custo de envio' ?> : </th>
                                <td class="text-right border-bottom-top"><?php echo html_escape((($position == 0) ? $currency.' '.$shipping_cost: $shipping_cost.' '. $currency)) ?> </td>
                            </tr>
                        <?php } ?>
                        <!-- <tr>
                            <th class="text-left grand_total"><?php echo display('previous'); ?> :</th>
                            <td class="text-right grand_total"><?php echo html_escape((($position == 0) ? $currency.' '.$previous  :$previous.' '. $currency)) ?></td>
                        </tr> -->
                        <tr>
                            <th class="text-left grand_total"><?php echo 'Valor Final' ?> :</th>
                            <td class="text-right grand_total"><?php echo html_escape((($position == 0) ? $currency.' '.$total_amount : $total_amount.' '. $currency)) ?></td>
                            <!-- <td class="text-right grand_total"><?php echo html_escape((($position == 0) ? $currency.' '.$subTotal_ammount  : $subTotal_ammount.' '. $currency)) ?></td> -->
                        </tr>
                        <!-- <tr>
                            <th class="text-left grand_total border-bottom-top"><?php echo display('paid_ammount') ?> : </th>
                            <td class="text-right grand_total border-bottom-top"><?php echo html_escape((($position == 0) ? $currency.' '.$paid_amount : $paid_amount.' '. $currency)) ?></td>
                        </tr> -->
                        <!-- <?php
                        if ($invoice_all_data[0]['due_amount'] != 0) {
                            ?>
                            <tr>
                                <th class="text-left grand_total"><?php echo display('due') ?> : </th>
                                <td  class="text-right grand_total"><?php echo html_escape((($position == 0) ? $currency.' '.$subTotal_ammount  : $subTotal_ammount.' '. $currency)) ?></td>
                            </tr>
                            <?php
                        }
                        ?> -->
                    </table>

                   

                </div>
            </div>
            <div class="row margin-top50">
                <div class="col-sm-4">
                 <div class="inv-footer-left">
                        <?php echo display('received_by') ?>
                    </div>
                </div>
               <div class="col-sm-4"></div>
                     <div class="col-sm-4"> <div class="inv-footer-right">
                        <?php echo display('authorised_by') ?>
                    </div></div>
            </div>
           
        </div>
    </div>
    
    <!--
    <?php print_r($invoice_all_data); ?>
    -->

   
</div>
</div>
</div>
<a class="btn btn-info" href="#" onclick="printDiv('printableArea')"><span class="fa fa-print"></span></a>
<a href="<?php echo $base_url.'invoice_edit/'.$invoice_all_data[0]['invoice_id']; ?>" class="btn btn-primary"><i class="fa fa-undo" aria-hidden="true"></i> Voltar ao pedido</a>
</div>