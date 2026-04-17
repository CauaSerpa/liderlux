 <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-bd lobidrag">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h4><?php echo $title ?> </h4>
                        </div>
                    </div>
                   
                    <div class="panel-body">
                            	<?php echo form_open('','class="" id="customer_form"')?>
                            	
                            	<input type="hidden" name="customer_id" id="customer_id" value="<?php echo $customer->customer_id?>">
                                <div class="form-group row">
                                     <label for="document" class="col-sm-2 text-right col-form-label"><?php echo display('cpf_cnpj')?> <i class="text-danger">  </i>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                           
                                            <input type="text" name="document" class="form-control input-mask-trigger text-left" id="document" onblur="fetchCustomerByCNPJ(this.value)" placeholder="<?php echo display('cpf_cnpj')?>" maxlength="18" value="<?php echo $customer->document?>" data-inputmask="'alias': 'decimal', 'groupSeparator': '', 'autoGroup': true" im-insert="true">
    
                                        </div>
                                       
                                    </div>
                                    <label for="customer_name" class="col-sm-2 text-right col-form-label"><?php echo display('customer_name')?> <i class="text-danger"> * </i>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                           
                                            <input type="text" name="customer_name" class="form-control" id="customer_name" placeholder="<?php echo display('customer_name')?>" value="<?php echo $customer->customer_name?>">
                                            <input type="hidden" name="old_name" value="<?php echo $customer->customer_name?>">
    
                                        </div>
                                       
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label for="customer_email" class="col-sm-2 text-right col-form-label"><?php echo display('email_address')?>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                           
                                            <input type="text" class="form-control input-mask-trigger" name="customer_email" id="email" data-inputmask="'alias': 'email'" im-insert="true" placeholder="<?php echo display('email')?>" value="<?php echo $customer->customer_email?>">
    
                                        </div>
                                       
                                    </div>
                                    <!--  <label for="email_address" class="col-sm-2 text-right col-form-label"><?php echo display('email_address')?>2:</label>-->
                                    <!--<div class="col-sm-4">-->
                                    <!--    <div class="">-->
                                           
                                    <!--        <input type="text" class="form-control" name="email_address" id="email_address" placeholder="<?php echo display('email_address')?>" value="<?php echo $customer->email_address?>">-->
    
                                    <!--    </div>-->
                                       
                                    <!--</div>-->
                                    <label for="customer_mobile" class="col-sm-2 text-right col-form-label"><?php echo display('customer_mobile')?>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                            
                                          <input class="form-control input-mask-trigger text-left" id="customer_mobile" type="number" name="customer_mobile" placeholder="<?php echo display('customer_mobile')?>" data-inputmask="'alias': 'decimal', 'groupSeparator': '', 'autoGroup': true" im-insert="true" value="<?php echo $customer->customer_mobile?>">
    
                                        </div>
                                       
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="phone" class="col-sm-2 text-right col-form-label"><?php echo display('phone')?>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                            
                                          <input class="form-control input-mask-trigger text-left" id="phone" type="text" name="phone" placeholder="<?php echo display('phone')?>" data-inputmask="'alias': 'decimal', 'groupSeparator': '', 'autoGroup': true" im-insert="true" value="<?php echo $customer->phone?>">
    
                                        </div>
                                       
                                    </div>

                                     <label for="contact" class="col-sm-2 text-right col-form-label"><?php echo display('contact')?>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                            
                                          <input class="form-control"  id="contact" type="text" name="contact" placeholder="<?php echo display('contact')?>" value="<?php echo $customer->contact?>">
    
                                        </div>
                                       
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="address1" class="col-sm-2 text-right col-form-label"><?php echo display('address')?>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                            
                                          <input class="form-control"  id="customer_address" type="text" name="customer_address" placeholder="<?php echo display('address')?>" value="<?php echo $customer->customer_address ?>">
    
                                        </div>
                                      
                                    </div>

                                    <label for="address_number" class="col-sm-2 text-right col-form-label"><?php echo display('number')?>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                            
                                          <input class="form-control"  id="address_number" type="text" name="address_number" placeholder="<?php echo display('number')?>" value="<?php echo $customer->address_number?>">
    
                                        </div>
                                      
                                    </div>
                                </div>
                                <div class="form-group row"> 
                                    <label for="complement" class="col-sm-2 text-right col-form-label"><?php echo display('complement')?>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                            
                                            <input type="text" name="complement" class="form-control" id="complement" placeholder="<?php echo display('complement')?>" value="<?php echo $customer->complement?>">
    
                                        </div>
                                       
                                    </div>
                                    
                                    <label for="city" class="col-sm-2 text-right col-form-label"><?php echo display('city')?>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                            
                                            <input type="text" name="city" class="form-control" id="city" placeholder="<?php echo display('city')?>" value="<?php echo $customer->city?>">
    
                                        </div>
                                       
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="state" class="col-sm-2 text-right col-form-label"><?php echo display('state')?>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                           
                                            <input type="text" name="state" class="form-control" id="state" placeholder="<?php echo display('state')?>"  value="<?php echo $customer->state?>">
    
                                        </div>
                                       
                                    </div>
                                    <label for="zip" class="col-sm-2 text-right col-form-label"><?php echo display('zip')?>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                           
                                            <input name="zip" type="text" class="form-control" id="zip" placeholder="<?php echo display('zip')?>" value="<?php echo $customer->zip?>">
    
                                        </div>
                                       
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="others" class="col-sm-2 text-right col-form-label"><?php echo display('others')?>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                           
                                            <input name="others" type="text" class="form-control " placeholder="<?php echo display('others')?>" value="<?php echo $customer->others?>" id="others" >
    
                                        </div>
                                       
                                    </div>
                                    <label for="function" class="col-sm-2 text-right col-form-label"><?php echo display('function')?>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                            
                                            <input type="text" name="function" class="form-control" id="function" placeholder="<?php echo display('function')?>" value="<?php echo $customer->function?>">
    
                                        </div>
                                       
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <?php if(empty($customer->customer_id)){?>

                                     <label for="previous_balance" class="col-sm-2 text-right col-form-label"><?php echo display('previous_balance')?>:</label>
                                    <div class="col-sm-4">
                                        <div class="">
                                           
                                            <input name="previous_balance" type="number" class="form-control text-right input-mask-trigger" placeholder="<?php echo display('previous_balance')?>"  data-inputmask="'alias': 'decimal', 'groupSeparator': '', 'autoGroup': true" im-insert="true" >
    
                                        </div>
                                       
                                    </div>
                                <?php }?>
                                    
                                </div>

                              

                         <div class="form-group row">
                                   <div class="col-sm-6 text-right">
                                   </div>
                                     <div class="col-sm-6 text-right">
                                        <div class="">
                                           
                                            <button type="button" onclick="customer_form()" class="btn btn-success">
                                            	<?php echo (empty($customer->customer_id)?display('save'):display('update')) ?></button>
    
                                        </div>
                                       
                                    </div>
                                </div>
                               

                                <?php echo form_close();?>
                            </div>
    
                        </div>
                    </div>
                </div>
                
<script>
    "use strict";

    function fetchCustomerByCNPJ(documento) {
        // remove caracteres não numéricos
        let clean = documento.replace(/\D/g, '');
    
        if(clean.length === 14) {
            // É CNPJ
            $('#customer_name').val('Carregando...');
    
            $.ajax({
                url: '<?php echo base_url("customer/bdtask_fetch_cnpj") ?>',
                method: 'POST',
                dataType: 'json',
                data: { cnpj: clean },
                success: function(data) {
                    if(data && data.status !== 'ERROR') {
                        // Preenche campos da empresa (CNPJ)
                        $('#customer_name').val(data.nome);
                        $('#email').val(data.email || '');
                        $('#phone').val(data.telefone ? data.telefone.replace(/\D/g,'') : '');
                        $('#customer_address').val(data.logradouro || '');
                        $('#address_number').val(data.numero || '');
                        $('#complement').val(data.complemento || '');
                        $('#city').val(data.municipio || '');
                        $('#state').val(data.uf || '');
                        $('#zip').val(data.cep || '');
                    } else {
                        alert('CNPJ não encontrado.');
                        $('#customer_name').val('');
                    }
                },
                error: function() {
                    alert('Erro ao buscar dados do CNPJ.');
                    $('#customer_name').val('');
                }
            });
    
        } else if(clean.length === 11) {
            // É CPF → não buscar
            console.log('CPF detectado, não será feita consulta na Receita.');
            return;
        } else {
            // inválido
            alert('Documento inválido.');
            $('#customer_name').val('');
            return;
        }
    }
</script>
