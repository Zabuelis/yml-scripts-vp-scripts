//cookies bar
$.cookiepolicy();

$(document).ready(function(){

    //set gap for fixed submenu on product page
    function setGap(){
        var gapHeight = $('.product-page.has-subnav .product-nav ul').outerHeight()
        $('.product-page.has-subnav').css({'padding-top': gapHeight})
        $('.product-page.has-subnav .product-nav').css({'margin-top': -(gapHeight)})
    }

    // new menu 2021-11-04
    // setGap()

    //set gap anchor

    function setGapAnchor() {
        var getHeightFirst = $('#page-header').outerHeight();
        var getHeightSecond = $('.product-page.has-subnav .product-nav ul').outerHeight();
        var gapHeight = getHeightFirst + getHeightSecond;
        $('.product-page a.anchor').css('top', -(gapHeight) + 30);

        $('.faq-page a.anchor').css('top', -(getHeightFirst));
        $('.question-full-category .anchor').css('top', -(getHeightFirst) - 30);
    }

    setGapAnchor();

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

    getCountCart();

    $('.side-box .cart .num').change(function(e) {
        getCountCart();
    });

    $(window).resize(function(){
        setGap();
        setGapAnchor();
    })

    //toggle active link in subnav
    $('.product-nav ul li a').click(function(){
        $('.product-nav ul li a').removeClass('active');
        $(this).addClass('active')
    })

    $('.loggedData').click(function(e){

        var button = $(this);
        button.closest('.button-loading-wrapper').addClass('loading');

        contact = {
            kind: "login",
            clientName: "",
            clientEmail: "",
            clientPhone: "",
            clientPostalCode: "",
            clientPromoCode: "",
            additionalService1: "",
            additionalService2: "",
            additionalService3: "",
            additionalService4: "",
            additionalService5: ""
        };

        $.ajax({
            type: 'POST',
            data: contact,
            dataType: "json",
            url: '/ajax/saveOrder',
            success: function(response) {
                var href = window.location.protocol + "//" + window.location.host + "/" + "krepselio-registracija";
                window.location.href = href;
            },
            error: function(response) {
                button.closest('.button-loading-wrapper').removeClass('loading');
            }
        });
    });

    // Add smooth scrolling to all links
    $("a").not('.tabs-product .tab a').on('click', function(event) {

        // Make sure this.hash has a value before overriding default behavior
        if (this.hash !== "") {
            // Prevent default anchor click behavior
            event.preventDefault();

            // Store hash
            var hash = this.hash;

            // Using jQuery's animate() method to add smooth page scroll
            // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
            $('html, body').animate({
                scrollTop: $(hash).offset().top - 135
            }, 800, function(){

            // Add hash (#) to URL when done scrolling (default click behavior)
            window.location.hash = hash;
            });
        } // End if
    });

    //filters mobile

    $('#show-filters').click(function(){
        $('#filters .content').addClass('show');
    })

    $('#close-filters, #go-filter').click(function(){
        $('#filters .content').removeClass('show');
    })

    // call user login function
    function userLogIn(login, password, target) {
        params = {
            _username: login,
            _password: password
        };
        var answear = false;
        $.ajax({
            type: 'POST',
            data: params,
            dataType: "json",
            url: '/app_dev.php/login',
            success: function(response) {
                if (typeof(response) == "undefined" || response.success == false) {
                    $('#email').addClass('error');
                    $('#password').addClass('error');
                    $('#inputEmail').addClass('error');
                    $('#inputPassword').addClass('error');
                    if (target == "krepselio-pristatymas") {
                        button.closest('.button-loading-wrapper').removeClass('loading');
                        $('.message-login').html('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Jūsų paskyra neaktyvi arba įvedėte neteisingus prisijungimo duomenis.</div>')
                    }
                    answear = false;
                } else {
                    $.magnificPopup.close();
                    if (target != "") {
                        answear = true;
                        var href = window.location.protocol + "//" + window.location.host + "/" + target;
                        window.location.href = href;
                    } else {
                        answear = true;
                    }
                }
            },
            error: function(response) {
                answear = false;
            }
        });
        return answear;
    }

    function userRegLogIn(login, password, button) {
        params = {
            _username: login,
            _password: password
        };
        var answear = false;
        $.ajax({
            type: 'POST',
            data: params,
            dataType: "json",
            url: '/app_dev.php/login',
            success: function(response) {
                if (typeof(response) == "undefined" || response.success == false) {
                    console.log('false login');
                    $('#inputEmail').addClass('error');
                    $('#inputPassword').addClass('error');
                    button.closest('.button-loading-wrapper').removeClass('loading');
                    $('.message-login').html('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Jūsų paskyra neaktyvi arba įvedėte neteisingus  prisijungimo duomenis.</div>')
                    answear = false;
                } else {
                    console.log('true login');
                    $.magnificPopup.close();
                    answear = true;
                }
            },
            error: function(response) {
                console.log('false login');
                answear = false;
            }
        });
        return answear;
    }

    function checkLogIn() {
        $.ajax({
            type: 'POST',
            data: "",
            dataType: "json",
            url: '/ajax/checkLogin',
            success: function(response) {
                if(response.success == true) {
                    return true;
                } else {
                    return false;
                }
            },
            error: function(response) {
                return false;
            }
        });
    }

    // call user login function
    function userResetPassword(email) {
        params = {
            email: email
        };

        $.ajax({
            type: 'POST',
            data: params,
            dataType: "json",
            url: '/ajax/resetFront',
            success: function(response) {
                if (typeof(response) == "undefined" || response.success != "true") {
                    $('#email-remember').addClass('error');
                    $('.message-reset').html('El. pašto adresas neegzistuoja arba slaptažodis keičiamas per daug dažnai.');
                    $('.alert-box').show();
                } else {
                    window.location.href = '/slaptazodzio-priminimas/mail';
                }
            },
            error: function(response) {
                return response;
            }
        });
    }

    $('#changepass').click(function(e) {
        e.preventDefault();
        var newpass = $('#newpass').val();
        var pass = $('#inputPassword').val();
        var email = $('#inputEmail').val();

        if (newpass == pass) {
            var params = {
                password: newpass,
                email: email
            };

            $.ajax({
                type: 'post',
                url: "/ajax/reset",
                data: params,
                success: function(response) {
                    if (typeof(response) == "undefined" || response != "true") {
                        $('#newpass').addClass('error');
                        $('#inputPassword').addClass('error');
                        $('.message').html('Slaptažodis negalėjo būti pakeistas.');
                        $('.alert-box').show();
                    } else {
                        window.location.href = '/slaptazodzio-priminimas/patvirtinimas';
                    }
                }, error: function(response) {
                    $('#newpass').addClass('error');
                    $('#inputPassword').addClass('error');
                    $('.message').html('El. pašto adresas neegzistuoja arba slaptažodis keičiamas per daug dažnai.');
                    $('.alert-box').show();
                }
            });
        } else {
            $('#newpass').addClass('error');
            $('#inputPassword').addClass('error');
            $('.message').html('Slaptažodžiai nesutampa.');
            $('.alert-box').show();
        }
    });

    $('#login-steps').click(function(e){
        e.preventDefault();
        console.log('action Login');
        $('.message-login').html('');
        var button = $(this);
        button.closest('.button-loading-wrapper').addClass('loading');
        var form = button.closest("form");

        login = $('#inputEmail').val();
        password = $('#inputPassword').val();
        errors = false;
        $('#inputEmail').removeClass('error');
        $('#inputPassword').removeClass('error');

        if (login == "") {
            $('#inputEmail').addClass('error');
            errors = true;
        } else {
            var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (!regex.test(login)) {
                $('#inputEmail').addClass('error');
                errors = true;
            }
        }
        if (password == "") {
            $('#inputPassword').addClass('error');
            errors = true;
        }
        if (!errors) {

            params = {
                _username: login,
                _password: password
            };
            var answear = false;
            $.ajax({
                type: 'POST',
                data: params,
                dataType: "json",
                url: '/app_dev.php/login',
                success: function(response) {
                    if (typeof(response) == "undefined" || response.success == false) {
                        $('#inputEmail').addClass('error');
                        $('#inputPassword').addClass('error');
                        button.closest('.button-loading-wrapper').removeClass('loading');
                        $('.message-login').html('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Jūsų paskyra neaktyvi arba įvedėte neteisingus prisijungimo duomenis.</div>')
                        answear = false;
                    } else {
                        console.log('logged in');
                        contact = {
                            kind: "saveOrder"
                        };

                        $.ajax({
                            type: 'POST',
                            data: contact,
                            dataType: "json",
                            url: 'ajax/saveOrder',
                            success: function (response) {
                                console.log("saveOrder");
                                var target = "krepselio-apibendrinimas"; //koszyk-podsumowanie
                                var href = window.location.protocol + "//" + window.location.host + "/" + target;
                                console.log(href);
                                window.location.href = href;

                                //location.reload();
                            },
                            error: function (response) {
                                button.closest('.button-loading-wrapper').removeClass('loading');
                            }
                        });
                    }
                },
                error: function(response) {
                    console.log('false login');
                    answear = false;
                }
            });
        } else {
            $('.message-login').html('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Jūsų paskyra neaktyvi arba įvedėte neteisingus prisijungimo duomenis.</div>')
            button.closest('.button-loading-wrapper').removeClass('loading');
        }
    });

    // login POPUP
    $("#login-cta").click(function(e){
        e.preventDefault();
        $("#login-form .step-1").addClass("hide");
        $("#login-form .step-2").removeClass("hide")
        $("#email-remember").focus();
    })

    // login button
    $("#btn-step-1").click(function(e){
        e.preventDefault();

        login = $('#email').val();
        password = $('#password').val();
        errors = false;
        $('#email').removeClass('error');
        $('#password').removeClass('error');

        if (login == "") {
            $('#email').addClass('error');
            errors = true;
        } else {
            var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (!regex.test(login)) {
                $('#email').addClass('error');
                errors = true;
            }
        }

        if (password == "") {
            $('#password').addClass('error');
            errors = true;
        }

        if (!errors) {
            userLogIn(login, password, "client-panel");
        }
    });

    $("#login-form #back-btn").click(function(){
        $("#login-form .step-1").removeClass("hide");
        $("#login-form .step-2").addClass("hide")
    });

    $("#login-form #btn-step-2").click(function(){
        email = $('#email-remember').val();
        errors = false;
        $('#email-remember').removeClass('error');

        if (email == "") {
            $('#email-remember').addClass('error');
            errors = true;
        } else {
            var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (!regex.test(email)) {
                $('#email-remember').addClass('error');
                errors = true;
            }
        }

        if (!errors) {
            userResetPassword(email);
        }

    });

    $("#btn-step-3").click(function(e){
        e.preventDefault();
        $.magnificPopup.close();
    });

    $('.popup-login').magnificPopup({
        type: 'inline',
        preloader: false,
        focus: '#email',

        // When elemened is focused, some mobile browsers in some cases zoom in
        // It looks not nice, so we disable it:
        callbacks: {
            beforeOpen: function() {
                if($(window).width() < 700) {
                    this.st.focus = false;
                } else {
                    this.st.focus = '#email';
                }
            },
            open: function() {
                $("#login-form .step-1").removeClass("hide");
                $("#login-form .step-2").addClass("hide");
                $("#login-form .step-3").addClass("hide");
            }
        }
    });

    $('.popup-reset').magnificPopup({
        type: 'inline',
        preloader: false,
        focus: '#email-remember',

        // When elemened is focused, some mobile browsers in some cases zoom in
        // It looks not nice, so we disable it:
        callbacks: {
            beforeOpen: function() {
                if($(window).width() < 700) {
                    this.st.focus = false;
                } else {
                    this.st.focus = '#email';
                }
            },
            open: function() {
                $("#login-form .step-1").addClass("hide");
                $("#login-form .step-2").removeClass("hide");
                $("#login-form .step-3").addClass("hide");
            }
        }
    });

    // OPEN HOME POPUP
    var popup = $('#home-popup');
    if (popup.length) {
        $.magnificPopup.open({
            items: {
                src: popup
            },
            type: 'inline',
            preloader: false,

            callbacks: {
                beforeOpen: function() {

                },
                open: function() {

                }
            }
        });

        $("#home-popup .close-popup").click(function(e){
            e.preventDefault();
            $.magnificPopup.close();
        });
    }


    //company-data-links set active
    $(".company-data-links li a").click(function(){
        $(this).addClass("active")
    })

    //company-data-links set active
    $('#affix').affix({
        offset: {
            top: function(e) {
                var $curSection = $('#dane-firmowe');
                return (this.top = $curSection.offset().top - 127);
            },
            bottom: function () {
                return (this.bottom = $('#page-footer').outerHeight(true) + 30)
            }
        }
    })

    //client panel accrodion
    var acc = $(".history-table").find(".item td:last-child");
    var i;

    for (i = 0; i < acc.length; i++) {
        acc[i].onclick = function() {
            $(this).closest(".item").next().toggleClass("active");
            $(this).closest(".item").toggleClass("active");
            var panel = $(this).closest(".item").next();
            var panelHeight = $(this).closest(".item").next().find(".content-inner").find(".inner").outerHeight(true)
            if (panel.hasClass("active")){
                panel.find(".content-inner").css("height", panelHeight)
            } else {
                panel.find(".content-inner").css("height", 0)
            }
        }
    }

    // client panel buttons
    $('#edit-data-tab').click(function(){
        $('#dane-firmowe-tab').trigger('click');
    });

    $('#orders-history-tab').click(function(){
        $('#historia-zamowien-tab').trigger('click');
    });

    $('.get-this-order').click(function(e){
        e.preventDefault();
        var button = $(this);
        var status = button.parent('.item').find('.status');
        orderId = $(this).attr('order-id');
        data = {
            order: orderId
        };
        $.ajax({
            type: 'POST',
            data: data,
            dataType: "json",
            url: '/ajax/changeStatus',
            success: function(response) {
                if(typeof(response.success) == undefined || response.success == false) {
                    $('.message').html('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Nie udało się złożyć zamówienia.</div>')
                } else {
                    window.location.href = button.attr('href');
                    /*$('.message').html('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Zamówienie zostało złożone.</div>')
                    button.hide();
                    status.addClass('ordered');
                    status.removeClass('offer-send');
                    status.html('<b>Zamówione</b>');*/
                }
            },
            error: function(response) {
                $('.message').html('<div class="alert alert-box alert-dismissible fade in active" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>Pasiūlymo negalima pateikti.</div>')
            }
        });
    });

    $('#dane-firmowe .save').click(function(){
        item = $(this).closest('.single-record');
        item.find('.value-org-box').html(item.find('.value-box input').val());
        //item.removeClass('edited');

        $('#client-full-data').submit();
    });

    $('.value-org-box').click(function(){
        item = $(this).closest('.single-record');
        item.addClass('edited');
    });


    $('#client-full-data input[type=text]').on('keydown', function(e) {
        if (e.which == 13 || e.keyCode == 13) {
            $('#client-full-data').submit();
        }
    });

    $('#client-full-data').submit(function( e ) {
        e.preventDefault();

        data = {
            fields: $(this).serializeArray()
        }

        $.ajax({
            type: 'POST',
            data: data,
            dataType: "json",
            url: '/ajax/saveFullClientData',
            success: function(response) {
                console.log(response);
                if (typeof(response) == "undefined" || response.success == false) {

                }
                else {
                    $('.single-record').removeClass('edited');
                }
            },
            error: function(response) {
                console.log(response);
                return response;
            }
        });


        /*
        var fields = $(this).find("input").serializeArray();
        $.each(fields, function(i, field) {
          console.log(field.name + ": " +field.value);
        });
        */
    });

    $('#panel-news-accept').on('change', function(){
        var checked = $(this).prop('checked');
        var id = $(this).attr('client-id');

        data = {
            id: id,
            checked: checked
        };

        console.log(data);

        $.ajax({
            type: 'POST',
            data: data,
            dataType: "json",
            url: '/ajax/savePanelNewsAccept',
            success: function(response) {
            },
            error: function(response) {
            }
        });
    });

    //toggle show label chceckbox
    $(".checbox-more").click(function(){
        textBox = $(this).prev();
        textBox.toggleClass("show");
    });

    /*
    $(".checbox-more").mousemove(function(){
        $(this).prev().addClass("show")
    })

    $(".checbox-more").mouseleave(function(){
        $(this).prev().removeClass("show")
    })
    */


    //lightbox pricing
    /*$('.popup-pricing').magnificPopup({
        type: 'ajax',
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
            ajaxContentAdded: function(mqlMobile2) {
                // +/- inputs in popup
                $("#pricing .counting-box").append('<div class="inc btn-count"><i class="fa fa-plus" aria-hidden="true"></i></div><div class="dec btn-count"><i class="fa fa-minus" aria-hidden="true"></i></div>');

                $('select').niceSelect();

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

                    $button.parent().find("input").val(newVal);

                });

                //fly image to cart
                var mqlMobile2 = window.matchMedia("screen and (max-width: 1199px)")
                mqlMobile2.addListener(flyImage)
                flyImage(mqlMobile2)

                function flyImage(){
                    if (!(mqlMobile2.matches)) {
                        $('#pricing .button.red').bind('click.fyl',function(e){
                            e.preventDefault();
                            var itemImg = $(this).parents("#pricing").find(".img-container").find('img').eq(0);
                            flyToElement($(itemImg), $('.side-box .num'));
                        })
                    } else {
                        $('#pricing .button.red').unbind('click.fyl')
                    }
                }
            }
        }

    });*/

    //match height products on cabins
    $('.filter-results .products .item .section-header').matchHeight();
    $('.filter-results .products .item .content').matchHeight({byRow: false});
    $('.filter-results .products .item').matchHeight();
    $('.offer .item').matchHeight();
    $('.offer .item .double-hedder').matchHeight();
    $('.extra-feature-icon').matchHeight();
    $('.most-often-question .category').matchHeight();
    $('.tabs-product .item-product .item').matchHeight();

    //styled select
    $('select').niceSelect();

	//set row bottom for fix header
    $(window).on('scroll', function() {
        if ($(window).scrollTop() > 0) {
            $('#page-header').addClass('set-border')
            $('#product-nav').addClass('set-border')
        } else {
            $('#page-header').removeClass('set-border')
            $('#product-nav').removeClass('set-border')
        }

        let windowWidth = $(window).width();

        if ($(window).scrollTop() > 80) {
            let onlinePages = $('#page-header').hasClass('online-header');

            if (!onlinePages) {
                $('#page-header').addClass('set-fixed');
                $('body').addClass('set-fixed');

                if (windowWidth > 1182) {
                    $('.product-page.has-subnav .product-nav').css({'position': 'fixed'});
                    $('.product-page.has-subnav .product-nav').css({'top': '80px'});
                }
            }
        } else {
            $('#page-header').removeClass('set-fixed');
            $('body').removeClass('set-fixed');

            if (windowWidth > 1182) {
                $('.product-page.has-subnav .product-nav').css({'position': 'relative'});
                $('.product-page.has-subnav .product-nav').css({'top': 0});
            }
        }
    })


    $( ".support-button" ).on( "mouseover", function() {
        $('.support-button i').addClass('animated swing');
        $('.support-button').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
            $('.support-button i').removeClass('animated swing');
        });
    });
    $( "#page-header .cart  span" ).on( "mouseover", function() {
        $('#page-header .cart  span').addClass('animated swing');
        $('#page-header .cart  span').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
            $('#page-header .cart  span').removeClass('animated swing');
        });
    });
    $( ".phone a" ).on( "mouseover", function() {
        $('.phone .inner').addClass('animated tada');
        $('.phone .inner').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
            $('.phone .inner').removeClass('animated tada');
        });
    });
	
	
    //home page main carousel
    var slideHome = $('.slider-home').owlCarousel({
        loop:true,
        nav:true,
        items: 1,
        navText: "",
        //animateOut: 'fadeOut',
        //animateIn: 'fadeIn',
        onInitialized: function(){
            $('.slider-home .owl-controls').wrapInner("<div class='container'></div>");
            $('.slider-home').append("<div class='container controls-box'><div class='slider-prev'></div><div class='slider-next'></div></div>");
        }
    })

    $('.slider-home .slider-prev').click(function() {
        slideHome.trigger('prev.owl.carousel');
    })
    $('.slider-home .slider-next').click(function() {
        slideHome.trigger('next.owl.carousel');
    })

    //about company carousel
    var sliderService = $('.slider-service').owlCarousel({
        loop:true,
        nav:true,
        items: 1,
        navText: "",
        //animateOut: 'fadeOut',
        //animateIn: 'fadeIn',
        onInitialized: function(){
            $('.slider-service .owl-controls').wrapInner("<div class='container'></div>");
            $('.slider-service').append("<div class='container controls-box'><div class='slider-prev'></div><div class='slider-next'></div></div>");
        }
    })

    $('.slider-service .slider-prev').click(function() {
        sliderService.trigger('prev.owl.carousel');
    })
    $('.slider-service .slider-next').click(function() {
        sliderService.trigger('next.owl.carousel');
    })

    sliderService.on('translated.owl.carousel', function(event) {
        var item = event.item.index;
        var element = event.target;
        $(this).find('.owl-item').children().removeClass('active')
        $(this).find('.owl-item').find('.labels').removeClass('active')
        $(this).find('.owl-item.active').children().addClass('active')
        $(this).find('.owl-item.active').find('.labels').addClass('active')
    })

    //news carousel
    $('#news-slider').owlCarousel({
        center: true,
        items:4,
        loop:true,
        margin:30,
        nav: true,
        navText: "",
        responsive:{
            992:{
                items: 4
            },
            767: {
                items: 3
            },
            479: {
                items: 2
            },
            320: {
                items: 1
            }
        }
    });

    //center header if has categories
    if ($('.banner-subpage .categories').length) {
        $('.banner-subpage .container').addClass('has-categories')
    }

    //news gallery
    $('.thumbs').magnificPopup({
		delegate: 'a',
		type: 'image',
		tLoading: 'Loading image #%curr%...',
		mainClass: 'mfp-img-mobile',
		gallery: {
			enabled: true,
			navigateByImgClick: true,
			preload: [0,1] // Will preload 0 - before current, and 1 after the current image
		},
		image: {
			tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
		}
	});

    // ocunting boxes
    /*
    $(".counting-box").append('<div class="inc btn-count"><i class="fa fa-plus" aria-hidden="true"></i></div><div class="dec btn-count"><i class="fa fa-minus" aria-hidden="true"></i></div>');
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

        console.log(newVal);

        if (input.hasClass('qantity-persons')) {
            cabinsNumber = $('input.qantity-cabins').val();
            if (newVal > 12 && cabinsNumber < 2) {
                $('#pricing input.qantity-cabins').val(2);
            }
            if (newVal > 20 && cabinsNumber < 3) {
                $('#pricing input.qantity-cabins').val(3);
            }
        }

    });
    */

    //loading button effect on cart view
    /* already done by CSS
    $(".button-loading-wrapper .button").click(function(){
        $(this).css("opacity", 0.2);
    })
    */

    //order register radiobuttons
    $('#client-register .items .content').click(function(){
        if ($(this).prev().hasClass('osoba-fizyczna')) {
            $('#client-register .company-section').addClass("hide")
        } else if ($(this).prev().hasClass('dzialalnosc-gospodarcza')) {
            $('#client-register .company-section').removeClass("hide")
        } else {
            $('#client-register .company-section').removeClass("hide")
        }
    })

    $("input.only-numbers").keypress(function (e) {
        if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
            return false;
        }
    });

})

//mobile nav
function openNav() {
    $('#page-header #menu').addClass('open')
}
function closeNav() {
    $('#page-header #menu').removeClass('open')
}

$(window).load(function(){
	// $(".zopim").hide();
	
    $('.chat-button').click(function(e){
        e.preventDefault();
        // $zopim.livechat.window.toggle();
		lh_inst.openRemoteWindow();
    });


function mediaqueryresponseMobile(mql){
    if (mql.matches) {
        $('#filters .box.one .list .control, #filters .mobile-styled').addClass('red');

        $(".tabs-order li a").click(function(){
            $("#register-info").css("display", "none")
        })
        $(".tabs-order li:nth-child(2) a").click(function(){
            $("#register-info").css("display", "block")
        })

    }else {
        var options = {
            trigger: "hover",
            placement: "top"
        };
        $('[data-toggle="popover"]').popover(options);

        $('#filters .box.one .list .control, #filters .mobile-styled').removeClass('red');
        $('#filters .content').removeClass('show');
    }
}

function mediaqueryresponseMobile2(mql2){
    if (!(mql2.matches)) {
        //cover page if submenu is open

        $("#menu .menu > li.has-subnav").hover(
            function(){
                $("body").addClass("changed submenu-active")
            }, function(){
                $("body").removeClass("submenu-active")
            }
        )

        //observe change class menu and then disable cover page if submenu is inactive
        var $div = $("body");
        var observer = new MutationObserver(function(mutations) {
            mutations.forEach(function(mutation) {
                if (mutation.attributeName === "class") {
                    var attributeValue = $(mutation.target).prop(mutation.attributeName);
                    if (attributeValue == "changed") {
                        if($("body").hasClass("changed")) {
                            setTimeout(function(){
                                if (!($("body").hasClass("submenu-active"))) {
                                    $("body").removeClass("changed")
                                }
                            }, 800)
                        }
                    }
                }
            });
        });
        observer.observe($div[0],  {
            attributes: true
        });

    } else {
        $("#menu .menu > li.has-subnav, #menu .submenu").unbind('mouseenter mouseleave');
        $("body").removeClass("submenu-active")
    }
}

var mqlMobile = window.matchMedia("screen and (max-width: 767px)");
mediaqueryresponseMobile(mqlMobile);
mqlMobile.addListener(mediaqueryresponseMobile);

var mqlMobile2 = window.matchMedia("screen and (max-width: 1199px)");
mediaqueryresponseMobile2(mqlMobile2);
mqlMobile2.addListener(mediaqueryresponseMobile2);

})
