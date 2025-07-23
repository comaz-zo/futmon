Ext.define('CDBE.controller.Aree', {
    extend: 'Ext.app.Controller',

    id:'controlleraree',

    models: [
        'aree.Aree',
    ],
    stores: [
        'aree.AreeS',
    ],

    views: [
        'aree.ListRecord',
        'Viewport',
        //'aree.EditRecord',
    ],

    init: function() {
        var me = this;

        me.listen({
            controller: {
                '*':{
                    anno_selected: me.loadStores,
                    anno_closed: me.unloadStores,
               },


            },
            component:{


                'areelistrecord button[action=save]': {
                    click: this.saveTable,
                },
                'areelistrecord button[action=cancel]': {
                    click: this.reloadTable,
                },
                /*'areelistrecord button[action=cancel]': {
                    click: function(button) {
                        var win    = button.up('window');
                        win.close();
                    }
                },*/

            },


        });

        console.log('Lookputable controller init');

    },

    saveTable(button) {
        //var win    = button.up('window');
        var gridlist = Ext.ComponentQuery.query("areelistrecord")[0];
        Ext.MessageBox.confirm(
               'Confirm save table',
               'Are you sure?',
               function(btn) {
                    if (btn == 'yes') {
                        gridlist.store.sync();
                    }
               }
            );

        //win.close();
    },

    reloadTable(button) {
        //var win    = button.up('window');
        var gridlist = Ext.ComponentQuery.query("areelistrecord")[0];

        if(gridlist.store.isDirty()){
            Ext.MessageBox.confirm(
                   'Confirm reload table',
                   'Are you sure?',
                   function(btn) {
                        if (btn == 'yes') {
                            gridlist.store.rejectChanges();
                            gridlist.store.reload();
                        }
                   }
                );
        }
    },


    loadStores: function(){

        var me = this;
        me.getAreeAreeSStore().load();
        console.log("Store Aree loaded ");
    },

    unloadStores: function(){

        var me = this;

        //
        // unbind table store
        me.getAreeAreeSStore().removeAll();
        console.log('Store Aree unloaded');
    },

});
