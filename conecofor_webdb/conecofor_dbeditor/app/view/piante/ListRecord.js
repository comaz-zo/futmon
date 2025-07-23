(function() {
    Ext.define('CDBE.view.piante.ListRecord' ,{
        extend: 'Ext.grid.GridPanel',
        alias: 'widget.piantelistrecord',
        title: 'Piante',

        xtype: 'gridpanel',
        //alias: 'widget.obiettivogridobiettivo',
        store: 'piante.PianteS',

        stripeRows   : true,
        selType: 'rowmodel',
        singleSelect : true,


        features: [
            {
                ftype:'grouping',
                startCollapsed:true
            }
        ],

        plugins: [{
                ptype: 'cellediting'
        }],

        /*plugins: [
            Ext.create('Ext.grid.plugin.RowEditing', {
                clicksToMoveEditor: 1,
                autoCancel: false,
                listeners: {
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
                }
            })
        ],*/

        columns: [

            {header: 'IDAREA',dataIndex: 'IDAREA',flex: 1,},
            {header: 'IDPIANTA',dataIndex: 'IDPIANTA',flex: 1,},
            {header: 'SPECIE',dataIndex: 'SPECIE',flex: 1,editor: {allowBlank: true},},
            {header: 'RM_OLD',dataIndex: 'RM_OLD',flex: 1,editor: {allowBlank: true},},
            {header: 'REM_MORT',dataIndex: 'REM_MORT',flex: 1,editor: {allowBlank: true},},
            {header: 'ASS_CROWN',dataIndex: 'ASS_CROWN',flex: 1,editor: {allowBlank: true},},
            {header: 'TRASPAR',dataIndex: 'TRASPAR',flex: 1,editor: {allowBlank: true},},
            {header: 'FRUTTIF',dataIndex: 'FRUTTIF',flex: 1,editor: {allowBlank: true},},
            {header: 'DENDROT',dataIndex: 'DENDROT',flex: 1,editor: {allowBlank: true},},
            {header: 'DIAM1',dataIndex: 'DIAM1',flex: 1,editor: {allowBlank: true},},
            {header: 'DIAM2',dataIndex: 'DIAM2',flex: 1,editor: {allowBlank: true},},
            {header: 'DIST',dataIndex: 'DIST',flex: 1,editor: {allowBlank: true},},
            {header: 'AZIMUT',dataIndex: 'AZIMUT',flex: 1,editor: {allowBlank: true},},


            /*{
                xtype: 'actioncolumn',
                //width: 40,
                items: [{
                    icon: 'resources/images/icons/Modify.gif',
                    handler: function(grid, rowIndex, colindex, item, e, record) {
                        var record = grid.getStore().getAt(rowIndex);
                        //var view = Ext.widget('pianteeditrecord');
                        //view.down('form').loadRecord(record);
                        plugin = grid.editingPlugin;
                        plugin.startEdit(record,0);
                    }
                }],
                flex: 1
            },*/
            {
                xtype: 'actioncolumn',
                //width: 40,
                items: [{
                    icon: 'resources/images/icons/Delete.gif',
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
                    var newRecord = Ext.create("CDBE.model.piante.Piante");
                    newRecord.set('ANNO_RIL', CDBE.config.Runtime.getAnnoSelectedId());
                    Ext.Msg.prompt("ID AREA", "Inserire l'ID Area:", function(btnText, sInput){
                        if(btnText === 'ok'){
                            newRecord.set('IDAREA', sInput);
                            Ext.Msg.prompt("ID PIANTA", "Inserire l'ID Pianta:", function(btnText, sInput){
                                if(btnText === 'ok'){
                                    newRecord.set('IDPIANTA', sInput);
                                    view.store.insert(view.store.count, newRecord);
                                }
                            }, this);
                        }
                    }, this);
                    //var edit_view = Ext.widget('pianteeditrecord');
                    //edit_view.down('form').loadRecord(newRecord);
                }
            }
        ],

        dockedItems: [{
            xtype: 'toolbar',
            dock: 'bottom',
            displayInfo : true,
            items: [
                { xtype: 'button', text: 'Salva', action: 'save' },
                { xtype: 'button', text: 'Ripristina', action: 'cancel' }
            ]
        }]

    });

})();
