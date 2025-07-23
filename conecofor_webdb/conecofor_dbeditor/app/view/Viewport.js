Ext.define('CDBE.view.Viewport', {
    extend: 'Ext.Viewport',
    layout: 'border',
    defaults : {
        frame : true,
        split : true
    },
    requires: [
        'Ext.layout.container.Border',
        'Ext.resizer.Splitter',
        'CDBE.view.Header',
        'CDBE.view.login.LoginPanel',
        'CDBE.view.anno.SelectPanel',
        'CDBE.view.menu.Tree',
        'CDBE.view.aree.ListRecord',
        'CDBE.view.piante.ListRecord',
        'CDBE.view.sintomi.ListRecord',
    ],

    items: [
        {
            xtype: 'panel',
            border: false,
            layout: 'fit',
            region : 'north',
            dockedItems: [
                {
                    xtype : 'cdbeheader',

                },
                {
                    xtype : 'loginloginpanel',
                     region : 'north',
                },
                {
                    xtype : 'annoselectpanel',
                    region : 'north',
                }
            ]
        },
        {
            xtype : 'container',
            region : 'west',
            layout : 'fit',
            id : 'westRegion',
            width : 150,
            minWidth : 150,
            maxWidth : 300,
            hidden: true,
            items : {
                xtype : 'menutree',
            }
        },
        {
            xtype : 'container',
            region : 'center',
            layout : 'fit',
            id : 'centerRegion',
            hidden: true,
            items : [

            ]
        },

    ],

    initComponent: function() {


        console.log('init viewport');
        this.callParent(arguments);


    }
});
