function sendAjaxResult(contact, button) {
    $.ajax({
        type: 'POST',
        data: contact,
        dataType: "json",
        url: '/app_dev.php/ajax/saveOrder',
        success: function (response) {
            button.closest('.button-loading-wrapper').removeClass('loading');
            window.location.href = button.attr('href');
        },
        error: function (response) {
            button.closest('.button-loading-wrapper').removeClass('loading');
        }
    });
}

function sendIncognitoAjaxResult(contact, button) {
    $.ajax({
        type: 'POST',
        data: contact,
        dataType: "json",
        url: '/ajax/saveDelivery',
        success: function (response) {
            if (response.success = true) {
                window.location.hash = '';
                window.location.href = button.attr('href');
            } else {
                button.closest('.button-loading-wrapper').removeClass('loading');
                window.location.hash = '';
                window.location.href = '/';
            }
        },
        error: function (response) {
            button.closest('.button-loading-wrapper').removeClass('loading');
        }
    });
}

function getCountCart() {
    $.ajax({
        type: 'POST',
        data: '',
        dataType: "json",
        url: '/app_dev.php/ajax/countCartUpdate',
        success: function (response) {
            if (typeof(response) == "undefined" || response.success == false) {
            } else {
                $('.side-box .cart .num').html(response.count);
            }
        },
        error: function (response) {
        }
    });
}

function removeFromCart(itemIndex){
    item = {
        itemIndex: itemIndex
    };

    $.ajax({
        type: 'POST',
        data: item,
        dataType: "json",
        url: '/app_dev.php/ajax/removeFromCart',
        success: function(response) {
            itemsNumber = parseInt($('#menu .cart .num').html());
            itemsNumber = itemsNumber - 1;
            $('#menu .cart .num').html(itemsNumber);
            $('#menu .cart .num').animate({top: "-14", right: "-14", height: "26px", width: "26px", lineHeight: "28px", fontSize: "15px"}, "fast").animate({top: "-12", right: "-12", height: "22px", width: "22px", lineHeight: "24px", fontSize: "12px"}, "fast");

            $('.cart-results .item.item-'+itemIndex).fadeOut();
        },
        error: function(response) {
            // console.log(response);
        }
    });
}

function updateCartItem(product){
    $.ajax({
        type: 'POST',
        data: product,
        dataType: "json",
        url: '/app_dev.php/ajax/updateCart',
        success: function(response) {
            setUpdatedProductDetails(product.itemIndex);
            getCountCart();
        },
        error: function(response) {
            // console.log(response);
        }
    });
}

function updateCartAll(products, href){
    data = {
        products: products
    };

    $.ajax({
        type: 'POST',
        data: data,
        dataType: "json",
        url: '/app_dev.php/ajax/updateCartAll',
        success: function(response) {
            window.location.href = href;

        },
        error: function(response) {
            // console.log(response);
        }
    });
}

function setUpdatedProductDetails(itemIndex){
    peopleCount = $('#pricing .qantity-persons').val();
    itemsCount = $('#pricing .qantity-cabins').val();
    service = $("#pricing select.serwis-type").val();
    alco = $("#pricing .alcohol-access").is(':checked');
    period = $("#pricing").attr('period');
    daysOrWeeks = parseInt($("#pricing").attr('daysOrWeeks'));
    var options = "";
    $('#pricing .extra-options li.'+ period +' input:checked').each(function() {
        options = options + $(this).attr('option-name') + ', ';
    });

    $('.cart-results .item-'+itemIndex+' .all-extra-options input').removeAttr('checked');

    $('#pricing .extra-options input').each(function() {
        name = $(this).attr('name');
        checked = $(this).prop('checked');
        $('.cart-results .item-'+itemIndex+' .all-extra-options input[name="'+ name +'"]').attr('checked', checked);
    });

    date = $('#pricing .delivery-date').val();
    dateEnd = $('#pricing .delivery-date-end').val();

    $('.cart-results .item-'+itemIndex+' .extra-options').html(options);

    $('.cart-results .item-'+itemIndex+' select.serwis-type').html("");
    $('#pricing .all-services option.'+period ).clone().appendTo('.cart-results .item-'+itemIndex+' select.serwis-type');
    $('.cart-results .item-'+itemIndex+' select.serwis-type').val(service);
    $('.cart-results .item-'+itemIndex+' select').niceSelect('update');

    $('.cart-results .item-'+itemIndex+' .qantity-cabins').val(itemsCount);
    $('.cart-results .item-'+itemIndex+' .qantity-persons').val(peopleCount);
    $('.cart-results .item-'+itemIndex+' .start-delivery-date').html(date);
    $('.cart-results .item-'+itemIndex+' select').niceSelect('update');
    $('.cart-results .item-'+itemIndex).attr('alco', alco);

    $('.cart-results .item-'+itemIndex).attr('period', period);
    $('.cart-results .item-'+itemIndex).attr('daysOrWeeks', daysOrWeeks);

    $('.cart-results .item-'+itemIndex).attr('end-delivery-date', dateEnd);

    rentTime = concatRentPeriod(period, daysOrWeeks);
    $('.cart-results .item-'+itemIndex+' .rent-period').html(rentTime);

}

function setProductDetails(itemIndex){
    img = $('.cart-results .item-'+itemIndex+' .img-container img').attr('src');
    name = $('.cart-results .item-'+itemIndex+' .item-description-container .header').html();
    options = $('.cart-results .item-'+itemIndex+' .all-extra-options').html();
    serviceHtml = $('.cart-results .item-'+itemIndex+' select.serwis-type').html();

    if (typeof serviceHtml == "undefined") {
        serviceHtml = "";
    }

    service = $('.cart-results .item-'+itemIndex+' select.serwis-type').val();
    serviceAll = $('.cart-results .item-'+itemIndex+' .all-services').html();

    if (typeof serviceAll == "undefined") {
        serviceAll = "";
    }

    itemsCount = $('.cart-results .item-'+itemIndex+' .qantity-cabins').val();
    peopleCount = $('.cart-results .item-'+itemIndex+' .qantity-persons').val();
    date = $('.cart-results .item-'+itemIndex+' .start-delivery-date').html();
    dateEnd = $('.cart-results .item-'+itemIndex).attr('end-delivery-date');
    alco = $('.cart-results .item-'+itemIndex).attr('alco');
    unit = $('.cart-results .item-'+itemIndex+' .unit').html();
    category = $('.cart-results .item-'+itemIndex).attr('category');

    period = $('.cart-results .item-'+itemIndex).attr('period');
    daysOrWeeksOrg = $('.cart-results .item-'+itemIndex).attr('daysOrWeeks');

    rentPeriod = $('.cart-results .item-'+itemIndex+' .rent-period').html();

    shortAvailable = $('.cart-results .item-'+itemIndex).hasClass('short');
    longAvailable = $('.cart-results .item-'+itemIndex).hasClass('long');

    if (shortAvailable) {
        $("#pricing").addClass('short');
    } else {
        $("#pricing").removeClass('short');
    }

    if (longAvailable) {
        $("#pricing").addClass('long');
    } else {
        $("#pricing").removeClass('long');
    }

    $("#pricing .img-container img").attr('src', img.replace('uploads/', 'uploads/small/'));
    $("#pricing .img-container .header").html(name);
    $('#pricing .extra-options').html(options);

    if (options == "") {
        $('.extra-options-label').hide();
    } else {
        $('.extra-options-label').show(); 
    }

    if (typeof serviceAll == "undefined" || serviceAll == "") {
        $('#serwis-box').hide();
    } else {
        $('#pricing select.serwis-type').html(serviceAll);
        $('#pricing select.serwis-type option[value='+ service+']').addClass('cart-item-selected');
    }

    $('#pricing select.serwis-type').val(service);
    $('#pricing .all-services').html(serviceAll);
    $('#pricing select').niceSelect('update');
    $('#pricing .qantity-cabins').val(itemsCount);
    $('#pricing .qantity-persons').val(peopleCount);
	// alert(category);
    if (peopleCount == 0 || category != "Biotualetai") {
        $('#persons-box').hide();
    } else {
        $('#persons-box').show();
    }

    $("#pricing .delivery-date").datepicker('update', date);

    dateEnd = $('.cart-results .item-'+itemIndex).attr('end-delivery-date');
    $("#pricing .delivery-date-end").datepicker('update', dateEnd);

    if (alco == "true") {
        $("#pricing .alcohol-access").prop('checked', true);
    } else {
        $("#pricing .alcohol-access").prop('checked', false);
    }

    if (category != "Biotualetai") {
        $('#alcohol-box').hide();
    } else {
        $('#alcohol-box').show();
    }

    $("#pricing").attr('period', period);
    $("#pricing").attr('daysOrWeeks', parseInt(daysOrWeeksOrg));

    $('#pricing .rent-period').html(rentPeriod);
    $('#pricing .unit').html(unit);
    $("#pricing").attr('category', category);

    /*
    dd1 = toDate('#pricing .delivery-date');

    if (period == "short") {
        dd1.setDate(dd1.getDate() + parseInt(daysOrWeeksOrg) - 1);
    } else {
        dd1.setDate(dd1.getDate() + (parseInt(daysOrWeeksOrg) * 7) - 1);
    }

    dateEnd = dd1.getDate()+'/'+ (dd1.getMonth()+1)+'/'+ dd1.getFullYear();
    */

    $('#pricing .extra-options li').each(function() {
        if (!$(this).hasClass(period)) {
            $(this).addClass('hidden');
        } else {
            $(this).removeClass('hidden');
        }
    });
}

$('#pricing form').on('submit', function(e){
    e.preventDefault();
    var error = false;
    $('#pricing .delivery-date').removeClass('error');
    $('#pricing .delivery-date-end').removeClass('error');

    itemIndex = $("#pricing").attr('item-index');
    // Get other info from popup
    people = $('#pricing .qantity-persons').val();
    items = $('#pricing .qantity-cabins').val();
    service = $("#pricing select.serwis-type option:selected" ).val();
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

    // if (dateEnd == "") {
        // error = true;
        // setTimeout(function() {
            // $('#pricing .delivery-date-end').addClass('error');
        // }, 250);
    // }

    if (date != "" && dateEnd != "") {
        dd1 = toDate('#pricing .delivery-date');
        dd2 = toDate('#pricing .delivery-date-end');

        if (dd1 > dd2) {
            error = true;
        }
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
            itemIndex: itemIndex,
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

        $.magnificPopup.close();
        updateCartItem(product);
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
                itemIndex = $($.magnificPopup.instance.st.el).parents('.item').attr('item-index');
                setProductDetails(itemIndex);
                $("#pricing").attr('item-index', itemIndex);
                $('#pricing .delivery-date').removeClass('error');
                $('#pricing .delivery-date-end').removeClass('error');
                $('#end-date-box').show();

                var period = $('#pricing').attr('period');
                var category = $('#pricing').attr('category');
                if(period == "long") {
                    $("#pricing .alcohol-access").prop('checked', false);
                    $("#alcohol-box").hide();
                } else {
                    if (category == "Biotualetai") {
                        $("#alcohol-box").show();
                    }
                }

                // +/- inputs in popup
                $("#pricing .counting-box").append('<div class="inc btn-count"><i class="fa fa-plus" aria-hidden="true"></i></div><div class="dec btn-count"><i class="fa fa-minus" aria-hidden="true"></i></div>');

                var that = this

                $('#pricing .close-popup').click(function(){
                    that.close()
                })

                $("#pricing .btn-count").on("click", function() {
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

                        /*
                        cabinsNumber = $('input.qantity-cabins').val();
                        if (newVal > 12 && cabinsNumber < 2) {
                            $('#pricing input.qantity-cabins').val(2);
                        }
                        if (newVal > 20 && cabinsNumber < 3) {
                            $('#pricing input.qantity-cabins').val(3);
                        }

                        if (newVal <= 12 && cabinsNumber >= 2) {
                            $('#pricing input.qantity-cabins').val(1);
                        }
                        if (newVal <= 20 && newVal > 12 && cabinsNumber >= 3) {
                            $('#pricing input.qantity-cabins').val(2);
                        }
                        */
                    }
                });

                $('input.qantity-persons').on('change paste keyup', function(){
                    personsNumber = $(this).val();
                    setCabinsNumber(personsNumber, period);

                    /*
                    cabinsNumber = $('input.qantity-cabins').val();

                    if (personsNumber > 12 && cabinsNumber < 2) {
                        $('#pricing input.qantity-cabins').val(2);
                    }
                    if (personsNumber > 20 && cabinsNumber < 3) {
                        $('#pricing input.qantity-cabins').val(3);
                    }

                    if (personsNumber <= 12 && cabinsNumber >= 2) {
                        $('#pricing input.qantity-cabins').val(1);
                    }
                    if (personsNumber <= 20 && personsNumber > 12 && cabinsNumber >= 3) {
                        $('#pricing input.qantity-cabins').val(2);
                    }
                    */
                })
            }
        }
    });

    $(".cart-results .item .counting-box").append('<div class="inc btn-count"><i class="fa fa-plus" aria-hidden="true"></i></div><div class="dec btn-count"><i class="fa fa-minus" aria-hidden="true"></i></div>');

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
            cabinsNumber = $button.closest('.item-action-container').find('input.qantity-cabins').val();

            if (newVal > 12 && cabinsNumber < 2) {
                $button.closest('.item-action-container').find('input.qantity-cabins').val(2);
            }
            if (newVal > 20 && cabinsNumber < 3) {
                $button.closest('.item-action-container').find('input.qantity-cabins').val(3);
            }
        }
    });

    //delete cart-results item
    $('.cart-results .item .delete').click(function(e){
        e.preventDefault();
        itemIndex = $(this).parent().attr('item-index');
        removeFromCart(itemIndex);
    })

    $('#shipping-data').click(function(){
        if($("#shipping-data input").is(':checked')) {
            $('#shipping-data-hide').slideUp();
        } else {
            $('#shipping-data-hide').slideDown();
        }
    })

    $("#cart-summary .item").click(function(){
        if($(this).hasClass('open')){
            $(this).removeClass('open')
        } else {
            $(this).addClass('open');
        }
    })

    $("#phone").keypress(function (e) {
        if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
            return false;
        }
    });

    function validatepesel(pesel) {
        var reg = /^[0-9]{11}$/;
        if(reg.test(pesel) == false)
            return false;
        else
        {
			// console.log(parseInt(pesel.substring(5, 7)));
			// console.log(parseInt(pesel.substring(3, 5)));
			
            var digits = (""+pesel).split("");
            if ((parseInt(pesel.substring(5, 7)) > 31)||(parseInt(pesel.substring(3, 5)) > 12))
                return false;

            var checksum = (parseInt(digits[0])*1 + parseInt(digits[1])*2 + parseInt(digits[2])*3 + parseInt(digits[3])*4 + parseInt(digits[4])*5 + parseInt(digits[5])*6 + parseInt(digits[6])*7 + parseInt(digits[7])*8 + parseInt(digits[8])*9 + parseInt(digits[9]*1))%11;
			
			console.log("Checksum: " + checksum);
			
            if(checksum==0) checksum = 10;
            checksum = 10 - checksum;
			console.log(checksum + ", " + parseInt(digits[10]));
            return (parseInt(digits[10])==checksum);
        }
    }

    function validatenip(nip) {
        var nipWithoutDashes = nip.replace(/-/g,"");
        var reg = /^[0-9]{10}$/;
        if(reg.test(nipWithoutDashes) == false) {
            return false;}
        else
        {
            var digits = (""+nipWithoutDashes).split("");
            var checksum = (6*parseInt(digits[0]) + 5*parseInt(digits[1]) + 7*parseInt(digits[2]) + 2*parseInt(digits[3]) + 3*parseInt(digits[4]) + 4*parseInt(digits[5]) + 5*parseInt(digits[6]) + 6*parseInt(digits[7]) + 7*parseInt(digits[8]))%11;

            return (parseInt(digits[9])==checksum);
        }
    }

    $(".register-send").on("click", function(e) {
        e.preventDefault();
        var button = $(this);
        var error = false;
        $('.cart-contact-data input').removeClass('error');

        button.closest('.button-loading-wrapper').addClass('loading');
        var form = button.closest("form");

        var newpass = $('#register-password').val();
        var pass = $('#register-password-repeat').val();

        if(pass != newpass) {
            $('#register-password').addClass('error');
            $('#register-password-repeat').addClass('error');
            error = true;
        }

        kind = form.find('#kind').val();
        person = form.find("#osoba-fizyczna").prop("checked");
        industry = form.find("#dzialalnosc-gospodarcza").prop("checked");
        company = form.find("#firma").prop("checked");

        customer_first = form.find("#customerFirstname").val();
        customer_second = form.find("#customerSurname").val();
        customer_postal = form.find("#company-postal-code").val();
        if(customer_first == "") {
            error = true;
            $('#customerFirstname').addClass('error');
        }
        if(customer_second == "") {
            error = true;
            $('#customerSurname').addClass('error');
        }
        // if(customer_postal == "") {
            // error = true;
            // $('#company-postal-code').addClass('error');
        // }
        clientName = $('#customerFirstname').val();
        clientEmail = $('#contactEmail').val();
        clientPhone = $('#contactPhone').val();
        // clientPostalCode = $('#company-postal-code').val();
        if(clientName == "") {
            error = true;
            if(kind == "incognito") {
                $('#incognitoFirstname').addClass('error');
            }else{
                $('#customerFirstname').addClass('error');
            }
        }
        var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if(!regex.test(clientEmail)) {
            error = true;
            if(kind == "incognito") {
                $('#incognitoEmail').addClass('error');
            }else{
                $('#contactEmail').addClass('error');
            }
        }
        if(clientPhone == "") {
            error = true;
            if(kind == "incognito") {
                $('#incognitoPhone').addClass('error');
            }else{
                $('#contactPhone').addClass('error');
            }
        }
        // if(clientPostalCode == "") {
            // error = true;
            // if(kind == "incognito") {
                // $('#incognito-postal-code').addClass('error');
            // }else{
                // $('#company-postal-code').addClass('error');
            // }
        // }

        var newsAccept = false;
        if ($('#newsAccept').prop('checked')){
            newsAccept = true;
        }

        var contractAccept = true;
        // var contractAcceptInfo = "";
        // if ($('#contractAccept').prop('checked')){
            // contractAccept = true;
        // } else {
            // error = true;
            // $('#contractAccept').addClass('error');
            // contractAcceptInfo = "Zaakceptuj regulamin."
        // }

        if (error) {
            button.closest('.button-loading-wrapper').removeClass('loading');
            if(kind == "incognito") {
                $('.incognito-alert').append('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Neteisingai užpildyta forma. Prašome pataisyti.</div>')
            } else {
                $('.register-alert').append('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Neteisingai užpildyta forma. Reikia ištaisyti klaidas. '+contractAcceptInfo+'</div>')
            }
        } else {
            contact = {
                kind: kind,
                clientName: clientName,
                clientEmail: clientEmail,
                clientPhone: clientPhone,
                // clientPostalCode: clientPostalCode,
            };

            $.ajax({
                type: 'POST',
                data: contact,
                dataType: "json",
                url: '/app_dev.php/ajax/saveOrder',
                success: function(response) {
                    console.log(response);
                    document.getElementById('registerOrderId').value = response.orderId;
                    document.getElementById('incognitoOrderId').value = response.orderId;
                    form.submit();
                },
                error: function(response) {
                    button.closest('.button-loading-wrapper').removeClass('loading');
                }
            });

            /*form.submit();*/
        }
    });

    $(".incognito-register-send").on("click", function(e) {
        e.preventDefault();
        var button = $(this);
        var error = false;
        $('.cart-contact-data input').removeClass('error');

        button.closest('.button-loading-wrapper').addClass('loading');
        var form = button.closest("form");

        kind = form.find('#kind').val();
        person = form.find("#osoba-fizyczna").prop("checked");
        industry = form.find("#dzialalnosc-gospodarcza").prop("checked");
        company = form.find("#firma").prop("checked");
        customer_first = form.find("#customerFirstname").val();
        customer_second = form.find("#customerSurname").val();
        customer_postal = form.find("#company-postal-code").val();
        if(customer_first == "") {
            error = true;
            $('#customerFirstname').addClass('error');
        }
        if(customer_second == "") {
            error = true;
            $('#customerSurname').addClass('error');
        }
        if(customer_postal == "") {
            error = true;
            $('#company-postal-code').addClass('error');
        }
        clientName = $('#customerFirstname').val();
        clientEmail = $('#contactEmail').val();
        clientPhone = $('#contactPhone').val();
        // clientPostalCode = $('#company-postal-code').val();
        if(clientName == "") {
            error = true;
            if(kind == "incognito") {
                $('#incognitoFirstname').addClass('error');
            }else{
                $('#customerFirstname').addClass('error');
            }
        }
        var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if(!regex.test(clientEmail)) {
            error = true;
            if(kind == "incognito") {
                $('#incognitoEmail').addClass('error');
            }else{
                $('#contactEmail').addClass('error');
            }
        }
        if(clientPhone == "") {
            error = true;
            if(kind == "incognito") {
                $('#incognitoPhone').addClass('error');
            }else{
                $('#contactPhone').addClass('error');
            }
        }
        // if(clientPostalCode == "") {
            // error = true;
            // if(kind == "incognito") {
                // $('#incognito-postal-code').addClass('error');
            // }else{
                // $('#company-postal-code').addClass('error');
            // }
        // }
        var newsAccept = false;
        if ($('#newsAccept').prop('checked')){
            newsAccept = true;
        }
        var contractAccept = true;
        // var contractAcceptInfo = "";
        // if ($('#contractAccept').prop('checked')){
            // contractAccept = true;
        // } else {
            // error = true;
            // $('#contractAccept').addClass('error');
            // contractAcceptInfo = "Zaakceptuj regulamin."
        // }

        if (error) {
            button.closest('.button-loading-wrapper').removeClass('loading');
            $('.incognito-alert').append('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Neteisingai užpildyta forma. Prašome pataisyti. '+contractAcceptInfo+'</div>');
        } else {
            contact = {
             kind: kind,
             clientName: clientName,
             clientEmail: clientEmail,
             clientPhone: clientPhone,
             // clientPostalCode: clientPostalCode,
             clientPromoCode: clientPromoCode
             };

            $.ajax({
             type: 'POST',
             data: contact,
             dataType: "json",
             url: '/app_dev.php/ajax/saveOrder',
             success: function(response) {
                 console.log(response);
                 document.getElementById('registerOrderId').value = response.orderId;
                 document.getElementById('incognitoOrderId').value = response.orderId;
                 form.submit();
             },
             error: function(response) {
                button.closest('.button-loading-wrapper').removeClass('loading');
             }
             });

            /*form.submit();*/
        }
    });

    $(".incognito-data-send").on("click", function(e) {
        e.preventDefault();
        var button = $(this);
        var error = false;
        $('.cart-contact-data input').removeClass('error');

        button.closest('.button-loading-wrapper').addClass('loading');
        var form = button.closest("form");

        //var newpass = $('#register-password').val();
        //var pass = $('#register-password-repeat').val();

        //if(pass != newpass) {
        //$('#register-password').addClass('error');
        //$('#register-password-repeat').addClass('error');
        //error = true;
        //}

        kind = form.find('#kind').val();
        person = form.find("#osoba-fizyczna").prop("checked");
        industry = form.find("#dzialalnosc-gospodarcza").prop("checked");
        company = form.find("#firma").prop("checked");
        tele_more = form.find("#tele-shipping").prop("checked");

        if(!person) {
            company_name = form.find("#full-company-name").val();
            nip = form.find("#nip").val();
        }
        customer_first = form.find("#customerFirstname").val();
        customer_second = form.find("#customerSurname").val();

        customer_pesel = form.find("#customerPesel").val();
        customer_id = form.find("#customerId").val();

        customer_street = form.find("#companyStreet").val();
        customer_number = form.find("#companyStreetNumber").val();
        customer_city = form.find("#company-city").val();
        customer_postal = form.find("#company-postal-code").val();
        if(!tele_more) {
            tele_street = form.find("#tele-street").val();
            tele_number = form.find("#tele-street-number").val();
            tele_city = form.find("#tele-city").val();
            tele_postal = form.find("#tele-postal-code").val();
        }

        if(!person) {
            if (company_name == "") {
                error = true;
            }
            if (nip == "") {
                error = true;
            }
        }
        if(customer_first == "") {
            error = true;
            $('#customerFirstname').addClass('error');
        }
        if(customer_second == "") {
            error = true;
            $('#customerSurname').addClass('error');
        }
        if(customer_pesel == "") {
            error = true;
            $('#customerPesel').addClass('error');
        }
        if(customer_id == "") {
            error = true;
            $('#customerId').addClass('error');
        }
        if(customer_street == "") {
            error = true;
            $('#companyStreet').addClass('error');
        }
        if(customer_number == "") {
            error = true;
            $('#companyStreetNumber').addClass('error');
        }
        if(customer_city == "") {
            error = true;
            $('#company-city').addClass('error');
        }
        if(customer_postal == "") {
            error = true;
            $('#company-postal-code').addClass('error');
        }
        if(!tele_more) {
            if (tele_street == "") {
                error = true;
                $('#tele-street').addClass('error');
            }
            if (tele_number == "") {
                error = true;
                $('#tele-street-number').addClass('error');
            }
            if (tele_city == "") {
                error = true;
                $('#tele-city').addClass('error');
            }
            if (tele_postal == "") {
                error = true;
                $('#tele-postal-code').addClass('error');
            }
        }
        if(!person) {
            if (!(validatenip(nip))) {
                error = true;
                $('#nip').addClass('error');
            }
        }
        if(!(validatepesel(customer_pesel))) {
            error = true;
            $('#customerPesel').addClass('error');
        }

        clientName = $('#customerFirstname').val();
        clientEmail = $('#contactEmail').val();
        clientPhone = $('#contactPhone').val();
        // clientPostalCode = $('#company-postal-code').val();

        if(clientName == "") {
            error = true;
            if(kind == "incognito") {
                $('#incognitoFirstname').addClass('error');
            }else{
                $('#customerFirstname').addClass('error');
            }
        }

        var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if(!regex.test(clientEmail)) {
            error = true;
            if(kind == "incognito") {
                $('#incognitoEmail').addClass('error');
            }else{
                $('#contactEmail').addClass('error');
            }
        }

        if(clientPhone == "") {
            error = true;
            if(kind == "incognito") {
                $('#incognitoPhone').addClass('error');
            }else{
                $('#contactPhone').addClass('error');
            }
        }

        // if(clientPostalCode == "") {
            // error = true;
            // if(kind == "incognito") {
                // $('#incognito-postal-code').addClass('error');
            // }else{
                // $('#company-postal-code').addClass('error');
            // }
        // }

        clientPromoCode = $('#promo-code').val();
        //kind = form.find('#kind').val();

        /* var additionalService1 = false;
         if ($('#service1').prop('checked')){
         additionalService1 = true;
         }

         var additionalService2 = false;
         if ($('#service2').prop('checked')){
         additionalService2 = true;
         }

         var additionalService3 = false;
         if ($('#service3').prop('checked')){
         additionalService3 = true;
         }

         var additionalService4 = false;
         if ($('#service4').prop('checked')){
         additionalService4 = true;
         }

         var additionalService5 = false;
         if ($('#service5').prop('checked')){
         additionalService5 = true;
         }*/

        var newsAccept = false;
        if ($('#newsAccept').prop('checked')){
            newsAccept = true;
        }

        var contractAccept = true;
        // var contractAcceptInfo = "";
        // if ($('#contractAccept').prop('checked')){
            // contractAccept = true;
        // } else {
            // error = true;
            // $('#contractAccept').addClass('error');
            // contractAcceptInfo = "Zaakceptuj regulamin."
        // }

        if (error) {
            button.closest('.button-loading-wrapper').removeClass('loading');
            $('.incognito-alert').append('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Neteisingai užpildyta forma. Prašome pataisyti. '+contractAcceptInfo+'</div>');
        } else {
            /*contact = {
                kind: kind,
                clientName: clientName,
                clientEmail: clientEmail,
                clientPhone: clientPhone,
                clientPostalCode: clientPostalCode,
                clientPromoCode: clientPromoCode
            };

            $.ajax({
                type: 'POST',
                data: contact,
                dataType: "json",
                url: '/ajax/saveOrder',
                success: function(response) {
                    console.log(response);
                    document.getElementById('registerOrderId').value = response.orderId;
                    document.getElementById('incognitoOrderId').value = response.orderId;
                    form.submit();
                },
                error: function(response) {
                    button.closest('.button-loading-wrapper').removeClass('loading');
                }
            });*/

            form.submit();
        }
    });

	$("#company").click(function(){
        if($(this).hasClass('open')){
            $("#private").removeClass('open')
        } else {
            $(this).addClass('open');
			console.log("Uždėta klasė ant company");
        }
    })
	
    $("#private").click(function(){
        if($(this).hasClass('open')){
            $("#company").removeClass('open')
        } else {
            $(this).addClass('open');
			console.log("Uždėta klasė ant private");
        }
    })


    $(".send-order").on("click", function(e) {
        e.preventDefault();
        var button = $(this);
        var error = false;
        $('.cart-contact-data input').removeClass('error');
        $('.incognito-alert').html('');

		var company_private = "";
		if($("#company").hasClass('open'))
		{
			company_private = "company";
		}
		else if($("#private").hasClass('open'))
		{	
			company_private = "private";
		}
		else
		{
			error = true;
			contractAcceptInfo = "Reikia pasirinkti kas siunčia užklausą. Ar įmonė? Ar fizinis asmuo?";
			$('html, body').animate({
				scrollTop: ($("#company").offset().top - 120)
			}, 2000);
             // $('.delivery-date1').addClass('error');
		}

        button.closest('.button-loading-wrapper').addClass('loading');
        var form = button.closest("form");

        kind = form.find('#kind').val();
        content = $('#content').val();

        customer_first = form.find("#incognitoFirstname").val();
        if(customer_first == "") {
            error = true;
            $('#incognitoFirstname').addClass('error');
        }

        clientName = $('#incognitoName').val();
        clientEmail = $('#incognitoEmail').val();
        clientPhone = $('#incognitoPhone').val();
        // clientPostalCode = $('#incognito-postal-code').val();

        if(clientName == "") {
            error = true;
            $('#incognitoName').addClass('error');
        }

        var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if(!regex.test(clientEmail)) {
            error = true;
            $('#incognitoEmail').addClass('error');
        }

        if(clientPhone == "") {
            error = true;
            $('#incognitoPhone').addClass('error');
        }

        // if(clientPostalCode == "") {
            // error = true;
            // $('#incognito-postal-code').addClass('error');
        // }

        var incognitoAccept = false;
        if ($('#incognitoAccept').prop('checked')){
            incognitoAccept = true;
        }

        var incognitoAccept2 = true;
        var incognitoAcceptNotice = "";
        // if ($('#incognitoAccept2').prop('checked')){
        //     incognitoAccept2 = true;
        // } else {
        //     error = true;
        //     $('#incognitoAccept2').addClass('error');
        //     incognitoAcceptNotice = "";
        // } 

        clientPromoCode = $('#promo-code').val();

        var additionalService1 = false;
        if ($('#service1').prop('checked')){
            additionalService1 = true;
        }

        var additionalService2 = false;
        if ($('#service2').prop('checked')){
            additionalService2 = true;
        }

        var additionalService3 = false;
        if ($('#service3').prop('checked')){
            additionalService3 = true;
        }

        var additionalService4 = false;
        if ($('#service4').prop('checked')){
            additionalService4 = true;
        }

        var additionalService5 = false;
        if ($('#service5').prop('checked')){
            additionalService5 = true;
        }

        if (error) {
            button.closest('.button-loading-wrapper').removeClass('loading');
            $('.incognito-alert').html('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Neteisingai užpildyta forma. Prašome pataisyti. '+incognitoAcceptNotice+'</div>');
        } else {
            contact = {
                kind: kind,
                clientName: clientName,
                clientEmail: clientEmail,
                clientPhone: clientPhone,
                // clientPostalCode: clientPostalCode,
                clientPromoCode: clientPromoCode,
                content: content,
                additionalService1: additionalService1,
                additionalService2: additionalService2,
                additionalService3: additionalService3,
                additionalService4: additionalService4,
                additionalService5: additionalService5,
                incognitoAccept: incognitoAccept,
				companyPrivate: company_private
            };

            $.ajax({
                type: 'POST',
                data: contact,
                dataType: "json",
                url: '/app_dev.php/ajax/saveOrder',
                success: function(response) {
                    if(response.message != "OK") {
                        button.closest('.button-loading-wrapper').removeClass('loading');
                        $('.incognito-alert').html('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Vartotojas su tokiu el. paštu jau yra užsiregistravęs, galite prisijungti ir tęsti užsakymą.</div>')
                    } else {
                        document.getElementById('incognitoOrderId').value = response.orderId;
                        form.submit();
                    }
                },
                error: function(response) {
                    button.closest('.button-loading-wrapper').removeClass('loading');
                }
            });
        }
    });

    $(".enter-contact-details").on("click", function(e) {
        e.preventDefault();
        var button = $(this);
        products = [];

        $('.cart-results div.item').each(function() {
            itemIndex = $(this).attr('item-index');
            service = $(this).find('select.serwis-type').val();
            itemsCount = $(this).find('.qantity-cabins').val();
            peopleCount = $(this).find('.qantity-persons').val();
            date = $(this).find('.start-delivery-date').html();
            dateEnd = $(this).attr('end-delivery-date');
            alco = $(this).attr('alco');
            period = $(this).attr('period');
            daysOrWeeks = parseInt($(this).attr('daysOrWeeks'));

            var options = [];
            $(this).find('.all-extra-options li.'+ period +' input').each(function() {
                if ($(this).attr('checked')) {
                    options.push($(this).attr('option-id'));
                }
            });

            product = {
                itemIndex: itemIndex,
                people: peopleCount,
                items: itemsCount,
                service: service,
                alco: alco,
                options: options,
                date: date,
                dateEnd: dateEnd,
                period: period,
                daysOrWeeks: daysOrWeeks
            };

            products.push(product);
        });

        href = button.attr('href');
        updateCartAll(products, href);
    });

    $(".save-delivery").on("click", function(e) {
        e.preventDefault();
        var button = $(this);
        var error = false;
        //window.location.hash = '';
        $('.cart-contact-data input').removeClass('error');

        var manual = $("#set-localization").hasClass("inverse");

        button.closest('.button-loading-wrapper').addClass('loading');

        var client = $('#clientId').val();
        deliveryStreet = $('#deliveryStreet').val();
        deliveryStreetNumber = $('#deliveryStreetNumber').val();
        deliveryCity = $('#deliveryCity').val();
        //deliveryRegion = $('#deliveryRegion').val();
        deliveryPostalCode = $('#deliveryPostalCode').val();

        if(deliveryStreet == "" && !manual) {
            error = true;
            $('#deliveryStreet').addClass('error');
        }

        if(deliveryStreetNumber == "" && !manual) {
            error = true;
            $('#deliveryStreetNumber').addClass('error');
        }

        if(deliveryCity == "" && !manual) {
            error = true;
            $('#deliveryCity').addClass('error');
        }

        // if(deliveryPostalCode == "" && !manual) {
            // error = true;
            // $('#deliveryPostalCode').addClass('error');
        // }

        var additionalService1 = false;
        /*if ($('#service1').prop('checked')){
            additionalService1 = true;
        }*/

        var additionalService2 = false;
        /*if ($('#service2').prop('checked')){
            additionalService2 = true;
        }*/

        var additionalService3 = false;
        /*if ($('#service3').prop('checked')){
            additionalService3 = true;
        }*/

        var additionalService4 = false;
        /*if ($('#service4').prop('checked')){
            additionalService4 = true;
        }*/

        var additionalService5 = false;
        /*if ($('#service5').prop('checked')){
            additionalService5 = true;
        }*/

        var newsAccept = false;
        /*if ($('#newsAccept').prop('checked')){
            newsAccept = true;
        }*/

        var einvoiceAccept = false;
        if ($('#einvoiceAccept').prop('checked')){
            einvoiceAccept = true;
        } else {
            error = true;
            $('#einvoiceAccept').addClass('error');
            $('.delivery-alert').html('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Sutinku PVM sąskaitą-faktūrą gauti elektroniniu formatu.</div>');
        }

        var contractAccept = true;
        // if ($('#contractAccept').prop('checked')){
        //     contractAccept = true;
        // } else {
        //     error = true;
        //     $('#contractAccept').addClass('error');
        //     $('.delivery-alert').html('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Sutinku su sutarties sąlygomis ir taisyklėmis.</div>');
        // }

        var serviceAccept = true;
        // if ($('#serviceAccept').prop('checked')){
        //     serviceAccept = true;
        // } else {
        //     error = true;
        //     $('#serviceAccept').addClass('error');
        //     $('.delivery-alert').html('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Sutinku, kad paslaugos būtų pradėtos teikti kaip numatyta sutartyje.</div>');
        // }

        // var paymentAccept = false;
        // if ($('#paymentAccept').prop('checked')){
            // paymentAccept = true;
        // } else {
            // error = true;
            // $('#paymentAccept').addClass('error');
            // $('.delivery-alert').html('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Sutinku su sutartyje pateiktomis sąlygomis.</div>');
        // }


        processingAccept = true;
        
        // isInvoice = $('#bill-or-invoice').hasClass('invoice');
        
        // billName = $('#billName').val();
        // billStreet = $('#billStreet').val();
        // billCity = $('#billCity').val();
        // billPostalCode = $('#billPostalCode').val();
        // billPESEL = $('#billPESEL').val();
        // invoiceNIP = $('#invoiceNIP').val();
        
        // if(isInvoice){
            // billInvoice = "invoice";
            
            // if (invoiceNIP == "" || !(validatenip(invoiceNIP))) {
                // error = true;
                // $('#invoiceNIP').addClass('error');
            // }
        // } else {
            // billInvoice = "bill";
            
            // if(billName == "") {
                // error = true;
                // $('#billName').addClass('error');
            // }
            
            // if(billStreet == "") {
                // error = true;
                // $('#billStreet').addClass('error');
            // }
            
            // if(billCity == "") {
                // error = true;
                // $('#billCity').addClass('error');
            // }
            
            // if(billPostalCode == "") {
                // error = true;
                // $('#billPostalCode').addClass('error');
            // }
            
            // if (billPESEL != "" && !(validatepesel(billPESEL))) {
                // error = true;
                // $('#billPESEL').addClass('error');
            // }
        // }
        
        if (!error) {
            if(!manual) {
                var geocoder = new google.maps.Geocoder();
                var address = deliveryStreet + ' ' + deliveryStreetNumber + ', ' + deliveryPostalCode + ' ' + deliveryCity;

                geocoder.geocode({
                    "address": address
                }, function(results, status) {
                    if (results[0] && status == "OK") {
                        $('#deliveryLatitude').val(results[0].geometry.location.lat().toFixed(6));
                        $('#deliveryLongitude').val(results[0].geometry.location.lng().toFixed(6));

                        contact = {
                            kind: "logged",
                            client: client,
                            deliveryStreet: deliveryStreet,
                            deliveryStreetNumber: deliveryStreetNumber,
                            deliveryCity: deliveryCity,
                            deliveryPostalCode: deliveryPostalCode,
                            manual: manual,
                            deliveryLatitude: $('#deliveryLatitude').val(),
                            deliveryLongitude: $('#deliveryLongitude').val(),
                            additionalService1: additionalService1,
                            additionalService2: additionalService2,
                            additionalService3: additionalService3,
                            additionalService4: additionalService4,
                            additionalService5: additionalService5,
                            contractAccept: contractAccept,
                            processingAccept: processingAccept,
                            serviceAccept: serviceAccept,
                            // paymentAccept: paymentAccept,
                            newsAccept: newsAccept,
                            // einvoiceAccept: einvoiceAccept,
                            // billInvoice: billInvoice,
                            // billName: billName,
                            // billStreet: billStreet,
                            // billCity: billCity,
                            // billPostalCode: billPostalCode,
                            // billPESEL: billPESEL,
                            // invoiceNIP: invoiceNIP
                        };

                        $.ajax({
                            type: 'POST',
                            data: contact,
                            dataType: "json",
                            url: '/app_dev.php/ajax/saveDelivery',
                            success: function (response) {

                                data = {client: client};

                                $.ajax({
                                    type: 'POST',
                                    data: data,
                                    dataType: "json",
                                    url: '/app_dev.php/ajax/orderOrder',
                                    success: function(response) {
                                        console.log(response);
                                        if(response.success == true) {
                                            window.location.href = button.attr('href');
                                        } else {
                                            button.closest('.button-loading-wrapper').removeClass('loading');
                                            //window.location.href = '/';
                                        }
                                    },
                                    error: function(response) {
                                        console.log(response);
                                        button.closest('.button-loading-wrapper').removeClass('loading');
                                    }
                                });

                                //button.closest('.button-loading-wrapper').removeClass('loading');
                                //window.location.href = button.attr('href');
                            },
                            error: function (response) {
                                button.closest('.button-loading-wrapper').removeClass('loading');
                            }
                        });
                    } else {
                        $('.delivery-alert').append('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Adresas nerastas. Patikrinkite ar teisingai užpildėte pristatymo duomenis.</div>');
                        button.closest('.button-loading-wrapper').removeClass('loading');
                    }
                });
            } else {
                var geolatlng = new google.maps.Geocoder();
                var latlng = new google.maps.LatLng($('#deliveryLatitude').val(), $('#deliveryLongitude').val());
                geolatlng.geocode({
                    "location": latlng
                }, function (results, status) {
                    if (results[0] && status == "OK") {

                        result_postalcode = '';
                        for(var i=0; i < results[0].address_components.length; i++)
                        {
                            var component = results[0].address_components[i];
                            if(component.types[0] == "postal_code")
                            {
                                result_postalcode = component.long_name;
                            }
                        }

                        contact = {
                            kind: "logged",
                            client: client,
                            additionalService1: additionalService1,
                            additionalService2: additionalService2,
                            additionalService3: additionalService3,
                            additionalService4: additionalService4,
                            additionalService5: additionalService5,
                            manual: manual,
                            deliveryStreet: deliveryStreet,
                            deliveryStreetNumber: deliveryStreetNumber,
                            deliveryCity: deliveryCity,
                            deliveryPostalCode: result_postalcode,
                            deliveryLatitude: $('#deliveryLatitude').val(),
                            deliveryLongitude: $('#deliveryLongitude').val(),
                            contractAccept: contractAccept,
                            processingAccept: processingAccept,
                            serviceAccept: serviceAccept,
                            // paymentAccept: paymentAccept,
                            newsAccept: newsAccept,
                            // einvoiceAccept: einvoiceAccept,
                            // billInvoice: billInvoice,
                            // billName: billName,
                            // billStreet: billStreet,
                            // billCity: billCity,
                            // billPostalCode: billPostalCode,
                            // billPESEL: billPESEL,
                            // invoiceNIP: invoiceNIP
                        };

                        $.ajax({
                            type: 'POST',
                            data: contact,
                            dataType: "json",
                            url: '/app_dev.php/ajax/saveDelivery',
                            success: function (response) {
                                data = {client: client};

                                $.ajax({
                                    type: 'POST',
                                    data: data,
                                    dataType: "json",
                                    url: '/app_dev.php/ajax/orderOrder',
                                    success: function(response) {
                                        console.log(response);
                                        if(response.success = true) {
                                            window.location.href = button.attr('href');
                                        } else {
                                            button.closest('.button-loading-wrapper').removeClass('loading');
                                            //window.location.href = '/';
                                        }
                                    },
                                    error: function(response) {
                                        console.log(response);
                                        button.closest('.button-loading-wrapper').removeClass('loading');
                                    }
                                });
                                /*button.closest('.button-loading-wrapper').removeClass('loading');
                                window.location.href = button.attr('href');*/
                            },
                            error: function (response) {
                                button.closest('.button-loading-wrapper').removeClass('loading');
                            }
                        });
                    } else {
                        $('.delivery-alert').append('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Adresas nerastas. Patikrinkite ar teisingai užpildėte pristatymo duomenis.</div>');
                        button.closest('.button-loading-wrapper').removeClass('loading');
                    }
                });
            }
        } else {
            $('.delivery-alert').html('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Neteisingai užpildyta forma. Prašome pataisyti.</div>');
            button.closest('.button-loading-wrapper').removeClass('loading');
            window.location.hash = '#cart-summary';
        }
    });

    $(".save-delivery-incognito").on("click", function(e) {
        e.preventDefault();
        var button = $(this);
        var error = false;
        //window.location.hash = '';
        $('.cart-contact-data input').removeClass('error');

        var manual = $("#set-localization").hasClass("inverse");

        button.closest('.button-loading-wrapper').addClass('loading');

        var client = $('#clientId').val();
        deliveryStreet = $('#deliveryStreet').val();
        deliveryStreetNumber = $('#deliveryStreetNumber').val();
        deliveryCity = $('#deliveryCity').val();
        //deliveryRegion = $('#deliveryRegion').val();
        deliveryPostalCode = $('#deliveryPostalCode').val();


        if(deliveryStreet == "" && !manual) {
            error = true;
            $('#deliveryStreet').addClass('error');
        }

        if(deliveryStreetNumber == "" && !manual) {
            error = true;
            $('#deliveryStreetNumber').addClass('error');
        }

        if(deliveryCity == "" && !manual) {
            error = true;
            $('#deliveryCity').addClass('error');
        }

        // if(deliveryPostalCode == "" && !manual) {
            // error = true;
            // $('#deliveryPostalCode').addClass('error');
        // }

        // isInvoice = $('#bill-or-invoice').hasClass('invoice');
        
        // billName = $('#billName').val();
        // billStreet = $('#billStreet').val();
        // billCity = $('#billCity').val();
        // billPostalCode = $('#billPostalCode').val();
        // billPESEL = $('#billPESEL').val();
        // invoiceNIP = $('#invoiceNIP').val();
        
        // if(isInvoice){
            // billInvoice = "invoice";
            
            // if (invoiceNIP == "" || !(validatenip(invoiceNIP))) {
                // error = true;
                // $('#invoiceNIP').addClass('error');
            // }
        // } else {
            // billInvoice = "bill";
            
            // if(billName == "") {
                // error = true;
                // $('#billName').addClass('error');
            // }
            
            // if(billStreet == "") {
                // error = true;
                // $('#billStreet').addClass('error');
            // }
            
            // if(billCity == "") {
                // error = true;
                // $('#billCity').addClass('error');
            // }
            
            // if(billPostalCode == "") {
                // error = true;
                // $('#billPostalCode').addClass('error');
            // }
            
            // if (billPESEL != "" && !(validatepesel(billPESEL))) {
                // error = true;
                // $('#billPESEL').addClass('error');
            // }
        // }
        
        var additionalService1 = false;
        /*if ($('#service1').prop('checked')){
            additionalService1 = true;
        }*/

        var additionalService2 = false;
        /*if ($('#service2').prop('checked')){
            additionalService2 = true;
        }*/

        var additionalService3 = false;
        /*if ($('#service3').prop('checked')){
            additionalService3 = true;
        }*/

        var additionalService4 = false;
        /*if ($('#service4').prop('checked')){
            additionalService4 = true;
        }*/

        var additionalService5 = false;
        /*if ($('#service5').prop('checked')){
            additionalService5 = true;
        }*/

        var newsAccept = false;
        if ($('#newsAccept').prop('checked')){
            newsAccept = true;
        }

        var einvoiceAccept = false;
        if ($('#einvoiceAccept').prop('checked')){
            einvoiceAccept = true;
        } else {
            error = true;
            $('#einvoiceAccept').addClass('error');
            $('.delivery-alert').html('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Sutinku gauti PVM sąskaitą-faktūrą elektroniniu format.</div>');
        }

        var contractAccept = true;
        // if ($('#contractAccept').prop('checked')){
        //     contractAccept = true;
        // } else {
        //     error = true;
        //     $('#contractAccept').addClass('error');
        //     $('.delivery-alert').html('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Sutinku su sutarties sąlygomis ir taisyklėmis.</div>');
        // }

        var serviceAccept = true;
        // if ($('#serviceAccept').prop('checked')){
        //     serviceAccept = true;
        // } else {
        //     error = true;
        //     $('#serviceAccept').addClass('error');
        //     $('.delivery-alert').html('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Sutinku kad paslaugos būtų pradėtos teikti kaip numatyta sutartyje.</div>');
        // }

        // var paymentAccept = false;
        // if ($('#paymentAccept').prop('checked')){
            // paymentAccept = true;
        // } else {
            // error = true;
            // $('#paymentAccept').addClass('error');
            // $('.delivery-alert').html('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Sutinku su sutartyje pateiktomis sąlygomis.</div>');
        // }


        processingAccept = true;
        /*
        var processingAccept = false;
        if ($('#processingAccept').prop('checked')){
            processingAccept = true;
        } else {
            error = true;
            $('#processingAccept').addClass('error');
            $('.delivery-alert').html('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Wyraź zgodę na przetwarzanie danych przez TOI TOI POLSKA Sp. z.o.o.</div>');
        }
        */

        if (!error) {
            if(!manual) {
                var geocoder = new google.maps.Geocoder();
                var address = deliveryStreet + ' ' + deliveryStreetNumber + ', ' + deliveryPostalCode + ' ' + deliveryCity;
                geocoder.geocode({
                    "address": address
                }, function(results, status) {
                    if (results[0] && status == "OK") {
                        $('#deliveryLatitude').val(results[0].geometry.location.lat().toFixed(6));
                        $('#deliveryLongitude').val(results[0].geometry.location.lng().toFixed(6));

                        contact = {
                            client: client,
                            deliveryStreet: deliveryStreet,
                            deliveryStreetNumber: deliveryStreetNumber,
                            deliveryCity: deliveryCity,
                            deliveryPostalCode: deliveryPostalCode,
                            manual: manual,
                            deliveryLatitude: $('#deliveryLatitude').val(),
                            deliveryLongitude: $('#deliveryLongitude').val(),
                            additionalService1: additionalService1,
                            additionalService2: additionalService2,
                            additionalService3: additionalService3,
                            additionalService4: additionalService4,
                            additionalService5: additionalService5,
                            contractAccept: contractAccept,
                            processingAccept: processingAccept,
                            serviceAccept: serviceAccept,
                            // paymentAccept: paymentAccept,
                            newsAccept: newsAccept,
                            einvoiceAccept: einvoiceAccept,
                            // billInvoice: billInvoice,
                            // billName: billName,
                            // billStreet: billStreet,
                            // billCity: billCity,
                            // billPostalCode: billPostalCode,
                            // billPESEL: billPESEL,
                            // invoiceNIP: invoiceNIP
                        };

                        $.ajax({
                            type: 'POST',
                            data: contact,
                            dataType: "json",
                            url: '/app_dev.php/ajax/saveDelivery',
                            success: function (response) {
                                if (response.success == true) {
                                    data = {client: client};

                                    $.ajax({
                                        type: 'POST',
                                        data: data,
                                        dataType: "json",
                                        url: '/app_dev.php/ajax/orderOrder',
                                        success: function(response) {
                                            console.log(response);
                                            if(response.success == true) {
                                                window.location.href = button.attr('href');
                                            } else {
                                                button.closest('.button-loading-wrapper').removeClass('loading');
                                                //window.location.href = '/';
                                            }
                                        },
                                        error: function(response) {
                                            console.log(response);
                                            button.closest('.button-loading-wrapper').removeClass('loading');
                                        }
                                    });
                                    /*window.location.hash = '';
                                    window.location.href = button.attr('href');*/
                                } else {
                                    button.closest('.button-loading-wrapper').removeClass('loading');
                                    window.location.hash = '';
                                    window.location.href = '/';
                                }
                            },
                            error: function (response) {
                                button.closest('.button-loading-wrapper').removeClass('loading');
                            }
                        });
                    } else {
                        $('.delivery-alert').append('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Adresas nerastas. Patikrinkite ar teisingai užpildėte pristatymo duomenis.</div>');
                        button.closest('.button-loading-wrapper').removeClass('loading');
                    }


                });
            } else {
                var geolatlng = new google.maps.Geocoder();
                var latlng = new google.maps.LatLng($('#deliveryLatitude').val(), $('#deliveryLongitude').val());
                geolatlng.geocode({
                    "location": latlng
                }, function (results, status) {
                    if (results[0] && status == "OK") {

                        result_postalcode = '';
                        for(var i=0; i < results[0].address_components.length; i++)
                        {
                            var component = results[0].address_components[i];
                            if(component.types[0] == "postal_code")
                            {
                                result_postalcode = component.long_name;
                            }
                        }

                        contact = {
                            client: client,
                            additionalService1: additionalService1,
                            additionalService2: additionalService2,
                            additionalService3: additionalService3,
                            additionalService4: additionalService4,
                            additionalService5: additionalService5,
                            manual: manual,
                            deliveryStreet: deliveryStreet,
                            deliveryStreetNumber: deliveryStreetNumber,
                            deliveryCity: deliveryCity,
                            deliveryPostalCode: result_postalcode,
                            deliveryLatitude: $('#deliveryLatitude').val(),
                            deliveryLongitude: $('#deliveryLongitude').val(),
                            contractAccept: contractAccept,
                            processingAccept: processingAccept,
                            serviceAccept: serviceAccept,
                            // paymentAccept: paymentAccept,
                            newsAccept: newsAccept,
                            einvoiceAccept: einvoiceAccept,
                            // billInvoice: billInvoice,
                            // billName: billName,
                            // billStreet: billStreet,
                            // billCity: billCity,
                            // billPostalCode: billPostalCode,
                            // billPESEL: billPESEL,
                            // invoiceNIP: invoiceNIP
                        };

                        $.ajax({
                            type: 'POST',
                            data: contact,
                            dataType: "json",
                            url: '/app_dev.php/ajax/saveDelivery',
                            success: function (response) {
                                if (response.success = true) {
                                    data = {client: client};

                                    $.ajax({
                                        type: 'POST',
                                        data: data,
                                        dataType: "json",
                                        url: '/app_dev.php/ajax/orderOrder',
                                        success: function(response) {
                                            console.log(response);
                                            if(response.success == true) {
                                                window.location.href = button.attr('href');
                                            } else {
                                                button.closest('.button-loading-wrapper').removeClass('loading');
                                                //window.location.href = '/';
                                            }
                                        },
                                        error: function(response) {
                                            console.log(response);
                                            button.closest('.button-loading-wrapper').removeClass('loading');
                                        }
                                    });
                                    /*window.location.hash = '';
                                    window.location.href = button.attr('href');*/
                                } else {
                                    button.closest('.button-loading-wrapper').removeClass('loading');
                                    window.location.hash = '';
                                    window.location.href = '/';
                                }
                            },
                            error: function (response) {
                                button.closest('.button-loading-wrapper').removeClass('loading');
                            }
                        });
                    } else {
                        $('.delivery-alert').append('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Adresas nerastas. Patikrinkite ar teisingai užpildėte pristatymo duomenis.</div>');
                        button.closest('.button-loading-wrapper').removeClass('loading');
                    }
                });
            }
        } else {
            $('.delivery-alert').append('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Neteisingai užpildyta forma. Prašome pataisyti.</div>');
            button.closest('.button-loading-wrapper').removeClass('loading');
            window.location.hash = '#cart-summary';
        }
    });

    $(".order-order").on("click", function(e) {
        e.preventDefault();

        var button = $(this);
        var client = $('#clientId').val();

        window.location.href = button.attr('href');
        /*
        button.closest('.button-loading-wrapper').addClass('loading');
        data = {client: client};

        $.ajax({
            type: 'POST',
            data: data,
            dataType: "json",
            url: '/app_dev.php/ajax/orderOrder',
            success: function(response) {
                console.log(response);
                if(response.success = true) {
                    window.location.href = button.attr('href');
                } else {
                    button.closest('.button-loading-wrapper').removeClass('loading');
                    //window.location.href = '/';
                }
            },
            error: function(response) {
                console.log(response);
                button.closest('.button-loading-wrapper').removeClass('loading');
            }
        });
        */

    });


    $(".login-register-forms .show-form").on("click", function(e) {
        e.preventDefault();
        var button = $(this);
        var box = button.next('.cart-form-box');
        
        if(box.hasClass('active') || box.hasClass('open')) {
            box.slideUp(function(){
                box.removeClass('active');
                box.removeClass('open');
            });
        } else {
            $('.cart-form-box.active, .cart-form-box.open').slideUp(function(){
               $('.cart-form-box.active').removeClass('active');
               $('.cart-form-box.open').removeClass('open');
            });
            
            box.slideDown(function(){
                box.addClass('active');
                $("html, body").animate({scrollTop: box.offset().top - 110 }, 500);
            });
        }
    });

    //$("#order-map").hide();

    $("#manually").click(function(e){
        $("#order-map").removeClass("order-map-hide");
    });
    $("#type-in").click(function(e){
        $("#order-map").addClass("order-map-hide");
    });

    /*$(".button-account span").on('click', function(e) {
        if($(this).hasClass("with-account")) {
            $('#have-not-account').fadeOut();
            $(this).addClass('activated');
            $('.without-account').removeClass('activated');
            $('#have-account').fadeIn();
            $('.tablinks.active').removeClass('active');
            $('.tabcontent.active').removeClass('active');

        }
        if($(this).hasClass("without-account")) {
            $('#have-account').fadeOut();
            $(this).addClass('activated');
            $('.with-account').removeClass('activated');
            $('#have-not-account').fadeIn();
        }
    })*/

});

