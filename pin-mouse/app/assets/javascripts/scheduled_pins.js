(function () {
    $(document).ready(function () {
        $.ajaxSetup({
            headers: {'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')}
        });

        var grid = $('.scheduled-pins-grid');
        var allBoardSelectors = grid.find('.board-selector');

        function applyBoardToAll(currentSelect) {
            var current = $(currentSelect);
            allBoardSelectors.val(current.val());
        }

        grid.find('.btn-apply-all').on('click', function (event) {
            var currentSelect = $(event.target).siblings('select')[0];
            applyBoardToAll(currentSelect);
        });

        var scheduleButton = $('#scheduleNow');
        scheduleButton.on('click', function () {
            var data = [];
            allBoardSelectors.each(function () {
                _this = $(this);

                if (_this.val()) {
                    data.push({
                        scheduled_pin_id: _this.data('pin'),
                        board_uuid: _this.val()
                    });
                }
            });

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