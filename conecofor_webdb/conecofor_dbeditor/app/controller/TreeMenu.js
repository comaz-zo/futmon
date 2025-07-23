Ext.define('CDBE.controller.TreeMenu', {
    extend: 'Ext.app.Controller',

    id:'controllertreemenu',

    requires: [
        'CDBE.view.aree.ListRecord',
        'CDBE.view.piante.ListRecord',
        'CDBE.view.sintomi.ListRecord',
    ],

    views: [
        'menu.Tree',
        'Viewport',
    ],

    init: function() {
        var me = this;

        me.listen({
            controller: {
                 // select and close piano
                '*':{
                    //map_created: me.loadStores,
                    //map_destroyed: me.unloadStores,
                },
            },
            component:{
                'treepanel': {
                    itemclick: function(tree, record){
                        item = record.get('id');
                        var center_region = Ext.ComponentQuery.query("#centerRegion")[0];
                        var proceed = true;

                        // if grid exist check if it has some modification and evenutally stops
                        if (center_region.items.length>0){
                            proceed = false;
                            var current_grid = center_region.items.items[0];

                            if(current_grid.store.isDirty()){
                                Ext.MessageBox.confirm(
                                       'Le modifiche alla tabella saranno perse',
                                       'Sei sicuro?',
                                       function(btn) {
                                            if (btn == 'yes') {
                                                current_grid.store.rejectChanges()
                                                proceed = true;
                                            } else{
                                                proceed = false;
                                            }
                                       }
                                    );
                            }else{
                                proceed = true;
                            }
                        }
                        if (proceed) {
                            center_region.removeAll(false);
                            var new_grid;
                            var new_grid_q;
                            switch(item) {
                                case 'aree':
                                    new_grid_q = Ext.ComponentQuery.query("areelistrecord");
                                    if (new_grid_q.length == 0 ){
                                        new_grid = new CDBE.view.aree.ListRecord();
                                    } else {
                                        new_grid = new_grid_q[0];
                                    }
                                break;
                                case 'piante':
                                    new_grid_q = Ext.ComponentQuery.query("piantelistrecord");
                                    if (new_grid_q.length == 0 ){
                                        new_grid = new CDBE.view.piante.ListRecord();
                                    } else {
                                        new_grid = new_grid_q[0];
                                    }
                                break;
                                case 'sintomi':
                                    new_grid_q = Ext.ComponentQuery.query("sintomilistrecord");
                                    if (new_grid_q.length == 0 ){
                                        new_grid = new CDBE.view.sintomi.ListRecord();
                                    } else {
                                        new_grid = new_grid_q[0];
                                    }
                                break;
                                default:
                            }

                            new_grid.store.reload();
                            center_region.add([new_grid]);
                        }
                    }
                },

            },


        });

        console.log('Tree menu controller init');

    },

});
