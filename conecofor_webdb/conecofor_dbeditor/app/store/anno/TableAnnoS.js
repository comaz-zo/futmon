Ext.define('CDBE.store.anno.TableAnnoS', {
    extend: 'Ext.data.Store',
    model: 'CDBE.model.anno.TableAnno',

    autoLoad: false,
    autoDestroy: true,

    proxy: {
        type: 'ajax',
        url : 'app/php/anno/selectanno.php', // legge il contenuto della tabella e lo consegna in formato JSON
        reader: {
            type: 'json'
        },
        actionMethods: {
            read: 'POST'
        },
        failure: function(conn, response, options, eOpts) {
            Ext.Msg.show({
                title:'Error!',
                msg: conn.responseText,
                icon: Ext.Msg.ERROR,
                buttons: Ext.Msg.OK
            });
        }
    },

    listeners: {
        beforeload: function(store, operation){
            //console.log("select piani for user " + CDBE.config.Runtime.getLoggedUser());
            //this.proxy.extraParams['i_utente'] = CDBE.config.Runtime.getLoggedUser();
        }
    },
});
