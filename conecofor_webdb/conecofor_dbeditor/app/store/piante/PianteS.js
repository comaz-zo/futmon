Ext.define(null, {
    override: "Ext.data.Store",
    isDirty: function() {
        return (this.getNewRecords().length > 0 || this.getUpdatedRecords().length > 0 || this.getRemovedRecords().length > 0);
    }
});

Ext.define('CDBE.store.piante.PianteS', {
    extend: 'Ext.data.Store',
    model: 'CDBE.model.piante.Piante',
    storeId: 'pianteS',
    autoLoad: true,
    autoDestroy: true,
    groupField: 'IDAREA',
    sortInfo: {
        field: 'IDPIANTA',
        direction: "ASC"
    },

    proxy: {
        type: 'ajax',
        batchOrder: 'destroy,create,update',
        api: {
            create: 'app/php/piante/piante_create.php', // Called when saving new records
            read: 'app/php/piante/piante_read.php', // Called when reading existing records
            update: 'app/php/piante/piante_update.php', // Called when updating existing records
            destroy: 'app/php/piante/piante_destroy.php' // Called when deleting existing records
        },
        reader: {
            type: 'json',
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
