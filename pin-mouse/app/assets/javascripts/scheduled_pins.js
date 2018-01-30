(function () {
    $(document).ready(function () {
        $.ajaxSetup({
            headers: {'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')}
        });

        var grid = $('.scheduled-pins-grid');
        var allBoardSelectors = grid.find('.board-selector');
        var scheduleButton = $('#scheduleNow');
        var schedule_group = $('#schedule_group');

        function applyBoardToAll(currentSelect) {
            var current = $(currentSelect);
            allBoardSelectors.val(current.val());
        }

        grid.find('.btn-apply-all').on('click', function (event) {
            var currentSelect = $(event.target).siblings('select')[0];
            applyBoardToAll(currentSelect);
        });
        
        scheduleButton.on('click', function () {
            var data = {
                scheduled_pins: []
            };
            data.schedule_group = schedule_group.val();

            allBoardSelectors.each(function () {
                _this = $(this);

                if (_this.val()) {
                    data.scheduled_pins.push({
                        scheduled_pin_id: _this.data('pin'),
                        board_uuid: _this.val()
                    });
                }
            });

            console.log(JSON.stringify(data));
            console.log(data);

            $.ajax({
                type: "POST",
                url: '/scheduled_pins/schedule',
                contentType: 'application/json',
                data: JSON.stringify(data),
                success: null,
                dataType: 'json'
            });
        });
    });
})();