<script src="<?php echo base_url('my-assets/js/admin_js/invoice.js?v=') . time(); ?>" type="text/javascript"></script>
<div class="row">
            <div class="col-sm-12">
                <div class="panel panel-bd lobidrag">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h4><?php echo display('invoice_edit') ?></h4>
                        </div>
                    </div>
                    <?php echo form_open('invoice/invoice/bdtask_update_invoice', array('class' => 'form-vertical', 'id' => 'update_invoice')) ?>
                    <div class="panel-body">

                        <div class="row">
                            <div class="col-sm-6" id="payment_from_1">
                                <div class="form-group row">
                                    <label for="product_name" class="col-sm-3 col-form-label"><?php echo display('customer_name').'/'.display('phone') ?> <i class="text-danger">*</i></label>
                                    <div class="col-sm-6">
                                        <input type="text" name="customer_name" value="<?php echo $customer_name?>" oninput="customer_autocomplete()" class="form-control customerSelection" placeholder='<?php echo display('customer_name') ?>' required id="customer_name">

                                        <input type="hidden" class="customer_hidden_value" name="customer_id" value="<?php echo $customer_id;?>" id="autocomplete_customer_id"/>
                            
                                        <p id="customer_document" style="margin-top: 10px;">CNPJ: <?php echo $customer_document?></p>
                                        <p id="customer_address">Endereço: <?php echo $customer_address?></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group row">
                                    <label for="product_table" class="col-sm-3 col-form-label"><?php echo display('table') ?> <i class="text-danger">*</i></label>
                                    <div class="col-sm-6">
                                        <select class="form-control" id="product_table" name="product_table">
                                            <option value="SP" <?php if($table == 'SP'){echo 'selected';}?>>SP</option>
                                            <option value="RJ" <?php if($table == 'RJ'){echo 'selected';}?>>RJ</option>
                                            <option value="BR" <?php if($table == 'BR'){echo 'selected';}?>>BR</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                             <div class="col-sm-6" id="payment_from_1">
                                <div class="form-group row">
                                    <label for="payment_type" class="col-sm-3 col-form-label">
                                        <?php echo display('payment_type'); ?> <i class="text-danger">*</i>
                                    </label>
                                    <div class="col-sm-6">
                                        <select name="paytype" class="form-control" required="" onchange="toggleBoletoFieldEdit(this.value)">
                                            <option value="">Selecione a opção de pagamento</option>
                                            <option value="1" <?php if($paytype == 1){ echo 'selected'; } ?>><?php echo display('cash_payment'); ?></option>
                                            <!--<option value="2" <?php if($paytype == 2){ echo 'selected'; } ?>><?php echo display('bank_payment'); ?></option>-->
                                            <option value="3" <?php if($paytype == 3){ echo 'selected'; } ?>><?php echo display('deposit_payment'); ?></option>
                                            <option value="4" <?php if($paytype == 4){ echo 'selected'; } ?>><?php echo display('bill_payment'); ?></option>
                                            <option value="5" <?php if($paytype == 5){ echo 'selected'; } ?>><?php echo display('check_payment'); ?></option>
                                            <option value="6" <?php if($paytype == 6){ echo 'selected'; } ?>><?php echo display('pix_payment'); ?></option>
                                            <option value="7" <?php if($paytype == 7){ echo 'selected'; } ?>><?php echo display('voucher_payment'); ?></option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            
                            <div id="boleto_vencimento_edit" style="display:none;">
                                <div class="col-sm-6"></div>
                                <div class="col-sm-6">
                                    <div class="form-group row">
                                        <label for="boleto_due_date" class="col-sm-3 col-form-label">
                                            Data de Vencimento do Boleto <i class="text-danger">*</i>
                                        </label>
                                        <div class="col-sm-6">
                                            <input type="text" name="boleto_due_date" id="boleto_due_date" class="form-control" value="<?php echo isset($boleto_due_date) ? $boleto_due_date : ''; ?>" required />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <script>
                                function toggleBoletoFieldEdit(paymentType) {
                                    const boletoField = document.getElementById("boleto_vencimento_edit");
                            
                                    if (paymentType === "4") {
                                        boletoField.style.display = "block";
                                        boletoField.querySelector("input").required = true;
                                    } else {
                                        boletoField.style.display = "none";
                                        boletoField.querySelector("input").required = false;
                                    }
                                }
                            
                                // Verifica o valor selecionado ao carregar a página para exibir o campo se necessário
                                window.addEventListener('DOMContentLoaded', function() {
                                    const selectPaytype = document.getElementsByName("paytype")[0];
                                    toggleBoletoFieldEdit(selectPaytype.value);
                                });
                            </script>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group row">
                                    <label for="delivery_location" class="col-sm-3 col-form-label"><?php echo display('delivery_location') ?></label>
                                    <div class="col-sm-6">
                                        <input class="form-control" type="text" id="delivery_location" name="delivery_location" value="<?php echo $delivery_location; ?>" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                 <div class="form-group row">
                                <label for="expected_delivery_time" class="col-sm-3 col-form-label"><?php echo display('expected_delivery_time') ?></label>
                                    <div class="col-sm-6">
                                         <input class="form-control" type="time"  name="expected_delivery_time" id="expected_delivery_time" value="<?php echo $expected_delivery_time; ?>" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group row">
                                    <label for="invoice_seller" class="col-sm-3 col-form-label"><?php echo display('seller') ?></label>
                                    <div class="col-sm-6">
                                        <input type="text" name="invoice_seller" class="form-control" placeholder='<?php echo display('seller') ?>' id="invoice_seller" oninput="seller_autocomplete()" value="<?php echo $invoice_seller ?>"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group row">
                                    <label for="product_name" class="col-sm-3 col-form-label"><?php echo display('date') ?> <i class="text-danger">*</i></label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control datepicker" name="invoice_date" value="<?php echo $date?>"  required />
                                    </div>
                                </div>
                            </div>
                             <div class="col-sm-6">
                                 <div class="form-group row">
                                <label for="invoice_no" class="col-sm-3 col-form-label"><?php
                                    echo display('invoice_no');
                                    ?> <i class="text-danger">*</i></label>
                                    <div class="col-sm-6">
                                         <input class="form-control" type="text"  name="invoice_no" id="invoice_no" required value="<?php echo html_escape($invoice); ?>" readonly/>
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
                                            <option value="<?php echo html_escape($bank['bank_id'])?>" <?php if($bank['bank_id'] == $bank_id){echo 'selected';}?>><?php echo html_escape($bank['bank_name']);?></option>
                                        <?php }?>
                                    </select>
                                  <input type="hidden" id="editpayment_type" value="<?php echo $paytype;?>" name="">
                                </div>
                             
                            </div>
                        </div>
                        </div>
                        <br>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover" id="normalinvoice">
                                <thead>
                                    <tr>
                                    <th class="text-center"><?php echo display('item_information') ?> <i class="text-danger">*</i></th>
                                    <th class="text-center"><?php echo display('item_description')?></th>
                                    <th class="text-center" ><?php echo display('serial_no')?></th>
                                        <th class="text-center"><?php echo display('available_qnty') ?></th>
                                        <th class="text-center"><?php echo display('unit') ?></th>
                                        <th class="text-center"><?php echo display('quantity') ?>  <i class="text-danger">*</i></th>
                                        <th class="text-center"><?php echo display('rate') ?> <i class="text-danger">*</i></th>

                                        <?php if ($discount_type == 1) { ?>
                                            <th class="text-center"><?php echo display('discount_percentage') ?> %</th>
                                        <?php } elseif ($discount_type == 2) { ?>
                                            <th class="text-center"><?php echo display('discount') ?> </th>
                                        <?php } elseif ($discount_type == 3) { ?>
                                            <th class="text-center"><?php echo display('fixed_dis') ?> </th>
                                        <?php } ?>

                                        <th class="text-center"><?php echo display('total') ?> <i class="text-danger">*</i></th>
                                        <th class="text-center"><?php echo display('action') ?></th>
                                    </tr>
                                </thead>
                                <tbody id="addinvoiceItem">
                                  <?php 
                                  echo "<!--TESTE<pre>";
                                  print_r($invoice_all_data);
                                  echo "</pre>-->";
                                  
                                  foreach($invoice_all_data as $details){?>
                                    <tr>
                                        <td class="product_field">
                                            <input type="text" name="product_name" oninput="invoice_productList(<?php echo $details['sl']?>);" value="<?php echo $details['product_name']?>-(<?php echo $details['product_model']?>)" class="form-control productSelection" required placeholder='<?php echo display('product_name') ?>' id="product_name_<?php echo $details['sl']?>">

                                            <input type="hidden" class="product_id_<?php echo $details['sl']?> autocomplete_hidden_value" name="product_id[]" value="<?php echo $details['serial_no']?>" id="SchoolHiddenId"/>
                                        </td>
                                        <td>
                                            <input type="text" name="desc[]" class="form-control text-right "  value="<?php echo $details['description']?>"/>
                                        </td>
                                         <td>
                                         <select class="form-control invoice_fields" id="serial_no_<?php echo $details['sl']?>" name="serial_no[]" disabled>

                                        <option value="<?php echo $details['serial_no']?>"><?php echo $details['serial_no']?></option>
                                            </select>
                                        </td>
                                       <td>
                                            <input type="text" name="available_quantity[]" class="form-control text-right available_quantity_<?php echo $details['sl']?>" value="999999.00" readonly="" />
                                        </td>
                                        <td>
                                            <input type="text" name="unit[]" class="form-control text-right " readonly="" value="<?php echo $details['unit']?>" />
                                        </td>
                                        <td>
                                            <input type="text" name="product_quantity[]" onkeyup="bdtask_invoice_quantity_calculate(<?php echo $details['sl']?>);" onchange="bdtask_invoice_quantity_calculate(<?php echo $details['sl']?>);" value="<?php echo $details['quantity']?>" class="total_qntt_<?php echo $details['sl']?> form-control text-right reindex_qnt" id="total_qntt_<?php echo $details['sl']?>" min="0" placeholder="0.00" required="required"/>
                                        </td>

                                        <td>
                                            <input type="text" name="product_rate[]" onkeyup="bdtask_invoice_quantity_calculate(<?php echo $details['sl']?>);" onchange="bdtask_invoice_quantity_calculate(<?php echo $details['sl']?>);" value="<?php echo $details['rate']?>" id="price_item_<?php echo $details['sl']?>" class="price_item<?php echo $details['sl']?> price_rate form-control text-right reindex_rate" min="0" required="" placeholder="0.00"/>
                                        </td>
                                        <!-- Discount -->
                                        <td>
                                            <input type="text" name="discount[]" oninput="bdtask_invoice_quantity_calculate(<?php echo $details['sl']?>);" id="discount_<?php echo $details['sl']?>" class="form-control text-right reindex_discount" placeholder="0.00" value="<?php echo $details['discount_per']?>" />

                                            <input type="hidden" value="<?php echo $discount_type ?>" name="discount_type" id="discount_type_<?php echo $details['sl']?>">
                                        </td>

                                        <td>
                                            <input class="total_price form-control text-right reindex_total_price" type="text" name="total_price[]" id="total_price_<?php echo $details['sl']?>" value="<?php echo $details['total_price']?>" readonly="readonly" />

                                            <input type="hidden" name="invoice_details_id[]" id="invoice_details_id" value="<?php echo $details['invoice_details_id']?>"/>
                                        </td>
                                        <td>

                                            <!-- Tax calculate start-->
                                            <?php $x=0;
                                            foreach($taxes as $taxfldt){
                                                $taxval='tax'.$x;
                                                ?>
                                            <input id="total_tax<?php echo $x;?>_<?php echo $details['sl']?>" class="total_tax<?php echo $x;?>_<?php echo $details['sl']?>" value="<?php echo $details[$taxval]?>" type="hidden">
                                            <input id="all_tax<?php echo $x;?>_<?php echo $details['sl']?>" class="total_tax<?php echo $x;?>" type="hidden" name="tax[]">
                                             <?php $x++;} ?>
                                            <!-- Tax calculate end-->
                                            <!-- Discount calculate start-->
                                            <input type="hidden" id="total_discount_<?php echo $details['sl']?>" class="" value="<?php echo $details['discount']?>"/>

                                            <input type="hidden" id="all_discount_<?php echo $details['sl']?>" class="total_discount" value="<?php echo $details['discount']?>" name="discount_amount[]" />

                                            <button  class="btn btn-danger text-center" type="button" value="<?php echo display('delete') ?>" onclick="deleteRow_invoice(this)"><i class="fa fa-close"></i></button>
                                        </td>
                                    </tr>
                                    <?php }?>
                                </tbody>
 <tfoot>
                                    <tr>
                                        <td colspan="7" rowspan="2">
                                            <center><label sclass="text-center" for="observation" class="  col-form-label"><?php echo display('observation') ?></label></center>
                                            <textarea name="observation" id="observation" class="form-control" placeholder="<?php echo display('observation') ?>" tabindex="-1"><?php echo isset($observation) ? htmlspecialchars($observation, ENT_QUOTES) : ''; ?></textarea>
                                        </td>
                                        <td class="text-right" colspan="1"><b>Tipo de Desconto:</b></td>
                                        <td class="text-right">
                                            <select id="discount_mode" name="discount_mode" class="form-control" onchange="bdtask_invoice_quantity_calculate(1);" tabindex="-1">
                                                <option value="percent" <?php if($discount_mode == 'percent'){echo 'selected';}?>>Porcentagem (%)</option>
                                                <option value="fixed" <?php if($discount_mode == 'fixed'){echo 'selected';}?>>Valor Fixo</option>
                                            </select>
                                        </td>
                                        <td><a  id="add_invoice_item" class="btn btn-info" name="add-invoice-item"  onClick="addInputField_invoice('addinvoiceItem');"><i class="fa fa-plus"></i></a></td>
                                    </tr>
                                     <tr>
                                    <td class="text-right" colspan="1"><b><?php echo display('invoice_discount') ?>:</b></td>
                                    <td class="text-right">
                                        <input type="text" onkeyup="bdtask_invoice_quantity_calculate(1);"  onchange="bdtask_invoice_quantity_calculate(1);" id="invoice_discount" class="form-control text-right total_discount" name="invoice_discount" placeholder="0.00"  value="<?php echo $invoice_discount;?>"/>
                                        <input type="hidden" id="txfieldnum" value="<?php echo count($taxes);?>">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-right" colspan="8"><b><?php echo display('total_discount') ?>:</b></td>
                                    <td class="text-right">
                                        <input type="text" id="total_discount_ammount" class="form-control text-right" name="total_discount" value="<?php echo $total_discount;?>" readonly="readonly" />
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
                                    <input id="total_tax_ammount<?php echo $x;?>" tabindex="-1" class="form-control text-right valid totalTax" name="total_tax<?php echo $x;?>" value="<?php $txval ='tax'.$x;
                                     echo html_escape($taxvalu[0][$txval])?>" readonly="readonly" aria-invalid="false" type="text">
                                </td>
                                </tr>
                            <?php $x++;}?>
                                 
                    <tr>
                                    <tr>
                                <td class="text-right" colspan="8"><b><?php echo display('total_tax') ?>:</b></td>
                                <td class="text-right">
                                    <input id="total_tax_amount" tabindex="-1" class="form-control text-right valid" name="total_tax" value="<?php echo $total_tax;?>" readonly="readonly" aria-invalid="false" type="text">
                                </td>
                                 <td><button type="button" class="toggle btn-warning">
                <i class="fa fa-angle-double-down"></i>
              </button></td>
                                </tr>
                               
                                 <tr>
                                    <td class="text-right" colspan="8"><b><?php echo display('shipping_cost') ?>:</b></td>
                                    <td class="text-right">
                                        <input type="text" id="shipping_cost" class="form-control text-right" name="shipping_cost" onkeyup="quantity_calculate(1);"  onchange="quantity_calculate(1);"  placeholder="0.00"  value="<?php echo $shipping_cost?>"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="8"  class="text-right"><b><?php echo display('grand_total') ?>:</b></td>
                                    <td class="text-right">
                                        <input type="text" id="grandTotal" class="form-control text-right" name="grand_total_price" value="<?php echo $total_amount?>" readonly="readonly" />
                                    </td>
                                </tr>
                                 <tr>
                                    <td colspan="8"  class="text-right"><b><?php echo display('previous'); ?>:</b></td>
                                    <td class="text-right">
                                        <input type="text" id="previous" class="form-control text-right" name="previous" value="<?php echo $prev_due?>" readonly="readonly" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="8"  class="text-right"><b><?php echo display('net_total'); ?>:</b></td>
                                    <td class="text-right">
                                        <input type="text" id="n_total" class="form-control text-right" name="n_total" value="<?php echo $net_total;?>" readonly="readonly" placeholder="" />
                                    </td>
                                </tr>
                                <tr>
                                   
                                    <td class="text-right" colspan="8"><b><?php echo display('paid_ammount') ?>:</b></td>
                                    <td class="text-right">
                                        <input type="text" id="paidAmount" 
                                               onkeyup="invoice_paidamount();" class="form-control text-right" name="paid_amount" placeholder="0.00" value="<?php echo $paid_amount;?>"/>
                                    </td>
                                </tr>
                                <tr>
                                    
                                
                                    <td class="text-right" colspan="8">
                                          <input type="hidden" name="baseUrl" class="baseUrl" value="<?php echo base_url(); ?>"/>
                                          <input type="hidden" name="invoice_id" id="invoice_id" value="<?php echo $invoice_id?>"/>
                                            <input type="hidden" name="invoice" id="invoice" value="<?php echo $invoice?>"/>
                                        <b><?php echo display('due') ?>:</b></td>
                                    <td class="text-right">
                                        <input type="text" id="dueAmmount" class="form-control text-right" name="due_amount" value="<?php echo $due_amount?>" readonly="readonly"/>
                                    </td>
                                </tr>
                                 <tr>
                                    <td align="center" colspan="2">
                                        <input type="button" id="full_paid_tab" class="btn btn-warning" value="<?php echo display('full_paid') ?>" onClick="invoicee_full_paid()"/>

                                        <input type="submit" id="add_invoice" class="btn btn-success" name="add-invoice" value="<?php echo display('save_changes') ?>" />
                                    </td>

                                    <td class="text-right" colspan="6"><b><?php echo display('change') ?>:</b></td>
                                    <td class="text-right">
                                        <input type="text" id="change" class="form-control text-right" name="change" value="0" readonly="readonly"/>
                                    </td>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                    <?php echo form_close() ?>
                </div>
            </div>

                  <div class="modal fade" id="printconfirmodal" tabindex="-1" role="dialog" aria-labelledby="printconfirmodal" aria-hidden="true">
      <div class="modal-dialog modal-sm">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel"><?php echo display('print') ?></h4>
          </div>
          <div class="modal-body">
            <?php echo form_open('invoice_print', array('class' => 'form-vertical', 'id' => '', 'name' => '')) ?>
            <div id="outputs" class="hide alert alert-danger"></div>
            <h3> <?php echo display('successfully_inserted') ?></h3>
            <h4><?php echo display('do_you_want_to_print') ?> ??</h4>
            <input type="hidden" name="invoice_id" id="inv_id">
          </div>
          <div class="modal-footer">
            <a href="<?php echo base_url('invoice_list')?>" class="btn btn-default"><?php echo display('no') ?></a>
            
            <button type="submit" class="btn btn-primary" id="yes"><?php echo display('yes') ?></button>
            <?php echo form_close() ?>
          </div>
        </div>
      </div>
    </div>

        </div>
        
        <script>
            let formEditado = false;
            const form = document.getElementById('update_invoice');
        
            // Quando qualquer campo do formulário mudar
            form.addEventListener('input', function() {
                formEditado = true;
            });
        
            // Quando enviar o formulário corretamente
            form.addEventListener('submit', function() {
                formEditado = false;
            });
        
            // Ao tentar sair da página
            window.addEventListener('beforeunload', function (e) {
                if (formEditado) {
                    e.preventDefault();
                    e.returnValue = '';
                }
            });
            
            // Calcula desconto geral porcentagem
            $(document).ready(function () {
                calculateTotalDiscountPercent();
            });
            
            // Recalcula valor total
            $(document).ready(function () {
                // percorre todos os inputs de quantidade
                $("input[id^='total_qntt_']").each(function () {
                    let id = $(this).attr("id");
                    let item = id.split("_").pop(); // pega o número final
            
                    bdtask_invoice_quantity_calculate(item);
                });
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
                $(".common_rate").each(function () {
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

