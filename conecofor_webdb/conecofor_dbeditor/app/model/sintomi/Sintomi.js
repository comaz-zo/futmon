Ext.define('CDBE.model.sintomi.Sintomi', {
    extend: 'Ext.data.Model',
    fields: [
        {name :'ANNO_RIL', type :'string'},
        {name :'IDAREA', type :'string'},
        {name :'IDPIANTA', type :'int'},
        {name :'IDSINTOMO', type :'int'},
        {name :'PARTE', type :'string'},
        {name :'TIPOSINT', type :'string'},
        {name :'ETADANNO', type :'string'},
        {name :'AGENTE', type :'string'},
        {name :'AG_NOME', type :'string'},
        {name :'AG_DIFF', type :'string'},
        {name :'CHIOMA_V', type :'string'},
        {name :'NOTE', type :'string'},
    ]
});
