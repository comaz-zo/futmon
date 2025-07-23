Ext.define('CDBE.model.aree.AreeTot', {
    extend: 'Ext.data.Model',
    fields: [
        {name :'IDAREA', type :'string'},
        {name :'TIPOAREA', type :'string', defaultValue: "0"},
        {name :'PROVINCI', type :'string', defaultValue: "0"},
        {name :'COMUNE', type :'string', defaultValue: "0"},
        {name :'COORDN', type :'double', defaultValue: 0},
        {name :'COORDE', type :'double', defaultValue: 0},
        {name :'REGIONE', type :'string', defaultValue: "0"},
        {name :'REG_COD_ISTAT', type :'int', defaultValue: 0},
        {name :'FUSO', type :'int', defaultValue: 0},
        {name :'COORD_ORIG_N', type :'string', defaultValue: "0"},
        {name :'COORD_ORIG_E', type :'string', defaultValue: "0"},
    ]
});
