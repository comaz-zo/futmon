Ext.define('CDBE.view.login.LoginPanel', {
    extend : 'Ext.form.Panel',
    alias : 'widget.loginloginpanel',

/*
    tbar: [

            '->',
            {
                itemId: 'account',
                text : 'Account',
            },

            {
                itemId: 'logout',
                text : 'Log out'
            }
    ],*/

    tools: [
        {
                xtype : 'label',
                itemId : 'welcomelabel',
                text : 'Benvenuto'
        }
    ]

});
