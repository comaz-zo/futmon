/**
 * Map controller
 * Used to manage map layers and showing their related views
 */
Ext.define('CDBE.controller.Anno', {
    extend: 'Ext.app.Controller',

    id:'controlleranno',

    models: [
        'anno.TableAnno',
    ],
    stores: [
        //'lookuptable.LookuptableS',
        'anno.TableAnnoS',

    ],

    views: [
        'anno.SelectPanel',
    ],

    anno_vecLayer: null,

    init: function() {
        var me = this;

        me.listen({
            controller: {
                '*':{
                    //map_created: me.loadStores,
                    //map_destroyed: me.unloadStores,
                },
            },
            component: {
                "annoselectpanel button#select": {       // #1
                    click: this.onButtonClickSelect // #2
                },
                "annoselectpanel button#close": {       // #1
                    click: this.onButtonClickClose // #2
                },
                'treepanel': {
                    itemclick: function(tree, record){
                        switch(record.get('id')) {
                            case 'anno':
                                me.onMenuTreeAnnoItemSelect();
                                break;
                            default:
                        }
                    }
                }
            },
            direct: {},
            global: {},
            store: {}


        });

        console.log('Anno controller init');

    },


     onButtonClickSelect: function(button, e, options) {
        var me = this;
        var pp = Ext.ComponentQuery.query('annoselectpanel')[0],
            pc = pp.down('#annocombo'),
            sb = pp.down('#select'),
            cb = pp.down('#close');
        CDBE.config.Runtime.setAnnoSelected(true);
        var sel_anno = pc.getValue();
        var ps = me.getAnnoTableAnnoSStore();
        var sel_ps_record = ps.getAt(ps.find('ANNO_RIL',sel_anno));
        CDBE.config.Runtime.setAnnoSelectedId(sel_ps_record.get('ANNO_RIL'));


        //log selected anno
        console.log('Selected anno ');

        //enable disable components
        cb.enable();
        pc.disable();
        sb.disable();

        //show border panels
        var wr = Ext.ComponentQuery.query('#westRegion')[0],
            cr = Ext.ComponentQuery.query('#centerRegion')[0];
        wr.show();
        cr.show();


        //load selected anno layers on map
        this.fireEvent('anno_selected');

    },


    onButtonClickClose: function(button, e, options) {
        var pp = Ext.ComponentQuery.query('annoselectpanel')[0],
            pc = pp.down('#annocombo'),
            sb = pp.down('#select'),
            cb = pp.down('#close');

        CDBE.config.Runtime.setAnnoSelected(false);
        CDBE.config.Runtime.setAnnoSelectedId(null);

        //log selected anno
        console.log('Selected anno '+CDBE.config.Runtime.getAnnoSelected());

        //enable disable components
        cb.disable();
        pc.enable();
        sb.enable();

        //hide border panels
        var wr = Ext.ComponentQuery.query('#westRegion')[0],
            cr = Ext.ComponentQuery.query('#centerRegion')[0];

        wr.hide();

        //cr.removeAll();
        cr.hide();

        this.fireEvent('anno_closed');
        console.log('anno closed');
    },


    loadStores: function(){

        var me = this;


    },

    unloadStores: function(){
        var me = this;


    },


    onMenuTreeAnnoItemSelect: function() {
        console.log("onMenuTreeAnnoItemSelect");


    },

    onLaunch: function() {

    },

    onAnnoSStoreLoad: function(store, records) {

    },


});
