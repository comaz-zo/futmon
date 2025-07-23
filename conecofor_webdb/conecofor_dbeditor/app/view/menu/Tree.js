Ext.define('CDBE.view.menu.Tree', {
    extend : 'Ext.form.Panel',
    alias : 'widget.menutree',


    items : {
        xtype : 'treepanel',
        store : {
            root : {
                text : 'Root Node',
                expanded : true,
                children : [
                    {
                        text : 'AREE',
                        id: 'aree',
                        leaf : true
                    },
                    {
                        text : 'PIANTE',
                        id: 'piante',
                        leaf : true
                    },
                    {
                        text : 'SINTOMI',
                        id: 'sintomi',
                        leaf : true
                    }
                ]
            }
        },
        rootVisible : false
    }

});
