function toDate(selector) {
    var date = $(selector).val().split("/");
    return new Date(date[2], date[1] - 1, date[0]);
}

function concatRentPeriod(period, daysOrWeeks) {
    var rentTime = daysOrWeeks;
    
    if (period == "short") {
        if (daysOrWeeks == 1) {
            rentTime = rentTime + " diena";
        } else {
            rentTime = rentTime + " dienos";
        }
    } else {
        if (daysOrWeeks == 1) {
            rentTime = rentTime + " savaitę";
        } else if (daysOrWeeks < 10) {
            rentTime = rentTime + " savaitės";
        } else {
            rentTime = rentTime + " savaitės";
        }
    }
    
    return rentTime;
}

function setCabinsNumber(personsNumber, period) {
    var cabinsNumber = $('input.qantity-cabins').val();
    var newCabinsNumber = cabinsNumber;
    
    if (period == "long") {
        if (personsNumber > 330)  { newCabinsNumber = 20; }
        if (personsNumber <= 330)  { newCabinsNumber = 20; }
        if (personsNumber <= 310)  { newCabinsNumber = 19; }
        if (personsNumber <= 290)  { newCabinsNumber = 18; }
        if (personsNumber <= 270)  { newCabinsNumber = 17; }
        if (personsNumber <= 250)  { newCabinsNumber = 16; }
        if (personsNumber <= 230)  { newCabinsNumber = 15; }
        if (personsNumber <= 210)  { newCabinsNumber = 14; }
        if (personsNumber <= 190)  { newCabinsNumber = 13; }
        if (personsNumber <= 170)  { newCabinsNumber = 12; }
        if (personsNumber <= 150)  { newCabinsNumber = 11; }
        if (personsNumber <= 135)  { newCabinsNumber = 10; }
        if (personsNumber <= 120)  { newCabinsNumber = 9; }
        if (personsNumber <= 105)  { newCabinsNumber = 8; }
        if (personsNumber <= 90)  { newCabinsNumber = 7; }
        if (personsNumber <= 75)  { newCabinsNumber = 6; }
        if (personsNumber <= 60)  { newCabinsNumber = 5; }
        if (personsNumber <= 45)  { newCabinsNumber = 4; }
        if (personsNumber <= 30)  { newCabinsNumber = 3; }
        if (personsNumber <= 30) { newCabinsNumber = 3; }
        if (personsNumber <= 20) { newCabinsNumber = 2; }
        if (personsNumber <= 12) { newCabinsNumber = 1; }
        
        $('#pricing input.qantity-cabins').val(newCabinsNumber);
    } else {
        var alco = $("#pricing .alcohol-access").is(':checked');
        
        if (alco) {
            personsNumber = parseInt(personsNumber) + Math.ceil(personsNumber * 0.15);
        }
        
        if (personsNumber > 100000)  { newCabinsNumber = 620; }
        if (personsNumber <= 100000) { newCabinsNumber = 620; }
        if (personsNumber <= 75000)  { newCabinsNumber = 491; }
        if (personsNumber <= 50000)  { newCabinsNumber = 330; }
        if (personsNumber <= 40000)  { newCabinsNumber = 270; }
        if (personsNumber <= 30000)  { newCabinsNumber = 210; }
        if (personsNumber <= 25000)  { newCabinsNumber = 182; }
        if (personsNumber <= 20000)  { newCabinsNumber = 164; }
        if (personsNumber <= 17500)  { newCabinsNumber = 146; }
        if (personsNumber <= 15000)  { newCabinsNumber = 128; }
        if (personsNumber <= 12500)  { newCabinsNumber = 104; }
        if (personsNumber <= 10000)  { newCabinsNumber = 80; }
        if (personsNumber <= 8000)   { newCabinsNumber = 64; }
        if (personsNumber <= 7000)   { newCabinsNumber = 56; }
        if (personsNumber <= 6000)   { newCabinsNumber = 48; }
        if (personsNumber <= 5000)   { newCabinsNumber = 40; }
        if (personsNumber <= 4000)   { newCabinsNumber = 32; }        
        if (personsNumber <= 3000)   { newCabinsNumber = 24; }
        if (personsNumber <= 1500)   { newCabinsNumber = 14; }
        if (personsNumber <= 1000)   { newCabinsNumber = 10; }
        if (personsNumber <= 500)    { newCabinsNumber = 6; }
        if (personsNumber <= 350)    { newCabinsNumber = 4; }
        if (personsNumber <= 200)    { newCabinsNumber = 3; }
        if (personsNumber <= 100)    { newCabinsNumber = 2; }
        if (personsNumber <= 50)     { newCabinsNumber = 1; }
        
        $('#pricing input.qantity-cabins').val(newCabinsNumber);
    }
}

$('input.alcohol-access').change(function(){
    personsNumber = $('input.qantity-persons').val();
    period = $('#pricing').attr('period');
    setCabinsNumber(personsNumber, period);
});

$('#pricing select.serwis-type').change(function(){
    var isShortPeriod = $(this).find('option:selected').hasClass('short');

    if(isShortPeriod){
        $(this).find('option.short').removeClass('user-selected');
    } else {
        $(this).find('option.long').removeClass('user-selected');
    }
    
    $(this).find('option:selected').addClass('user-selected');
});

$('#pricing .delivery-date, #pricing .delivery-date-end').on('change', function(e){
    date = $('#pricing .delivery-date').val();
    dateEnd = $('#pricing .delivery-date-end').val();
    
    $('#pricing .delivery-date').removeClass('error');
    $('#pricing .delivery-date-end').removeClass('error');
        
    var period = "short";
    var category = $('#pricing').attr('category');

    if (date != "" && dateEnd != "" && $('#end-date-box').hasClass('active')) {
                    
        dd1 = toDate('#pricing .delivery-date');
        dd2 = toDate('#pricing .delivery-date-end');

        if (dd1 > dd2) {
            error = true;
            $('#pricing .delivery-date').addClass('error');
            $('#pricing .delivery-date-end').addClass('error');
        } else {
            daysOrWeeks = Math.round((dd2-dd1)/(1000*60*60*24)) + 1;

            if (daysOrWeeks <= 4) {
                period = "short";
            } else {
                period = "long";
                daysOrWeeks = Math.ceil(daysOrWeeks / 7);
            }
            if(period == "long") {
                $("#pricing .alcohol-access").prop('checked', false);
                $("#alcohol-box").hide();
            } else {
                if (category == "Kabiny") {
                    $("#alcohol-box").show();
                }
            }

            $("#pricing").attr('period', period);
            $("#pricing").attr('daysOrWeeks', parseInt(daysOrWeeks));
            
            rentTime = concatRentPeriod(period, daysOrWeeks);;
            rentTime.replace("NaN", "1");
            $('#pricing .rent-period').html(rentTime);
            
            $('#pricing .extra-options li').each(function() {
                if (!$(this).hasClass(period)) {
                    $(this).addClass('hidden');
                } else {
                    $(this).removeClass('hidden');
                }
            });
            
            var anyVisible = false;
            $('#pricing .extra-options li').each(function() {
                if(!$(this).hasClass('hidden') && $(this).hasClass(period)){
                    anyVisible = true;
                }
            });
                       
            if (!anyVisible) {
                $('.extra-options-label').hide();
            } else {
                $('.extra-options-label').show();
            }
            
            // services
            $('#pricing select.serwis-type option').each(function() {
                if (!$(this).hasClass(period)) {
                    $(this).addClass('hidden');
                } else {
                    $(this).removeClass('hidden');
                }
            });
            
            anyVisible = false;
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
                       
            if (!anyVisible) {
                $('#serwis-box').hide();
            } else {
                $('#serwis-box').show();
                
                var cartItemSelected = $('#pricing select.serwis-type option.cart-item-selected').first();
                if (cartItemSelected.length > 0) {
                    var optionLabel = cartItemSelected.html();
                    var optionVal = cartItemSelected.val();
                    
                    $('#pricing .nice-select.serwis-type .current').html(optionLabel);
                    $('#pricing .nice-select.serwis-type .list li').removeClass('selected').removeClass('focus');
                    $('#pricing .nice-select.serwis-type .list li[data-value='+optionVal+']').addClass('selected').addClass('focus');
                    cartItemSelected.prop('selected', true);
                    setTimeout(function() {
                        cartItemSelected.removeClass('cart-item-selected');
                        cartItemSelected.addClass('user-selected');
                    }, 250);
                    
                } else {
                    var userSelected = $('#pricing select.serwis-type option.'+period+'.user-selected').first();
                    if (userSelected.length > 0) {
                        var optionLabel = userSelected.html();
                        var optionVal = userSelected.val();
                        
                        $('#pricing .nice-select.serwis-type .current').html(optionLabel);
                        $('#pricing .nice-select.serwis-type .list li').removeClass('selected').removeClass('focus');
                        $('#pricing .nice-select.serwis-type .list li[data-value='+optionVal+']').addClass('selected').addClass('focus');
                        cartItemSelected.prop('selected', true);
                    }
                }
            }
            
            // if (!$('#pricing').hasClass(period)){
            //     if (period == "short"){
            //         $('#pricing .term-not-valid span').html("Produktas nuomojamas tik ilgam laikotarpiui.");
            //     } else {
            //         $('#pricing .term-not-valid span').html("Produktas nuomojamas tik ilgam laikotarpiui.");
            //     }
                
            //     $('#pricing .delivery-date').addClass('error');
            //     $('#pricing .delivery-date-end').addClass('error');
            //     $('#pricing .term-not-valid').addClass('active');                
            // } else {
            //     $('#pricing .term-not-valid').removeClass('active');
            //     $('#pricing .delivery-date').removeClass('error');
            //     $('#pricing .delivery-date-end').removeClass('error');
            // }
        }
    } else {
        if ( $('#end-date-box').hasClass('active') ) {
            setTimeout(function() {
                $('#pricing .delivery-date').addClass('error');
                $('#pricing .delivery-date-end').addClass('error');
            }, 250);
        }
    }
});