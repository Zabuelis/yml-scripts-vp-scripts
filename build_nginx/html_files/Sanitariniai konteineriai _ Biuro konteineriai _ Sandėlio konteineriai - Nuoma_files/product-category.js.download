/**
 * Created by Kubson on 09.02.2017.
 * Updated by Gootson on 03.03.2017
 */

// products filter 
function search() {
    var filter_options = new Array();
    var filter_destiny = new Array();
    var filter_container = new Array();
    var filter_fence = new Array();
    var inputs = $(".filter-checkbox:checked");
    var filter_items = $(".sidebar-filter-products .item-product");
    var filter_period = $('#filters input[name=periods]:checked').val();
    var filter_container_category = $('#filters .containers-category:checked');
    var filter_fence_category = $('#filters .fence-category:checked');
    
    /*
    if(typeof filter_category == 'undefined' || filter_category == 'on'){
        filter_category = 0;
    }
    */
   
    $.each(inputs, function (key, value) {
        if($(this).data("option-id")) {
            filter_options[key] = $(this).data("option-id");
        } else if($(this).data("destiny-id")) {
            filter_destiny[key] = $(this).data("destiny-id");
        }
    });
    
    $.each(filter_container_category, function (key, value) {
        if($(this).data("category-id")) {
            filter_container[key] = $(this).data("category-id");
        }
    });
    
    $.each(filter_fence_category, function (key, value) {
        if($(this).data("category-id")) {
            filter_fence[key] = $(this).data("category-id");
        }
    });

    $.each(filter_items, function (key, value) {
        $(this).removeClass("hide");
        $(this).show();
    });

    
    // options
    $.each(filter_options, function (k, value) {
        $.each(filter_items, function (l, item) {
            if ($(this).hasClass('hide') == false) {
                if ($(this).hasClass("option-" + value) == false) {
                    $(this).hide();
                    $(this).addClass("hide");
                }
            }
        });
    });
    
    // destiny
    if(filter_destiny.length > 0) {
        $.each(filter_destiny, function (k, value) {
            $.each(filter_items, function (l, item) {
                if ($(this).hasClass('hide') == false) {
                    if ($(this).hasClass("destiny-" + value) == false) {
                        $(this).hide();
                        $(this).addClass("hide");
                    }
                }
            });
        });
    }
    
    // fence categories
    if(filter_fence.length > 0) {
        $.each(filter_items, function (l, item) {
            var ok = false;
            $.each(filter_fence, function (k, value) {                
                if ($(item).hasClass("category-" + value)) {
                    ok = true;
                }            
            });

            if(!ok) {
                $(item).hide();
                $(item).addClass("hide");
            }
        });
    }

    // period long/short
    $.each(filter_items, function (l, item) {
        if(typeof filter_period != "undefined"){
            if ($(this).hasClass('hide') == false) {
                if ($(this).hasClass(filter_period) == false) {
                    $(this).hide();
                    $(this).addClass("hide");
                }
            }
        }
    });

    // kontenery - category
    /*
    if(filter_category > 0) {
        $.each(filter_items, function (l, item) {
            if ($(this).hasClass('hide') == false) {
                if ($(this).hasClass('category-'+filter_category) == false) {
                    $(this).hide();
                    $(this).addClass("hide");
                }
            }
        });
    }
    */
    
    if(filter_container.length > 0) {
        $.each(filter_items, function (l, item) {
            var ok = false;
            $.each(filter_container, function (k, value) {
                if ($(item).hasClass("category-" + value)) {
                    ok = true;
                }            
            });

            if(!ok) {
                $(item).hide();
                $(item).addClass("hide");
            }
        });
    }
    
    // GET PRIO
    if(typeof filter_period != "undefined"){
        var sortValue = "prio-"+filter_period;
    } else {
        var sortValue = "prio-org";
    }
    
    // SORT ITEMS BY PRIO
    $('div.item-product').sort(function (a, b) {
        var contentA = parseInt( $(a).attr(sortValue) );
        var contentB = parseInt( $(b).attr(sortValue) );            
        return (contentA < contentB) ? -1 : (contentA > contentB) ? 1 : 0;
    }).appendTo('.sidebar-filter-products .row .col-xs.12');
    
    window.setTimeout(function() { 
        $("html, body").animate({scrollTop: $('.products.sidebar-filter-products').offset().top - 110 }, 500);
    }, 100);
}


//Upgrade 2018-07-20

$(".rasyti").click(function() {
	// $("#lhc_status-icon-restore").click();
	lh_inst.lh_openchatWindow();
});

$(".buttons .filter-btn").click(function() {
	var pasirinkimas = $(this).html();
	$(".popup-pricing").removeClass("hide");
	
	// if(pasirinkimas != "Renginiui")
	// {
		// $('#persons-box').hide();
		// $('#alcohol-box').hide();
		// $('.qantity-persons').val(0);
		// $(".uzsakyti").hide();
		// $(".gauti_pasiulyma").show();
	// } else {
		// $('#persons-box').show();
		// $(".uzsakyti").show();
		// $(".gauti_pasiulyma").hide();
	// }

});

function getProductDetails(tipas, productId){
    $('#' + tipas + ' .extra-options').fadeOut();
    // default period
    $('#' + tipas + '').attr('period', 'short');
    $('#' + tipas + ' .delivery-date').val("");
    $('#' + tipas + ' .delivery-date-end').val("");
    $('#' + tipas + '').removeClass('short');
    $('#' + tipas + '').removeClass('long');
    $('#serwis-box').hide();
    $('#' + tipas + ' .term-not-valid').removeClass('active');
    $('#' + tipas + ' .rent-period').html("");
            
    var params = {
        productId: productId
    };

    $.ajax({
        type: 'POST',
        data: params,
        dataType: "json",
        url: '/app_dev.php/ajax/getProductDetails',
        success: function(response) {
            period = $('#' + tipas + '').attr('period');   
            hidden = "";
            servicePeriod = "long";
            category = response.product['category'];
            $('#' + tipas + '').attr('category', category);
            
            $.each(response.product.periods, function(index, item) {
                $('#' + tipas + '').addClass(item);
            });
            
            // if (!$('#' + tipas + '').hasClass(period)){
                // if (period == "short"){
                    // $('#' + tipas + ' .term-not-valid span').html("Produktas nuomojamas tik ilgam laikotarpiui.");
                // } else {
                    // $('#' + tipas + ' .term-not-valid span').html("Produktas nuomojamas tik trumpam laikotarpiui.");
                // }
                
                // $('#' + tipas + ' .delivery-date').addClass('error');
                // $('#' + tipas + ' .delivery-date-end').addClass('error');
                // $('#' + tipas + ' .term-not-valid').addClass('active');                
            // } else {
                // $('#' + tipas + ' .term-not-valid').removeClass('active');
                // $('#' + tipas + ' .delivery-date').removeClass('error');
                // $('#' + tipas + ' .delivery-date-end').removeClass('error');
            // }
            
            servicesHtml = "";
            $.each(response.services, function(index, item) {
                if (item.kind != "initial" && item.kind != "final" && item.kind != "init_final") {
                    if (item.kind == "everyday" || item.kind == "2days" || item.kind == "noservice") {
                        servicePeriod = "short";
                    } else {
                        servicePeriod = "long";
                    }
                    
                    if (period != servicePeriod) {
                        hidden = "hidden";
                    } else {
                        hidden = "";
                    }
                    
                    servicesHtml = servicesHtml + '<option value="'+ item.id +'" class="' + servicePeriod +' '+ hidden + '">'+ item.name +'</option>'
                }
            });
            
            $('#' + tipas + ' select.serwis-type').html(servicesHtml);
            $('#' + tipas + ' select').niceSelect('update');
            
            anyVisible = false;
            $('#' + tipas + ' select.serwis-type option').each(function() {
                var val = $(this).attr('value');
                if(!anyVisible){
                    $('#' + tipas + ' .nice-select.serwis-type .current').html("");
                    $('#' + tipas + ' .nice-select.serwis-type .list li').removeClass('selected').removeClass('focus');
                }
                if(!$(this).hasClass('hidden') && $(this).hasClass(period)){
                    if(!anyVisible){
                        $('#' + tipas + ' .nice-select.serwis-type .list li[data-value='+val+']').addClass('selected').addClass('focus');
                        $('#' + tipas + ' .nice-select.serwis-type .current').html($(this).html());
                        $(this).prop('selected', true);
                    }
                    
                    $('#' + tipas + ' .nice-select.serwis-type .list li[data-value='+val+']').removeClass('hidden');
                    anyVisible = true;
                } else {
                    $('#' + tipas + ' .nice-select.serwis-type .list li[data-value='+val+']').addClass('hidden');
                    $('#' + tipas + ' .nice-select.serwis-type .list li[data-value='+val+']').removeClass('selected').removeClass('focus');
                }
            });
            
            if(!anyVisible) {
                $('#serwis-box').hide();
            } else {
                $('#serwis-box').show();
            }
            
            /*
            if(servicesHtml == "") {
                $('#serwis-box').hide();
            } else {
                $('#serwis-box').show();
            }
            */
            
            optionsHtml = "";
            
            $.each(response.options, function(index, item) {
                if (period != item.term) {
                    hidden = "hidden";
                } else {
                    hidden = "";
                }
                
                optionsHtml = optionsHtml + '<li class="' +item.term +' '+ hidden + '"><label class="control red"><input type="checkbox" name="option-'+item.id +'" option-id="' +item.id +'"><i class="state"></i><span class="item">'+ item.name +'</span></label></li>'
            });

            $('#' + tipas + ' .extra-options').hide().html(optionsHtml).fadeIn();
            
            if (category == "Inne produkty" || category == "Serwis") {
                $('.extra-options-label').html("Papildomos paslaugos:");
            } else {
                $('.extra-options-label').html("Papildomai galima užsisakyti:");
            }
            
            var anyVisible = false;
            $('#' + tipas + ' .extra-options li').each(function() {
                if(!$(this).hasClass('hidden') && $(this).hasClass(period)){
                    anyVisible = true;
                }
            });
                       
            if (optionsHtml == "" || !anyVisible) {
                $('.extra-options-label').hide();
            } else {
                $('.extra-options-label').show();
            }
                        
            /*
            if (category == "Inne produkty" || category == "Serwis" || category == "Przyczepy") {
                $('#end-date-box').addClass('active');
                $('#end-date-box').show();
            } else {
                $('#end-date-box').removeClass('active');
                $('#end-date-box').hide();
            }
            */
           
            $('#end-date-box').addClass('active');
            $('#end-date-box').show();
            
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
            $('#' + tipas + ' .unit').html(unitHtml);
            
        },
        error: function(response) {
            console.log(response);
        }
    });        
}

function addToCart(product) {
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

function gautiPasiulyma(product) {
    $.ajax({
        type: 'POST',
        data: product,
        dataType: "json",
        url: '/app_dev.php/ajax/GautiPasiulyma',
        success: function(response) {      
			console.log(response);		
            $.magnificPopup.close();
            // itemsNumber = response.cart.length;
            
            // var itemImg = $('#pricing').find('.img-container').find('img').eq(0);
            // flyToElement($(itemImg), $('.side-box .num'));
            
            // $('#menu .cart .num').html(itemsNumber);
            // $('#menu .cart').attr('href', "/krepselis");
            
            // setTimeout(function() {
                // window.location.href = "/krepselis";
            // }, 500);
        },
        error: function(response) {
            console.log(response);
        }
    });        
}

function saveFilters(period, options, href){
    var data = {
        period: period,
        options: options
    };
    
    $.ajax({
        type: 'POST',
        data: data,
        dataType: "json",
        url: '/app_dev.php/ajax/saveFilters',
        success: function(response) {
            // console.log(response);
            window.location.href = href;
        },
        error: function(response) {
            // console.log(response);
            window.location.href = href;
        }
    });        
}

$('#pricing form').on('submit', function(e){
    e.preventDefault();
    
    var error = false;
    $('#pricing .delivery-date.error').removeClass('error');
    $('#pricing .delivery-date-end.error').removeClass('error');

    productId = $("#pricing").attr('product');
    // Get other info from popup
    people = $('#pricing .qantity-persons').val();
    
    if(typeof people == "undefined"){
        people = 0;
    }
    
    items = $('#pricing .qantity-cabins').val();
    service = $("#pricing select.serwis-type option:selected" ).val();
    alco = $("#pricing .alcohol-access").is(':checked');
    
    if(typeof alco == "undefined"){
        alco = false;
    }

    date = $('#pricing .delivery-date').val();
    dateEnd = $('#pricing .delivery-date-end').val();
    period = $('#pricing').attr('period');
    daysOrWeeks = $('#pricing').attr('daysorweeks');

    var options = [];
    $('#pricing .extra-options li.'+ period +' input:checked').each(function() {
        options.push($(this).attr('option-id'));
    });

    if (date == "") {
        error = true;
        setTimeout(function() {
            $('#pricing .delivery-date').addClass('error');
        }, 250);
    }
    
    if (dateEnd == "") {
        error = true;
        setTimeout(function() {
            $('#pricing .delivery-date-end').addClass('error');
        }, 250);
    }
    
    if (date != "") {
        dd1 = toDate('#pricing .delivery-date');
        dd2 = toDate('#pricing .delivery-date-end');

        if (dd1 > dd2 && dd2 != "") {
            error = true;
        }
    }
    
    if ($('#pricing .term-not-valid').hasClass('active')) {
        error = true;
        setTimeout(function() {  
            $('#pricing .delivery-date').addClass('error');
            $('#pricing .delivery-date-end').addClass('error');
        }, 250);
    }
    
    
    if ($('#end-date-box').hasClass('active')) {
        if ( dateEnd != "") {
            var period = "short";

            dd1 = toDate('#pricing .delivery-date');
            dd2 = toDate('#pricing .delivery-date-end');

            if (dd1 > dd2) {
                error = true;
                setTimeout(function() {
                    $('#pricing .delivery-date').addClass('error');
                    $('#pricing .delivery-date-end').addClass('error');
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
            error = true;
            setTimeout(function() {            
                $('#pricing .delivery-date-end').addClass('error');
            }, 250);
        }
    } else {
        dd1 = toDate('#pricing .delivery-date');    

        if (period == "short") {
            dd1.setDate(dd1.getDate() + parseInt(daysOrWeeks) - 1);
        } else {
            dd1.setDate(dd1.getDate() + (parseInt(daysOrWeeks) * 7) - 1);
        }

        dateEnd = dd1.getDate()+'/'+ (dd1.getMonth()+1)+'/'+ dd1.getFullYear();
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

$('#pasiulymas form').on('submit', function(e){
    e.preventDefault();
    
    var error = false;
    $('#pasiulymas .delivery-date.error').removeClass('error');
    $('#pasiulymas .delivery-date-end.error').removeClass('error');

    productId = $("#pasiulymas").attr('product');
    // Get other info from popup
    people = $('#pasiulymas .qantity-persons').val();
    
    if(typeof people == "undefined"){
        people = 0;
    }
    
    items = $('#pasiulymas .qantity-cabins').val();
    service = $("#pasiulymas select.serwis-type option:selected" ).val();
    alco = $("#pasiulymas .alcohol-access").is(':checked');
    
    if(typeof alco == "undefined"){
        alco = false;
    }

    date = $('#pasiulymas .delivery-date').val();
    dateEnd = $('#pasiulymas .delivery-date-end').val();
    period = $('#pasiulymas').attr('period');
    daysOrWeeks = $('#pasiulymas').attr('daysorweeks');

    var options = [];
    $('#pasiulymas .extra-options li.'+ period +' input:checked').each(function() {
        options.push($(this).attr('option-id'));
    });

    if (date == "") {
        error = true;
        setTimeout(function() {
            $('#pasiulymas .delivery-date').addClass('error');
        }, 250);
    }
    
    if (dateEnd == "") {
        error = true;
        setTimeout(function() {
            $('#pasiulymas .delivery-date-end').addClass('error');
        }, 250);
    }
    
    if (date != "") {
        dd1 = toDate('#pasiulymas .delivery-date');
        dd2 = toDate('#pasiulymas .delivery-date-end');

        if (dd1 > dd2 && dd2 != "") {
            error = true;
        }
    }
    
    if ($('#pasiulymas .term-not-valid').hasClass('active')) {
        error = true;
        setTimeout(function() {  
            $('#pasiulymas .delivery-date').addClass('error');
            $('#pasiulymas .delivery-date-end').addClass('error');
        }, 250);
    }
    

    if ($('#end-date-box').hasClass('active')) {
        if ( dateEnd != "") {
            var period = "short";

            dd1 = toDate('#pasiulymas .delivery-date');
            dd2 = toDate('#pasiulymas .delivery-date-end');

            if (dd1 > dd2) {
                error = true;
                setTimeout(function() {
                    $('#pasiulymas .delivery-date').addClass('error');
                    $('#pasiulymas .delivery-date-end').addClass('error');
                }, 250);            
            }

            daysOrWeeks = Math.round((dd2-dd1)/(1000*60*60*24)) + 1;

            if (daysOrWeeks <= 4) {
                period = "short";
            } else {
                period = "long";
                daysOrWeeks = Math.ceil(daysOrWeeks / 7);
            }

            $("#pasiulymas").attr('period', period);
            $("#pasiulymas").attr('daysOrWeeks', parseInt(daysOrWeeks));
        } else {
            error = true;
            setTimeout(function() {            
                $('#pasiulymas .delivery-date-end').addClass('error');
            }, 250);
        }
    } else {
        dd1 = toDate('#pasiulymas .delivery-date');    

        if (period == "short") {
            dd1.setDate(dd1.getDate() + parseInt(daysOrWeeks) - 1);
        } else {
            dd1.setDate(dd1.getDate() + (parseInt(daysOrWeeks) * 7) - 1);
        }

        dateEnd = dd1.getDate()+'/'+ (dd1.getMonth()+1)+'/'+ dd1.getFullYear();
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
		console.log(product);
        gautiPasiulyma(product);
    }
})
    
$(document).ready(function() {
    $(".filters-sidebar input.destiny").on('change', function() {
       $(".filters-sidebar input.destiny").not(this).prop('checked', false);
    });
    
    $("#clear-sidebar-filers").click(function(){
        $('.filters-sidebar input[type="checkbox"]').prop('checked', false);
        search();
    });

    if($(window).innerWidth() > 1366){
        $('#filters').scrollToFixed({
            marginTop: 110,
            removeOffsets: true,            
            zIndex: 0,
            limit: function() {
                    var limit = 0;
                    limit = $('#page-footer').offset().top - $(this).outerHeight() - $('.note-section').outerHeight() - $('.world-branches.departments').outerHeight();
                    return limit;
                },
        });
    }
    
    //supppor tooltip closing
    $(".support-tooltip").find(".close").click(function(){
        $(this).parent().slideUp('100')
    });

    $('.uzsakyti').magnificPopup({
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
				var tipas = "pricing";
				
                productId = $($.magnificPopup.instance.st.el).attr('product');
                productImage = $($.magnificPopup.instance.st.el).parents('.item').find('.img-container img').attr('src');
                productName = $($.magnificPopup.instance.st.el).parents('.item').find('.content h3').html();
                
                period = $('#filters input[name=periods]:checked').val();

                if(period == "long") {
                    $("#alcohol-box").hide();
                } else {
                    $("#alcohol-box").show();
                }
                
                $('#pricing .qantity-persons').val(1);
                $('#pricing .qantity-cabins').val(1);
                
                $("#pricing .img-container img").attr('src', productImage.replace('uploads/', 'uploads/small/'));
                $("#pricing .img-container .header").html(productName);
                $('#pricing .delivery-date').removeClass('error');
                
                productDetails = getProductDetails(tipas, productId);
                
                $("#pricing").attr('product', productId);
                $("#pricing").attr('period', period);
                
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
    
	$('.gauti_pasiulyma').magnificPopup({
        items: {
            src: $('#pasiulymas'),
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
				var tipas = "pasiulymas";
                productId = $($.magnificPopup.instance.st.el).attr('product');
                productImage = $($.magnificPopup.instance.st.el).parents('.item').find('.img-container img').attr('src');
                productName = $($.magnificPopup.instance.st.el).parents('.item').find('.content h3').html();
                
                period = $('#filters input[name=periods]:checked').val();

                if(period == "long") {
                    $("#alcohol-box").hide();
                } else {
                    $("#alcohol-box").show();
                }
                
                $('#pasiulymas .qantity-persons').val(1);
                $('#pasiulymas .qantity-cabins').val(1);
                
                $("#pasiulymas .img-container img").attr('src', productImage.replace('uploads/', 'uploads/small/'));
                $("#pasiulymas .img-container .header").html(productName);
                $('#pasiulymas .delivery-date').removeClass('error');
                
                productDetails = getProductDetails(tipas, productId);
                
                $("#pasiulymas").attr('product', productId);
                $("#pasiulymas").attr('period', period);
                
                // +/- inputs in popup
                $("#pasiulymas .counting-box").append('<div class="inc btn-count"><i class="fa fa-plus" aria-hidden="true"></i></div><div class="dec btn-count"><i class="fa fa-minus" aria-hidden="true"></i></div>');               
                
                var that = this
                
                $('#pasiulymas .close-popup').click(function(){
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
	
    //slider periods
    var periodsSliderDays = $("#periods-slider #days").slider({
        step: 1,
        min: 1,
        max: 4,
        value: 1,
        change: function( event, ui ) {
            $( "#period-num" ).text(ui.value );
        },
        slide: function( event, ui ) {
            $( "#period-num" ).text(ui.value );
        },
    });

    var periodsSliderWeeks = $("#periods-slider #weeks").slider({
        step: 1,
        min: 2,
        max: 52,
        value: 1,
        change: function( event, ui ) {
            $( "#period-num" ).text(ui.value );
        },
        slide: function( event, ui ) {
            $( "#period-num" ).text(ui.value );
        },
    });

    periodsSliderWeeks.slider( "disable" )
    $("#periods-slider #weeks .ui-slider-handle").css('display', 'none')

    $( "#period-num" ).text($( "#periods-slider #days" ).slider( "value" ) );

    function changeToWeeks(){
        periodsSliderDays.slider( "disable" );
        periodsSliderWeeks.slider( "enable" );
        periodsSliderWeeks.slider( "value", 1 );
        $("#period-txt").text("savaitės")
        if(!($(".filters .periods .period.long input").is(':checked'))) {
            $(".filters .periods .period.long input").prop( "checked", true );
        }
        if ($(".filters .periods .period.long input").is(':checked')){ 
            $("#periods-slider #days .ui-slider-handle").css('display', 'none')
            $("#periods-slider #weeks .ui-slider-handle").css('display', 'block')
        }
    }

    function changeToDays() {
        periodsSliderDays.slider( "enable" );
        periodsSliderDays.slider( "value", 4 );
        periodsSliderWeeks.slider( "disable" );
        $("#period-txt").text("dienos")
        if(!($(".filters .periods .period.short input").is(':checked'))) {
            $(".filters .periods .period.short input").prop( "checked", true );
        }
        if ($(".filters .periods .period.short input").is(':checked')){ 
            $("#periods-slider #days .ui-slider-handle").css('display', 'block')
            $("#periods-slider #weeks .ui-slider-handle").css('display', 'none')
        }
    }

    $("#days-wrapper").click(function(){
        if (!($(".filters .periods .period.short input").is(':checked'))){ 
            changeToDays();
            search();
        }
    })

    $("#weeks-wrapper").click(function(){
        if (!($(".filters .periods .period.long input").is(':checked'))){ 
            changeToWeeks();
            search();
        }
    })

    $('#btn-plus-period').click(function(){
        if(!($( "#periods-slider #weeks" ).hasClass('ui-state-disabled'))) {
            periodsSliderWeeks.slider("value", $( "#periods-slider #weeks" ).slider( "value") + 1);
        }

        var previousVal = periodsSliderDays.slider("value");
        if($( "#periods-slider #weeks" ).hasClass('ui-state-disabled')) {
            periodsSliderDays.slider("value", $( "#periods-slider #days" ).slider( "value") + 1);
            if(previousVal > 3) {
                changeToWeeks();
                search();
            }
        }
    })

    $('#btn-minus-period').click(function(){
        if($( "#periods-slider #weeks" ).hasClass('ui-state-disabled')) {
            periodsSliderDays.slider("value", $( "#periods-slider #days" ).slider( "value") - 1);
        }

        var previousVal = periodsSliderWeeks.slider("value");
        if(!($( "#periods-slider #weeks" ).hasClass('ui-state-disabled'))) {
            periodsSliderWeeks.slider("value", $( "#periods-slider #weeks" ).slider( "value") - 1);
            if(previousVal == 2) {
                changeToDays();
                search();
            }
        }
    })

    // filter - period
    $(".filters .periods .period.long").click(function(){
        if($(this).data('clicked', true)) {
            changeToWeeks();
            search();
        }
    })
    
    $(".filters .periods .period.short").click(function(){
         if($(this).data('clicked', true)) {
            changeToDays();
            search();
        }
    })
    
    $(".show-product-details").click(function(e){
        e.preventDefault();
        
        var period = $('#filters input[name=periods]:checked').val();
        var options = [];
        
        $(".filter-checkbox:checked").each(function(){            
            options.push($(this).data('option-id'));
        });
        
        saveFilters(period, options, $(this).attr('href'));        
    })

    // filter options
    $('#filters .filter-checkbox').change(function (e) {
        search();
    });
    
    // filter - kontenery - categories
    $('#filters .buttons input').change(function (e) {
        var categoryId = $(this).data('category-id');
        $('#filters input[name=containers-category]').val(categoryId);
        search();
    });
    
    $('.countries li').sort(function (a, b) {        
        var contentA = $(a).attr('sort');
        var contentB = $(b).attr('sort');
        return (contentA < contentB) ? -1 : (contentA > contentB) ? 1 : 0;
    }).appendTo($(".countries"));
});

$(window).load(function(){

    /*
    var filtersBox = $('#filters .content');
    
    if (filtersBox.length != 0) {
        search();
    }
    */

	// $(".popup-pricing").hide();

});