function toDate(selector) {
    var date = $(selector).val().split("/");
    return new Date(date[2], date[1] - 1, date[0]);
}

function getProductDetails(productId){
    $('#pricing .extra-options').fadeOut();
    // default period
    $('#pricing').attr('period', 'short');
    $('#pricing .delivery-date').val("");
    $('#pricing .delivery-date-end').val("");
    $('#pricing').removeClass('short');
    $('#pricing').removeClass('long');
    $('#serwis-box').hide();
    $('#pricing .term-not-valid').removeClass('active');
    $('#pricing .rent-period').html("");
    
    var params = {
        productId: productId
    };

    $.ajax({
        type: 'POST',
        data: params,
        dataType: "json",
        url: '/app_dev.php/ajax/getProductDetails',
        success: function(response) {
            var period = $('#pricing').attr('period');
            servicePeriod = "";
            servicesHtml = "";
            hidden = "";

            category = response.product['category'];
            $('#pricing').attr('category', category);
            
            $('#pricing').removeClass('short');
            $('#pricing').removeClass('long');
            
            $.each(response.product.periods, function(index, item) {
                 $('#pricing').addClass(item);
            });

            if (!$('#pricing').hasClass(period)){
                if (period == "short"){
                    $('#pricing .term-not-valid span').html("Produktas nuomojamas tik ilgam laikotarpiui.");
                } else {
                    $('#pricing .term-not-valid span').html("Produktas nuomojamas tik ilgam laikotarpiui.");
                }
                
                $('#pricing .delivery-date').addClass('error');
                // $('#pricing .delivery-date-end').addClass('error');
                $('#pricing .term-not-valid').addClass('active');                
            } else {
                $('#pricing .term-not-valid').removeClass('active');
                $('#pricing .delivery-date').removeClass('error');
                $('#pricing .delivery-date-end').removeClass('error');
            }

            $.each(response.services, function(index, item) {
                if (item.kind != "initial" && item.kind != "final" && item.kind != "init_final") {
                    if (item.kind == "everyday" || item.kind == "2days" || item.kind == "noservice") {
                        servicePeriod = "short";
                    } else {
                        servicePeriod = "long";
                    }
                    
                    //servicesHtml = servicesHtml + '<option class="'+ servicePeriod +'"value="'+ item.id +'">'+ item.name +'</option>'
                    
                    if (period != servicePeriod) {
                        hidden = "hidden";
                    } else {
                        hidden = "";
                    }
                    
                    servicesHtml = servicesHtml + '<option value="'+ item.id +'" class="' + servicePeriod +' '+ hidden + '">'+ item.name +'</option>'
                }
            });
            
            $('#pricing select.serwis-type').html(servicesHtml);
            $('#pricing select').niceSelect('update');
            
            if (servicesHtml == "") {
                $('#serwis-box').hide();
            } else {                
                $('#pricing select.serwis-type option').each(function() {
                    if (!$(this).hasClass(period)) {
                        $(this).addClass('hidden');
                    } else {
                        $(this).removeClass('hidden');
                    }
                });
            
                $('#pricing select').niceSelect('update');
                
                var anyVisible = false;
                $('#pricing select.serwis-type option').each(function() {
                    var val = $(this).attr('value');
                    if(!anyVisible){
                        $('#pricing .nice-select.serwis-type .current').html("");
                        $('#pricing .nice-select.serwis-type .list li').removeClass('selected').removeClass('focus');
                    }
                    if(!$(this).hasClass('hidden') && $(this).hasClass(period)){
                        if(!anyVisible){
                            $('#pricing .nice-select.serwis-type .list li[data-value='+val+']').addClass('selected').addClass('focus');
                            $('#pricing .nice-select.serwis-type .current').html($(this).html());
                            $(this).prop('selected', true);
                        }

                        $('#pricing .nice-select.serwis-type .list li[data-value='+val+']').removeClass('hidden');
                        anyVisible = true;
                    } else {
                        $('#pricing .nice-select.serwis-type .list li[data-value='+val+']').addClass('hidden');
                        $('#pricing .nice-select.serwis-type .list li[data-value='+val+']').removeClass('selected').removeClass('focus');
                    }
                });
            }

            optionsHtml = "";
            /*
            $.each(response.options, function(index, item) {
                optionsHtml = optionsHtml + '<li class="'+item.term +'"><label class="control red"><input type="checkbox" name="option-' +item.id +'" option-id="' +item.id +'"><i class="state"></i><span class="item">'+ item.name +'</span></label></li>'
            })
            */
            
            $.each(response.options, function(index, item) {
                if (period != item.term) {
                    hidden = "hidden";
                } else {
                    hidden = "";
                }
                
                optionsHtml = optionsHtml + '<li class="' +item.term +' '+ hidden + '"><label class="control red"><input type="checkbox" name="option-'+item.id +'" option-id="' +item.id +'"><i class="state"></i><span class="item">'+ item.name +'</span></label></li>'
            });

            $('#pricing .extra-options').hide().html(optionsHtml).fadeIn();
            $('#pricing .img-container .header').html(response.product.name);

            if(period == "long") {
                $("#alcohol-box").hide();
            } else {
                $("#alcohol-box").show();
            }
            $('#pricing .extra-options li').each(function() {
                if (!$(this).hasClass(period)) {
                    $(this).addClass('hidden');
                } else {
                    $(this).removeClass('hidden');
                }
            });
            
            if (category == "Inne produkty" || category == "Serwis") {
                $('.extra-options-label').html("Papildomos paslaugos:");
            } else {
                $('.extra-options-label').html("Papildomai galima užsisakyti:");
            }
            
            var anyVisible = false;
            $('#pricing .extra-options li').each(function() {
                if(!$(this).hasClass('hidden') && $(this).hasClass(period)){
                    anyVisible = true;
                }
            });
                       
            if (optionsHtml == "" || !anyVisible) {
                $('.extra-options-label').hide();
            } else {
                $('.extra-options-label').show(); 
            }
            
            $('#end-date-box').addClass('active');
            $('#end-date-box').show();
            // alert(category);
            if (category != "Biotualetai") {
                $('#persons-box').hide();
                $('#alcohol-box').hide();
                $('.qantity-persons').val(0);
            } else {
                $('#persons-box').show();
                if (period == "short"){
                    $('#alcohol-box').show();
                }
            }
            
            unitHtml = response.product['unitLabel'] +":"
            $('#pricing .unit').html(unitHtml);

        },
        error: function(response) {
            console.log(response);
        }
    });        
}

function addToCart(product){
    $.ajax({
        type: 'POST',
        data: product,
        dataType: "json",
        url: '/app_dev.php/ajax/addToCart',
        success: function(response) {
            $.magnificPopup.close();
            itemsNumber = response.cart.length;
            
            var itemImg = $('#pricing').find('.img-container').find('img').eq(0);
            flyToElement($(itemImg), $('.side-box .num'));
            
            $('#menu .cart .num').html(itemsNumber);
            $('#menu .cart').attr('href', "/krepselis");
            
            setTimeout(function() {
                window.location.href = "/krepselis";
            }, 500);
        },
        error: function(response) {
            // console.log(response);
        }
    });        
}

$('#pricing form').on('submit', function(e){
    e.preventDefault();    

    var error = false;
    $('#pricing .delivery-date').removeClass('error');
    $('#pricing .delivery-date-end').removeClass('error');
    
    productId = $("#pricing").attr('product');
    // Get other info from popup
    people = $('#pricing .qantity-persons').val();
    items = $('#pricing .qantity-cabins').val();
    service = $("#pricing select.serwis-type option:selected" ).val();
    console.log(service);
    alco = $("#pricing .alcohol-access").is(':checked');
    
    period = $("#pricing").attr('period');
    daysOrWeeks = parseInt($("#pricing").attr('daysOrWeeks'));
    
    var options = []; 
    $('#pricing .extra-options li.'+ period +' input:checked').each(function() {
        options.push($(this).attr('option-id'));
    });

    date = $('#pricing .delivery-date').val();
    dateEnd = $('#pricing .delivery-date-end').val();
    
    if (date == "") {
        error = true;
        setTimeout(function() {
            $('#pricing .delivery-date').addClass('error');
        }, 250);
    }
    
    if (dateEnd != "") {
        var period = "short";
                
        dd1 = toDate('#pricing .delivery-date');
        dd2 = toDate('#pricing .delivery-date-end');

        if (dd1 > dd2) {
            error = true;
            setTimeout(function() {
                $('#pricing .delivery-date').addClass('error');
                // $('#pricing .delivery-date-end').addClass('error');
            }, 250);            
        }

        daysOrWeeks = Math.round((dd2-dd1)/(1000*60*60*24)) + 1;

        if (daysOrWeeks <= 4) {
            period = "short";
        } else {
            period = "long";
            daysOrWeeks = Math.ceil(daysOrWeeks / 7);
        }
        
        $("#pricing").attr('period', period);
        $("#pricing").attr('daysOrWeeks', parseInt(daysOrWeeks));
    } else {
        // error = true;
        // setTimeout(function() {            
            // $('#pricing .delivery-date-end').addClass('error');
        // }, 250);
    }
    
    if ($('#pricing .term-not-valid').hasClass('active')) {
        error = true;
        setTimeout(function() {  
            $('#pricing .delivery-date').addClass('error');
            // $('#pricing .delivery-date-end').addClass('error');
        }, 250);
    }
    
    if (!error) {
        product = {
            productId: productId,
            people: people,
            items: items,
            service: service,
            alco: alco,
            options: options,
            date: date,
            dateEnd: dateEnd,
            period: period,
            daysOrWeeks: daysOrWeeks,
        }

        addToCart(product);
    }
})
    
$(document).ready(function() {
    $('.popup-pricing').magnificPopup({
        items: {
            src: $('#pricing'),
            type: 'inline'
        },

        overflowY: 'scroll', // as we know that popup content is tall we set scroll overflow by default to avoid jump
        fixedContentPos: false,
        fixedBgPos: true,
        overflowY: 'auto',
        closeBtnInside: true,
        preloader: false,
        midClick: true,
        removalDelay: 300,
        mainClass: 'my-mfp-slide-bottom',
        
        callbacks: {
            beforeOpen: function() {
                if ($($.magnificPopup.instance.st.el).hasClass('chess-click')){
					console.log('chess');
                    ga('send', {
                        hitType: 'event',
                        eventCategory: 'Produkt',
                        eventAction: 'show',
                        eventLabel: 'szachownica-popup'
                    });
                }
                
                productId = $($.magnificPopup.instance.st.el).attr('product');
                loadInfo =  $($.magnificPopup.instance.st.el).attr('load-info');
                
                if (loadInfo) {
                    getProductDetails(productId);
                }
                
                var dateNow = new Date();
                var date = dateNow.getDate + "/" + (dateNow.getMonth() + 1) + "/" + dateNow.getFullYear();
                
                $("#pricing").attr('product', productId);
                $('#pricing .delivery-date').removeClass('error');
                $('#pricing .delivery-date-end').removeClass('error');
                
                $('#pricing .delivery-date').datepicker('update', date);
                $('#pricing .delivery-date-end').datepicker('update', date);

                // +/- inputs in popup
                $("#pricing .counting-box").append('<div class="inc btn-count"><i class="fa fa-plus" aria-hidden="true"></i></div><div class="dec btn-count"><i class="fa fa-minus" aria-hidden="true"></i></div>');               
                
                var that = this
                
                $('#pricing .close-popup').click(function(){
                    that.close()
                })
                                
                $(".btn-count").on("click", function() {
                    var $button = $(this);
                    var oldValue = $button.parent().find("input").val();

                    if ($button.hasClass('inc')) {
                        var newVal = parseFloat(oldValue) + 1;
                    } else {
                    // Don't allow decrementing below zero
                        if (oldValue > 1) {
                        var newVal = parseFloat(oldValue) - 1;
                    } else {
                        newVal = 1;
                        }
                    }

                    var input = $button.parent().find("input");
                    input.val(newVal);
                    
                    if (input.hasClass('qantity-persons')) {
                        setCabinsNumber(newVal, period);
                    }
                });
                
                $('input.qantity-persons').on('change paste keyup', function(){
                    personsNumber = $(this).val();                    
                    setCabinsNumber(personsNumber, period);
                })
            }
        }
    });
});