Ext.define(null, {
    override: "Ext.data.Store",
    isDirty: function() {
        return (this.getNewRecords().length > 0 || this.getUpdatedRecords().length > 0 || this.getRemovedRecords().length > 0);
    }
});

Ext.define('CDBE.store.aree.AreeS', {
    extend: 'Ext.data.Store',
    model: 'CDBE.model.aree.Aree',
    storeId: 'areeS',
    autoLoad: false,
    autoDestroy: true,

    /*pageSize: 50,
    buffered: true,
    remoteSort : true,
    sorters    : {
        property  : 'IDAREA',
        direction : 'ASC'
    },*/

    proxy: {
        type: 'ajax',
        batchOrder: 'destroy,create,update',
        api: {
            create: 'app/php/aree/aree_create.php', // Called when saving new records
            read: 'app/php/aree/aree_read.php', // Called when reading existing records
            update: 'app/php/aree/aree_update.php', // Called when updating existing records
            destroy: 'app/php/aree/aree_destroy.php' // Called when deleting existing records
        },
        reader: {
            type: 'json',
            //successProperty: 'meta.success',
            //totalProperty: 'meta.total'
        },

        writer: {
            type : 'json',
            allowSingle : false,
        },

        actionMethods: {
            read: 'POST',
            update: 'POST'
        },

        success: function(conn, response, options, eOpts) {
            console.log('success');
            Ext.Msg.show({
                title:'Success!',
                msg: conn.responseText,
                icon: Ext.Msg.ERROR,
                buttons: Ext.Msg.OK
            });
        },

        failure: function(conn, response, options, eOpts) {
            console.log('failure');
            Ext.Msg.show({
                title:'Error!',
                msg: conn.responseText,
                icon: Ext.Msg.ERROR,
                buttons: Ext.Msg.OK
            });
        },

        listeners: {
            exception: function(proxy, response, operation){
                Ext.MessageBox.show({
                    title: 'REMOTE EXCEPTION',
                    msg: operation.getError(),
                    icon: Ext.MessageBox.ERROR,
                    buttons: Ext.Msg.OK
                });
            }
        },

    },

    listeners: {
        beforeload: function(store, operation){
            this.proxy.extraParams['ANNO_RIL'] = CDBE.config.Runtime.getAnnoSelectedId();

        },

        /*write: function(store, operation){
            this.fireEvent('store_end_write');
            console.log('store_end_write event');

        }*/
    }


});
