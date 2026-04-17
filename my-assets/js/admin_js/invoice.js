//Add Input Field Of Row
    "use strict";
function addInputField_invoice(t) {
    var row = $("#normalinvoice tbody tr").length;
    var count = row + 1;
    var limits = 500;
     var taxnumber = $("#txfieldnum").val();
    var tbfild ='';
    for(var i=0;i<taxnumber;i++){
        var taxincrefield = '<input id="total_tax'+i+'_'+count+'" class="total_tax'+i+'_'+count+'" type="hidden"><input id="all_tax'+i+'_'+count+'" class="total_tax'+i+'" type="hidden" name="tax[]">';
         tbfild +=taxincrefield;
    }
    if (count == limits)
        alert("You have reached the limit of adding " + count + " inputs");
    else {
        var a = "product_name_" + count,
                e = document.createElement("tr");
        e.innerHTML = "<td><input type='text' name='product_name' oninput='invoice_productList(" + count + ");' class='form-control productSelection common_product' placeholder='Product Name' id='" + a + "' required><input type='hidden' class='common_product autocomplete_hidden_value  product_id_" + count + "' name='product_id[]' id='SchoolHiddenId'/></td><td><input type='text' name='desc[]'' class='form-control text-right ' /></td><td><select class='form-control' id='serial_no_" + count + "' name='serial_no[]'><option></option></select></td> <td><input type='text' name='available_quantity[]' id='' class='form-control text-right common_avail_qnt available_quantity_" + count + "' value='0' readonly='readonly' /></td><td><input class='form-control text-right common_name unit_" + count + " valid' value='None' readonly='' aria-invalid='false' type='text'></td><td> <input type='text' name='product_quantity[]' value='1' required='required' oninput='bdtask_invoice_quantity_calculate(" + count + ");' id='total_qntt_" + count + "' class='common_qnt total_qntt_" + count + " form-control text-right'  placeholder='0.00' min='0' /></td><td><input type='text' name='product_rate[]' oninput='bdtask_invoice_quantity_calculate(" + count + ");' id='price_item_" + count + "' class='common_rate price_rate price_item" + count + " form-control text-right' required placeholder='0.00' min='0' /></td><td><input type='text' name='discount[]' oninput='bdtask_invoice_quantity_calculate(" + count + ");' id='discount_" + count + "' class='form-control text-right common_discount' placeholder='0.00' min='0' /><input type='hidden' value='' name='discount_type' id='discount_type_" + count + "'></td><td class='text-right'><input class='common_total_price total_price form-control text-right' type='text' name='total_price[]' id='total_price_" + count + "' value='0.00' readonly='readonly'/></td><td>"+tbfild+"<input type='hidden' id='all_discount_" + count + "' class='total_discount dppr' name='discount_amount[]'/><button style='text-align: right;' class='btn btn-danger' type='button' value='Delete' onclick='deleteRow_invoice(this)'><i class='fa fa-close'></i></button></td>",
                document.getElementById(t).appendChild(e),
                document.getElementById(a).focus(),
                count++
    }
}
//Quantity calculat
"use strict";
function bdtask_invoice_quantity_calculate(item) {
    var quantity = $("#total_qntt_" + item).val();
    var available_quantity = $(".available_quantity_" + item).val();
    var price_item = $("#price_item_" + item).val();
    var invoice_discount = $("#invoice_discount").val();
    var discount = $("#discount_" + item).val();
    var total_tax = $("#total_tax_" + item).val();
    var total_discount = $("#total_discount_" + item).val();
    var taxnumber = $("#txfieldnum").val();
    var dis_type = $("#discount_type").val();
    
    // if (parseInt(quantity) > parseInt(available_quantity)) {
    //     var message = "You can Sale maximum " + available_quantity + " Items";
    //     toastr["error"](message);
    //     $("#total_qntt_" + item).val('');
    //     var quantity = 0;
    //     $("#total_price_" + item).val(0);
    //     for(var i=0;i<taxnumber;i++){
    //     $("#all_tax"+i+"_" + item).val(0);
    //       bdtask_invoice_quantity_calculate(item);
    // }
    // }

    // Não bloqueia mais a venda
    if (!available_quantity || parseInt(quantity) > parseInt(available_quantity)) {
        available_quantity = 999999;
        $(".available_quantity_" + item).val(available_quantity);
    }

if (quantity > 0 || discount > 0) {
        if (dis_type == 1) {
            var price = quantity * price_item;
            var dis = +(price * discount / 100);
            $("#all_discount_" + item).val(dis);
            //Total price calculate per product
            var temp = price - dis;
            var ttletax = 0;
            $("#total_price_" + item).val(temp.toFixed(2));
             for(var i=0;i<taxnumber;i++){
           var tax = (temp) * $("#total_tax"+i+"_" + item).val();
           ttletax += Number(tax);
            $("#all_tax"+i+"_" + item).val(tax);
    }

          
        } else if (dis_type == 2) {
            var price = quantity * price_item;

            // Discount cal per product
            var dis = (discount * quantity);

            $("#all_discount_" + item).val(dis);

            //Total price calculate per product
            var temp = price - dis;
            $("#total_price_" + item).val(temp.toFixed(2));

            var ttletax = 0;
             for(var i=0;i<taxnumber;i++){
           var tax = (temp) * $("#total_tax"+i+"_" + item).val();
           ttletax += Number(tax);
            $("#all_tax"+i+"_" + item).val(tax);
    }
        } else if (dis_type == 3) {
            var total_price = quantity * price_item;
             var dis =  discount;
            // Discount cal per product
            $("#all_discount_" + item).val(dis);
            //Total price calculate per product
            var price = total_price - dis;
            $("#total_price_" + item).val(price);

             var ttletax = 0;
             for(var i=0;i<taxnumber;i++){
           var tax = (price) * $("#total_tax"+i+"_" + item).val();
           ttletax += Number(tax);
            $("#all_tax"+i+"_" + item).val(tax);
    }
        }
    } else {
        var n = quantity * price_item;
        var c = quantity * price_item * total_tax;
        $("#total_price_" + item).val(n),
                $("#all_tax_" + item).val(c)
    }
    invoice_calculateSum();
    invoice_paidamount();
}

"use strict";
function calculateTotalDiscountPercent() {

    let subtotalBruto = 0;
    let totalDescontoItens = 0;

    // Subtotal bruto (sem desconto)
    $(".price_rate").each(function () {
        const id = this.id.split('_').pop(); // pega o índice da linha

        const qty   = toNumber($("#total_qntt_" + id).val());
        const price = toNumber($(this).val());

        subtotalBruto += qty * price;
    });

    // Soma descontos dos itens
    const hasInvoiceDiscount = toNumber($("#invoice_discount").val()) > 0;
    $(".total_discount").each(function () {
        if (hasInvoiceDiscount) {
            return;
        }

        totalDescontoItens += toNumber(this.value);
    });
    
    // Base após desconto dos itens
    const baseAposItens = subtotalBruto - totalDescontoItens;

    // Desconto geral
    const discountMode = $("#discount_mode").val(); // percent | fixed
    const invoiceDiscount = toNumber($("#invoice_discount").val());

    let descontoGeralValor = 0;
    
    console.log("TESTE A", baseAposItens);

    if (discountMode === 'percent') {
        descontoGeralValor = baseAposItens * (invoiceDiscount / 100);
    } else {
        descontoGeralValor = invoiceDiscount;
    }

    const totalDesconto = totalDescontoItens + descontoGeralValor;

    // Evita divisão por zero
    let percent = 0;
    if (subtotalBruto > 0) {
        percent = (totalDesconto / subtotalBruto) * 100;
    }

    $("#total_discount_percent").val(percent.toFixed(2) + "%");
}

//Calculate Sum
    "use strict";
function invoice_calculateSum() {
     var taxnumber = $("#txfieldnum").val();
      var t = 0,
            a = 0,
            e = 0,
            o = 0,
            p = 0,
            f = 0,
            ad = 0,
            tx = 0,
            ds = 0,
            cc = 0,
            s_cost =  $("#shipping_cost").val();

    //Total Tax
   for(var i=0;i<taxnumber;i++){
      
var j = 0;

p  = 0;
cc = 0;
f  = 0;

    $(".total_tax"+i).each(function () {
        isNaN(this.value) || 0 == this.value.length || (j += parseFloat(this.value.replace(',', '.')))
    });
            $("#total_tax_ammount"+i).val(j.toFixed(2));
             
    }
            //Total Discount
$("#invoice_discount").each(function () {
    isNaN(this.value) || 0 == this.value.length || (p += parseFloat(this.value.replace(',', '.')))
}),
$(".total_discount").each(function () {
    isNaN(this.value) || 0 == this.value.length || (cc += parseFloat(this.value.replace(',', '.')))
});

$("#total_discount_ammount").val(cc.toFixed(2)),

             $(".totalTax").each(function () {
        isNaN(this.value) || 0 == this.value.length || (f += parseFloat(this.value.replace(',', '.')))
    }),
            $("#total_tax_amount").val(f.toFixed(2));
         
            // ðŸ”¹ Desconto total com tipo
var subtotal = 0;

// Soma todos os totais de produtos
$(".total_price").each(function () {
    isNaN(this.value) || 0 == this.value.length || (subtotal += parseFloat(this.value.replace(',', '.')))
});

// Valor digitado no campo desconto total
var invoice_discount_val = parseFloat($("#invoice_discount").val().replace(',', '.')) || 0;

// Tipo selecionado no select
var discount_mode = $("#discount_mode").val(); // <-- vocÃª precisa ter o select no HTML

// calcula valor do desconto total
var total_discount_amount = 0;
if (discount_mode === 'percent') {
    total_discount_amount = subtotal * (invoice_discount_val / 100);
} else {
    total_discount_amount = invoice_discount_val;
}

// Soma descontos individuais de produtos tambÃ©m
var cc = 0;
$(".total_discount").each(function () {
    isNaN(this.value) || 0 == this.value.length || (cc += parseFloat(this.value.replace(',', '.')))
});

$("#total_discount_ammount").val(total_discount_amount.toFixed(2));

 $(".dppr").each(function () {
        isNaN(this.value) || 0 == this.value.length || (ad += parseFloat(this.value.replace(',', '.')))
    }),
            
            o = a.toFixed(2),
            e = t.toFixed(2),
            tx = f.toFixed(2),
    ds = p.toFixed(2);

    // var test = +tx + +s_cost + +e + -ds + + ad;
    var test = +tx + +s_cost + +subtotal - total_discount_amount; 
    $("#grandTotal").val(test.toFixed(2));


    var gt = $("#grandTotal").val();
    var invdis = $("#invoice_discount").val();
    var total_discount_ammount = $("#total_discount_ammount").val();
    var ttl_discount = +total_discount_ammount;
    $("#total_discount_ammount").val(ttl_discount.toFixed(2));
    var grnt_totals = gt;
    invoice_paidamount();
    $("#grandTotal").val(grnt_totals);
    
    calculateTotalDiscountPercent();

    
}

//Invoice Paid Amount
//    "use strict";
//function invoice_paidamount() {
// var  prb = parseFloat($("#previous").val(), 10);
// var pr = 0;
// var d = 0;
// var nt = 0;
//    if(prb != 0){
//        pr =  prb;
//    }else{
//        pr = 0;
//    }
//    var t = $("#grandTotal").val(),
//            a = $("#paidAmount").val(),
//            e = t - a,
//            f = e + pr,
//            nt = parseFloat(t, 10) + pr;
//            d = a - nt;
//    $("#n_total").val(nt.toFixed(2));      
//     if(f > 0){
//    $("#dueAmmount").val(f.toFixed(2,2));
//     if(a <= f){
//     $("#change").val(0);   
//    }
//   }else{
//    if(a < f){
//     $("#change").val(0);   
//    }
//    if(a > f){
//        $("#change").val(d.toFixed(2,2))
//    }
//  $("#dueAmmount").val(0)   
//
//}
//}

//Invoice Paid Amount
"use strict";
function toNumber(val) {
    if (!val) return 0;
    val = val.toString().replace(',', '.');
    let num = parseFloat(val);
    return isNaN(num) ? 0 : num;
}
function invoice_paidamount() {

    const previous = toNumber($("#previous").val());
    const grandTotal = toNumber($("#grandTotal").val());
    const paidAmount = toNumber($("#paidAmount").val());

    const netTotal = grandTotal + previous;
    const dueAmount = netTotal - paidAmount;
    const change = paidAmount - netTotal;

    $("#n_total").val(netTotal.toFixed(2));

    if (dueAmount > 0) {
        $("#dueAmmount").val(dueAmount.toFixed(2));
        $("#change").val(0);
    } else {
        $("#dueAmmount").val(0);
        $("#change").val(change > 0 ? change.toFixed(2) : 0);
    }
}

//Stock Limit
    "use strict";
// function stockLimit(t) {
//     var a = $("#total_qntt_" + t).val(),
//             e = $(".product_id_" + t).val(),
//             o = $(".baseUrl").val();

//     $.ajax({
//         type: "POST",
//         url: o + "Cinvoice/product_stock_check",
//         data: {
//             product_id: e
//         },
//         cache: !1,
//         success: function (e) {
//             alert(e);
//             if (a > Number(e)) {
//                 var o = "You can Sale maximum " + e + " Items";
//                 alert(o), $("#qty_item_" + t).val("0"), $("#total_qntt_" + t).val("0"), $("#total_price_" + t).val("0")
//             }
//         }
//     })
// }
function stockLimit(t) {

    var a = $("#total_qntt_" + t).val();
    var stock = $("#stock_" + t).val(); // campo de estoque caso exista

    // Se não tiver estoque definido, usa 999999
    if (!stock || stock == 0) {
        stock = 999999;
    }

    if (a > Number(stock)) {
        var msg = "You can Sale maximum " + stock + " Items";
        alert(msg);

        $("#qty_item_" + t).val("0");
        $("#total_qntt_" + t).val("0");
        $("#total_price_" + t).val("0");
    }
}

  
//Invoice full paid
    "use strict";
function invoicee_full_paid() {
    var grandTotal = $("#n_total").val();
    $("#paidAmount").val(grandTotal);
    invoice_paidamount();
    invoice_calculateSum();
}

    "use strict";
function reindexInvoiceRows() {
    $("#normalinvoice > tbody > tr").each(function (index) {
        var rowIndex = index + 1;

        // Product name
        $(this).find('input.productSelection')
               .attr('id', 'product_name_' + rowIndex);

        // Quantidade
        $(this).find('input.reindex_qnt')
               .attr('id', 'total_qntt_' + rowIndex)
               .attr('onkeyup', 'bdtask_invoice_quantity_calculate(' + rowIndex + ');')
               .attr('onchange', 'bdtask_invoice_quantity_calculate(' + rowIndex + ');')
               .attr('oninput', 'bdtask_invoice_quantity_calculate(' + rowIndex + ');');

        // PreÃ§o
        $(this).find('input.reindex_rate')
               .attr('id', 'price_item_' + rowIndex)
               .attr('onkeyup', 'bdtask_invoice_quantity_calculate(' + rowIndex + ');')
               .attr('onchange', 'bdtask_invoice_quantity_calculate(' + rowIndex + ');')
               .attr('oninput', 'bdtask_invoice_quantity_calculate(' + rowIndex + ');');

        // Desconto
        $(this).find('input.reindex_discount')
               .attr('id', 'discount_' + rowIndex)
               .attr('onkeyup', 'bdtask_invoice_quantity_calculate(' + rowIndex + ');')
               .attr('onchange', 'bdtask_invoice_quantity_calculate(' + rowIndex + ');')
               .attr('oninput', 'bdtask_invoice_quantity_calculate(' + rowIndex + ');');

        // Total price
        $(this).find('input.reindex_total_price')
               .attr('id', 'total_price_' + rowIndex);

        // TambÃ©m renomeie selects e inputs ocultos aqui se tiver
        $(this).find('select[name="serial_no[]"]').attr('id', 'serial_no_' + rowIndex);
    });
}

//Delete a row of table
    "use strict";
function deleteRow_invoice(t) {
    var a = $("#normalinvoice > tbody > tr").length;
    if (1 == a)
        alert("There only one row you can't delete.");
    else {
        var e = t.parentNode.parentNode;
        e.parentNode.removeChild(e),
                invoice_calculateSum();
        invoice_paidamount();

        // reindexa IDs para nÃ£o duplicar
        reindexInvoiceRows();

        var current = 1;
        $("#normalinvoice > tbody > tr td input.productSelection").each(function () {
            current++;
            $(this).attr('id', 'product_name' + current);
        });
        var common_qnt = 1;
        $("#normalinvoice > tbody > tr td input.common_qnt").each(function () {
            common_qnt++;
            $(this).attr('id', 'total_qntt_' + common_qnt);
            $(this).attr('onkeyup', 'bdtask_invoice_quantity_calculate('+common_qnt+');');
            $(this).attr('onchange', 'bdtask_invoice_quantity_calculate('+common_qnt+');');
            $(this).attr('oninput', 'bdtask_invoice_quantity_calculate('+common_qnt+');');
        });
        var common_rate = 1;
        $("#normalinvoice > tbody > tr td input.common_rate").each(function () {
            common_rate++;
            $(this).attr('id', 'price_item_' + common_rate);
            $(this).attr('onkeyup', 'bdtask_invoice_quantity_calculate('+common_qnt+');');
            $(this).attr('onchange', 'bdtask_invoice_quantity_calculate('+common_qnt+');');
            $(this).attr('oninput', 'bdtask_invoice_quantity_calculate('+common_qnt+');');
        });
        var common_discount = 1;
        $("#normalinvoice > tbody > tr td input.common_discount").each(function () {
            common_discount++;
            $(this).attr('id', 'discount_' + common_discount);
            $(this).attr('onkeyup', 'bdtask_invoice_quantity_calculate('+common_qnt+');');
            $(this).attr('onchange', 'bdtask_invoice_quantity_calculate('+common_qnt+');');
            $(this).attr('oninput', 'bdtask_invoice_quantity_calculate('+common_qnt+');');
        });
        var common_total_price = 1;
        $("#normalinvoice > tbody > tr td input.common_total_price").each(function () {
            common_total_price++;
            $(this).attr('id', 'total_price_' + common_total_price);
        });




    }
}
var count = 2,
        limits = 500;



    "use strict";
    function bank_info_show(payment_type)
    {
        if (payment_type.value == "1") {
            document.getElementById("bank_info_hide").style.display = "none";
        } else {
            document.getElementById("bank_info_hide").style.display = "block";
        }
    }




        window.onload = function () {
        $('body').addClass("sidebar-mini sidebar-collapse");
    }

        "use strict";
      function bank_paymet(val){
        if(val==2){
           var style = 'block'; 
           document.getElementById('bank_id').setAttribute("required", true);
        }else{
   var style ='none';
    document.getElementById('bank_id').removeAttribute("required");
        }
           
    document.getElementById('bank_div').style.display = style;
    }

    $(document ).ready(function() {
    $('#normalinvoice .toggle').on('click', function() {
    $('#normalinvoice .hideableRow').toggleClass('hiddenRow');
  })
});

     "use strict";
    function customer_due(id){
   var csrf_test_name = $('[name="csrf_test_name"]').val();
   var base_url = $("#base_url").val();
        $.ajax({
            url: base_url + 'invoice/invoice/previous',
            type: 'post',
            data: {customer_id:id,csrf_test_name:csrf_test_name}, 
            dataType: 'json',
            success: function(response) {
                if(response.error){
                    alert(response.error);
                    return;
                }
                // Atualiza os valores nos elementos HTML
                $("#previous").val(response.balance);
                $("#customer_document").text("CNPJ: " + response.document);
                $("#customer_address").text("EndereÃ§o: " + response.address);
            },
            error: function(xhr, status, error) {
                console.error("Erro AJAX: " + error);
            }
        });        
    }
    
    "use strict";

    $(document).ready(function() {
        var dueDates = ["60/90", "20/40", "30", "14", "20"]; // valores fixos
    
        $('#boleto_due_date').autocomplete({
            minLength: 0, // mostra ao clicar
            source: dueDates,
            focus: function(event, ui) {
                $(this).val(ui.item.label || ui.item);
                return false;
            },
            select: function(event, ui) {
                $(this).val(ui.item.label || ui.item); // define o valor selecionado
                return false;
            }
        });
    
        // faz aparecer ao clicar
        $('#boleto_due_date').on('focus', function() {
            $(this).autocomplete("search", "");
        });
    });

    "use strict";
    function seller_autocomplete(sl) {
    
        var seller_name = $('#invoice_seller').val();
    
        var options = {
            minLength: 0,
            source: function(request, response) {
                var csrf_test_name = $('[name="csrf_test_name"]').val();
                var base_url = $("#base_url").val();
    
                $.ajax({
                    url: base_url + "invoice/invoice/bdtask_seller_autocomplete",
                    method: 'post',
                    dataType: "json",
                    data: {
                        term: request.term,
                        seller_name: seller_name,
                        csrf_test_name: csrf_test_name
                    },
                    success: function(data) {
                        response(data);
                    }
                });
            },
            focus: function(event, ui) {
                $(this).val(ui.item.label);
                return false;
            },
            select: function(event, ui) {
                $('#autocomplete_seller_id').val(ui.item.value);
                var seller_id = ui.item.value;
    
                $(this).unbind("change");
                return false;
            }
        }
    
        $('body').on('input', '#invoice_seller', function() {
            $(this).autocomplete(options);
        });
    }

      "use strict";
    function customer_autocomplete(sl) {

    var customer_id = $('#customer_id').val();
    // Auto complete
    var options = {
        minLength: 0,
        source: function( request, response ) {
            var customer_name = $('#customer_name').val();
            var csrf_test_name = $('[name="csrf_test_name"]').val();
            var base_url = $("#base_url").val();
         
        $.ajax( {
          url: base_url + "invoice/invoice/bdtask_customer_autocomplete",
          method: 'post',
          dataType: "json",
          data: {
            term: request.term,
            customer_id:customer_name,
            csrf_test_name:csrf_test_name,
          },
          success: function( data ) {
            response( data );

          }
        });
      },
       focus: function( event, ui ) {
           $(this).val(ui.item.label);
           return false;
       },
       select: function( event, ui ) {
            $(this).parent().parent().find("#autocomplete_customer_id").val(ui.item.value); 
            var customer_id          = ui.item.value;
            customer_due(customer_id);

            $(this).unbind("change");
            return false;
       }
   }

   $('body').on('input', '#customer_name', function() {
       $(this).autocomplete(options);
   });

}

    "use strict";
function cancelprint(){
   location.reload();
}

$(document).ready(function(){

//     $('#full_paid_tab').keydown(function(event) {
//         if(event.keyCode == 13) {
//  $('#add_invoice').trigger('click');
//         }
//     });
});



    $(document).ready(function() {
    "use strict";
    var frm = $("#insert_sale");
    var output = $("#output");

    // ðŸ”¹ INTERCEPTA ENTER E ADICIONA NOVA LINHA
    frm.on('keydown', function(e) {
        if (e.key === 'Enter') {
            if (e.target.tagName === 'TEXTAREA') {
                return true; // Permite comportamento padrão (quebra de linha)
            }
            
            e.preventDefault(); // sempre impede o submit

            // verifica se o foco atual Ã© no botÃ£o #add_invoice_item
            if (document.activeElement && document.activeElement.id === 'add_invoice_item') {
                // adiciona nova linha
                addInputField_invoice('addinvoiceItem'); // ou 'addinvoiceItem', conforme seu caso
            }

            return false;
        }
    });

    frm.on('submit', function(e) {
         e.preventDefault(); 
               $.ajax({
            url : $(this).attr('action'),
            method : $(this).attr('method'),
            dataType : 'json',
            data : frm.serialize(),
            success: function(data) 
            {
                 
                if (data.status == true) {
                   toastr["success"](data.message);
       swal({
    title: "Success!",
    showCancelButton: true,
    cancelButtonText: "NO",
    confirmButtonText: "Yes",
    text: "Do You Want To Print ?",
    type: "success",
}, function(inputValue) {
    if (inputValue === true) {
        // Cria um formulário temporário para enviar POST
        var form = $('<form>', {
            action: 'https://liderlux.com.br/sistema/invoice_print',
            method: 'POST',
            target: '_self'
        });

        // Adiciona o ID da fatura
        form.append($('<input>', {
            type: 'hidden',
            name: 'invoice_id',
            value: data.invoice_id // vindo do retorno AJAX
        }));

        // Adiciona o token CSRF se precisar
        form.append($('<input>', {
            type: 'hidden',
            name: 'csrf_test_name',
            value: $('[name="csrf_test_name"]').val()
        }));

        // Adiciona ao body e envia
        $('body').append(form);
        form.submit();
    } else {
        location.reload();
    }
});
        //           if(data.status == true && event.keyCode == 13) {
        // }
                } else {
                    toastr["error"](data.exception);
                }
            },
            error: function(xhr)
            {
                alert('failed!');
            }
        });
    });
     });

    $(document).ready(function() {
    "use strict";
   var frm = $("#update_invoice");
    var output = $("#output");

    // ðŸ”¹ INTERCEPTA ENTER E ADICIONA NOVA LINHA
    frm.on('keydown', function(e) {
        if (e.key === 'Enter') {
            if (e.target.tagName === 'TEXTAREA') {
                return true; // Permite comportamento padrão (quebra de linha)
            }

            e.preventDefault(); // sempre impede o submit

            // verifica se o foco atual Ã© no botÃ£o #add_invoice_item
            if (document.activeElement && document.activeElement.id === 'add_invoice_item') {
                // adiciona nova linha
                addInputField_invoice('addinvoiceItem'); // ou 'addinvoiceItem', conforme seu caso
            }

            return false;
        }
    });

    frm.on('submit', function(e) {
         e.preventDefault(); 
               $.ajax({
            url : $(this).attr('action'),
            method : $(this).attr('method'),
            dataType : 'json',
            data : frm.serialize(),
            success: function(data) 
            {
                 
                if (data.status == true) {
                   toastr["success"](data.message);
                    $("#inv_id").val(data.invoice_id);
                  $('#printconfirmodal').modal('show');
        //           if(data.status == true && event.keyCode == 13) {
        // }
                } else {
                    toastr["error"](data.exception);
                }
            },
            error: function(xhr)
            {
                alert('failed!');
            }
        });
    });
     });

//      $("#printconfirmodal").on('keydown', function ( e ) {
//     var key = e.which || e.keyCode;
//     if (key == 13) {
//       $('#yes').trigger('click');
//     }
// });

$(document).ready(function() {
    // FunÃ§Ã£o para obter o valor de um parÃ¢metro GET
    function getQueryParam(param) {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(param);
    }

    // Salva valor atual ao carregar
    let previousValue = $('#product_table').val();

    // Preenche o select com o valor do GET se existir
    const selectedTable = getQueryParam('loc');
    if (selectedTable) {
        $('#product_table').val(selectedTable);
        previousValue = selectedTable;
    }

    // Quando o select muda
    $('#product_table').on('change', function() {
        const selected = $(this).val();
        const confirmed = confirm('A página será recarregada com uma nova seleção. Deseja continuar?');

        if (confirmed) {
            const url = new URL(window.location.href);
            url.searchParams.set('loc', selected);
            window.location.href = url.toString();
        } else {
            // Reverte para o valor anterior
            $(this).val(previousValue);
        }
    });
});

    "use strict";
     function invoice_productList(sl) {
        var priceClass = 'price_item'+sl;
        var available_quantity = 'available_quantity_'+sl;
        var unit = 'unit_'+sl;
        var tax = 'total_tax_'+sl;
        var serial_no = 'serial_no_'+sl;
        var discount_type = 'discount_type_'+sl;
        var csrf_test_name = $('[name="csrf_test_name"]').val();
        var base_url = $("#base_url").val();

    // Auto complete
    var options = {
        minLength: 0,
        source: function( request, response ) {
            var product_name = $('#product_name_'+sl).val();
        $.ajax( {
          url: base_url + "invoice/invoice/bdtask_autocomplete_product",
          method: 'post',
          dataType: "json",
          data: {
            term: request.term,
            product_name:product_name,
            csrf_test_name:csrf_test_name,
          },
          success: function( data ) {
            response( data );

          }
        });
      },
       focus: function( event, ui ) {
           $(this).val(ui.item.label);
           return false;
       },
       select: function( event, ui ) {
            $(this).parent().parent().find(".autocomplete_hidden_value").val(ui.item.value); 
                $(this).val(ui.item.label);
                var product_table=$('#product_table').val();
                var id=ui.item.value;
                var dataString = 'product_id='+ id;
                var base_url = $('.baseUrl').val();

                $.ajax
                   ({
                        type: "POST",
                        url: base_url+"invoice/invoice/retrieve_product_data_inv",
                        data: {product_id:id,product_table:product_table,csrf_test_name:csrf_test_name},
                        cache: false,
                        success: function(data)
                        {
                            var obj = jQuery.parseJSON(data);
                            for (var i = 0; i < (obj.txnmber); i++) {
                            var txam = obj.taxdta[i];
                            var txclass = 'total_tax'+i+'_'+sl;
                           $('.'+txclass).val(obj.taxdta[i]);
                            }
                            $('.'+priceClass).val(obj.price);
                            $('.'+available_quantity).val(obj.total_product.toFixed(2));
                            $('.'+unit).val(obj.unit);
                            $('.'+tax).val(obj.tax);
                            $('#txfieldnum').val(obj.txnmber);
                            $('#'+serial_no).html(obj.serial);
                           
                                   bdtask_invoice_quantity_calculate(sl);
                            
                        } 
                    });

            $(this).unbind("change");
            return false;
       }
   }

   $('body').on('input', '.productSelection', function() {
       $(this).autocomplete(options);
   });

}

 $( document ).ready(function() {
        "use strict";
        var paytype = $("#editpayment_type").val();
        if(paytype == 2){
          $("#bank_div").css("display", "block");        
      }else{
       $("#bank_div").css("display", "none"); 
      }

      $(".bankpayment").css("width", "100%");
    });
