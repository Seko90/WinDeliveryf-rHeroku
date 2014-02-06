$(function () {
    /* Funktion Draggable für den Div=catalog.li */
    $("#catalog").accordion();
    $("#catalog li").draggable({
        appendTo: "body",
        helper: "clone"
    });
    /* Funktion Droppable mit herausnehmen(remove)für den Div=cart ol */
    $("#cart ol").droppable({
        out: function (event, ui) {
            var self = ui;
            ui.helper.off('mouseup').on('mouseup', function () {
                $(this).remove();
                self.draggable.remove();
            });
        },
        activeClass: "ui-state-default",
        hoverClass: "ui-state-hover",
        accept: ":not(.ui-sortable-helper)",
        drop: function (event, ui) {

            if (ui.draggable.is('.dropped')) return false;
            $(this).find(".placeholder").remove();
            $("<li></li>").html(ui.draggable.html()).appendTo(this).draggable({
                appendTo: "body",
                helper: "clone"
            }).addClass('dropped').data("price", ui.draggable.data("price")).data("id", ui.draggable.data("id"));
            /* Variable "total" die den Wert der Bestellung hat und aktualisiert sich
            bei jedem gedroppten Item(bei Zeile 33-38) */
            var total = 0.0;
            var product_ids = [];
            /* Itterieren über alle Artikel im Warenkorb, holen von jedem Artikel den Preis über
            data-tag=price im view und addieren dies zum Gesamtpreis */
            $(".ui-draggable.dropped").each(function(){
              var item_id = $(this).data("id");
              product_ids.push(item_id);
              var item_price = parseFloat($(this).data("price"));
              total += item_price;
            })
            $("#total .price").text(total);
            $("#order_products").attr("value",product_ids.join(","));

        }
    });


});
