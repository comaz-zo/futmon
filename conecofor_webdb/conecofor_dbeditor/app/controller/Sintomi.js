Ext.define('CDBE.controller.Sintomi', {
    extend: 'Ext.app.Controller',

    id:'controllersintomi',

    models: [
        'sintomi.Sintomi',
    ],
    stores: [
        'sintomi.SintomiS',
    ],

    views: [
        'sintomi.ListRecord',
        'Viewport',
        //'sintomi.EditRecord',
    ],

    init: function() {
        var me = this;

        me.listen({
            controller: {
                 // select and close piano
                '*':{
                    anno_selected: me.loadStores,
                    anno_closed: me.unloadStores,
                },
            },
            component:{

                'sintomilistrecord button[action=save]': {
                    click: function(button) {
                        //var win    = button.up('window');
                        var gridlist = Ext.ComponentQuery.query("sintomilistrecord")[0];
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
                    }
                },
                'sintomilistrecord button[action=cancel]': {
                    click: function(button) {
                        //var win    = button.up('window');
                        var gridlist = Ext.ComponentQuery.query("sintomilistrecord")[0];

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


                        //win.close();
                    }
                },
                /*'sintomilistrecord button[action=cancel]': {
                    click: function(button) {
                        var win    = button.up('window');
                        win.close();
                    }
                },*/

            },


        });

        console.log('Lookputable controller init');

    },

    loadStores: function(){

        var me = this;
        me.getSintomiSintomiSStore().load();
        console.log("Store Sintomi loaded ");
    },

    unloadStores: function(){

        var me = this;
        //
        // unbind table store
        me.getSintomiSintomiSStore().removeAll();
        console.log('Store Sintomi unloaded');
    },

});
