(function() {
    Ext.define('CDBE.view.sintomi.ListRecord' ,{
        extend: 'Ext.grid.GridPanel',
        alias: 'widget.sintomilistrecord',
        title: 'Sintomi',

        xtype: 'gridpanel',
        //alias: 'widget.obiettivogridobiettivo',
        store: 'sintomi.SintomiS',

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

        columns: [

            {header: 'IDAREA',dataIndex: 'IDAREA',flex: 1,},
            {header: 'IDPIANTA',dataIndex: 'IDPIANTA',flex: 1,},
            {header: 'IDSINTOMO',dataIndex: 'IDSINTOMO',flex: 1,},
            {header: 'PARTE',dataIndex: 'PARTE',flex: 1,editor: {allowBlank: true},},
            {header: 'TIPOSINT',dataIndex: 'TIPOSINT',flex: 1,editor: {allowBlank: true},},
            {header: 'ETADANNO',dataIndex: 'ETADANNO',flex: 1,editor: {allowBlank: true},},
            {header: 'AGENTE',dataIndex: 'AGENTE',flex: 1,editor: {allowBlank: true},},
            {header: 'AG_NOME',dataIndex: 'AG_NOME',flex: 2,editor: {allowBlank: true},},
            {header: 'AG_DIFF',dataIndex: 'AG_DIFF',flex: 1,editor: {allowBlank: true},},
            {header: 'CHIOMA_V',dataIndex: 'CHIOMA_V',flex: 1,editor: {allowBlank: true},},
            {header: 'NOTE',dataIndex: 'NOTE',flex: 2,editor: {allowBlank: true},},



            /*{
                xtype: 'actioncolumn',
                //width: 40,
                items: [{
                    icon: 'resources/images/icons/Modify.gif',
                    handler: function(grid, rowIndex, colindex, item, e, record) {
                        var record = grid.getStore().getAt(rowIndex);
                        //var view = Ext.widget('sintomieditrecord');
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
                    var newRecord = Ext.create("CDBE.model.sintomi.Sintomi");
                    newRecord.set('ANNO_RIL', CDBE.config.Runtime.getAnnoSelectedId());
                    Ext.Msg.prompt("ID AREA", "Inserire l'ID Area:", function(btnText, sInput){
                        if(btnText === 'ok'){
                            newRecord.set('IDAREA', sInput);
                            Ext.Msg.prompt("ID PIANTA", "Inserire l'ID Pianta:", function(btnText, sInput){
                                if(btnText === 'ok'){
                                    newRecord.set('IDPIANTA', sInput);
                                    Ext.Msg.prompt("ID SINTOMO", "Inserire l'ID Sintomo:", function(btnText, sInput){
                                        if(btnText === 'ok'){
                                            newRecord.set('IDSINTOMO', sInput);
                                            view.store.insert(view.store.count, newRecord);
                                        }
                                    }, this);
                                }
                            }, this);
                        }
                    }, this);
                    //var edit_view = Ext.widget('sintomieditrecord');
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
