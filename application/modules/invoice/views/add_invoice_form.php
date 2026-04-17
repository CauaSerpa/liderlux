<!-- Invoice js -->
<script src="<?php echo base_url('my-assets/js/admin_js/invoice.js?v=') . time(); ?>" type="text/javascript"></script>
       
    <style>
        @media (max-width: 500px) {
            .panel-heading {
                display: inline-block;
            }
            .panel-heading .panel-title .padding-lefttitle {
                margin-top: 8px;
            }
            
            #customer_name_container .col-sm-6 {
                width: 80%;
                float: left;
                padding-right: 0px;
                padding-left: 15px;
            }
            #customer_name_container .col-sm-3:not(.col-form-label) {
                width: 20%;
                float: left;
                padding-right: 15px;
                padding-left: 0px;
            }
        }
    </style>


        <!--Add Invoice -->
        <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-bd lobidrag">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <span><?php echo display('new_invoice') ?></span>
                           <span class="padding-lefttitle">            
       <?php if($this->permission1->method('manage_invoice','read')->access()){ ?>
                    <a href="<?php echo base_url('invoice_list') ?>" class="btn btn-info m-b-5 m-r-2"><i class="ti-align-justify"> </i> <?php echo display('manage_invoice') ?> </a>
                    <?php }?>
         <?php if($this->permission1->method('pos_invoice','create')->access()){ ?>
                    <a href="<?php echo base_url('gui_pos') ?>" class="btn btn-primary m-b-5 m-r-2"><i class="ti-align-justify"> </i>  <?php echo display('pos_invoice') ?> </a>
                <?php }?></span>
                        </div>
                    </div>
                 
                    <div class="panel-body">
                        <?php echo form_open_multipart('invoice/invoice/bdtask_manual_sales_insert',array('class' => 'form-vertical', 'id' => 'insert_sale', 'name' => 'insert_sale'))?>
                        <div class="row">

                            <div class="col-sm-6" id="payment_from_1">
                                <div class="form-group row" id="customer_name_container">
                                    <label for="customer_name" class="col-sm-3 col-form-label"><?php
                                        echo display('customer_name').'/'.display('phone');
                                        ?> <i class="text-danger">*</i></label>
                                    <div class="col-sm-6">
                                        <input type="text" size="100"  name="customer_name" class=" form-control" placeholder='<?php echo display('customer_name').'/'.display('phone') ?>' id="customer_name" onclick="customer_autocomplete()" onkeyup="customer_autocomplete()" value="<?php echo $customer_name?>"/>

                                        <input id="autocomplete_customer_id" class="customer_hidden_value abc" type="hidden" name="customer_id" value="<?php echo $customer_id?>">
                            
                                        <p id="customer_document" style="margin-top: 10px;"></p>
                                        <p id="customer_address"></p>
                                    </div>
                                     <?php if($this->permission1->method('add_customer','create')->access()){ ?>
                                    <div  class=" col-sm-3">
                                         <a href="#" class="client-add-btn btn btn-success" aria-hidden="true" data-toggle="modal" data-target="#cust_info"><i class="ti-plus m-r-2"></i></a>
                                    </div>
                                <?php } ?>
                                </div>
                            </div>

                          
                           <div class="col-sm-6">
                                <div class="form-group row">
                                    <label for="product_table" class="col-sm-3 col-form-label">
                                        <?php echo display('table'); ?> <i class="text-danger">*</i>
                                    </label>
                                    <div class="col-sm-6">
                                        <select name="product_table" id="product_table" class="form-control" required>
                                            <option value="SP" selected>SP</option>
                                            <option value="RJ">RJ</option>
                                            <option value="BR">BR</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                          
                           <div class="col-sm-6" id="payment_from">
                                <div class="form-group row">
                                    <label for="payment_type" class="col-sm-3 col-form-label">
                                        <?php echo display('payment_type'); ?> <i class="text-danger">*</i>
                                    </label>
                                    <div class="col-sm-6">
                                        <select name="paytype" class="form-control" required="" onchange="toggleBoletoField(this.value)">
                                            <option value="1"><?php echo display('cash_payment'); ?></option>
                                            <!--<option value="2"><?php echo display('bank_payment'); ?></option> -->
                                            <option value="3"><?php echo display('deposit_payment'); ?></option>
                                            <option value="4"><?php echo display('bill_payment'); ?></option> <!-- Boleto -->
                                            <option value="5"><?php echo display('check_payment'); ?></option>
                                            <option value="6"><?php echo display('pix_payment'); ?></option>
                                            <option value="7"><?php echo display('voucher_payment'); ?></option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            
                            <div id="boleto_vencimento" style="display:none;">
                                <div class="col-sm-6"></div>
                                <div class="col-sm-6">
                                    <div class="form-group row">
                                        <label for="boleto_due_date" class="col-sm-3 col-form-label">
                                            Data de Vencimento do Boleto <i class="text-danger">*</i>
                                        </label>
                                        <div class="col-sm-6">
                                            <input type="text" name="boleto_due_date" id="boleto_due_date" class="form-control" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <script>
                                function toggleBoletoField(paymentType) {
                                    const boletoField = document.getElementById("boleto_vencimento");
                            
                                    if (paymentType === "4") {
                                        boletoField.style.display = "block";
                                        boletoField.querySelector("input").required = true;
                                    } else {
                                        boletoField.style.display = "none";
                                        boletoField.querySelector("input").required = false;
                                    }
                                }
                            </script>
                        </div>
                        
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group row">
                                    <label for="delivery_location" class="col-sm-3 col-form-label"><?php echo display('delivery_location') ?></label>
                                    <div class="col-sm-6">
                                        <input class="form-control" type="text" id="delivery_location" name="delivery_location" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                 <div class="form-group row">
                                <label for="expected_delivery_time" class="col-sm-3 col-form-label"><?php echo display('expected_delivery_time') ?></label>
                                    <div class="col-sm-6">
                                         <input class="form-control" type="time"  name="expected_delivery_time" id="expected_delivery_time" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group row">
                                    <label for="invoice_seller" class="col-sm-3 col-form-label"><?php echo display('seller') ?></label>
                                    <div class="col-sm-6">
                                        <input type="text" name="invoice_seller" class="form-control" id="invoice_seller" oninput="seller_autocomplete()" value="<?php echo $this->session->userdata('fullname') ?>" autocomplete="name" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-sm-6">
                                <div class="form-group row">
                                    <label for="date" class="col-sm-3 col-form-label"><?php echo display('date') ?> <i class="text-danger">*</i></label>
                                    <div class="col-sm-6">
                                        <?php
                               
                                        $date = date('Y-m-d');
                                        ?>
                                        <input class="datepicker form-control" type="text" size="50" name="invoice_date" id="date" required value="<?php echo html_escape($date); ?>" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                 <div class="form-group row">
                                <label for="invoice_no" class="col-sm-3 col-form-label"><?php
                                    echo display('invoice_no');
                                    ?> <i class="text-danger">*</i></label>
                                    <div class="col-sm-6">
                                         <input class="form-control" type="text"  name="invoice_no" id="invoice_no" required value="<?php echo html_escape($invoice_no); ?>" readonly/>
                                    </div>
                            </div>
                        </div>
                        
                                  <div class="col-sm-6" id="bank_div">
                            <div class="form-group row">
                                <label for="bank" class="col-sm-3 col-form-label"><?php
                                    echo display('bank');
                                    ?> <i class="text-danger">*</i></label>
                                <div class="col-sm-6">
                                   <select name="bank_id" class="form-control bankpayment"  id="bank_id">
                                        <option value="">Select Location</option>
                                        <?php foreach($bank_list as $bank){?>
                                            <option value="<?php echo html_escape($bank['bank_id'])?>"><?php echo html_escape($bank['bank_name']);?></option>
                                        <?php }?>
                                    </select>
                                 
                                </div>
                             
                            </div>
                        </div>
                        </div>
                        <br>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover" id="normalinvoice">
                                <thead>
                                    <tr>
                                        <th class="text-center product_field"><?php echo display('item_information') ?> <i class="text-danger">*</i></th>
                                        <th class="text-center"><?php echo display('item_description')?></th>
                                         <th class="text-center"><?php echo display('serial_no')?></th>
                                        <th class="text-center"><?php echo display('available_qnty') ?></th>
                                        <th class="text-center"><?php echo display('unit') ?></th>
                                        <th class="text-center">Quantidade <i class="text-danger">*</i></th>
                                        <th class="text-center"><?php echo display('rate') ?> <i class="text-danger">*</i></th>

                                        <?php if ($discount_type == 1) { ?>
                                            <th class="text-center invoice_fields"><?php echo display('discount_percentage') ?> %</th>
                                        <?php } elseif ($discount_type == 2) { ?>
                                            <th class="text-center invoice_fields"><?php echo display('discount') ?> </th>
                                        <?php } elseif ($discount_type == 3) { ?>
                                            <th class="text-center invoice_fields"><?php echo display('fixed_dis') ?> </th>
                                        <?php } ?>

                                        <th class="text-center invoice_fields"><?php echo display('total') ?> 
                                        </th>
                                        <th class="text-center"><?php echo display('action') ?></th>
                                    </tr>
                                </thead>
                                <tbody id="addinvoiceItem">
                                    <tr>
                                        <td class="product_field">
                                            <input type="text" required name="product_name" oninput="invoice_productList(1)" id="product_name_1" class="form-control productSelection" placeholder="<?php echo display('product_name') ?>">

                                            <input type="hidden" class="autocomplete_hidden_value product_id_1" name="product_id[]" id="SchoolHiddenId"/>

                                            <input type="hidden" class="baseUrl" value="<?php echo base_url(); ?>" />
                                        </td>
                                          <td>
                                            <input type="text" name="desc[]" class="form-control text-right" />
                                        </td>
                                        <td  class="invoice_fields">
                                             <select class="form-control" id="serial_no_1" name="serial_no[]" disabled>
                                                <option></option>
                                            </select>
                                        </td>
                                        <td>
                                            <input type="text" name="available_quantity[]" class="form-control text-right available_quantity_1" value="0" readonly="" />
                                        </td>
                                        <td>
                                            <input name="" id="" class="form-control text-right unit_1 valid" value="None" readonly="" aria-invalid="false" type="text">
                                        </td>
                                        <td>
                                            <input type="text" name="product_quantity[]" required="" oninput="bdtask_invoice_quantity_calculate(1);" class="total_qntt_1 form-control text-right reindex_qnt" id="total_qntt_1" placeholder="0.00" min="0" value="1" />
                                        </td>
                                        <td class="invoice_fields">
                                            <input type="text" name="product_rate[]" id="price_item_1" class="price_item1 price_item price_rate form-control text-right reindex_rate" required="" oninput="bdtask_invoice_quantity_calculate(1);" placeholder="0.00" min="0" />
                                        </td>
                                        <!-- Discount -->
                                        <td>
                                            <input type="text" name="discount[]" oninput="bdtask_invoice_quantity_calculate(1);" id="discount_1" class="form-control text-right reindex_discount" placeholder="0.00"/>
                                            <input type="hidden" value="<?php echo $discount_type?>" name="discount_type" id="discount_type_1">

                                        </td>


                                        <td class="invoice_fields">
                                            <input class="total_price form-control text-right reindex_total_price" type="text" name="total_price[]" id="total_price_1" value="0.00" readonly="readonly" />
                                        </td>

                                        <td>
                                            <!-- Tax calculate start-->
                                            <?php $x=0;
                                     foreach($taxes as $taxfldt){?>
                                            <input id="total_tax<?php echo $x;?>_1" class="total_tax<?php echo $x;?>_1" type="hidden">
                                            <input id="all_tax<?php echo $x;?>_1" class="total_tax<?php echo $x;?>" type="hidden" name="tax[]">
                                           
                                            <!-- Tax calculate end-->

                                            <!-- Discount calculate start-->
                                           
                                            <?php $x++;} ?>
                                            <!-- Tax calculate end-->

                                            <!-- Discount calculate start-->
                                            <input type="hidden" id="total_discount_1" class="" />
                                            <input type="hidden" id="all_discount_1" class="total_discount dppr" name="discount_amount[]" />
                                            <!-- Discount calculate end -->

                                         <button  class='btn btn-danger text-right' type='button' value='Delete' onclick='deleteRow_invoice(this)'><i class='fa fa-close'></i></button>
                                        </td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="7" rowspan="2">
                                            <center><label  for="observation" class="  col-form-label text-center"><?php echo display('observation') ?></label></center>
                                            <textarea name="observation" id="observation" class="form-control" placeholder="<?php echo display('observation') ?>" tabindex="-1"></textarea>
                                        </td>
                                        <td class="text-right" colspan="1"><b>Tipo de Desconto:</b></td>
                                        <td class="text-right">
                                            <select id="discount_mode" name="discount_mode" class="form-control" onchange="bdtask_invoice_quantity_calculate(1);" tabindex="-1">
                                                <option value="percent">Porcentagem (%)</option>
                                                <option value="fixed">Valor Fixo</option>
                                            </select>
                                        </td>
                                        <td><a href="javascript:void(0)" id="add_invoice_item" class="btn btn-info" name="add-invoice-item" onClick="addInputField_invoice('addinvoiceItem');"><i class="fa fa-plus"></i></a></td>
                                    </tr>
                                    <tr>
                                        <td class="text-right" colspan="1"><b><?php echo display('invoice_discount') ?>:</b></td>
                                        <td class="text-right">
                                            <input type="text" oninput="bdtask_invoice_quantity_calculate(1);" id="invoice_discount" class="form-control text-right total_discount" name="invoice_discount" placeholder="0.00" />
                                            <input type="hidden" id="txfieldnum">
                                        </td>
                                    </tr>
                                <tr>
                                    <td class="text-right" colspan="8"><b><?php echo display('total_discount') ?>:</b></td>
                                    <td class="text-right">
                                        <input type="text" id="total_discount_ammount" class="form-control text-right" name="total_discount" value="0.00" readonly="readonly" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-right" colspan="8"><b>Desconto total (%):</b></td>
                                    <td class="text-right">
                                        <input type="text" id="total_discount_percent" class="form-control text-right" name="total_discount_percent" value="0.00" readonly="readonly" />
                                    </td>
                                </tr>
                                    <?php $x=0;
                                     foreach($taxes as $taxfldt){?>
                                    <tr class="hideableRow hiddenRow">
                                       
                                <td class="text-right" colspan="8"><b><?php echo html_escape($taxfldt['tax_name']) ?></b></td>
                                <td class="text-right">
                                    <input id="total_tax_ammount<?php echo $x;?>" tabindex="-1" class="form-control text-right valid totalTax" name="total_tax<?php echo $x;?>" value="0.00" readonly="readonly" aria-invalid="false" type="text">
                                </td>
                                </tr>
                            <?php $x++;}?>
                                 
                    <tr>
                                    <tr>
                                <td class="text-right" colspan="8"><b><?php echo display('total_tax') ?>:</b></td>
                                <td class="text-right">
                                    <input id="total_tax_amount" tabindex="-1" class="form-control text-right valid" name="total_tax" value="0.00" readonly="readonly" aria-invalid="false" type="text">
                                </td>
                                 <td><button type="button" class="toggle btn-warning">
                <i class="fa fa-angle-double-down"></i>
              </button></td>
                                </tr>
                               
                                 <tr>
                                    <td class="text-right" colspan="8"><b><?php echo display('shipping_cost') ?>:</b></td>
                                    <td class="text-right">
                                        <input type="text" id="shipping_cost" class="form-control text-right" name="shipping_cost" oninput="bdtask_invoice_quantity_calculate(1);"  placeholder="0.00" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="8"  class="text-right"><b><?php echo display('grand_total') ?>:</b></td>
                                    <td class="text-right">
                                        <input type="text" id="grandTotal" class="form-control text-right" name="grand_total_price" value="0.00" readonly="readonly" />
                                    </td>
                                </tr>
                                 <tr>
                                    <td colspan="8"  class="text-right"><b><?php echo display('previous'); ?>:</b></td>
                                    <td class="text-right">
                                        <input type="text" id="previous" class="form-control text-right" name="previous" value="0.00" readonly="readonly" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="8"  class="text-right"><b><?php echo display('net_total'); ?>:</b></td>
                                    <td class="text-right">
                                        <input type="text" id="n_total" class="form-control text-right" name="n_total" value="0" readonly="readonly" placeholder="" />
                                    </td>
                                </tr>
                                <tr>
                                    
                                    <td class="text-right" colspan="8"><b><?php echo display('paid_ammount') ?>:</b></td>
                                    <td class="text-right">
                                         <input type="hidden" name="baseUrl" class="baseUrl" value="<?php echo base_url(); ?>"/>
                                        <input type="text" id="paidAmount" 
                                               onkeyup="invoice_paidamount();" class="form-control text-right" name="paid_amount" placeholder="0.00" value=""/>
                                    </td>
                                </tr>
                                <tr>
                                   

                                    <td class="text-right" colspan="8"><b><?php echo display('due') ?>:</b></td>
                                    <td class="text-right">
                                        <input type="text" id="dueAmmount" class="form-control text-right" name="due_amount" value="0.00" readonly="readonly"/>
                                    </td>
                                </tr>
                                <tr>
                                     <td align="center">
                                        <input type="button" id="full_paid_tab" class="btn btn-warning" value="<?php echo display('full_paid') ?>" onClick="invoicee_full_paid()"/>

                                        <input type="submit" id="add_invoice" class="btn btn-success" name="add-invoice" value="<?php echo display('submit') ?>" />
                                    </td>
                                    <td colspan="7"  class="text-right"><b><?php echo display('change'); ?>:</b></td>
                                    <td class="text-right">
                                        <input type="text" id="change" class="form-control text-right" name="change" value="0" readonly="readonly" placeholder="" />
                                        <input type="hidden" name="is_normal" value="1">
                                    </td>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                               <?php echo form_close()?>
                    </div>
                   
                </div>
            </div>
     
         
        </div>
        <script>
              function printRawHtml(view) {
              printJS({
                printable: view,
                type: 'raw-html',
                
              });

             }
        </script>
        
        <script>
            let formAlterado = false;
        
            // Detecta alterações em todos os campos, EXCETO #product_table
            document.querySelectorAll("#insert_sale input, #insert_sale select, #insert_sale textarea")
                .forEach(el => {
        
                    if (el.id === "product_table") return; // <<< IGNORA esse campo
        
                    el.addEventListener("change", () => formAlterado = true);
                    el.addEventListener("input", () => formAlterado = true);
                });
        
            // Aviso ao tentar sair da página
            window.addEventListener("beforeunload", function (e) {
                if (formAlterado) {
                    e.preventDefault();
                    e.returnValue = "";
                }
            });
        
            // Ao salvar, desativa aviso
            document.getElementById("insert_sale").addEventListener("submit", function () {
                formAlterado = false;
            });
            
            
            
            
            // Regra de desconto
            $(document).on('change', 'select[name="paytype"]', function () {
                const paytype = $(this).val();
            
                // Só aplica se for PIX
                if (paytype != 6) {
                    calculateTotalDiscountPercent();
                    return;
                }
            
                let subtotalBruto = 0;
            
                // Calcula subtotal bruto
                $(".price_rate").each(function () {
                    const id = this.id.split('_').pop();
            
                    const qty   = toNumber($("#total_qntt_" + id).val());
                    const price = toNumber($(this).val());
            
                    subtotalBruto += qty * price;
                });
            
                if (subtotalBruto <= 0) return;
            
                // Percentual atual já calculado
                let currentPercent = toNumber(
                    $("#total_discount_percent").val().replace('%', '')
                );
            
                // Desconto extra PIX
                const pixPercent = 10;
            
                // Novo percentual total
                const newPercent = currentPercent + pixPercent;
            
                // Atualiza modo para percentual
                $("#discount_mode").val('percent').trigger('change');
                $("#invoice_discount").val(newPercent.toFixed(2));
            
                // Recalcula tudo com a regra correta
                calculateTotalDiscountPercent();
            });
        </script>
   


