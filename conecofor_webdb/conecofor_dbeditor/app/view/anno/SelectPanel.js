Ext.define('CDBE.view.anno.SelectPanel', {
    extend : 'Ext.form.Panel',
    alias : 'widget.annoselectpanel',


    tbar: [
        {
            xtype: 'combo',
            itemId: 'annocombo',
            fieldLabel: 'Anno rilievo',
            allowBlank: false,
            forceSelection : true,
            displayField: 'ANNO_RIL',
            valueField: 'ANNO_RIL',

            store: 'anno.TableAnnoS'
        },
        {
            itemId: 'select',
            text : 'Seleziona',
            formBind: true,
        },
        '->',
        {
            itemId: 'close',
            text : 'Chiudi',
            disabled: true
        }
    ]

});
