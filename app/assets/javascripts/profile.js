var profile = {};

profile.init = function () {
    jQuery(function ($) {
        $(document.body).off('click', '.edit-profile');
        $(document.body).on('click', '.edit-profile', function (e) {
            e.preventDefault();
            var user_id = $(this).attr('user_id');
            $.ajax({
                type: 'GET',
                url: '/profile/' + user_id + '/edit'
            }).success(function (data) {
                $('.profile-content').html(data);
            }).error(function (error) {
                $('#container').html('Error: ' + error.statusText);
            });
        });
    })
};
