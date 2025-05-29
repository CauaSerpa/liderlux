 <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-bd lobidrag">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h4><?php echo $title ?> </h4>
                        </div>
                    </div>
                   
                    <div class="panel-body">
    

                <table class="table table-bordered" id="CustomerList">
                    <thead>
 
                        <tr>
                            <th><?php echo display('sl') ?></th>
                            <th><?php echo display('customer_name') ?></th>
                            <th><?php echo display('contact'); ?></th>
                            <th><?php echo display('cpf_cnpj') ?></th>
                            <th><?php echo display('city'); ?></th>
                            <th><?php echo display('state'); ?></th>
                            <th><?php echo display('zip'); ?></th>
                            <th><?php echo display('address'); ?></th>
                            <th><?php echo display('number'); ?></th>
                            <th><?php echo display('balance') ?></th>
                            <th width="50px;"><?php echo display('action') ?></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody id="customer_tablebody">
                       
                    </tbody>
                    <tfoot>
                                            <tr>
                <th colspan="9" class="text-right"><?php echo display('total') ?>:</th>
                <th id="stockqty"></th>
                   <th></th>
            </tr>
                                            
                                        </tfoot>
                  </table>  
                  
            </div>
         

        </div>
    </div>
</div>
 
