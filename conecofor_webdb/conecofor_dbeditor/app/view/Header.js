/**
 * The application header displayed at the top of the viewport
 * @extends Ext.Component
 */
Ext.define('CDBE.view.Header', {
    extend: 'Ext.Component',
    alias: 'widget.cdbeheader',

    dock: 'top',
    baseCls: 'cdbe-header',

    config: {
        style:"background-color:white;",
    },

    initComponent: function() {
        Ext.applyIf(this, {
            html: '<img src="../images/cfs.jpg" alt="" style="width: 150px; height: 100px;"><img src="../images/conecofor_head.jpg" style=" height: 100px;" alt="">'
        });

        this.callParent(arguments);
    }
});
