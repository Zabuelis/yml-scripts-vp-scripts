//Save fingerprint and session for user
//    $(document).ready(function() {
        var client = new ClientJS(); // Create A New Client Object
        var fingerprint = client.getFingerprint();

        if (client.isMobile()) { // Check For Mobile Device
            if (client.isMobileAndroid()) { // Check For Android
                var device = 'android';
            } else if (client.isMobileIOS()) { // Check For iOS
                var device = 'ios';
            } else {
                var device = 'unknownMobile';
            }
        } else {
            var device = 'desktop';
        }
        var url = window.location.protocol + '//' + window.location.host + window.location.pathname;
        var data = 'device=' + device + '&url=' + url + '&fingerprint=' + fingerprint;
        $.ajax({
            type: 'post',
            data: data,
            url: '/app_dev.php/ajax/client',
            success: function (response) {
            },
            error: function (response) {
            }
        });
//    });
