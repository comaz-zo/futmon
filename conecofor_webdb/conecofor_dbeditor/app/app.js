


Ext.require([

    // We need to require this class, even though it is used by Ext.EventObjectImpl
    // see: http://www.sencha.com/forum/showthread.php?262124-Missed-(-)-dependency-reference-to-a-Ext.util.Point-in-Ext.EventObjectImpl
    'Ext.util.Point',


]);

// Solve grouping grid row selection in ExtJS 4.2
// see: https://www.sencha.com/forum/showthread.php?264961-Grid-Grouping-Bug
Ext.define('App.overrides.view.Table', {
    override: 'Ext.view.Table',


    getRecord: function (node) {
        node = this.getNode(node);
        if (node) {
            //var recordIndex = node.getAttribute('data-recordIndex');
            //if (recordIndex) {
            //    recordIndex = parseInt(recordIndex, 10);
            //    if (recordIndex > -1) {
            //        // The index is the index in the original Store, not in a GroupStore
            //        // The Grouping Feature increments the index to skip over unrendered records in collapsed groups
            //        return this.store.data.getAt(recordIndex);
            //    }
            //}
            return this.dataSource.data.get(node.getAttribute('data-recordId'));
        }
    },


    indexInStore: function (node) {
        node = this.getNode(node, true);
        if (!node && node !== 0) {
            return -1;
        }
        //var recordIndex = node.getAttribute('data-recordIndex');
        //if (recordIndex) {
        //    return parseInt(recordIndex, 10);
        //}
        return this.dataSource.indexOf(this.getRecord(node));
    }
});

Ext.application({
    name: 'CDBE',

    requires:[
        'CDBE.config.Runtime'
    ],


    controllers: [
        'Login',
        'TreeMenu',
        'Anno',
        'Aree',
        'Piante',
        'Sintomi',
    ],

    models: [
    ],

    stores: [

    ],

    views: [

    ],

    autoCreateViewport: false,

    launch: function(){
        Ext.widget('loginwindow');
    }
});
