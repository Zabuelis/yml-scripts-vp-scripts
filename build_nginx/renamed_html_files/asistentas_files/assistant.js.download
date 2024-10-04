$(document).ready(function() {
    
    var separator = null;
    var activeStepDist = 0;
    var totalDist = 0;
    
    var lastScrollTop = 0;
    $(window).scroll(function(event){
        var st = $(this).scrollTop();

        if (st > lastScrollTop){
            //console.log('down');            
        } else {
            //console.log('up');
        }

        lastScrollTop = st;
       
        scrollTop = $(window).scrollTop();
        nextElement = $('.step:not(.active):first');
        if (typeof nextElement != 'undefined' && nextElement.length > 0){
            nextElementOffset = nextElement.offset().top;
            distance = (nextElementOffset - scrollTop);

            if (activeStepDist > 0) {
                currDist = distance - activeStepDist;
                proc = (currDist*100)/totalDist;
                sepLenngth = 318 - ((Math.ceil(proc)/100)*318);
                
                if (separator != null) {
                    separator.find('.step-separator-red').css('height', sepLenngth);
                }
            }

        }
    });
    
    /*
    $(window).bind('mousewheel', function(event) {
        if (event.originalEvent.wheelDelta >= 0) {
            //console.log('Scroll up');
        }
        else {
            //console.log('Scroll down');
        }                
    });
    */

    var wpStep0 = new Waypoint({
        element: document.getElementById('step-0'),
        offset: '60%',
        handler: function(direction) {
            
            if (direction === 'down') {
                $('#step-0').addClass('active');
            
                separator = $('#sep0');
                activeStepDist = $('#step-0').offset().top - $(window).scrollTop();
                nextStepDist = $('#step-1').offset().top - $(window).scrollTop();
                totalDist = nextStepDist - activeStepDist;
            } else if (direction === 'up') {
                $('#step-0').removeClass('active');
                separator.find('.step-separator-red').css('height', 0);
                separator = null;
            }
        }
    }); 
    
    var wpStep1 = new Waypoint({
        element: document.getElementById('step-1'),
        offset: '60%',
        handler: function(direction) {
            if (direction === 'down') {
                $('#step-1').addClass('active');
                separator.find('.step-separator-red').css('height', '318px');
                
                separator = $('#sep1');
                activeStepDist = $('#step-1').offset().top - $(window).scrollTop();
                nextStepDist = $('#step-2').offset().top - $(window).scrollTop();
                totalDist = nextStepDist - activeStepDist;
            } else if (direction === 'up') {
                $('#step-1 .images').fadeOut(function(){
                    $('#step-1').removeClass('active');
                    $('#step-1 .images').fadeIn();
                    
                    separator = $('#sep0');
                });
            }
        }
    });
    
    var wpStep2 = new Waypoint({
        element: document.getElementById('step-2'),
        offset: '60%',
        handler: function(direction) {
            $('#step-2').toggleClass('active');
            if (direction === 'down') {                
                separator.find('.step-separator-red').css('height', '318px');
                separator = $('#sep2');
                
                activeStepDist = $('#step-2').offset().top - $(window).scrollTop();
                nextStepDist = $('#step-3').offset().top - $(window).scrollTop();
                totalDist = nextStepDist - activeStepDist;
            } else if (direction === 'up') {
                separator = $('#sep1');
            }
        }
    });
    
    var wpStep3 = new Waypoint({
        element: document.getElementById('step-3'),
        offset: '60%',
        handler: function(direction) {
            $('#step-3').toggleClass('active');
            if (direction === 'down') {
                separator.find('.step-separator-red').css('height', '318px');
                separator = $('#sep3');                
                
                activeStepDist = $('#step-3').offset().top - $(window).scrollTop();
                nextStepDist = $('#step-4').offset().top - $(window).scrollTop();
                totalDist = nextStepDist - activeStepDist;
            } else if (direction === 'up') {
                separator = $('#sep2');
            }
        }
    });
    
    var wpStep4 = new Waypoint({
        element: document.getElementById('step-4'),
        offset: '60%',
        handler: function(direction) {
            $('#step-4').toggleClass('active');
            if (direction === 'down') {
                separator.find('.step-separator-red').css('height', '318px');
                separator = $('#sep4');                
                
                activeStepDist = $('#step-4').offset().top - $(window).scrollTop();
                nextStepDist = $('#step-5').offset().top - $(window).scrollTop();
                totalDist = nextStepDist - activeStepDist;
            } else if (direction === 'up') {
                separator = $('#sep3');
            }
        }
    });
    
    var wpStep5 = new Waypoint({
        element: document.getElementById('step-5'),
        offset: '60%',
        handler: function(direction) {
            if (direction === 'down') {
                $('#step-5').addClass('active');
                separator.find('.step-separator-red').css('height', '318px');
                separator = $('#sep5');                
                
                activeStepDist = $('#step-5').offset().top - $(window).scrollTop();
                nextStepDist = $('#step-6').offset().top - $(window).scrollTop();
                totalDist = nextStepDist - activeStepDist;
            } else if (direction === 'up') {
                $('#step-5 .images').fadeOut(function(){
                    $('#step-5').removeClass('active');
                    $('#step-5 .images').fadeIn();
                    separator = $('#sep4');
                });
            }
        }
    });
    
    var wpStep6 = new Waypoint({
        element: document.getElementById('step-6'),
        offset: '60%',
        handler: function(direction) {
            $('#step-6').toggleClass('active');
                separator.find('.step-separator-red').css('height', '318px');
                separator = $('#sep5');
        }
    });
    
    //features animation
    var waypoint = new Waypoint({
        element: document.getElementById('features'),
        offset: '60%',
        handler: function(direction) {
            setTimeout(function(){
                $('.features').find('.icon:first-child').addClass('active')
            }, 300)
            setTimeout(function(){
                $('.features').find('.icon:nth-child(2)').addClass('active')
            }, 700)
            setTimeout(function(){
                $('.features').find('.icon:nth-child(3)').addClass('active')
            }, 1100)
            setTimeout(function(){
                $('.features').find('.icon:nth-child(4)').addClass('active')
            }, 1500)
            setTimeout(function(){
                $('.features').find('.icon:nth-child(5)').addClass('active')
            }, 1900)
            setTimeout(function(){
                $('.features').find('.icon:nth-child(6)').addClass('active')
            }, 2300)
            setTimeout(function(){
                $('.features').find('.icon:nth-child(7)').addClass('active')
            }, 2700)
            setTimeout(function(){
                $('.features').find('.icon:nth-child(8)').addClass('active')
            }, 3100)
        }
    });
    
    setTimeout(function(){
        $('.assistant-tt img').addClass('animated swing');
        $('.assistant-tt img').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
            $('.assistant-tt img').removeClass('animated swing');
        });
    }, 1000);
    
    var wpAssistant = new Waypoint({
        element: document.getElementById('assistant'),
        offset: '20%',
        handler: function(direction) {
            $('.assistant-tt img').addClass('animated swing');
            $('.assistant-tt img').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
                $('.assistant-tt img').removeClass('animated swing');
            });
        }
    });
    
    $('#go-to-timeline').click(function(e){
        e.preventDefault();        
        $("html, body").animate({scrollTop: $('#timeline').offset().top - 110 }, 500);
    });
    
});

