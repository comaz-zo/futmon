(function() {
    Ext.define('CDBE.view.aree.ListRecord' ,{
        extend: 'Ext.grid.GridPanel',
        alias: 'widget.areelistrecord',
        title: 'Aree',

        xtype: 'gridpanel',
        //alias: 'widget.obiettivogridobiettivo',
        store: 'aree.AreeS',

        stripeRows   : true,
        selType: 'rowmodel',
        singleSelect : true,

        plugins: [
            Ext.create('Ext.grid.plugin.RowEditing', {
                clicksToMoveEditor: 1,
                autoCancel: false,
                /*listeners: {
                    validateedit: function( editor, context, e){
                        grid_store = context.grid.getStore();

                        key_uniqueness = grid_store.queryBy(function(record,id){
                            return (record.get('table_n') == context.newValues.table_n && record.get('field_n') == context.newValues.field_n && record.get('code_v') == context.newValues.code_v);
                        }).length;
                        if(key_uniqueness>1){
                            Ext.Msg.alert('Edit', 'Modifica annullata: valori tabella, campo, codice duplicati.');
                            return false;
                        }else{
                            return true;
                        }
                    }
                }*/
            })
        ],

        columns: [
            {header: 'IDAREA',dataIndex: 'IDAREA',flex: 1},
            {header: 'TIPOAREA',dataIndex: 'TIPOAREA',flex: 1,editor: {allowBlank: true}},
            {header: 'PAESE',dataIndex: 'PAESE',flex: 1,editor: {allowBlank: true}},
            {header: 'PROVINCI',dataIndex: 'PROVINCI',flex: 1,editor: {allowBlank: true}},
            {header: 'COMUNE',dataIndex: 'COMUNE',flex: 1,editor: {allowBlank: true}},
            {header: 'IDSQUADRA',dataIndex: 'IDSQUADRA',flex: 1,editor: {allowBlank: true}},
            {header: 'IDONEITA',dataIndex: 'IDONEITA',flex: 1,editor: {allowBlank: true}},
            {header: 'DATARIL',dataIndex: 'DATARIL',flex: 1,xtype: 'datecolumn',renderer: Ext.util.Format.dateRenderer('d/m/Y'),
                editor: {
                    xtype: 'datefield',
                    allowBlank: true,
                    format: 'd/m/Y'
                }
            },
            {header: 'COORDN',dataIndex: 'COORDN',flex: 1,editor: {allowBlank: true}},
            {header: 'COORDE',dataIndex: 'COORDE',flex: 1,editor: {allowBlank: true}},
            {header: 'ALTITUD',dataIndex: 'ALTITUD',flex: 1,editor: {allowBlank: true}},
            {header: 'ESPOSIZ',dataIndex: 'ESPOSIZ',flex: 1,editor: {allowBlank: true}},
            {header: 'DISPH2O',dataIndex: 'DISPH2O',flex: 1,editor: {allowBlank: true}},
            {header: 'T_HUMUS',dataIndex: 'T_HUMUS',flex: 1,editor: {allowBlank: true}},
            {header: 'ETAMEDIA',dataIndex: 'ETAMEDIA',flex: 1,editor: {allowBlank: true}},
            {header: 'CATFOR',dataIndex: 'CATFOR',flex: 1,editor: {allowBlank: true}},
            {header: 'SCATFOR',dataIndex: 'SCATFOR',flex: 1,editor: {allowBlank: true}},
            {header: 'COORDN_C',dataIndex: 'COORDN_C',flex: 1,editor: {allowBlank: true}},
            {header: 'COORDE_C',dataIndex: 'COORDE_C',flex: 1,editor: {allowBlank: true}},
            {header: 'FIXGPS_C',dataIndex: 'FIXGPS_C',flex: 1,editor: {allowBlank: true}},
            {header: 'PIC',dataIndex: 'PIC',flex: 1,editor: {allowBlank: true}},
            {header: 'TRAS_PIC',dataIndex: 'TRAS_PIC',flex: 1,editor: {allowBlank: true}},
            {header: 'T_PIC_AZ',dataIndex: 'T_PIC_AZ',flex: 1,editor: {allowBlank: true}},
            {header: 'T_PIC_DS',dataIndex: 'T_PIC_DS',flex: 1,editor: {allowBlank: true}},
            {header: 'DATAUP',dataIndex: 'DATAUP',flex: 1,xtype: 'datecolumn',renderer: Ext.util.Format.dateRenderer('d/m/Y'),
                editor: {
                    xtype: 'datefield',
                    allowBlank: true,
                    format: 'd/m/Y'
                }
            },


            /*{
                xtype: 'actioncolumn',
                //width: 40,
                items: [{
                    icon: 'resources/images/icons/Modify.gif',
                    handler: function(grid, rowIndex, colindex, item, e, record) {
                        var record = grid.getStore().getAt(rowIndex);
                        //var view = Ext.widget('areeeditrecord');
                        //view.down('form').loadRecord(record);
                        plugin = grid.editingPlugin;
                        plugin.startEdit(record,0);
                    }
                }],
                flex: 1
            },*/
            /*{
                xtype: 'actioncolumn',
                //width: 40,
                items: [{
                    icon: 'resources/images/icons/List.gif',
                    tooltip: 'piante',
                    handler: function(grid, rowIndex, colIndex) {
                        // fire custom event "itemeditbuttonclick"
                        this.up('grid').fireEvent('itempiantebuttonclick', grid, rowIndex, colIndex);
                    }
                }],
                flex: 1
            },*/
            {
                xtype: 'actioncolumn',
                //width: 40,
                items: [{
                    icon: 'resources/images/icons/Delete.gif',
                    iconCls:'act-destroy',
                    /*handler: function(grid, rowIndex) {
                        var record = grid.getStore().getAt(rowIndex);
                        grid.fireEvent('deleteAction', grid, record);
                    },*/
                    handler: function(grid, rowIndex, colindex) {
                        var record = grid.getStore().getAt(rowIndex);
                        Ext.MessageBox.confirm(
                           'Confirm delete',
                           'Are you sure?',
                           function(btn) {
                                if (btn == 'yes') {
                                    grid.store.remove(record);
                                }
                           }
                        );
                    }
                }],
                flex: 1
            }
        ],

        /*features: [{
            ftype: 'grouping',
            // You can customize the group's header.
            groupHeaderTpl: '{name} ({children.length})',
            enableNoGroups:true,
            enableGroupingMenu : false,
            startCollapsed:false,
            collapsible : false
        }],*/

        tools: [
            {
                type : 'plus',
                itemId : 'addrecord',
                callback: function(view,button,e) {
                    var newRecord = Ext.create("CDBE.model.aree.Aree");
                    newRecord.set('ANNO_RIL', CDBE.config.Runtime.getAnnoSelectedId());
                    Ext.Msg.prompt("ID AREA", "Inserire l'ID Area:", function(btnText, sInput){
                        if(btnText === 'ok'){
                            newRecord.set('IDAREA', sInput);
                        }
                    }, this);
                    view.store.insert(view.store.count, newRecord);
                    //var edit_view = Ext.widget('areeeditrecord');
                    //edit_view.down('form').loadRecord(newRecord);
                }
            }
        ],

        dockedItems: [
            {
                xtype: 'toolbar',
                dock: 'top',
                displayInfo : true,
                items: [
                    { xtype: 'button', text: 'Salva', action: 'save' },
                    { xtype: 'button', text: 'Ripristina', action: 'cancel' }
                ]
            }
        ]

    });

})();
