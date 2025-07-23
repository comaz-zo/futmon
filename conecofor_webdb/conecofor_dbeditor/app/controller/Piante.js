Ext.define('CDBE.controller.Piante', {
    extend: 'Ext.app.Controller',

    id:'controllerpiante',

    models: [
        'piante.Piante',
    ],
    stores: [
        'piante.PianteS',
    ],

    views: [
        'piante.ListRecord',
        'Viewport',
        //'piante.EditRecord',
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

                'piantelistrecord button[action=save]': {
                    click: function(button) {
                        //var win    = button.up('window');
                        var gridlist = Ext.ComponentQuery.query("piantelistrecord")[0];
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
                'piantelistrecord button[action=cancel]': {
                    click: function(button) {
                        //var win    = button.up('window');
                        var gridlist = Ext.ComponentQuery.query("piantelistrecord")[0];

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
                /*'piantelistrecord button[action=cancel]': {
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
        me.getPiantePianteSStore().load();
        console.log("Store Piante loaded ");
    },

    unloadStores: function(){

        var me = this;

        //
        // unbind table store
        me.getPiantePianteSStore().removeAll();
        console.log('Store Piante unloaded');
    },

});
