Ext.define('CDBE.config.Runtime',{
    singleton : true,
    config : {


        //login
        loggedIn : false,
        loggedUser : "",
        loggedUserLevel: 0,

        //anno
        annoSelected : false,
        annoSelectedId : null,

    },
    constructor : function(config){
        this.initConfig(config);
    }
});
