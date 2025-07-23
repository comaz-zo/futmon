Ext.define('CDBE.model.piante.Piante', {
    extend: 'Ext.data.Model',
    fields: [
        {name :'ANNO_RIL', type :'string'},
        {name :'IDAREA', type :'string'},
        {name :'IDPIANTA', type :'int'},
        {name :'SPECIE', type :'string', defaultValue: "0"},
        {name :'RM_OLD', type :'string', defaultValue: "0"},
        {name :'REM_MORT', type :'string', defaultValue: "0"},
        {name :'ASS_CROWN', type :'string', defaultValue: "0"},
        {name :'TRASPAR', type :'string', defaultValue: "0"},
        {name :'FRUTTIF', type :'string', defaultValue: "0"},
        {name :'DENDROT', type :'string', defaultValue: "0"},
        {name :'DIAM1', type :'int', defaultValue: 0},
        {name :'DIAM2', type :'int', defaultValue: 0},
        {name :'DIST', type :'double', defaultValue: 0},
        {name :'AZIMUT', type :'double', defaultValue: 0},
    ]
});
