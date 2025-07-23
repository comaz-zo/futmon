' --------------------------------------------------------------------------------------------------
'
' CONECOFOR MOBILE 2017
' 
' Copyright 2017 EFFETRESEIZERO Srl  <info@f360.it>. Tutti i diritti sono riservati.
' 
' Questo programma e' tutelato dalle leggi sul copyright, dalle leggi sui diritti d'autore e dalle disposizioni dei trattati internazionali. La riproduzione o distribuzione non autorizzata di questo programma, o di parte di esso, sara' perseguibile civilmente e penalmente nella misura massima consentita dalla legge in vigore.
' 
' ---
' 
' CONECOFOR MOBILE 2017
' 
' Copyright 2017 EFFETRESEIZERO Srl  <info@f360.it>. All rights reserved.
'  
' This software is protected by copyright law and international treaties. Unauthorized reproduction or distribution of this program, or any portion of it, may result in severe civil and criminal penalties, and will be prosecuted to the maximum extent possible under the law.
' 
'---------------------------------------------------------------------------------------------------

Option Explicit

Private Const CEF_APPLET_APP 		    = "conecofor_mobile_rel3.apa"
Private Const CEF_TOOLBAR_TBR 		    = "CONECOFOR_Toolbar"
Private Const CEF_TOOLBAR_TBR_BTN_LIST	= "CONECOFOR_BtnList"



'------------------------------------------------------------------

Private Const CEF_FRMSET		            = "CONECOFOR_FormSet"
Private Const CEF_FRMSET_S1		            = "S1"
Private Const CEF_FRMSET_LBL_LAYER_AREE	    = "lblLayerAreeVal"
Private Const CEF_FRMSET_LBL_LAYER_PIANTE	= "lblLayerPianteVal"
Private Const CEF_FRMSET_LBL_LAYER_SINTOMI	= "lblLayerSintomiVal"
Private Const CEF_FRMSET_LBL_LAYER_CAV   	= "lblLayerCavVal"
Private Const CEF_FRMSET_LBL_LAYER_TABDEC   = "lblLayerTabDecVal"

'------------------------------------------------------------------

Private Const CEF_FRM_LISTAREE		        = "CONECOFOR_FormLISTAREE"
Private Const CEF_FRM_LISTAREE_LA1		    = "PageLA1"

Private Const CEF_FRM_LISTAREE_LA1_EDITID	= "EditID"

Private Const CEF_FRM_LISTAREE_LA1_BTNPREV	= "BtnPREV"
Private Const CEF_FRM_LISTAREE_LA1_BTNNEXT	= "BtnNEXT"
Private Const CEF_FRM_LISTAREE_LA1_BTNPREV10	= "BtnPREV10"
Private Const CEF_FRM_LISTAREE_LA1_BTNNEXT10	= "BtnNEXT10"

Private Const CEF_FRM_LISTAREE_LA1_BTNDATIAREA	= "BtnDATIAREA"
Private Const CEF_FRM_LISTAREE_LA1_BTNLISTPIANTE	= "BtnLISTPIANTE"
Private Const CEF_FRM_LISTAREE_LA1_BTNRILDENDRO	= "BtnRILDENDRO"

Private Const CEF_FRM_LISTAREE_LA1_LBLIDONEITAV	= "LblIDONEITAV"
Private Const CEF_FRM_LISTAREE_LA1_LBLNOSINTV	= "LblNOSINTV"
Private Const CEF_FRM_LISTAREE_LA1_LBLNCAVV	    = "LblNCAVV"
Private Const CEF_FRM_LISTAREE_LA1_LBLNHDOMV	    = "lblNHDOMV"
'------------------------------------------------------------------

Private Const CEF_FRM_NAV		= "FORM_NAV_MEDIA"


'------------------------------------------------------------------

Private Const CEF_FRM_DATIAREA		            = "CONECOFOR_FormDATIAREA"
Private Const CEF_FRM_DATIAREA_DA1		        = "PageDA1"
Private Const CEF_FRM_DATIAREA_DA1_LBLPAESEV     = "LblPAESEV"
Private Const CEF_FRM_DATIAREA_DA1_LBLPROVV      = "LblPROVV"
Private Const CEF_FRM_DATIAREA_DA1_LBLCOMUNEV    = "LblCOMUNEV"
Private Const CEF_FRM_DATIAREA_DA1_CMBIDONEITA   = "ComboIDONEITA"
Private Const CEF_FRM_DATIAREA_DA1_DATEDATA      = "Data"
Private Const CEF_FRM_DATIAREA_DA1_EDITN		    = "EditN"
Private Const CEF_FRM_DATIAREA_DA1_EDITE  	    = "EditE"

Private Const CEF_FRM_DATIAREA_DA2		            = "PageDA2"
Private Const CEF_FRM_DATIAREA_DA2_CMBH20            = "ComboH20"
Private Const CEF_FRM_DATIAREA_DA2_CMBHUMUS          = "ComboHUMUS"
Private Const CEF_FRM_DATIAREA_DA2_CMBALT            = "ComboALT"
Private Const CEF_FRM_DATIAREA_DA2_CMBESP            = "ComboESP"
Private Const CEF_FRM_DATIAREA_DA2_CMBETA            = "ComboETA"
Private Const CEF_FRM_DATIAREA_DA2_EDITCATFORID      = "EditCATFORID"
Private Const CEF_FRM_DATIAREA_DA2_EDITCATFORTEXT    = "EditCATFORTEXT"
Private Const CEF_FRM_DATIAREA_DA2_BTNCATFOR         = "BtnCATFOR"
Private Const CEF_FRM_DATIAREA_DA2_EDITSCATFORID     = "EditSCATFORID"
Private Const CEF_FRM_DATIAREA_DA2_EDITSCATFORTEXT   = "EditSCATFORTEXT"
Private Const CEF_FRM_DATIAREA_DA2_BTNSCATFOR        = "BtnSCATFOR"
Private Const CEF_FRM_DATIAREA_DA3		        = "PageDA3"
Private Const CEF_FRM_DATIAREA_DA3_EDITNC  	    = "EditNC"
Private Const CEF_FRM_DATIAREA_DA3_EDITEC  	    = "EditEC"
Private Const CEF_FRM_DATIAREA_DA3_EDITFIXGPSC 	= "EditFIXGPSC"
Private Const CEF_FRM_DATIAREA_DA3_CMBPICCHC     = "ComboPICCHC"
Private Const CEF_FRM_DATIAREA_DA3_CMBTRSLC      = "ComboTRASLC"
Private Const CEF_FRM_DATIAREA_DA3_EDITTRASLC_A  = "EditTRASLC_A"
Private Const CEF_FRM_DATIAREA_DA3_EDITTRASLC_D  = "EditTRASLC_D"
Private Const CEF_FRM_DATIAREA_DA3_BTNPOSMED      = "BtnPOSMED"

'------------------------------------------------------------------

Private Const CEF_FRM_LISTPIANTE		            = "CONECOFOR_FormLISTPIANTE"

Private Const CEF_FRM_LISTPIANTE_LP1		        = "PageLP1"
Private Const CEF_FRM_LISTPIANTE_LP1_EDITID	    = "EditNPIANTA"
Private Const CEF_FRM_LISTPIANTE_LP1_BTNPREV	    = "BtnPREV"
Private Const CEF_FRM_LISTPIANTE_LP1_BTNNEXT	    = "BtnNEXT"
Private Const CEF_FRM_LISTPIANTE_LP1_BTNPREV10    = "BtnPREV10"
Private Const CEF_FRM_LISTPIANTE_LP1_BTNNEXT10    = "BtnNEXT10"
Private Const CEF_FRM_LISTPIANTE_LP1_BTNADD	    = "BtnADD"
Private Const CEF_FRM_LISTPIANTE_LP1_BTNDEL	    = "BtnDEL"
Private Const CEF_FRM_LISTPIANTE_LP1_LBLRMV	= "LblRMV"
Private Const CEF_FRM_LISTPIANTE_LP1_LBLSPECIEV	= "LblSPECIEV"
Private Const CEF_FRM_LISTPIANTE_LP1_LBLTRASV	= "LblTRASV"
Private Const CEF_FRM_LISTPIANTE_LP1_LBLFRUTV	= "LblFRUTV"
Private Const CEF_FRM_LISTPIANTE_LP1_LBLSINTOMI	= "lblSintomiVal"
Private Const CEF_FRM_LISTPIANTE_LP1_BTNDATIPIANTA	= "BtnDATIPIANTA"
Private Const CEF_FRM_LISTPIANTE_LP1_BTNLISTSINTOMI	= "BtnLISTSINTOMI"

Private Const CEF_FRM_DATIPIANTA		                = "CONECOFOR_FormDATIPIANTA"

Private Const CEF_FRM_DATIPIANTA_DP1		                = "PageDP1"
Private Const CEF_FRM_DATIPIANTA_DP1_EDITIDPIANTA        = "EditIdPIANTA"
Private Const CEF_FRM_DATIPIANTA_DP1_BTNIMPORT           = "BtnIMPORT"
Private Const CEF_FRM_DATIPIANTA_DP1_BTNSPECIE           = "BtnSPECIE"
Private Const CEF_FRM_DATIPIANTA_DP1_EDITIDSPECIEID      = "EditSPECIEID"
Private Const CEF_FRM_DATIPIANTA_DP1_EDITIDSPECIETEXT    = "EditSPECIETEXT"
Private Const CEF_FRM_DATIPIANTA_DP1_COMBODENDRO         = "ComboDENDRO"
Private Const CEF_FRM_DATIPIANTA_DP1_COMBORM             = "ComboRM"

Private Const CEF_FRM_DATIPIANTA_DP2		                = "PageDP2"
Private Const CEF_FRM_DATIPIANTA_DP2_COMBOCH_VAL         = "ComboCH_VAL"
Private Const CEF_FRM_DATIPIANTA_DP2_COMBOTRAS           = "ComboTRAS"
Private Const CEF_FRM_DATIPIANTA_DP2_COMBOFRUT           = "ComboFRUT"

Private Const CEF_FRM_DATIPIANTA_DP3		            = "PageDP3"
Private Const CEF_FRM_DATIPIANTA_DP3_EDITD1          = "EditD1"
Private Const CEF_FRM_DATIPIANTA_DP3_EDITD2          = "EditD2"
Private Const CEF_FRM_DATIPIANTA_DP3_EDITAZ          = "EditAZ"
Private Const CEF_FRM_DATIPIANTA_DP3_EDITDIST        = "EditDIST"






'------------------------------------------------------------------

Private Const CEF_FRM_LISTSINTOMI	= "CONECOFOR_FormLISTSINTOMI"

Private Const CEF_FRM_LISTSINTOMI_LS1	        = "PageLS1"
Private Const CEF_FRM_LISTSINTOMI_LS1_EDITID	    = "EditNSINTOMO"
Private Const CEF_FRM_LISTSINTOMI_LS1_BTNPREV    = "BtnPREV"
Private Const CEF_FRM_LISTSINTOMI_LS1_BTNNEXT    = "BtnNEXT"
Private Const CEF_FRM_LISTSINTOMI_LS1_BTNPREV10  = "BtnPREV10"
Private Const CEF_FRM_LISTSINTOMI_LS1_BTNNEXT10  = "BtnNEXT10"


Private Const CEF_FRM_LISTSINTOMI_LS1_BTNADD	    = "BtnADD"
Private Const CEF_FRM_LISTSINTOMI_LS1_BTNDEL	    = "BtnDEL"

Private Const CEF_FRM_LISTSINTOMI_LS1_LBLPARTEV	    = "LblPARTEV"
Private Const CEF_FRM_LISTSINTOMI_LS1_LBLSINTV	    = "LblSINTV"
Private Const CEF_FRM_LISTSINTOMI_LS1_LBLAGENTEV	    = "LblAGENTEV"

Private Const CEF_FRM_LISTSINTOMI_LS1_BTNDATISINTOMO	    = "BtnDATISINTOMO"



Private Const CEF_FRM_DATISINTOMO	= "CONECOFOR_FormDATISINTOMO"

Private Const CEF_FRM_DATISINTOMO_DS1		            = "PageDS1"
Private Const CEF_FRM_DATISINTOMO_DS1_EDITPARTEID		= "EditPARTEID"
Private Const CEF_FRM_DATISINTOMO_DS1_EDITPARTETEXT		= "EditPARTETEXT"
Private Const CEF_FRM_DATISINTOMO_DS1_BtnPARTE		    = "BtnPARTE"
Private Const CEF_FRM_DATISINTOMO_DS1_EDITSINTID 		= "EditSINTID"
Private Const CEF_FRM_DATISINTOMO_DS1_EDITSINTTEXT		= "EditSINTTEXT"
Private Const CEF_FRM_DATISINTOMO_DS1_BtnSINT		    = "BtnSINT"
Private Const CEF_FRM_DATISINTOMO_DS1_COMBOETA   		= "ComboETA"

Private Const CEF_FRM_DATISINTOMO_DS2		            = "PageDS2"
Private Const CEF_FRM_DATISINTOMO_DS2_BtnAGENTE		    = "BtnAGENTE"
Private Const CEF_FRM_DATISINTOMO_DS2_EDITAGENTEID       = "EditAGENTEID"
Private Const CEF_FRM_DATISINTOMO_DS2_EDITAGENTETEXT   	= "EditAGENTETEXT"
Private Const CEF_FRM_DATISINTOMO_DS2_BtnNOMEAGENTE		    = "BtnNOMEAGENTE"
Private Const CEF_FRM_DATISINTOMO_DS2_EDITNOMEAGENTEID   = "EditNOMEAGENTEID"
'Private Const CEF_FRM_DATISINTOMO_DS2_EDITNOMEAGENTETEXT = "EditNOMEAGENTETEXT"
Private Const CEF_FRM_DATISINTOMO_DS2_COMBOCHIOMAVAL   	= "ComboCHIOMAVAL"
Private Const CEF_FRM_DATISINTOMO_DS2_COMBODIFF   		= "ComboDIFF"

Private Const CEF_FRM_DATISINTOMO_DS3		            = "PageDS3"
Private Const CEF_FRM_DATISINTOMO_DS3_EDITNOTE   		= "editNOTE"

'------------------------------------------------------------------

Private Const CEF_FRM_RILDENDRO		= "CONECOFOR_FormRILDENDRO"


'------------------------------------------------------------------

Private Const CEF_FRM_CAV		= "CONECOFOR_FormCAV"

Private Const CEF_FRM_CAV_C1             = "PageC1"
Private Const CEF_FRM_CAV_C1_EDITID	    = "EditNCAV"
Private Const CEF_FRM_CAV_C1_BTNPREV     = "BtnPREV"
Private Const CEF_FRM_CAV_C1_BTNNEXT     = "BtnNEXT"
Private Const CEF_FRM_CAV_C1_BTNPREV10   = "BtnPREV10"
Private Const CEF_FRM_CAV_C1_BTNNEXT10   = "BtnNEXT10"

Private Const CEF_FRM_CAV_C1_BTNADD	    = "BtnADD"
Private Const CEF_FRM_CAV_C1_BTNDEL	    = "BtnDEL"

Private Const CEF_FRM_CAV_LblSPECIEID		= "LblSPECIEID" 
Private Const CEF_FRM_CAV_LblSPECIETEXT		= "LblSPECIETEXT"

Private Const CEF_FRM_CAV_LblD1V		        = "LblD1V"
Private Const CEF_FRM_CAV_LblD2V		        = "LblD2V"
Private Const CEF_FRM_CAV_LblALTEZZAV		= "LblALTEZZAV"
Private Const CEF_FRM_CAV_LblALTEZZAVM		= "LblALTEZZAVM"
Private Const CEF_FRM_CAV_LblDENDROV 		= "LblDENDROV"

Private Const CEF_FRM_CAVNEW		                = "CONECOFOR_FormCAVNEW"
Private Const CEF_FRM_CAVNEW_C1		            = "PageC1"
Private Const CEF_FRM_CAVNEW_EditSPECIEID		= "EditSPECIEID" 
Private Const CEF_FRM_CAVNEW_EditSPECIETEXT		= "EditSPECIETEXT"
Private Const CEF_FRM_CAVNEW_EditD1		        = "EditD1"
Private Const CEF_FRM_CAVNEW_EditD2		        = "EditD2"
Private Const CEF_FRM_CAVNEW_ComboALTEZZA		= "ComboALTEZZA"
Private Const CEF_FRM_CAVNEW_EditALTEZZAV		= "EditALTEZZAV"
Private Const CEF_FRM_CAVNEW_ComboDENDRO		    = "ComboDENDRO"


'------------------------------------------------------------------

Private Const CEF_FRM_HDOM		                = "CONECOFOR_FormHDOM"
Private Const CEF_FRM_HDOM_HD1		            = "PageHD1"
Private Const CEF_FRM_HDOM_HD1_LBOX		        = "lbox"
Private Const CEF_FRM_HDOM_HD1_EDITALTEZZAV		= "EditALTEZZAV"


Private Const CEF_FRM_GET_VALUE                  = "FrmGET_VALUE"

'------------------------------------------------------------------
Private CEF_aree_field_array(22,3)

'------------------------------------------------------------------


Private Const CEF_AREE_FIELDS_COUNT			= 23

Private Const CEF_AREE_FIELD_IDAREA			= "IDAREA"
Private Const CEF_AREE_FIELD_TIPOAREA  		= "TIPOAREA"
Private Const CEF_AREE_FIELD_PAESE		    = "PAESE"
Private Const CEF_AREE_FIELD_PROVINCI		= "PROVINCI"
Private Const CEF_AREE_FIELD_COMUNE 		    = "COMUNE"
Private Const CEF_AREE_FIELD_IDONEITA 		= "IDONEITA"
Private Const CEF_AREE_FIELD_DATARIL	    	= "DATARIL"
Private Const CEF_AREE_FIELD_COORDN			= "COORDN"
Private Const CEF_AREE_FIELD_COORDE			= "COORDE"
Private Const CEF_AREE_FIELD_FALTITUD		= "ALTITUD"
Private Const CEF_AREE_FIELD_ESPOSIZ	    	= "ESPOSIZ"
Private Const CEF_AREE_FIELD_DISPH2O		    = "DISPH2O"
Private Const CEF_AREE_FIELD_T_HUMUS		    = "T_HUMUS"
Private Const CEF_AREE_FIELD_ETAMEDIA		= "ETAMEDIA"
Private Const CEF_AREE_FIELD_CATFOR 	    	= "CATFOR"
Private Const CEF_AREE_FIELD_SCATFOR		    = "SCATFOR"
Private Const CEF_AREE_FIELD_COORDN_C		= "COORDN_C"			
Private Const CEF_AREE_FIELD_COORDE_C		= "COORDE_C"
Private Const CEF_AREE_FIELD_FIXGPS_C		= "FIXGPS_C"			
Private Const CEF_AREE_FIELD_PIC 		    = "PIC"
Private Const CEF_AREE_FIELD_T_PIC		    = "TRAS_PIC"
Private Const CEF_AREE_FIELD_T_PIC_AZ		= "T_PIC_AZ"
Private Const CEF_AREE_FIELD_T_PIC_DS		= "T_PIC_DS"

'------------------------------------------------------------------


'------------------------------------------------------------------
Private CEF_piante_field_array(12,3)

Private Const CEF_PIANTE_FIELDS_COUNT		= 13

Private Const CEF_PIANTE_FIELD_IDAREA		= "IDAREA"
Private Const CEF_PIANTE_FIELD_IDPIANTA		= "IDPIANTA"
Private Const CEF_PIANTE_FIELD_SPECIE		= "SPECIE"
Private Const CEF_PIANTE_FIELD_RM_OLD		= "RM_OLD"
Private Const CEF_PIANTE_FIELD_REM_MORT		= "REM_MORT"
Private Const CEF_PIANTE_FIELD_ASS_CROWN		= "ASS_CROWN"
Private Const CEF_PIANTE_FIELD_TRASPAR		= "TRASPAR"
Private Const CEF_PIANTE_FIELD_FRUTTIF		= "FRUTTIF"
Private Const CEF_PIANTE_FIELD_DENDROT		= "DENDROT"
Private Const CEF_PIANTE_FIELD_DIAM1			= "DIAM1"
Private Const CEF_PIANTE_FIELD_DIAM2 		= "DIAM2"
Private Const CEF_PIANTE_FIELD_DIST			= "DIST"
Private Const CEF_PIANTE_FIELD_AZIMUT		= "AZIMUT"



'------------------------------------------------------------------
Private CEF_sintomi_field_array(10,3)

Private Const CEF_SINTOMI_FIELDS_COUNT		= 11

Private Const CEF_SINTOMI_FIELD_IDAREA		= "IDAREA"
Private Const CEF_SINTOMI_FIELD_IDPIANTA		= "IDPIANTA"
Private Const CEF_SINTOMI_FIELD_IDSINTOMO	= "IDSINTOMO"
Private Const CEF_SINTOMI_FIELD_PARTE		= "PARTE"
Private Const CEF_SINTOMI_FIELD_TIPOSINT		= "TIPOSINT"
Private Const CEF_SINTOMI_FIELD_ETADANNO		= "ETADANNO"
Private Const CEF_SINTOMI_FIELD_AGENTE		= "AGENTE"
Private Const CEF_SINTOMI_FIELD_AG_NOME		= "AG_NOME"
Private Const CEF_SINTOMI_FIELD_AG_DIFF		= "AG_DIFF"
Private Const CEF_SINTOMI_FIELD_CHIOMA_V		= "CHIOMA_V"
Private Const CEF_SINTOMI_FIELD_NOTE 		= "NOTE"


'------------------------------------------------------------------
Private CEF_cav_field_array(7,3)

Private Const CEF_CAV_FIELDS_COUNT		= 8

Private Const CEF_CAV_FIELD_IDAREA		= "IDAREA"
Private Const CEF_CAV_FIELD_IDPIANTA		= "IDPIANTA"
Private Const CEF_CAV_FIELD_SPECIE		= "SPECIE"
Private Const CEF_CAV_FIELD_DIAM1    	= "DIAM1"
Private Const CEF_CAV_FIELD_DIAM2		= "DIAM2"
Private Const CEF_CAV_FIELD_DENDROT		= "DENDROT"
Private Const CEF_CAV_FIELD_RIL_H		= "RIL_H"
Private Const CEF_CAV_FIELD_H    		= "H"




'------------------------------------------------------------------
Private CEF_piante_bookmark_array(200,2)
Private CEF_sintomi_bookmark_array(100,2)
Private CEF_cav_bookmark_array(200,2)
Private CEF_hdom_bookmark_array(200,2)

Private CEF_AreeRS
Private CEF_PianteRS
Private CEF_SintomiRS
Private CEF_CavRS

Private CEF_TabdecRS

Private frmLISTBOX_array

Private DemoRectangle

Private CEF_layerPathPrefix

'------------------------------------------------------------------

Private Sub CEF_load_applet()
    Application.Log ( "CEF_load_applet" )
    Application.UserProperties("debug") = false
    If Application.UserProperties("debug") then
         Console.DebugFlags = 2 
    End If
   
    Set DemoRectangle = Application.CreateAppObject("rectangle")
    DemoRectangle.Bottom = 6000000
    DemoRectangle.Top = 6000000
    DemoRectangle.Left = 600000
    DemoRectangle.Right = 600000

        
    Call CEF_create_aree_field_array
    Application.Log ( "CEF_create_aree_field_array" )
    Call CEF_create_piante_field_array
    Application.Log ( "CEF_create_piante_field_array" )
    Call CEF_create_sintomi_field_array
    Application.Log ( "CEF_create_sintomi_field_array" )
    Call CEF_create_cav_field_array
    Application.Log ( "CEF_create_cav_field_array" )
    
    Dim CEF_Toolbar
	Set CEF_Toolbar = Application.ToolBars(CEF_TOOLBAR_TBR)
    CEF_Toolbar(CEF_TOOLBAR_TBR_BTN_LIST).enabled = false
    Application.Log ( "CEF_TOOLBAR_TBR_BTN_LIST" )
    
    Dim appApplets, CEF_Applet
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
    CEF_Applet.Forms("INFOFORM").Show
    Application.Log ( "CEF_Applet.Forms.INFOFORM.Show" )
End Sub

'------------------------------------------------------------------

Private Sub CEF_CreateShape()
	Dim strSelectedFile_Path,newShapeFileRS,strNewShpFile_Path
	
' 	If Not RK_reg_relaskope() Then
' 		Exit Sub
' 	End If

	strSelectedFile_Path = CommonDialog.ShowSave ("CONECOFOR.shp", "shp", "Shapefiles|*.shp", "Create Shape File")
	If Not IsEmpty (strSelectedFile_Path) Then
		'create AREE shapefile
        Dim slashPos,dotPos
		
		slashPos = InstrRev(strSelectedFile_Path,"\",-1, 1)
		dotPos = InstrRev(strSelectedFile_Path,".",-1, 1)
		strNewShpFile_Path = Left(strSelectedFile_Path,slashPos) & Mid(strSelectedFile_Path,slashPos+1,dotPos-slashPos-1) & "_AREE.shp"
		Set newShapeFileRS = Application.CreateAppObject("RecordSet")
		
		newShapeFileRS.create strNewShpFile_Path,11,Map.CoordinateSystem
		dim i
		
		For i=0 To CEF_AREE_FIELDS_COUNT-1
			Select Case CEF_aree_field_array(i,1)
			Case 5
				newShapeFileRS.Fields.Append CEF_aree_field_array(i,0),CEF_aree_field_array(i,1),CEF_aree_field_array(i,2),CEF_aree_field_array(i,3)
			Case 7
				newShapeFileRS.Fields.Append CEF_aree_field_array(i,0),CEF_aree_field_array(i,1)
			Case 11
				newShapeFileRS.Fields.Append CEF_aree_field_array(i,0),CEF_aree_field_array(i,1)
			Case 129
				newShapeFileRS.Fields.Append CEF_aree_field_array(i,0),CEF_aree_field_array(i,1),CEF_aree_field_array(i,2)
			End Select
		Next 
		
		newShapeFileRS.Update
		newShapeFileRS.Close
		
		
		'create symbology
		
		'Path to apl file to be created	
		Dim strNewAplFile_Path,newAplFile
		
		slashPos = InstrRev(strNewShpFile_Path,"\",-1, 1)
		dotPos = InstrRev(strNewShpFile_Path,".",-1, 1)
		strNewAplFile_Path = Left(strNewShpFile_Path,slashPos) & Mid(strNewShpFile_Path,slashPos+1,dotPos-slashPos-1) & ".apl"
		
		
		Set newAplFile = Application.CreateAppObject("File")
		newAplFile.Open strNewAplFile_Path,apFileWrite,apFileSystemDefault
		newAplFile.Write("<?xml version=""1.0"" encoding=""UTF-8"" ?>" & vbNewLine)
		newAplFile.Write("<ArcPad>" & vbNewLine)
		newAplFile.Write("<LAYER name=""" & Mid(strNewShpFile_Path,slashPos+1,dotPos-slashPos-1) & ".shp" & """>" & vbNewLine)
		newAplFile.Write("<SYMBOLOGY>" & vbNewLine)
        newAplFile.Write("<SIMPLERENDERER>" & vbNewLine)
		newAplFile.Write("<SIMPLEMARKERSYMBOL color=""Red"" width=""5"" outlinewidth=""1""/>" & vbNewLine)
        newAplFile.Write("</SIMPLERENDERER>" & vbNewLine)
		newAplFile.Write("</SYMBOLOGY>" & vbNewLine)
		newAplFile.Write("</LAYER>" & vbNewLine)
		newAplFile.Write("</ArcPad>" & vbNewLine)
		newAplFile.Close
		'load shapefile in the map
		Dim cLayer
		Set cLayer = Map.AddLayerFromFile(strNewShpFile_Path)
        
        'create PIANTE shapefile
        
		slashPos = InstrRev(strSelectedFile_Path,"\",-1, 1)
		dotPos = InstrRev(strSelectedFile_Path,".",-1, 1)
		strNewShpFile_Path = Left(strSelectedFile_Path,slashPos) & Mid(strSelectedFile_Path,slashPos+1,dotPos-slashPos-1) & "_PIANTE.shp"
		Set newShapeFileRS = Application.CreateAppObject("RecordSet")
		
		newShapeFileRS.create strNewShpFile_Path,11,Map.CoordinateSystem
		
		For i=0 To CEF_PIANTE_FIELDS_COUNT-1
			Select Case CEF_piante_field_array(i,1)
			Case 5
				newShapeFileRS.Fields.Append CEF_piante_field_array(i,0),CEF_piante_field_array(i,1),CEF_piante_field_array(i,2),CEF_piante_field_array(i,3)
			Case 7
				newShapeFileRS.Fields.Append CEF_piante_field_array(i,0),CEF_piante_field_array(i,1)
			Case 11
				newShapeFileRS.Fields.Append CEF_piante_field_array(i,0),CEF_piante_field_array(i,1)
			Case 129
				newShapeFileRS.Fields.Append CEF_piante_field_array(i,0),CEF_piante_field_array(i,1),CEF_piante_field_array(i,2)
			End Select
		Next 
		
		newShapeFileRS.Update
		newShapeFileRS.Close
		
		
		'create symbology
		
		'Path to apl file to be created	
		
		slashPos = InstrRev(strNewShpFile_Path,"\",-1, 1)
		dotPos = InstrRev(strNewShpFile_Path,".",-1, 1)
		strNewAplFile_Path = Left(strNewShpFile_Path,slashPos) & Mid(strNewShpFile_Path,slashPos+1,dotPos-slashPos-1) & ".apl"
		
		
		Set newAplFile = Application.CreateAppObject("File")
		newAplFile.Open strNewAplFile_Path,apFileWrite,apFileSystemDefault
		newAplFile.Write("<?xml version=""1.0"" encoding=""UTF-8"" ?>" & vbNewLine)
		newAplFile.Write("<ArcPad>" & vbNewLine)
		newAplFile.Write("<LAYER name=""" & Mid(strNewShpFile_Path,slashPos+1,dotPos-slashPos-1) & ".shp" & """>" & vbNewLine)
		newAplFile.Write("<SYMBOLOGY>" & vbNewLine)
        newAplFile.Write("<SIMPLERENDERER>" & vbNewLine)
		newAplFile.Write("<SIMPLEMARKERSYMBOL color=""Green"" width=""5"" outlinewidth=""1""/>" & vbNewLine)
        newAplFile.Write("</SIMPLERENDERER>" & vbNewLine)
		newAplFile.Write("</SYMBOLOGY>" & vbNewLine)
		newAplFile.Write("</LAYER>" & vbNewLine)
		newAplFile.Write("</ArcPad>" & vbNewLine)
		newAplFile.Close
		'load shapefile in the map
		Set cLayer = Map.AddLayerFromFile(strNewShpFile_Path)
        
		Set newAplFile = Nothing
       
		'create SINTOMI dbf
        
		slashPos = InstrRev(strSelectedFile_Path,"\",-1, 1)
		dotPos = InstrRev(strSelectedFile_Path,".",-1, 1)
		strNewShpFile_Path = Left(strSelectedFile_Path,slashPos) & Mid(strSelectedFile_Path,slashPos+1,dotPos-slashPos-1) & "_SINTOMI.dbf"
		Set newShapeFileRS = Application.CreateAppObject("RecordSet")
		
		newShapeFileRS.create strNewShpFile_Path,0
		
		For i=0 To CEF_SINTOMI_FIELDS_COUNT-1
			Select Case CEF_sintomi_field_array(i,1)
			Case 5
				newShapeFileRS.Fields.Append CEF_sintomi_field_array(i,0),CEF_sintomi_field_array(i,1),CEF_sintomi_field_array(i,2),CEF_sintomi_field_array(i,3)
			Case 7
				newShapeFileRS.Fields.Append CEF_sintomi_field_array(i,0),CEF_sintomi_field_array(i,1)
			Case 11
				newShapeFileRS.Fields.Append CEF_sintomi_field_array(i,0),CEF_sintomi_field_array(i,1)
			Case 129
				newShapeFileRS.Fields.Append CEF_sintomi_field_array(i,0),CEF_sintomi_field_array(i,1),CEF_sintomi_field_array(i,2)
			End Select
		Next 
		
		newShapeFileRS.Update
		newShapeFileRS.Close
		
        'create SINTOMI dbf
        
		slashPos = InstrRev(strSelectedFile_Path,"\",-1, 1)
		dotPos = InstrRev(strSelectedFile_Path,".",-1, 1)
		strNewShpFile_Path = Left(strSelectedFile_Path,slashPos) & Mid(strSelectedFile_Path,slashPos+1,dotPos-slashPos-1) & "_CAV.dbf"
		Set newShapeFileRS = Application.CreateAppObject("RecordSet")
		
		newShapeFileRS.create strNewShpFile_Path,0
		
		For i=0 To CEF_CAV_FIELDS_COUNT-1
			Select Case CEF_cav_field_array(i,1)
			Case 5
				newShapeFileRS.Fields.Append CEF_cav_field_array(i,0),CEF_cav_field_array(i,1),CEF_cav_field_array(i,2),CEF_cav_field_array(i,3)
			Case 7
				newShapeFileRS.Fields.Append CEF_cav_field_array(i,0),CEF_cav_field_array(i,1)
			Case 11
				newShapeFileRS.Fields.Append CEF_cav_field_array(i,0),CEF_cav_field_array(i,1)
			Case 129
				newShapeFileRS.Fields.Append CEF_cav_field_array(i,0),CEF_cav_field_array(i,1),CEF_cav_field_array(i,2)
			End Select
		Next 
		
		newShapeFileRS.Update
		newShapeFileRS.Close
        
	End If
	
	Set newShapeFileRS = Nothing
End Sub


Private Sub CEF_CreateShape_FromDBF()
	Dim DBFFile_Path
	
' 	If Not RK_reg_relaskope() Then
' 		Exit Sub
' 	End If

	DBFFile_Path = CommonDialog.ShowOpen ("dbf", "DBF|*.dbf","Open CONECOFOR DBF File",&H1000)
	If Not IsEmpty (DBFFile_Path) Then
        'exctract dbf file name
        Dim slashPos,dotPos,underscorePos,layer_Name
        slashPos = InstrRev(DBFFile_Path,"\",-1, 1)
		dotPos = InstrRev(DBFFile_Path,".",-1, 1)
        underscorePos = InstrRev(DBFFile_Path,"_",-1, 1)
     
        'copy orginal dbf to a temp copy
        Dim DBFTMPFile_Path,myFile
        DBFTMPFile_Path = Left(DBFFile_Path,slashPos) & Mid(DBFFile_Path,slashPos+1,dotPos-slashPos-1) & "-TMP" & ".dbf"
        Set myFile = Application.CreateAppObject("file")
        myFile.copy DBFFile_Path,DBFTMPFile_Path
        'delete orginal dbf
        myFile.delete(DBFFile_Path)
        
        'create AREE shapefile
        Dim newShapeFileRS,strNewShapeFile_Path,dbfRS
        strNewShapeFile_Path = Left(DBFFile_Path,slashPos) & Mid(DBFFile_Path,slashPos+1,dotPos-slashPos-1) & ".shp"
        Set newShapeFileRS = Application.CreateAppObject("RecordSet")
		newShapeFileRS.create strNewShapeFile_Path,11,Map.CoordinateSystem
        'open temp dbf recordset
        Set dbfRS = Application.CreateAppObject("RecordSet")
        dbfRS.open DBFTMPFile_Path,1
        Dim field
        For each field in dbfRS.Fields
            newShapeFileRS.Fields.Append field.name, field.type, field.definedSize, field.numericScale
        Next
        'Iterate through all records in pLayer's recordset
        dbfRS.MoveFirst
        While Not dbfRS.EOF
            'Ignore records flagged for deletion
            If Not dbfRS.IsDeleted Then
                  'create the new point geometry
                  Dim pPoint
                  Set pPoint = Application.CreateAppObject("point")
                  pPoint.X = dbfRS.Fields(CEF_AREE_FIELD_COORDE).Value
                  pPoint.Y = dbfRS.Fields(CEF_AREE_FIELD_COORDN).Value
                  
                  newShapeFileRS.AddNew pPoint
                  'copy over all the attribute values to the new record of the new shapefile
                  
                  For Each field In dbfRS.Fields
                        newShapeFileRS.Fields(field.Name).Value = field.Value
                  Next
                  'Update the new record of the new shapefile to save the changes
                  newShapeFileRS.Update
                  
                  Set pPoint = nothing
            End If
            dbfRS.MoveNext
        Wend
        
        newShapeFileRS.Update
		newShapeFileRS.Close
		
        'delete orginal dbf
        dbfRS.Close
        myFile.delete(DBFTMPFile_Path)
		
		'create symbology
		
		'Path to apl file to be created	
		Dim strNewAplFile_Path,strNewAplFile
		
		strNewAplFile_Path = Left(DBFFile_Path,slashPos) & Mid(DBFFile_Path,slashPos+1,dotPos-slashPos-1) & ".apl"
		
        layer_Name = Mid(strNewShapeFile_Path,slashPos+1,dotPos-slashPos-1)& ".shp"
		
		Set strNewAplFile = Application.CreateAppObject("File")
		strNewAplFile.Open strNewAplFile_Path,apFileWrite,apFileSystemDefault
		strNewAplFile.Write("<?xml version=""1.0"" encoding=""UTF-8"" ?>" & vbNewLine)
		strNewAplFile.Write("<ArcPad>" & vbNewLine)
		strNewAplFile.Write("<LAYER name=""" & layer_Name & """>" & vbNewLine)
		strNewAplFile.Write("<SYMBOLOGY>" & vbNewLine)
        strNewAplFile.Write("<SIMPLERENDERER>" & vbNewLine)
		strNewAplFile.Write("<SIMPLEMARKERSYMBOL color=""Red"" width=""5"" outlinewidth=""1""/>" & vbNewLine)
        strNewAplFile.Write("</SIMPLERENDERER>" & vbNewLine)
        strNewAplFile.Write("<SIMPLELABELRENDERER field=""IDAREA"" visible=""true"">"& vbNewLine)
        strNewAplFile.Write("<TEXTSYMBOL fontcolor=""0,0,0"" font=""System"" fontstyle=""bold"" fontsize=""8""/>"& vbNewLine) 
        strNewAplFile.Write("</SIMPLELABELRENDERER>" & vbNewLine)
		strNewAplFile.Write("</SYMBOLOGY>" & vbNewLine)
		strNewAplFile.Write("</LAYER>" & vbNewLine)
		strNewAplFile.Write("</ArcPad>" & vbNewLine)
		strNewAplFile.Close
		
		
		'load shapefile in the map
		Dim cLayer
		Set cLayer = Map.AddLayerFromFile(strNewShapeFile_Path)
		'get the aree recordset to obtain area center choords
        Dim areeLayer, areeshapeRS
        Set areeLayer = Application.Map.Layers.Item(layer_Name)
        Set areeShapeRS = areeLayer.records
      
        
        'create PIANTE shapefile
        
        'copy orginal dbf to a temp copy
        Dim DBF_PIANTE_File_Path
        DBF_PIANTE_File_Path = Left(DBFFile_Path,underscorePos-1) & "_PIANTE.dbf"
        slashPos = InstrRev(DBF_PIANTE_File_Path,"\",-1, 1)
		dotPos = InstrRev(DBF_PIANTE_File_Path,".",-1, 1)
        underscorePos = InstrRev(DBF_PIANTE_File_Path,"_",-1, 1)
        
        DBFTMPFile_Path = Left(DBF_PIANTE_File_Path,slashPos) & Mid(DBF_PIANTE_File_Path,slashPos+1,dotPos-slashPos-1) & "-TMP" & ".dbf"
        Set myFile = Application.CreateAppObject("file")
        myFile.copy DBF_PIANTE_File_Path,DBFTMPFile_Path
        'delete orginal dbf
        myFile.delete(DBF_PIANTE_File_Path)
        
        
        strNewShapeFile_Path = Left(DBF_PIANTE_File_Path,slashPos) & Mid(DBF_PIANTE_File_Path,slashPos+1,dotPos-slashPos-1) & ".shp"
        Set newShapeFileRS = Application.CreateAppObject("RecordSet")
		newShapeFileRS.create strNewShapeFile_Path,11,Map.CoordinateSystem
        'open temp dbf recordset
        Set dbfRS = Application.CreateAppObject("RecordSet")
        dbfRS.open DBFTMPFile_Path,1

        For each field in dbfRS.Fields
            newShapeFileRS.Fields.Append field.name, field.type, field.definedSize, field.numericScale
        Next
        
        'Iterate through all records in dbfRS's recordset
        dbfRS.MoveFirst
        While Not dbfRS.EOF
            'Ignore records flagged for deletion
            If Not dbfRS.IsDeleted Then
                  
                  'get the AREA of PIANTA choordinates
                  Dim idArea,findString,area_x,area_y
                  idArea = dbfRS.Fields(CEF_PIANTE_FIELD_IDAREA).Value
                  findString = "[" & CEF_AREE_FIELD_IDAREA & "] = """ & idArea & """"
                  areeShapeRS.bookmark = areeShapeRS.find(findString)
                  area_x = areeShapeRS.Fields(CEF_AREE_FIELD_COORDE).Value
                  area_y = areeShapeRS.Fields(CEF_AREE_FIELD_COORDN).Value
                  'create the new point geometry

                  Set pPoint = Application.CreateAppObject("point")
                  
                  Dim dist,azimut
                  dist = dbfRS.Fields(CEF_PIANTE_FIELD_DIST).Value
                  azimut = 90 -dbfRS.Fields(CEF_PIANTE_FIELD_AZIMUT).Value
                  pPoint.X = area_x + dist*cos((azimut*3.14159/180))
                  pPoint.Y = area_y + dist*sin((azimut*3.14159/180))
                  
                  newShapeFileRS.AddNew pPoint
                  
                  'copy over all the attribute values to the new record of the new shapefile
                  
                  For Each field In dbfRS.Fields
                        newShapeFileRS.Fields(field.Name).Value = field.Value
                  Next
                  
                  'Update the new record of the new shapefile to save the changes
                  newShapeFileRS.Update
                  
                  Set pPoint = nothing
            End If
            dbfRS.MoveNext
        Wend
        
        newShapeFileRS.Update
		newShapeFileRS.Close
		
        'delete orginal dbf
        dbfRS.Close
        myFile.delete(DBFTMPFile_Path)
		
		'create symbology
		
		'Path to apl file to be created	

		
		strNewAplFile_Path = Left(DBF_PIANTE_File_Path,slashPos) & Mid(DBF_PIANTE_File_Path,slashPos+1,dotPos-slashPos-1) & ".apl"
	
        layer_Name = Mid(strNewShapeFile_Path,slashPos+1,dotPos-slashPos-1)& ".shp"
		
		Set strNewAplFile = Application.CreateAppObject("File")
		strNewAplFile.Open strNewAplFile_Path,apFileWrite,apFileSystemDefault
		strNewAplFile.Write("<?xml version=""1.0"" encoding=""UTF-8"" ?>" & vbNewLine)
		strNewAplFile.Write("<ArcPad>" & vbNewLine)
		strNewAplFile.Write("<LAYER name=""" & layer_Name & """>" & vbNewLine)
		strNewAplFile.Write("<SYMBOLOGY>" & vbNewLine)
        strNewAplFile.Write("<SIMPLERENDERER>" & vbNewLine)
		strNewAplFile.Write("<SIMPLEMARKERSYMBOL color=""Green"" width=""5"" outlinewidth=""1""/>" & vbNewLine)
        strNewAplFile.Write("</SIMPLERENDERER>" & vbNewLine)
        strNewAplFile.Write("<SIMPLELABELRENDERER field=""IDPIANTA"" visible=""true"">"& vbNewLine)
        strNewAplFile.Write("<TEXTSYMBOL fontcolor=""0,0,0"" font=""System"" fontsize=""6""/>"& vbNewLine) 
        strNewAplFile.Write("</SIMPLELABELRENDERER>" & vbNewLine)
		strNewAplFile.Write("</SYMBOLOGY>" & vbNewLine)
		strNewAplFile.Write("</LAYER>" & vbNewLine)
		strNewAplFile.Write("</ArcPad>" & vbNewLine)
		strNewAplFile.Close
		
		
		'load shapefile in the map

		Set cLayer = Map.AddLayerFromFile(strNewShapeFile_Path)
		
        Set areeLayer = Nothing
        Set areeShapeRS = Nothing
        Set strNewAplFile = Nothing
        Set newShapeFileRS = Nothing
        Set dbfRS = Nothing
        Set myFile = nothing
        
        
	End If
End Sub

Private Sub CEF_show_FrmSet()
	'If Not RK_reg_relaskope() Then
	'	Exit Sub
	'End If
	Dim appApplets, CEF_Applet
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item (CEF_APPLET_APP)
	
	CEF_Applet.Forms(CEF_FRMSET).Show
	
	'free resources 
	Set appApplets = nothing
	Set CEF_Applet = nothing
End Sub

Private Sub CEF_FrmSet_onload()
	Dim pForm,pPage
	Set pForm = Thisevent.object
	Set pPage = pForm.Pages(CEF_FRMSET_S1)
	Dim appLayers,appLayer,dashPos,slashPos,fileName,layerAree,layerAreeName,layerPianteName
	Set appLayers = application.Map.Layers
    If appLayers.count = 0 Then
        MsgBox "Errore: prima caricare gli Shapefile CONECOFOR AREE e PIANTE!"
        pForm.Close(false)
        Exit Sub
    End If
    layerAreeName = "NOT_FOUND"
    layerPianteName = "NOT_FOUND"
	For Each appLayer In appLayers
		if StrComp(appLayer.layerFormat,"SHAPEFILE") = 0 then
			if CEF_compare_RS(appLayer.Records,CEF_aree_field_array) then
                slashPos = InstrRev(appLayer.FilePath,"\",-1, 1)
                fileName = Right(appLayer.FilePath,Len(appLayer.FilePath)-slashPos)
				pPage(CEF_FRMSET_LBL_LAYER_AREE).Value = fileName
                Set layerAree = appLayer
                layerAreeName = fileName
            end if
            if CEF_compare_RS(appLayer.Records,CEF_piante_field_array) then
                slashPos = InstrRev(appLayer.FilePath,"\",-1, 1)
                fileName = Right(appLayer.FilePath,Len(appLayer.FilePath)-slashPos)
                pPage(CEF_FRMSET_LBL_LAYER_PIANTE).Value = fileName
                layerPianteName = fileName
            end if
		end if
	Next
    
    If StrComp(layerAreeName,"NOT_FOUND") = 0 Then
        MsgBox "Errore: non hai caricato uno Shapefile AREE valido (Rel 3)!"
        pForm.Close(false)
        Exit Sub
    End If
    
    If StrComp(layerPianteName,"NOT_FOUND") = 0 Then
        MsgBox "Errore: non hai caricato uno Shapefile PIANTE valido (Rel 3)!"
        pForm.Close(false)
        Exit Sub
    End If
     
    dashPos = InstrRev(layerAree.FilePath,"_",-1, 1)  
    CEF_layerPathPrefix = Left(layerAree.FilePath,dashPos)

    'check if dbf sintomi exist and is valid
    Dim dbfSintomi_path,fileObj,dbfSintomRS
    'slashPos = InstrRev(Application.Map.FilePath,"\",-1, 1)  
    dbfSintomi_path = CEF_layerPathPrefix & "SINTOMI.dbf"
    
    Set fileObj = Application.CreateAppObject("file")
    If fileObj.Exists(dbfSintomi_path) Then
        Set dbfSintomRS = Application.CreateAppObject("Recordset")
        dbfSintomRS.Open(dbfSintomi_path)
        if CEF_compare_RS(dbfSintomRS,CEF_sintomi_field_array) then
                slashPos = InstrRev(dbfSintomi_path,"\",-1, 1)
                fileName = Right(dbfSintomi_path,Len(dbfSintomi_path)-slashPos)
				pPage(CEF_FRMSET_LBL_LAYER_SINTOMI).Value = fileName
		end if
    Else
        MsgBox "Errore nel file DBF SINTOMI (Rel 3)"
        pForm.Close(false)
        Exit Sub
    End If
    
    'check if dbf cav exist and is valid
    Dim dbfCav_path,dbfCavRS
    'slashPos = InstrRev(Application.Map.FilePath,"\",-1, 1)  
    dbfCav_path = CEF_layerPathPrefix & "CAV.dbf"
    
    
    Set fileObj = Application.CreateAppObject("file")
    If fileObj.Exists(dbfCav_path) Then
        Set dbfCavRS = Application.CreateAppObject("Recordset")
        dbfCavRS.Open(dbfCav_path)
        if CEF_compare_RS(dbfCavRS,CEF_cav_field_array) then
                slashPos = InstrRev(dbfCav_path,"\",-1, 1)
                fileName = Right(dbfCav_path,Len(dbfCav_path)-slashPos)
				pPage(CEF_FRMSET_LBL_LAYER_CAV).Value = fileName
		end if
    Else
        MsgBox "Errore nel file CAV (Rel 3)"
        pForm.Close(false)
        Exit Sub
    End If
    
    'check if dbf tabdec exist and is valid
    Dim dbfTabdec_path
    'slashPos = InstrRev(Application.Map.FilePath,"\",-1, 1)  
    dbfTabdec_path = CEF_layerPathPrefix & "TABDEC.dbf"
    Set fileObj = Application.CreateAppObject("file")
    If fileObj.Exists(dbfTabdec_path) Then
        slashPos = InstrRev(dbfTabdec_path,"\",-1, 1)
        fileName = Right(dbfTabdec_path,Len(dbfTabdec_path)-slashPos)
        pPage(CEF_FRMSET_LBL_LAYER_TABDEC).Value = fileName
    Else
        MsgBox "Manca file DBF TABDEC"
        pForm.Close(false)
        Exit Sub
    End If
    
    If Len(pPage(CEF_FRMSET_LBL_LAYER_AREE).Value)= 0 Then
        MsgBox "Errore nel file DBF AREE (Rel 3)"
        pForm.Close(false) 
        Exit Sub
    End If
    If Len(pPage(CEF_FRMSET_LBL_LAYER_PIANTE).Value) = 0 Then
        MsgBox "Errore nel file DBF PIANTE (Rel 3)"
        pForm.Close(false)
        Exit Sub
    End If

	'free resources 
	Set pPage = nothing
	Set appLayers = nothing
	Set appLayer = nothing
End Sub


Private Sub CEF_FrmSet_PS1_onvalidate()
	Dim pPage
	Set pPage = Thisevent.object
	
	Dim CEF_Toolbar
	Set CEF_Toolbar = Application.ToolBars(CEF_TOOLBAR_TBR)


	If  Len(pPage(CEF_FRMSET_LBL_LAYER_AREE).Value)> 0 and Len(pPage(CEF_FRMSET_LBL_LAYER_PIANTE).Value)>0 and Len(pPage(CEF_FRMSET_LBL_LAYER_SINTOMI).Value)>0 and Len(pPage(CEF_FRMSET_LBL_LAYER_CAV).Value)>0 Then
		Application.UserProperties("CEF_AREE_LAYER_NAME_STRING") = "CONECOFOR_AREE.shp"
		Application.UserProperties("CEF_PIANTE_LAYER_NAME_STRING") = "CONECOFOR_PIANTE.shp"
        
        Application.UserProperties("CEF_SINTOMI_DBF_PATH") = CEF_layerPathPrefix & "SINTOMI.dbf"
        Application.UserProperties("CEF_CAV_DBF_PATH") = CEF_layerPathPrefix & "CAV.dbf"
        Application.UserProperties("CEF_TABDEC_DBF_PATH") = CEF_layerPathPrefix & "TABDEC.dbf"
        
        Application.Map.Layers.MoveToTop(Application.UserProperties("CEF_PIANTE_LAYER_NAME_STRING"))
		Application.Map.Layers.MoveToTop(Application.UserProperties("CEF_AREE_LAYER_NAME_STRING"))
		
        Dim CEF_Layer,CEF_LayerRS
        
        'set index cav dbf
        Set CEF_LayerRS = Application.CreateAppObject("Recordset")
        CEF_LayerRS.Open(Application.UserProperties("CEF_CAV_DBF_PATH"))
        
        'set index sintomi dbf
        Set CEF_LayerRS = Application.CreateAppObject("Recordset")
        CEF_LayerRS.Open(Application.UserProperties("CEF_SINTOMI_DBF_PATH"))
       
        
        'set piante layer
		
        Set CEF_Layer = Application.Map.Layers.Item(Application.UserProperties("CEF_PIANTE_LAYER_NAME_STRING"))
		CEF_Layer.Properties("ShowEditForm") = False
        CEF_Layer.Properties("ShowProgressDialogs") = false
        Set CEF_LayerRS = CEF_Layer.Records
       
        
        'set aree layer
        Set CEF_Layer = Application.Map.Layers.Item(Application.UserProperties("CEF_AREE_LAYER_NAME_STRING"))
		CEF_Layer.Editable = True
		CEF_Layer.Properties("ShowEditForm") = False
		CEF_Layer.Properties("ShowProgressDialogs") = false	
		CEF_Toolbar(CEF_TOOLBAR_TBR_BTN_LIST).enabled = true
        
        
        
	End If
	
	'free resources 
	Set pPage = nothing
	Set CEF_Toolbar = nothing
	
End Sub


Private Function CEF_compare_RS(compareRS,field_array)
    CEF_compare_RS = true
    Dim compareFields
    Set compareFields = compareRS.Fields
	If compareFields.Count = UBound(field_array)+1 Then
		Dim i,compareField
		For i=1 To compareFields.Count
			Set compareField = compareFields.Item(i)
			If (StrComp(field_array(i-1,0),compareField.Name) <> 0) Or (field_array(i-1,1) <> compareField.Type) Then
				MsgBox field_array(i-1,0) & "&" & compareField.Name & vbNewLine & field_array(i-1,1) & "&" & compareField.Type & vbNewLine & CStr(StrComp(field_array(i-1,0),compareField.Name) <> 0) & "	" & CStr(field_array(i-1,1) <> compareField.Type)
				CEF_compare_RS = false
				Exit For
			End if
		Next
	Else
		CEF_compare_RS = false
	End if

End Function


Private Sub CEF_create_aree_field_array()

	CEF_aree_field_array(0,0) = CEF_AREE_FIELD_IDAREA
    CEF_aree_field_array(1,0) = CEF_AREE_FIELD_TIPOAREA
    CEF_aree_field_array(2,0) = CEF_AREE_FIELD_PAESE
    CEF_aree_field_array(3,0) = CEF_AREE_FIELD_PROVINCI		
    CEF_aree_field_array(4,0) = CEF_AREE_FIELD_COMUNE
    CEF_aree_field_array(5,0) = CEF_AREE_FIELD_IDONEITA
    CEF_aree_field_array(6,0) = CEF_AREE_FIELD_DATARIL		
    CEF_aree_field_array(7,0) = CEF_AREE_FIELD_COORDN			
    CEF_aree_field_array(8,0) = CEF_AREE_FIELD_COORDE			
    CEF_aree_field_array(9,0) = CEF_AREE_FIELD_FALTITUD		
    CEF_aree_field_array(10,0) = CEF_AREE_FIELD_ESPOSIZ	
    CEF_aree_field_array(11,0) = CEF_AREE_FIELD_DISPH2O		
    CEF_aree_field_array(12,0) = CEF_AREE_FIELD_T_HUMUS		
    CEF_aree_field_array(13,0) = CEF_AREE_FIELD_ETAMEDIA		
    CEF_aree_field_array(14,0) = CEF_AREE_FIELD_CATFOR 	    	
    CEF_aree_field_array(15,0) = CEF_AREE_FIELD_SCATFOR
    CEF_aree_field_array(16,0) = CEF_AREE_FIELD_COORDN_C			
    CEF_aree_field_array(17,0) = CEF_AREE_FIELD_COORDE_C
    CEF_aree_field_array(18,0) = CEF_AREE_FIELD_FIXGPS_C			
    CEF_aree_field_array(19,0) = CEF_AREE_FIELD_PIC
    CEF_aree_field_array(20,0) = CEF_AREE_FIELD_T_PIC
    CEF_aree_field_array(21,0) = CEF_AREE_FIELD_T_PIC_AZ
    CEF_aree_field_array(22,0) = CEF_AREE_FIELD_T_PIC_DS
    
    CEF_aree_field_array(0,1) = 129
    CEF_aree_field_array(1,1) = 129
    CEF_aree_field_array(2,1) = 129
    CEF_aree_field_array(3,1) = 129
    CEF_aree_field_array(4,1) = 129		
    CEF_aree_field_array(5,1) = 129
    CEF_aree_field_array(6,1) = 7		
    CEF_aree_field_array(7,1) = 5			
    CEF_aree_field_array(8,1) = 5			
    CEF_aree_field_array(9,1) = 129		
    CEF_aree_field_array(10,1) = 129		
    CEF_aree_field_array(11,1) = 129		
    CEF_aree_field_array(12,1) = 129		
    CEF_aree_field_array(13,1) = 129		
    CEF_aree_field_array(14,1) = 129 	    	
    CEF_aree_field_array(15,1) = 129
    CEF_aree_field_array(16,1) = 5			
    CEF_aree_field_array(17,1) = 5
    CEF_aree_field_array(18,1) = 5			
    CEF_aree_field_array(19,1) = 129
    CEF_aree_field_array(20,1) = 129
    CEF_aree_field_array(21,1) = 5
    CEF_aree_field_array(22,1) = 5
    
    CEF_aree_field_array(0,2) = 7
    CEF_aree_field_array(1,2) = 1
    CEF_aree_field_array(2,2) = 2
    CEF_aree_field_array(3,2) = 2
    CEF_aree_field_array(4,2) = 30		
    CEF_aree_field_array(5,2) = 1
    CEF_aree_field_array(6,2) = 0		
    CEF_aree_field_array(7,2) = 10			
    CEF_aree_field_array(8,2) = 10			
    CEF_aree_field_array(9,2) = 10		
    CEF_aree_field_array(10,2) = 1		
    CEF_aree_field_array(11,2) = 1		
    CEF_aree_field_array(12,2) = 1		
    CEF_aree_field_array(13,2) = 1		
    CEF_aree_field_array(14,2) = 2 	    	
    CEF_aree_field_array(15,2) = 3
    CEF_aree_field_array(16,2) = 10			
    CEF_aree_field_array(17,2) = 10
    CEF_aree_field_array(18,2) = 3			
    CEF_aree_field_array(19,2) = 1
    CEF_aree_field_array(20,2) = 1
    CEF_aree_field_array(21,2) = 6
    CEF_aree_field_array(22,2) = 5
    
    CEF_aree_field_array(0,3) = 0
    CEF_aree_field_array(1,3) = 0
    CEF_aree_field_array(2,3) = 0
    CEF_aree_field_array(3,3) = 0
    CEF_aree_field_array(4,3) = 0		
    CEF_aree_field_array(5,3) = 0
    CEF_aree_field_array(6,3) = 0		
    CEF_aree_field_array(7,3) = 2			
    CEF_aree_field_array(8,3) = 2			
    CEF_aree_field_array(9,3) = 0		
    CEF_aree_field_array(10,3) = 0		
    CEF_aree_field_array(11,3) = 0		
    CEF_aree_field_array(12,3) = 0		
    CEF_aree_field_array(13,3) = 0		
    CEF_aree_field_array(14,3) = 0 	    	
    CEF_aree_field_array(15,3) = 0
    CEF_aree_field_array(16,3) = 2			
    CEF_aree_field_array(17,3) = 2
    CEF_aree_field_array(18,3) = 0			
    CEF_aree_field_array(19,3) = 0
    CEF_aree_field_array(20,3) = 0
    CEF_aree_field_array(21,3) = 2
    CEF_aree_field_array(22,3) = 2

End Sub

Private Sub CEF_create_piante_field_array()

	CEF_piante_field_array(0,0) = CEF_PIANTE_FIELD_IDAREA
    CEF_piante_field_array(1,0) = CEF_PIANTE_FIELD_IDPIANTA
    CEF_piante_field_array(2,0) = CEF_PIANTE_FIELD_SPECIE
    CEF_piante_field_array(3,0) = CEF_PIANTE_FIELD_RM_OLD
    CEF_piante_field_array(4,0) = CEF_PIANTE_FIELD_REM_MORT
    CEF_piante_field_array(5,0) = CEF_PIANTE_FIELD_ASS_CROWN
    CEF_piante_field_array(6,0) = CEF_PIANTE_FIELD_TRASPAR
    CEF_piante_field_array(7,0) = CEF_PIANTE_FIELD_FRUTTIF
    CEF_piante_field_array(8,0) = CEF_PIANTE_FIELD_DENDROT
    CEF_piante_field_array(9,0) = CEF_PIANTE_FIELD_DIAM1
	CEF_piante_field_array(10,0) = CEF_PIANTE_FIELD_DIAM2
	CEF_piante_field_array(11,0) = CEF_PIANTE_FIELD_DIST
	CEF_piante_field_array(12,0) = CEF_PIANTE_FIELD_AZIMUT
	
	CEF_piante_field_array(0,1) = 129
    CEF_piante_field_array(1,1) = 5
    CEF_piante_field_array(2,1) = 129
    CEF_piante_field_array(3,1) = 129
    CEF_piante_field_array(4,1) = 129
    CEF_piante_field_array(5,1) = 129
    CEF_piante_field_array(6,1) = 129
    CEF_piante_field_array(7,1) = 129
    CEF_piante_field_array(8,1) = 129
    CEF_piante_field_array(9,1) = 5
    CEF_piante_field_array(10,1) = 5
	CEF_piante_field_array(11,1) = 5
	CEF_piante_field_array(12,1) = 5

	CEF_piante_field_array(0,2) = 7
    CEF_piante_field_array(1,2) = 4
    CEF_piante_field_array(2,2) = 3
    CEF_piante_field_array(3,2) = 3
    CEF_piante_field_array(4,2) = 3
    CEF_piante_field_array(5,2) = 2
    CEF_piante_field_array(6,2) = 3
    CEF_piante_field_array(7,2) = 3
    CEF_piante_field_array(8,2) = 1
    CEF_piante_field_array(9,2) = 3
    CEF_piante_field_array(10,2) = 3
	CEF_piante_field_array(11,2) = 6
	CEF_piante_field_array(12,2) = 6
    
	CEF_piante_field_array(0,3) = 0
    CEF_piante_field_array(1,3) = 0
    CEF_piante_field_array(2,3) = 0
    CEF_piante_field_array(3,3) = 0
    CEF_piante_field_array(4,3) = 0
    CEF_piante_field_array(5,3) = 0
    CEF_piante_field_array(6,3) = 0
    CEF_piante_field_array(7,3) = 0
    CEF_piante_field_array(8,3) = 0
    CEF_piante_field_array(9,3) = 0
    CEF_piante_field_array(10,3) = 0
	CEF_piante_field_array(11,3) = 2
	CEF_piante_field_array(12,3) = 2

End Sub

Private Sub CEF_create_sintomi_field_array()

	CEF_sintomi_field_array(0,0) = CEF_SINTOMI_FIELD_IDAREA
    CEF_sintomi_field_array(1,0) = CEF_SINTOMI_FIELD_IDPIANTA
	CEF_sintomi_field_array(2,0) = CEF_SINTOMI_FIELD_IDSINTOMO
	CEF_sintomi_field_array(3,0) = CEF_SINTOMI_FIELD_PARTE
	CEF_sintomi_field_array(4,0) = CEF_SINTOMI_FIELD_TIPOSINT	
    CEF_sintomi_field_array(5,0) = CEF_SINTOMI_FIELD_ETADANNO		
    CEF_sintomi_field_array(6,0) = CEF_SINTOMI_FIELD_AGENTE	
    CEF_sintomi_field_array(7,0) = CEF_SINTOMI_FIELD_AG_NOME	
    CEF_sintomi_field_array(8,0) = CEF_SINTOMI_FIELD_AG_DIFF		
    CEF_sintomi_field_array(9,0) = CEF_SINTOMI_FIELD_CHIOMA_V
    CEF_sintomi_field_array(10,0) = CEF_SINTOMI_FIELD_NOTE

	CEF_sintomi_field_array(0,1) = 129
    CEF_sintomi_field_array(1,1) = 5
	CEF_sintomi_field_array(2,1) = 5
	CEF_sintomi_field_array(3,1) = 129
    CEF_sintomi_field_array(4,1) = 129	
    CEF_sintomi_field_array(5,1) = 129		
    CEF_sintomi_field_array(6,1) = 129	
    CEF_sintomi_field_array(7,1) = 129	
    CEF_sintomi_field_array(8,1) = 129		
    CEF_sintomi_field_array(9,1) = 129
    CEF_sintomi_field_array(10,1) = 129
    
	CEF_sintomi_field_array(0,2) = 7
    CEF_sintomi_field_array(1,2) = 3
	CEF_sintomi_field_array(2,2) = 2
	CEF_sintomi_field_array(3,2) = 2
    CEF_sintomi_field_array(4,2) = 2	
    CEF_sintomi_field_array(5,2) = 1		
    CEF_sintomi_field_array(6,2) = 5	
    CEF_sintomi_field_array(7,2) = 60	
    CEF_sintomi_field_array(8,2) = 3		
    CEF_sintomi_field_array(9,2) = 1
    CEF_sintomi_field_array(10,2) = 254
    
	CEF_sintomi_field_array(0,3) = 0
    CEF_sintomi_field_array(1,3) = 0
	CEF_sintomi_field_array(2,3) = 0
	CEF_sintomi_field_array(3,3) = 0
    CEF_sintomi_field_array(4,3) = 0	
    CEF_sintomi_field_array(5,3) = 0	
    CEF_sintomi_field_array(6,3) = 0
    CEF_sintomi_field_array(7,3) = 0	
    CEF_sintomi_field_array(8,3) = 0	
    CEF_sintomi_field_array(9,3) = 0
    CEF_sintomi_field_array(10,3) = 0
End Sub


Private Sub CEF_create_cav_field_array()

	CEF_cav_field_array(0,0) = CEF_CAV_FIELD_IDAREA
    CEF_cav_field_array(1,0) = CEF_CAV_FIELD_IDPIANTA
	CEF_cav_field_array(2,0) = CEF_CAV_FIELD_SPECIE
	CEF_cav_field_array(3,0) = CEF_CAV_FIELD_DIAM1
	CEF_cav_field_array(4,0) = CEF_CAV_FIELD_DIAM2	
    CEF_cav_field_array(5,0) = CEF_CAV_FIELD_DENDROT		
    CEF_cav_field_array(6,0) = CEF_CAV_FIELD_RIL_H	
    CEF_cav_field_array(7,0) = CEF_CAV_FIELD_H	

    CEF_cav_field_array(0,1) = 129
    CEF_cav_field_array(1,1) = 5
	CEF_cav_field_array(2,1) = 129
	CEF_cav_field_array(3,1) = 5
	CEF_cav_field_array(4,1) = 5	
    CEF_cav_field_array(5,1) = 129		
    CEF_cav_field_array(6,1) = 129	
    CEF_cav_field_array(7,1) = 5
    
	CEF_cav_field_array(0,2) = 7
    CEF_cav_field_array(1,2) = 3
	CEF_cav_field_array(2,2) = 3
	CEF_cav_field_array(3,2) = 3
	CEF_cav_field_array(4,2) = 3	
    CEF_cav_field_array(5,2) = 1	
    CEF_cav_field_array(6,2) = 1	
    CEF_cav_field_array(7,2) = 5
    
    CEF_cav_field_array(0,3) = 0
    CEF_cav_field_array(1,3) = 0
	CEF_cav_field_array(2,3) = 0
	CEF_cav_field_array(3,3) = 0
	CEF_cav_field_array(4,3) = 0	
    CEF_cav_field_array(5,3) = 0	
    CEF_cav_field_array(6,3) = 0	
    CEF_cav_field_array(7,3) = 2
End Sub


'------------------------------------------------------------------




'------------------------------------------------------------------

Private Sub CEF_show_FrmList()
	Dim appApplets, CEF_Applet
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
	
    'On Error Resume Next
    Application.UserProperties("LAFORM_ONLOAD") = vbFalse
	CEF_Applet.Forms(CEF_FRM_LISTAREE).Show
	
    'manage error
'     if  Err.Number <> 0  then 
'         MsgBox "Exception:" & vbCrLf &_
'             "    Error number: " & Err.Number & vbCrLf &_
'             "    Error description: '" & Err.Description & vbCrLf &_
'             "    Error source: '" & Err.Source & vbCrLf
'         Map.Properties("SuspendDraw") = false
'     End If
End Sub


Private Sub CEF_FormLISTAREE_onload()
    Dim laForm,la1Page
    Set laForm = ThisEvent.Object
    
    Map.Properties("SuspendDraw") = true
    
    Dim CEF_AreeLayer,CEF_PianteLayer
	Set CEF_AreeLayer = Application.Map.Layers.Item(Application.UserProperties("CEF_AREE_LAYER_NAME_STRING"))
    CEF_AreeLayer.Editable = True
    Set CEF_AreeRS = CEF_AreeLayer.records
    
    Set CEF_PianteLayer = Application.Map.Layers.Item(Application.UserProperties("CEF_PIANTE_LAYER_NAME_STRING"))
    CEF_PianteLayer.Editable = false
    Set CEF_PianteRS = CEF_PianteLayer.Records
    
    Set CEF_SintomiRS = Application.CreateAppObject("Recordset")
    CEF_SintomiRS.Open Application.UserProperties("CEF_SINTOMI_DBF_PATH"),2
    
    Set CEF_TabdecRS = Application.CreateAppObject("Recordset")
    CEF_TabdecRS.Open Application.UserProperties("CEF_TABDEC_DBF_PATH"),1
    
    Set CEF_CavRS = Application.CreateAppObject("Recordset")
    CEF_CavRS.Open Application.UserProperties("CEF_CAV_DBF_PATH"),2
    
    
    
    If CEF_AreeRS.RecordCount = 0 Then
        MsgBox "Non e' presente alcuna area CONECOFOR!",vbExclamation,"CONECOFOR MOBILE"
        laForm.Close
        Exit sub
    End If
    
    
    
    
    Dim sLayer
    Set sLayer = Application.Map.SelectionLayer
    If sLayer Is nothing then
        CEF_AreeRS.MoveFirst
    Else
        If sLayer.Name = CEF_AreeLayer.Name AND Application.Map.SelectionBookmark  <> 0 Then
            CEF_AreeRS.Bookmark = Application.Map.SelectionBookmark
        Else
            CEF_AreeRS.MoveFirst
        End If
    End If
    
    '------------------START DEMO CODE--------------------
        
       
'     If CEF_AreeRS.RecordCount > 1 Then
'         MsgBox "Versione DEMO." & vbNewLine & "In questa versione non e' concesso avere piu' di un'area CONECOFOR!",vbExclamation,"CONECOFOR MOBILE"
'         laForm.Close
'         Exit sub
'     End If
'             
        
    '------------------END DEMO CODE---------------------
    
    
    Application.UserProperties("CEF_SELECTED_AREA_ID") = CEF_AreeRS(CEF_AREE_FIELD_IDAREA).Value


    Set la1Page = laForm(CEF_FRM_LISTAREE_LA1)
    Application.UserProperties("LAFORM_ONLOAD") = vbTrue
    la1Page.Activate
    
    

End Sub

Private Sub CEF_FormLISTAREE_onunload()
    Map.Properties("SuspendDraw") = false
    Application.UserProperties("LAFORM_ONLOAD") = vbFalse
    
    CEF_TabdecRS.Close
    Set CEF_TabdecRS = nothing
    
    CEF_CavRS.Close
    Set CEF_CavRS = nothing
End Sub

Private Sub CEF_FormLISTAREE_LA1_setactive()
    If Application.UserProperties("LAFORM_ONLOAD") Then
        Dim la1Page,laForm
        Set la1Page = ThisEvent.Object
        Set laForm = la1Page.Parent
        
        Dim CEF_AreeLayer
        Set CEF_AreeLayer = Application.Map.Layers.Item(Application.UserProperties("CEF_AREE_LAYER_NAME_STRING"))
        
        '------------------START DEMO CODE--------------------
        
'         Dim area_point
'         Set area_point = CEF_AreeRS.Fields.Shape
'         If not DemoRectangle.IsPointIn(area_point) Then
'             MsgBox "Versione DEMO." & vbNewLine & "Area non valida!",vbExclamation,"CONECOFOR MOBILE"
'             laForm.Close
'             Exit sub
'         End If
'                 
        
        '------------------END DEMO CODE---------------------
        
        
        Map.Select CEF_AreeLayer,CEF_AreeRS.Bookmark
        
        la1Page(CEF_FRM_LISTAREE_LA1_EDITID).Text = CEF_AreeRS(CEF_AREE_FIELD_IDAREA).Value
        
        'assign global area variables
        Application.UserProperties("CEF_SELECTED_AREA_COORDN") = Cdbl(CEF_AreeRS(CEF_AREE_FIELD_COORDN_C).Value)
        Application.UserProperties("CEF_SELECTED_AREA_COORDE") = Cdbl(CEF_AreeRS(CEF_AREE_FIELD_COORDE_C).Value)
        
        
        la1Page(CEF_FRM_LISTAREE_LA1_BTNLISTPIANTE).enabled = false
        la1Page(CEF_FRM_LISTAREE_LA1_BTNRILDENDRO).enabled = false
        
        'manage area idoneita' status

        Select Case CEF_AreeRS(CEF_AREE_FIELD_IDONEITA).Value
            Case "1"
                la1Page(CEF_FRM_LISTAREE_LA1_LBLIDONEITAV).Text = "1 Idonea"
                
                'imposta sintomi mancanti
                Dim find_string,sint_find_string, lBookmark, exit_loop, n_piante_area
                find_string = "["&CEF_PIANTE_FIELD_IDAREA&"] = """ & CEF_AreeRS(CEF_AREE_FIELD_IDAREA).Value & """ AND ([" & CEF_PIANTE_FIELD_RM_OLD & "] = ""1"" OR [" & CEF_PIANTE_FIELD_RM_OLD & "] = ""2"" OR [" & CEF_PIANTE_FIELD_RM_OLD & "] = ""3"")"  
                exit_loop = false
                n_piante_area=0
                If CEF_PianteRS.RecordCount > 0 Then
                    
                    CEF_PianteRS.MoveFirst
                    
                    lBookmark = CEF_PianteRS.Find(find_string)
                    
                    
                    
                    Do While (lBookmark>0 And Not exit_loop)
                        n_piante_area = n_piante_area +1       
                        Select Case Clng(CEF_PianteRS(CEF_PIANTE_FIELD_REM_MORT).Value)
                            Case 18,19,23,29,905,906:
                                
                            Case else:
                                sint_find_string = "["&CEF_SINTOMI_FIELD_IDAREA&"] = """ & CEF_AreeRS(CEF_AREE_FIELD_IDAREA).Value & """ AND [" & CEF_SINTOMI_FIELD_IDPIANTA & "] = " & CEF_PianteRS(CEF_PIANTE_FIELD_IDPIANTA).Value
                                If CEF_SintomiRS.RecordCount > 0 Then 
                                    CEF_SintomiRS.MoveFirst
                                    If CEF_SintomiRS.Find(sint_find_string) = 0 Then
                                  
                                        exit_loop = true
                                    End If
                                Else
                                    exit_loop = true
                                End If
                        End Select
                        lBookmark = CEF_PianteRS.Find(find_string,,lBookmark)
                    Loop
                Else
                    exit_loop = true
                End If
                
                If exit_loop Then
                    la1Page(CEF_FRM_LISTAREE_LA1_LBLNOSINTV).Text = "SI"
                Else
                    If n_piante_area > 0 Then
                        la1Page(CEF_FRM_LISTAREE_LA1_LBLNOSINTV).Text = "NO"
                    Else
                        la1Page(CEF_FRM_LISTAREE_LA1_LBLNOSINTV).Text = "--"
                         MsgBox "Non vi sono piante campione della chioma rilevate in questa area!",vbExclamation,"CONECOFOR MOBILE"
                    End If
                End If
                
                'trova numero piante cav e hdom
                
                Dim n_cav,n_hdom
                n_cav = 0
                n_hdom = 0
                
                find_string = "["&CEF_PIANTE_FIELD_IDAREA&"] = """ & CEF_AreeRS(CEF_AREE_FIELD_IDAREA).Value & """ "  
                
                If CEF_CavRS.RecordCount > 0 Then
                    CEF_CavRS.MoveFirst
                    lBookmark = CEF_CavRS.Find(find_string)
                    
                    Do While (lBookmark>0)
                               
                        n_cav = n_cav +1
                        If CEF_CavRS(CEF_CAV_FIELD_RIL_H).Value = 3 Then
                            n_hdom = n_hdom+1
                        End If
                        
                        lBookmark = CEF_CavRS.Find(find_string,,lBookmark)
                    Loop
                End If
                
                la1Page(CEF_FRM_LISTAREE_LA1_LBLNCAVV).Text = n_cav
                
                la1Page(CEF_FRM_LISTAREE_LA1_LBLNHDOMV).Text = n_hdom
                
                'abilita bottoni rilievi
                
                la1Page(CEF_FRM_LISTAREE_LA1_BTNLISTPIANTE).enabled = true
                la1Page(CEF_FRM_LISTAREE_LA1_BTNRILDENDRO).enabled = true
                
                
            Case "2"
                la1Page(CEF_FRM_LISTAREE_LA1_LBLIDONEITAV).Text = "2 Non idonea"
                
                la1Page(CEF_FRM_LISTAREE_LA1_LBLNOSINTV).Text = ""
                la1Page(CEF_FRM_LISTAREE_LA1_LBLNCAVV).Text = ""
                la1Page(CEF_FRM_LISTAREE_LA1_LBLNHDOMV).Text = ""
            Case "3"
                la1Page(CEF_FRM_LISTAREE_LA1_LBLIDONEITAV).Text = "3 Idonea non ril."
                
                la1Page(CEF_FRM_LISTAREE_LA1_LBLNOSINTV).Text = ""
                la1Page(CEF_FRM_LISTAREE_LA1_LBLNCAVV).Text = ""
                la1Page(CEF_FRM_LISTAREE_LA1_LBLNHDOMV).Text = ""
            Case Else
                la1Page(CEF_FRM_LISTAREE_LA1_LBLIDONEITAV).Text = ""
                
                la1Page(CEF_FRM_LISTAREE_LA1_LBLNOSINTV).Text = ""
                la1Page(CEF_FRM_LISTAREE_LA1_LBLNCAVV).Text = ""
                la1Page(CEF_FRM_LISTAREE_LA1_LBLNHDOMV).Text = ""
        End Select
        
        

        'enable/disable move buttons
        If CEF_AreeRS.Bookmark = 1 then
            la1Page(CEF_FRM_LISTAREE_LA1_BTNPREV).Enabled = false
            la1Page(CEF_FRM_LISTAREE_LA1_BTNPREV10).Enabled = false
            
        else
            la1Page(CEF_FRM_LISTAREE_LA1_BTNPREV).Enabled = true
            la1Page(CEF_FRM_LISTAREE_LA1_BTNPREV10).Enabled = true
            
        End If
        If CEF_AreeRS.Bookmark = CEF_AreeRS.RecordCount then
            la1Page(CEF_FRM_LISTAREE_LA1_BTNNEXT).Enabled = false
            la1Page(CEF_FRM_LISTAREE_LA1_BTNNEXT10).Enabled = false
        else
            la1Page(CEF_FRM_LISTAREE_LA1_BTNNEXT).Enabled = true
            la1Page(CEF_FRM_LISTAREE_LA1_BTNNEXT10).Enabled = true
        End If
    End If
End Sub

Private Sub CEF_FormLISTAREE_BtnPREV10_click()
    Dim i
    i = 0
    While (i<10 And not CEF_AreeRS.BOF)
        CEF_AreeRS.MovePrevious
        i = i+1
    Wend
    If CEF_AreeRS.BOF Then
        CEF_AreeRS.MoveFirst
    End If
    Application.UserProperties("CEF_SELECTED_AREA_ID") = CEF_AreeRS(CEF_AREE_FIELD_IDAREA).Value
    Dim p1Page
    Set p1Page = ThisEvent.Object.Parent
    p1Page.Activate
End Sub

Private Sub CEF_FormLISTAREE_BtnPREV_click()
    CEF_AreeRS.MovePrevious
    Application.UserProperties("CEF_SELECTED_AREA_ID") = CEF_AreeRS(CEF_AREE_FIELD_IDAREA).Value
    Dim p1Page
    Set p1Page = ThisEvent.Object.Parent
    p1Page.Activate
End Sub

Private Sub CEF_FormLISTAREE_BtnNEXT_click()
    CEF_AreeRS.MoveNext
    Application.UserProperties("CEF_SELECTED_AREA_ID") = CEF_AreeRS(CEF_AREE_FIELD_IDAREA).Value
    Dim button,p1Page
    Set button = ThisEvent.Object
    Set p1Page = button.Parent
    p1Page.Activate
End Sub

Private Sub CEF_FormLISTAREE_BtnNEXT10_click()
    Dim i
    i = 0
    While (i<10 And not CEF_AreeRS.EOF)
        CEF_AreeRS.MoveNext
        i = i+1
    Wend
    If CEF_AreeRS.EOF Then
        CEF_AreeRS.MoveLast
    End If
    Application.UserProperties("CEF_SELECTED_AREA_ID") = CEF_AreeRS(CEF_AREE_FIELD_IDAREA).Value
    Dim button,p1Page
    Set button = ThisEvent.Object
    Set p1Page = button.Parent
    p1Page.Activate
End Sub

Private Sub CEF_btnNAV_Click()
	Dim form,pPage,control
	Set control = ThisEvent.object
    Set pPage = control.parent
    Set form = pPage.parent
    Call Navigation.gotoXY(CEF_AreeRS(CEF_AREE_FIELD_COORDE),CEF_AreeRS(CEF_AREE_FIELD_COORDN),CEF_AreeRS(CEF_AREE_FIELD_IDAREA))
	Navigation.active=vbtrue
    form.close
End Sub

Private Sub CEF_btnNPM_Click()
	Dim appApplets, CEF_Applet
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
	
	CEF_Applet.Forms(CEF_FRM_NAV).Show
       
End Sub

Private Sub CEF_btnDATIAREA_Click()
    Dim control,lp1Page
    Set control = ThisEvent.Object
    Set lp1Page = control.Parent

	Dim appApplets, CEF_Applet, return_form
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
	
	CEF_Applet.Forms(CEF_FRM_DATIAREA).Show
    
    lp1Page.Activate
    
End Sub

Private Sub CEF_btnLISTPIANTE_Click()
    Dim control,lp1Page
    Set control = ThisEvent.Object
    Set lp1Page = control.Parent

    Dim appApplets, CEF_Applet
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
    Application.UserProperties("LPFORM_ONLOAD") = vbFalse
	CEF_Applet.Forms(CEF_FRM_LISTPIANTE).Show
    
    lp1Page.Activate
End Sub

Private Sub CEF_btnRILDENDRO_Click()
    Dim control,lp1Page
    Set control = ThisEvent.Object
    Set lp1Page = control.Parent
    
	Dim appApplets, CEF_Applet
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
	
	CEF_Applet.Forms(CEF_FRM_RILDENDRO).Show
    
    lp1Page.Activate
End Sub


Private Sub CEF_btnCAV_Click()
	Dim appApplets, CEF_Applet
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
	Application.UserProperties("CAVFORM_ONLOAD") = vbFalse
	CEF_Applet.Forms(CEF_FRM_CAV).Show
End Sub

Private Sub CEF_btnHDOM_Click()
	Dim appApplets, CEF_Applet
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
	
	CEF_Applet.Forms(CEF_FRM_HDOM).Show
End Sub

'------------------------------------------------------------------

Private Sub CEF_FormDATIAREA_onload()    
    Dim areaForm,p1Page,p2Page,p3Page,p4Page
    Set areaForm = ThisEvent.Object
    Set p1Page = areaForm(CEF_FRM_DATIAREA_DA1)
    Set p2Page = areaForm(CEF_FRM_DATIAREA_DA2)
    Set p3Page = areaForm(CEF_FRM_DATIAREA_DA3)
    
    areaForm.caption = "AREA" & " " & CEF_AreeRS(CEF_AREE_FIELD_IDAREA).Value
    
    

    p1Page.Activate
    
    p1Page(CEF_FRM_DATIAREA_DA1_LBLPAESEV).Text = CEF_AreeRS(CEF_AREE_FIELD_PAESE).Value
    p1Page(CEF_FRM_DATIAREA_DA1_LBLPAESEV).Enabled = false
    
    p1Page(CEF_FRM_DATIAREA_DA1_LBLPROVV).Text = CEF_AreeRS(CEF_AREE_FIELD_PROVINCI).Value
    p1Page(CEF_FRM_DATIAREA_DA1_LBLPROVV).Enabled = false
    
    p1Page(CEF_FRM_DATIAREA_DA1_LBLCOMUNEV).Text = CEF_AreeRS(CEF_AREE_FIELD_COMUNE).Value
    p1Page(CEF_FRM_DATIAREA_DA1_LBLCOMUNEV).Enabled = false
    
    if StrComp(CEF_AreeRS(CEF_AREE_FIELD_IDONEITA).Value,"") = 0 then
        p1Page(CEF_FRM_DATIAREA_DA1_CMBIDONEITA).ListIndex = -1
    else
        p1Page(CEF_FRM_DATIAREA_DA1_CMBIDONEITA).ListIndex = ComboFind(p1Page(CEF_FRM_DATIAREA_DA1_CMBIDONEITA),CEF_AreeRS(CEF_AREE_FIELD_IDONEITA).Value)
    end if
    
    if CEF_AreeRS(CEF_AREE_FIELD_DATARIL).IsNull then
        p1Page(CEF_FRM_DATIAREA_DA1_DATEDATA).Value = Now
    else
        p1Page(CEF_FRM_DATIAREA_DA1_DATEDATA).Value = CDate(CEF_AreeRS(CEF_AREE_FIELD_DATARIL).Value)
    end if
    
    
    p1Page(CEF_FRM_DATIAREA_DA1_EDITN).text = CEF_AreeRS(CEF_AREE_FIELD_COORDN).Value
    p1Page(CEF_FRM_DATIAREA_DA1_EDITE).text = CEF_AreeRS(CEF_AREE_FIELD_COORDE).Value
    p1Page(CEF_FRM_DATIAREA_DA1_EDITN).enabled = false
    p1Page(CEF_FRM_DATIAREA_DA1_EDITE).enabled = false
    
    p2Page.Activate
    
    if StrComp(CEF_AreeRS(CEF_AREE_FIELD_DISPH2O).Value,"") = 0 then
        p2Page(CEF_FRM_DATIAREA_DA2_CMBH20).ListIndex = -1
    else
        p2Page(CEF_FRM_DATIAREA_DA2_CMBH20).ListIndex = ComboFind(p2Page(CEF_FRM_DATIAREA_DA2_CMBH20),CEF_AreeRS(CEF_AREE_FIELD_DISPH2O).Value)
    end if
    p2Page(CEF_FRM_DATIAREA_DA2_CMBH20).Enabled = false
    
    if StrComp(CEF_AreeRS(CEF_AREE_FIELD_T_HUMUS).Value,"") = 0 then
        p2Page(CEF_FRM_DATIAREA_DA2_CMBHUMUS).ListIndex = -1
    else
        p2Page(CEF_FRM_DATIAREA_DA2_CMBHUMUS).ListIndex = ComboFind(p2Page(CEF_FRM_DATIAREA_DA2_CMBHUMUS),CEF_AreeRS(CEF_AREE_FIELD_T_HUMUS).Value)
    end if
    p2Page(CEF_FRM_DATIAREA_DA2_CMBHUMUS).Enabled = false
    
    if StrComp(CEF_AreeRS(CEF_AREE_FIELD_FALTITUD).Value,"") = 0 then
        p2Page(CEF_FRM_DATIAREA_DA2_CMBALT).ListIndex = -1
    else
        p2Page(CEF_FRM_DATIAREA_DA2_CMBALT).ListIndex = ComboFind(p2Page(CEF_FRM_DATIAREA_DA2_CMBALT),CEF_AreeRS(CEF_AREE_FIELD_FALTITUD).Value)
    end if
    p2Page(CEF_FRM_DATIAREA_DA2_CMBALT).Enabled = false
    
    if StrComp(CEF_AreeRS(CEF_AREE_FIELD_ESPOSIZ).Value,"") = 0 then
        p2Page(CEF_FRM_DATIAREA_DA2_CMBESP).ListIndex = -1
    else
        p2Page(CEF_FRM_DATIAREA_DA2_CMBESP).ListIndex = ComboFind(p2Page(CEF_FRM_DATIAREA_DA2_CMBESP),CEF_AreeRS(CEF_AREE_FIELD_ESPOSIZ).Value)
    end if
    p2Page(CEF_FRM_DATIAREA_DA2_CMBESP).Enabled = false
    
    if StrComp(CEF_AreeRS(CEF_AREE_FIELD_ETAMEDIA).Value,"") = 0 then
        p2Page(CEF_FRM_DATIAREA_DA2_CMBETA).ListIndex = -1
    else
        p2Page(CEF_FRM_DATIAREA_DA2_CMBETA).ListIndex = ComboFind(p2Page(CEF_FRM_DATIAREA_DA2_CMBETA),CEF_AreeRS(CEF_AREE_FIELD_ETAMEDIA).Value)
    end if
    
    If CEF_AreeRS(CEF_AREE_FIELD_IDONEITA).Value="2" Then   
        p2Page(CEF_FRM_DATIAREA_DA2_CMBETA).Enabled = false
    Else
        p2Page(CEF_FRM_DATIAREA_DA2_CMBETA).Enabled = true
    End If
    
    p2Page(CEF_FRM_DATIAREA_DA2_EDITCATFORID).Text = CEF_AreeRS(CEF_AREE_FIELD_CATFOR).Value
    p2Page(CEF_FRM_DATIAREA_DA2_EDITCATFORID).Enabled = false
    p2Page(CEF_FRM_DATIAREA_DA2_EDITSCATFORID).Text = CEF_AreeRS(CEF_AREE_FIELD_SCATFOR).Value
    p2Page(CEF_FRM_DATIAREA_DA2_EDITSCATFORID).Enabled = false
    
    Dim find_String
    If StrComp(CEF_AreeRS(CEF_AREE_FIELD_CATFOR).Value,"") = 0 then
        p2Page(CEF_FRM_DATIAREA_DA2_EDITCATFORTEXT).Text = ""
    Else    
        find_String = "[TABELLA]=""CATFOR"" AND [ID]= """ & CEF_AreeRS(CEF_AREE_FIELD_CATFOR).Value & """"
        CEF_TabdecRS.Find(find_String)
        p2Page(CEF_FRM_DATIAREA_DA2_EDITCATFORTEXT).Text = CEF_TabdecRS("TEXT").Value
    End If
    p2Page(CEF_FRM_DATIAREA_DA2_EDITCATFORTEXT).Enabled = false
    If StrComp(CEF_AreeRS(CEF_AREE_FIELD_SCATFOR).Value,"") = 0 then
        p2Page(CEF_FRM_DATIAREA_DA2_EDITSCATFORTEXT).Text = ""
    Else
        find_String = "[TABELLA]=""SCATFOR"" AND [ID]= """ & CEF_AreeRS(CEF_AREE_FIELD_SCATFOR).Value & """"
        CEF_TabdecRS.Find(find_String)
        p2Page(CEF_FRM_DATIAREA_DA2_EDITSCATFORTEXT).Text = CEF_TabdecRS("TEXT").Value
    End If
    p2Page(CEF_FRM_DATIAREA_DA2_EDITSCATFORTEXT).Enabled = false
    
    p2Page(CEF_FRM_DATIAREA_DA2_BTNCATFOR).Enabled = false
    p2Page(CEF_FRM_DATIAREA_DA2_BTNSCATFOR).Enabled = false
    
    p3Page.Activate
    
    p3Page(CEF_FRM_DATIAREA_DA3_EDITNC).text = CEF_AreeRS(CEF_AREE_FIELD_COORDN_C).Value
    p3Page(CEF_FRM_DATIAREA_DA3_EDITEC).text = CEF_AreeRS(CEF_AREE_FIELD_COORDE_C).Value
    p3Page(CEF_FRM_DATIAREA_DA3_EDITFIXGPSC).text = CEF_AreeRS(CEF_AREE_FIELD_FIXGPS_C).Value
    p3Page(CEF_FRM_DATIAREA_DA3_EDITNC).enabled = false
    p3Page(CEF_FRM_DATIAREA_DA3_EDITEC).enabled = false
    p3Page(CEF_FRM_DATIAREA_DA3_EDITFIXGPSC).enabled = false
    
    if StrComp(CEF_AreeRS(CEF_AREE_FIELD_PIC).Value,"") = 0 then
        p3Page(CEF_FRM_DATIAREA_DA3_CMBPICCHC).ListIndex = -1
    else
        p3Page(CEF_FRM_DATIAREA_DA3_CMBPICCHC).ListIndex = ComboFind(p3Page(CEF_FRM_DATIAREA_DA3_CMBPICCHC),CEF_AreeRS(CEF_AREE_FIELD_PIC).Value)
    end if
    p3Page(CEF_FRM_DATIAREA_DA3_CMBPICCHC).Enabled = false
    
    if StrComp(CEF_AreeRS(CEF_AREE_FIELD_T_PIC).Value,"") = 0 then
        p3Page(CEF_FRM_DATIAREA_DA3_CMBTRSLC).ListIndex = -1
    else
        p3Page(CEF_FRM_DATIAREA_DA3_CMBTRSLC).ListIndex = ComboFind(p3Page(CEF_FRM_DATIAREA_DA3_CMBTRSLC),CEF_AreeRS(CEF_AREE_FIELD_T_PIC).Value)
    end if
    p3Page(CEF_FRM_DATIAREA_DA3_CMBTRSLC).Enabled = false
    
    If StrComp(CEF_AreeRS(CEF_AREE_FIELD_T_PIC).Value,"2") = 0 or StrComp(CEF_AreeRS(CEF_AREE_FIELD_PIC).Value,"1") = 0 Then
        p3Page(CEF_FRM_DATIAREA_DA3_EDITTRASLC_A).text = ""            
    Else
        p3Page(CEF_FRM_DATIAREA_DA3_EDITTRASLC_A).text = CEF_AreeRS(CEF_AREE_FIELD_T_PIC_AZ).Value
    End If
    p3Page(CEF_FRM_DATIAREA_DA3_EDITTRASLC_A).Enabled = false
    
    If StrComp(CEF_AreeRS(CEF_AREE_FIELD_T_PIC).Value,"2") = 0 or StrComp(CEF_AreeRS(CEF_AREE_FIELD_PIC).Value,"1") = 0 Then
        p3Page(CEF_FRM_DATIAREA_DA3_EDITTRASLC_D).text = ""
    Else
        p3Page(CEF_FRM_DATIAREA_DA3_EDITTRASLC_D).text = CEF_AreeRS(CEF_AREE_FIELD_T_PIC_DS).Value
    End If
    p3Page(CEF_FRM_DATIAREA_DA3_EDITTRASLC_D).Enabled = false
    
    'p3Page(CEF_FRM_DATIAREA_DA3_BTNPOSMED).Enabled = false
    
    p1Page.Activate
    

    Set areaForm = nothing
    Set p1Page = nothing
    Set p2Page = nothing
    Set p3Page = nothing
    Set p4Page = nothing
    
End Sub

Private Sub CEF_FormDATIAREA_onok()
    CEF_AreeRS.Update 
End Sub

Private Sub CEF_FormDATIAREA_DA1_ComboIDONEITA_onselchange()
    Dim control,pPage,pForm
    Set control = ThisEvent.Object
    Set pPage = control.parent
    Set pForm = pPage.parent
    If pPage(CEF_FRM_DATIAREA_DA1_CMBIDONEITA).Value = "2" Or pPage(CEF_FRM_DATIAREA_DA1_CMBIDONEITA).Value = "3" Then      
        Set pPage = pForm(CEF_FRM_DATIAREA_DA2)
        pPage.Activate
        
        pPage(CEF_FRM_DATIAREA_DA2_CMBETA).Enabled = false
        
     Else
        Set pPage = pForm(CEF_FRM_DATIAREA_DA2)
        pPage.Activate
        
        pPage(CEF_FRM_DATIAREA_DA2_CMBETA).Enabled = true
        
     End If
     Set pPage = pForm(CEF_FRM_DATIAREA_DA1)
     pPage.Activate
End Sub

Private Sub CEF_FormDATIAREA_BtnCATFOR_Click()
    Dim button,pPage
    Set button = ThisEvent.Object
    Set pPage = button.parent
    Application.UserProperties("LIST_FILTER") = "[TABELLA] = ""CATFOR"""
    Application.UserProperties("LIST_FIELD_ID") = "ID"
    Application.UserProperties("LIST_FIELD_TEXT") = "TEXT"
    Dim appApplets, CEF_Applet
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
	If CEF_Applet.Forms("FrmLISTBOX").Show Then
        pPage(CEF_FRM_DATIAREA_DA2_EDITCATFORID).Text = Application.UserProperties("FrmLISTBOX_RESULT_V")
        pPage(CEF_FRM_DATIAREA_DA2_EDITCATFORTEXT).Text = Application.UserProperties("FrmLISTBOX_RESULT_T")
    End If
End Sub

Private Sub CEF_FormDATIAREA_BtnSCATFOR_Click()
    Dim button,pPage
    Set button = ThisEvent.Object
    Set pPage = button.parent
    
    Application.UserProperties("LIST_FILTER") = "[TABELLA] = ""SCATFOR"""
    Application.UserProperties("LIST_FIELD_ID") = "ID"
    Application.UserProperties("LIST_FIELD_TEXT") = "TEXT"
    Dim appApplets, CEF_Applet
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
    
	If CEF_Applet.Forms("FrmLISTBOX").Show Then
        pPage(CEF_FRM_DATIAREA_DA2_EDITSCATFORID).Text = Application.UserProperties("FrmLISTBOX_RESULT_V")
        pPage(CEF_FRM_DATIAREA_DA2_EDITSCATFORTEXT).Text = Application.UserProperties("FrmLISTBOX_RESULT_T")
    End If
    
    pPage.Activate
    
End Sub

Private Sub CEF_FormDATIAREA_DA3_ComboPICCHC_onselchange()
    Dim control,pPage,pForm
    Set control = ThisEvent.Object
    Set pPage = control.parent
    If pPage(CEF_FRM_DATIAREA_DA3_CMBPICCHC).Value = "1" Then
        pPage(CEF_FRM_DATIAREA_DA3_CMBTRSLC).ListIndex = -1
        pPage(CEF_FRM_DATIAREA_DA3_CMBTRSLC).Enabled = false
        pPage(CEF_FRM_DATIAREA_DA3_EDITTRASLC_A).Value = ""
        pPage(CEF_FRM_DATIAREA_DA3_EDITTRASLC_A).Enabled = false
        pPage(CEF_FRM_DATIAREA_DA3_EDITTRASLC_D).Value = ""
        pPage(CEF_FRM_DATIAREA_DA3_EDITTRASLC_D).Enabled = false
    Else
        pPage(CEF_FRM_DATIAREA_DA3_CMBTRSLC).Enabled = true
        pPage(CEF_FRM_DATIAREA_DA3_CMBTRSLC).ListIndex = -1
        pPage(CEF_FRM_DATIAREA_DA3_EDITTRASLC_A).Enabled = true
        pPage(CEF_FRM_DATIAREA_DA3_EDITTRASLC_A).Value = ""
        pPage(CEF_FRM_DATIAREA_DA3_EDITTRASLC_D).Enabled = true
        pPage(CEF_FRM_DATIAREA_DA3_EDITTRASLC_D).Value = ""
    End If
End Sub

Private Sub CEF_FormDATIAREA_DA3_ComboTRASLC_onselchange()
    Dim control,pPage,pForm
    Set control = ThisEvent.Object
    Set pPage = control.parent
    If pPage(CEF_FRM_DATIAREA_DA3_CMBTRSLC).Value = "2" Then
        pPage(CEF_FRM_DATIAREA_DA3_EDITTRASLC_A).Value = ""
        pPage(CEF_FRM_DATIAREA_DA3_EDITTRASLC_A).Enabled = false
        pPage(CEF_FRM_DATIAREA_DA3_EDITTRASLC_D).Value = ""
        pPage(CEF_FRM_DATIAREA_DA3_EDITTRASLC_D).Enabled = false
    Else
        pPage(CEF_FRM_DATIAREA_DA3_EDITTRASLC_A).Enabled = true
        pPage(CEF_FRM_DATIAREA_DA3_EDITTRASLC_A).Value = ""
        pPage(CEF_FRM_DATIAREA_DA3_EDITTRASLC_D).Enabled = true
        pPage(CEF_FRM_DATIAREA_DA3_EDITTRASLC_D).Value = ""
    End If
End Sub

Private Sub CEF_btnPOSMED_Click()
    Dim button,pPage
    Set button = ThisEvent.Object
    Set pPage = button.parent


    Dim appApplets, CEF_Applet
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
	If CEF_Applet.Forms(C_FORM_POS).Show then
        pPage(CEF_FRM_DATIAREA_DA3_EDITNC).Text = Application.UserProperties ("intPointC_Y")
        pPage(CEF_FRM_DATIAREA_DA3_EDITEC).Text = Application.UserProperties ("intPointC_X")
        pPage(CEF_FRM_DATIAREA_DA3_EDITFIXGPSC).Text = Application.UserProperties ("intPointCNumPos")
    End If
End Sub

Private Sub CEF_FormDATIAREA_DA1_validate()
    Dim pPage
    Set pPage = ThisEvent.Object
    if pPage(CEF_FRM_DATIAREA_DA1_CMBIDONEITA).ListIndex = -1 then
        ThisEvent.MessageText = "Inserire Idoneita'!"
        Thisevent.result = false
        Exit sub
    else
        CEF_AreeRS(CEF_AREE_FIELD_IDONEITA).Value = pPage(CEF_FRM_DATIAREA_DA1_CMBIDONEITA).Value 
    end if
    CEF_AreeRS(CEF_AREE_FIELD_DATARIL).Value = CDate(pPage(CEF_FRM_DATIAREA_DA1_DATEDATA).Value)
End Sub

Private Sub CEF_FormDATIAREA_DA2_validate()
    Dim pPage,pForm,da1Page
    Set pPage = ThisEvent.Object
    Set pForm = pPage.parent
    Set da1Page = pForm(CEF_FRM_DATIAREA_DA1)
    
    
    
    if (pPage(CEF_FRM_DATIAREA_DA2_CMBETA).ListIndex = -1 and (da1Page(CEF_FRM_DATIAREA_DA1_CMBIDONEITA).Value<>"2" Or da1Page(CEF_FRM_DATIAREA_DA1_CMBIDONEITA).Value<>"3"))  then
        ThisEvent.MessageText = "Inserire Eta' dominante!"
        Thisevent.result = false
        Exit sub
    else
        CEF_AreeRS(CEF_AREE_FIELD_ETAMEDIA).Value = pPage(CEF_FRM_DATIAREA_DA2_CMBETA).Value 
    end if
    
    

End Sub

Private Sub CEF_FormDATIAREA_DA3_validate()
    Dim pPage,pForm,da1Page
    Set pPage = ThisEvent.Object
    Set pForm = pPage.parent
    Set da1Page = pForm(CEF_FRM_DATIAREA_DA1)
    CEF_AreeRS(CEF_AREE_FIELD_COORDN_C).Value = Cdbl(pPage(CEF_FRM_DATIAREA_DA3_EDITNC).Value)
    CEF_AreeRS(CEF_AREE_FIELD_COORDE_C).Value = Cdbl(pPage(CEF_FRM_DATIAREA_DA3_EDITEC).Value)
    CEF_AreeRS(CEF_AREE_FIELD_FIXGPS_C).Value = Cdbl(pPage(CEF_FRM_DATIAREA_DA3_EDITFIXGPSC).Value)
End Sub



'------------------------------------------------------------------

Private Sub CEF_FormLISTPIANTE_onload()
    Dim lpForm,lp1Page

    Dim CEF_AreeLayer,CEF_PianteLayer
    Set CEF_AreeLayer = Application.Map.Layers.Item(Application.UserProperties("CEF_AREE_LAYER_NAME_STRING"))
    CEF_AreeLayer.Editable = false
    
	Set CEF_PianteLayer = Application.Map.Layers.Item(Application.UserProperties("CEF_PIANTE_LAYER_NAME_STRING"))
    CEF_PianteLayer.Editable = true
    
    
    Call CEF_update_CEF_piante_bookmark_array

    'select first pianta if any pianta exists
    If Application.UserProperties("CEF_LISTPIANTE_NPIANTE") > 0 Then
        Application.UserProperties("CEF_SELECTED_PIANTA_POS") = 1
        Application.UserProperties("CEF_SELECTED_PIANTA_BMK") = CEF_piante_bookmark_array(Application.UserProperties("CEF_SELECTED_PIANTA_POS"),1)
        Application.UserProperties("CEF_SELECTED_PIANTA_ID") = CEF_piante_bookmark_array(Application.UserProperties("CEF_SELECTED_PIANTA_POS"),2)    
    Else
        Application.UserProperties("CEF_SELECTED_PIANTA_POS") = 0
        Application.UserProperties("CEF_SELECTED_PIANTA_BMK") = 0
        Application.UserProperties("CEF_SELECTED_PIANTA_ID") = 0 
    End If
        
    
    Set lpForm = ThisEvent.Object
    Set lp1Page = lpForm(CEF_FRM_LISTPIANTE_LP1)
    
    '------------------START DEMO CODE--------------------
        
'     If Application.UserProperties("CEF_LISTPIANTE_NPIANTE") > 10 Then
'         MsgBox "Versione DEMO." & vbNewLine & "In questa versione non e' concesso avere piu' di 10 piante campione!",vbExclamation,"CONECOFOR MOBILE"
'         lpForm.Close
'         Exit sub
'     End If
            
        
    '------------------END DEMO CODE---------------------
    
    lpForm.caption = "PIANTE AREA " & Application.UserProperties("CEF_SELECTED_AREA_ID")
    Application.UserProperties("LPFORM_ONLOAD") = vbTrue
    lp1Page.Activate
End Sub

Private Sub CEF_update_CEF_piante_bookmark_array()
    
    'create bookmark piante array
    Dim lBookmark,find_string,n_piante
    find_string = "["&CEF_PIANTE_FIELD_IDPIANTA&"] > 0 AND ["& CEF_PIANTE_FIELD_IDAREA & "] = """ & Application.UserProperties("CEF_SELECTED_AREA_ID") & """"
    
    n_piante = 0
    If CEF_PianteRS.RecordCount = 0 Then
        Application.UserProperties("CEF_LISTPIANTE_NPIANTE") = 0
        Exit Sub
    End If
    CEF_PianteRS.MoveFirst
    lBookmark = CEF_PianteRS.Find(find_string)
    Do While (lBookmark>0)
        n_piante = n_piante+1
        lBookmark = CEF_PianteRS.Find(find_string,,lBookmark)
    Loop
    Dim CEF_piante_bookmark_array_tmp()
    ReDim CEF_piante_bookmark_array_tmp(n_piante,2)
    
    n_piante=0
    CEF_PianteRS.MoveFirst
    lBookmark = CEF_PianteRS.Find(find_string)
    Do While (lBookmark>0)
        n_piante = n_piante+1
        CEF_piante_bookmark_array_tmp(n_piante,1)=lBookmark
        CEF_piante_bookmark_array_tmp(n_piante,2)=CEF_PianteRS(CEF_PIANTE_FIELD_IDPIANTA).Value
        lBookmark = CEF_PianteRS.Find(find_string,,lBookmark)
    Loop
    If Ubound(CEF_piante_bookmark_array_tmp,1)>1 Then
        QuickSort CEF_piante_bookmark_array_tmp,1,n_piante,2
    End If
    
    'reset CEF_piante_bookmark_array array
    Dim i,l
    For i = 1 To UBound(CEF_piante_bookmark_array,1)
        For l = 1 To UBound(CEF_piante_bookmark_array,2)
            CEF_piante_bookmark_array(i,l) = 0
        Next    
    Next
    'copy CEF_piante_bookmark_array_tmp in CEF_piante_bookmark_array
    For i = 1 To UBound(CEF_piante_bookmark_array_tmp,1)
        For l = 1 To UBound(CEF_piante_bookmark_array_tmp,2)
            CEF_piante_bookmark_array(i,l) = CEF_piante_bookmark_array_tmp(i,l)
        Next
    Next
    'set the npiante value
    Application.UserProperties("CEF_LISTPIANTE_NPIANTE") = UBound(CEF_piante_bookmark_array_tmp,1)
    
    'set the max ID value
    Application.UserProperties("CEF_LISTPIANTE_MAX_ID_PIANTA") = CEF_piante_bookmark_array_tmp(UBound(CEF_piante_bookmark_array_tmp,1),2)
End Sub

Private Sub CEF_FormLISTPIANTE_onunload()
    
    Dim CEF_AreeLayer,CEF_PianteLayer
    Set CEF_PianteLayer = Application.Map.Layers.Item(Application.UserProperties("CEF_PIANTE_LAYER_NAME_STRING"))
    CEF_PianteRS.Pack
    CEF_PianteLayer.Editable = false
    Set CEF_AreeLayer = Application.Map.Layers.Item(Application.UserProperties("CEF_AREE_LAYER_NAME_STRING"))
	CEF_AreeLayer.Editable = true
    
    Dim find_String
    find_string = "["&CEF_AREE_FIELD_IDAREA&"] = """ & Application.UserProperties("CEF_SELECTED_AREA_ID") & """"
    CEF_AreeRS.Find(find_string)
    
    Application.UserProperties("LPFORM_ONLOAD") = vbFalse
End Sub


Private Sub CEF_FormLISTPIANTE_LP1_setactive() 
    If Application.UserProperties("LPFORM_ONLOAD") Then
        Dim lp1Page,lpForm
        Set lp1Page = ThisEvent.Object
        Set lpForm = lp1Page.parent
        
        If Application.UserProperties("CEF_LISTPIANTE_NPIANTE") > 0 Then

            CEF_PianteRS.Bookmark = Application.UserProperties("CEF_SELECTED_PIANTA_BMK")
            
            
            lp1Page(CEF_FRM_LISTPIANTE_LP1_EDITID).Text = CEF_PianteRS(CEF_PIANTE_FIELD_IDPIANTA).Value
            
            lp1Page(CEF_FRM_LISTPIANTE_LP1_LBLRMV).Text = CEF_PianteRS(CEF_PIANTE_FIELD_REM_MORT).Value
            lp1Page(CEF_FRM_LISTPIANTE_LP1_LBLSPECIEV).Text = CEF_PianteRS(CEF_PIANTE_FIELD_SPECIE).Value
            lp1Page(CEF_FRM_LISTPIANTE_LP1_LBLTRASV).Text = CEF_PianteRS(CEF_PIANTE_FIELD_TRASPAR).Value
            lp1Page(CEF_FRM_LISTPIANTE_LP1_LBLFRUTV).Text = CEF_PianteRS(CEF_PIANTE_FIELD_FRUTTIF).Value
            
            If StrComp(CEF_PianteRS(CEF_PIANTE_FIELD_TRASPAR).Value,"") = 0 Then
                Application.UserProperties("CEF_SELECTED_PIANTA_TRASPAR_INS") = vbFalse
            Else
                Application.UserProperties("CEF_SELECTED_PIANTA_TRASPAR_INS") = vbTrue
            End If
            
            Call CEF_update_CEF_sintomi_bookmark_array
            
            lp1Page(CEF_FRM_LISTPIANTE_LP1_LBLSINTOMI).Text = Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI")
            
            
            
            'if pianta is new
            If (Application.UserProperties("CEF_DATIPIANTA_NEW") AND Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI")=0) Then
                MsgBox " CEF_FormLISTPIANTE_LP1_setactive Inserire almeno un sintomo!",vbExclamation,"CONECOFOR MOBILE"
                lp1Page(CEF_FRM_LISTPIANTE_LP1_BTNPREV).Enabled = false
                lp1Page(CEF_FRM_LISTPIANTE_LP1_BTNNEXT).Enabled = false
                lp1Page(CEF_FRM_LISTPIANTE_LP1_BTNPREV10).Enabled = false
                lp1Page(CEF_FRM_LISTPIANTE_LP1_BTNNEXT10).Enabled = false
                
                lp1Page(CEF_FRM_LISTPIANTE_LP1_BTNADD).Enabled = false
                lp1Page(CEF_FRM_LISTPIANTE_LP1_BTNDEL).Enabled = true
            Else
                
                'manage first and last pianta
                lp1Page(CEF_FRM_LISTPIANTE_LP1_BTNPREV).Enabled = true
                lp1Page(CEF_FRM_LISTPIANTE_LP1_BTNNEXT).Enabled = true
                lp1Page(CEF_FRM_LISTPIANTE_LP1_BTNPREV10).Enabled = true
                lp1Page(CEF_FRM_LISTPIANTE_LP1_BTNNEXT10).Enabled = true
                
                lp1Page(CEF_FRM_LISTPIANTE_LP1_BTNADD).Enabled = true
                lp1Page(CEF_FRM_LISTPIANTE_LP1_BTNDEL).Enabled = true
                
                If Application.UserProperties("CEF_SELECTED_PIANTA_POS") = 1 then
                    lp1Page(CEF_FRM_LISTPIANTE_LP1_BTNPREV).Enabled = false
                    lp1Page(CEF_FRM_LISTPIANTE_LP1_BTNPREV10).Enabled = false
                
                
                End If
                If Application.UserProperties("CEF_SELECTED_PIANTA_POS") = Application.UserProperties("CEF_LISTPIANTE_NPIANTE") then
                    lp1Page(CEF_FRM_LISTPIANTE_LP1_BTNNEXT).Enabled = false
                    lp1Page(CEF_FRM_LISTPIANTE_LP1_BTNNEXT10).Enabled = false
                
                End If
            End If
            
            lp1Page(CEF_FRM_LISTPIANTE_LP1_BTNDATIPIANTA).Enabled = true
            
            'se pianta e' non ritrovata, requisiti persi o uscita dal campione
            'disabilito inserimento sintomi
            Select Case Clng(CEF_PianteRS(CEF_PIANTE_FIELD_REM_MORT).Value)
                Case 18,19,23,29,905,906:
                    lp1Page(CEF_FRM_LISTPIANTE_LP1_BTNLISTSINTOMI).Enabled = false
                Case else:
                    lp1Page(CEF_FRM_LISTPIANTE_LP1_BTNLISTSINTOMI).Enabled = true
            End Select
            
        Else
            lp1Page(CEF_FRM_LISTPIANTE_LP1_EDITID).Text = "NO PIANTE"
            lp1Page(CEF_FRM_LISTPIANTE_LP1_BTNPREV).Enabled = false
            lp1Page(CEF_FRM_LISTPIANTE_LP1_BTNNEXT).Enabled = false
            lp1Page(CEF_FRM_LISTPIANTE_LP1_BTNPREV10).Enabled = false
            lp1Page(CEF_FRM_LISTPIANTE_LP1_BTNNEXT10).Enabled = false
                
            lp1Page(CEF_FRM_LISTPIANTE_LP1_BTNADD).Enabled = true
            lp1Page(CEF_FRM_LISTPIANTE_LP1_BTNDEL).Enabled = false
            
            lp1Page(CEF_FRM_LISTPIANTE_LP1_EDITID).Text = ""
            
            lp1Page(CEF_FRM_LISTPIANTE_LP1_LBLRMV).Text = ""
            lp1Page(CEF_FRM_LISTPIANTE_LP1_LBLSPECIEV).Text = ""
            lp1Page(CEF_FRM_LISTPIANTE_LP1_LBLTRASV).Text = ""
            lp1Page(CEF_FRM_LISTPIANTE_LP1_LBLFRUTV).Text = ""
            
            lp1Page(CEF_FRM_LISTPIANTE_LP1_BTNDATIPIANTA).Enabled = false
            lp1Page(CEF_FRM_LISTPIANTE_LP1_BTNLISTSINTOMI).Enabled = false
            
        End If
        
        
        Set lp1Page = nothing
    End If
End Sub

Private Sub CEF_FormLISTPIANTE_LP1_onquerycancel()
    'Controllo se la pianta corrente e' completata
    If (Application.UserProperties("CEF_SELECTED_PIANTA_TRASPAR_INS") And Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI")=0) Then
        MsgBox "Nella pianta corrente si deve inserire almeno un sintomo!",vbExclamation,"CONECOFOR MOBILE"
        ThisEvent.Result = False
        Exit Sub
    End If
    If (Not Application.UserProperties("CEF_SELECTED_PIANTA_TRASPAR_INS") And Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI")>0) Then
        MsgBox "Nella pianta corrente si deve inserire trasparenza e fruttificazione!",vbExclamation,"CONECOFOR MOBILE"
        ThisEvent.Result = False
        Exit Sub
    End If


    Dim find_string,sint_find_string,lBookmark
    Dim n_piante_no_sint,list_piante_no_sint
    n_piante_no_sint=0
    list_piante_no_sint=""
    find_string = "["&CEF_PIANTE_FIELD_IDAREA&"] = """ & Application.UserProperties("CEF_SELECTED_AREA_ID") & """ AND ([" & CEF_PIANTE_FIELD_RM_OLD & "] = ""1"" OR [" & CEF_PIANTE_FIELD_RM_OLD & "] = ""2""  OR [" & CEF_PIANTE_FIELD_RM_OLD & "] = ""3"")"  
    If CEF_PianteRS.RecordCount > 0 Then
        CEF_PianteRS.MoveFirst
        lBookmark = CEF_PianteRS.Find(find_string)
        If lBookmark>0 Then
            Dim id_pianta
            Dim rm_pianta
            Do While (lBookmark>0 and n_piante_no_sint<=5)
                id_pianta = CEF_PianteRS(CEF_PIANTE_FIELD_IDPIANTA).Value
                rm_pianta = Clng(CEF_PianteRS(CEF_PIANTE_FIELD_REM_MORT).Value)
                'se pianta e' non ritrovata, requisiti persi o uscita dal campione
                'non cerco sintomi altrimenti li cerco
                Select Case rm_pianta
                    Case 18,19,23,29,905,906:
                        
                    Case else:
                        sint_find_string = "["&CEF_SINTOMI_FIELD_IDAREA&"] = """ & Application.UserProperties("CEF_SELECTED_AREA_ID") & """ AND [" & CEF_SINTOMI_FIELD_IDPIANTA & "] = " & CEF_PianteRS(CEF_PIANTE_FIELD_IDPIANTA).Value
                        If CEF_SintomiRS.RecordCount > 0 Then 
                            CEF_SintomiRS.MoveFirst
                            If CEF_SintomiRS.Find(sint_find_string) = 0 Then
                                n_piante_no_sint = n_piante_no_sint+1
                                if n_piante_no_sint < 6 then
                                    list_piante_no_sint=list_piante_no_sint&" "&id_pianta
                                else
                                    list_piante_no_sint=list_piante_no_sint&" (...)"
                                end if
                            End If
                        Else
                            MsgBox "Nessun sintomo inserito nell'area!",vbExclamation,"CONECOFOR MOBILE"
                            Exit Sub
                        End If
                End Select
                
                lBookmark = CEF_PianteRS.Find(find_string,,lBookmark)
            Loop
            If n_piante_no_sint>0 then
                MsgBox "Mancano i sintomi per le piante:"&list_piante_no_sint&"!",vbExclamation,"CONECOFOR MOBILE"
            End If
        Else 
            MsgBox "Non vi sono piante rilevate!",vbExclamation,"CONECOFOR MOBILE"
            Exit Sub
        End If
    End If
End Sub

Private Sub CEF_FormLISTPIANTE_LP1_onvalidate()
    'Controllo se la pianta corrente e' completata
    If (Application.UserProperties("CEF_SELECTED_PIANTA_TRASPAR_INS") And Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI")=0) Then
        MsgBox "Nella pianta corrente si deve inserire almeno un sintomo!",vbExclamation,"CONECOFOR MOBILE"
        ThisEvent.Result = False
        Exit Sub
    End If
    If (Not Application.UserProperties("CEF_SELECTED_PIANTA_TRASPAR_INS") And Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI")>0) Then
        MsgBox "Nella pianta corrente si deve inserire trasparenza e fruttificazione!",vbExclamation,"CONECOFOR MOBILE"
        ThisEvent.Result = False
        Exit Sub
    End If
    
    
    Dim find_string,sint_find_string,lBookmark
    Dim n_piante_no_sint,list_piante_no_sint
    n_piante_no_sint=0
    list_piante_no_sint=""
    find_string = "["&CEF_PIANTE_FIELD_IDAREA&"] = """ & Application.UserProperties("CEF_SELECTED_AREA_ID") & """ AND ([" & CEF_PIANTE_FIELD_RM_OLD & "] = ""1"" OR [" & CEF_PIANTE_FIELD_RM_OLD & "] = ""2""  OR [" & CEF_PIANTE_FIELD_RM_OLD & "] = ""3"")"  
    If CEF_PianteRS.RecordCount > 0 Then
        CEF_PianteRS.MoveFirst
        lBookmark = CEF_PianteRS.Find(find_string)
        If lBookmark>0 Then
            Dim id_pianta
            Dim rm_pianta
            Do While (lBookmark>0 and n_piante_no_sint<=5)
                id_pianta = CEF_PianteRS(CEF_PIANTE_FIELD_IDPIANTA).Value
                rm_pianta = Clng(CEF_PianteRS(CEF_PIANTE_FIELD_REM_MORT).Value)
                'se pianta e' non ritrovata, requisiti persi o uscita dal campione
                'non cerco sintomi altrimenti li cerco
                Select Case rm_pianta
                    Case 18,19,23,29,905,906:
                        
                    Case else:
                        sint_find_string = "["&CEF_SINTOMI_FIELD_IDAREA&"] = """ & Application.UserProperties("CEF_SELECTED_AREA_ID") & """ AND [" & CEF_SINTOMI_FIELD_IDPIANTA & "] = " & CEF_PianteRS(CEF_PIANTE_FIELD_IDPIANTA).Value
                        If CEF_SintomiRS.RecordCount > 0 Then 
                            CEF_SintomiRS.MoveFirst
                            If CEF_SintomiRS.Find(sint_find_string) = 0 Then
                                n_piante_no_sint = n_piante_no_sint+1
                                if n_piante_no_sint < 6 then
                                    list_piante_no_sint=list_piante_no_sint&" "&id_pianta
                                else
                                    list_piante_no_sint=list_piante_no_sint&" (...)"
                                end if
                            End If
                        Else
                            MsgBox "Nessun sintomo inserito nell'area!",vbExclamation,"CONECOFOR MOBILE"
                            Exit Sub
                        End If
                End Select
                
                lBookmark = CEF_PianteRS.Find(find_string,,lBookmark)
            Loop
            If n_piante_no_sint>0 then
                MsgBox "Mancano i sintomi per le piante:"&list_piante_no_sint&"!",vbExclamation,"CONECOFOR MOBILE"
            End If
        Else 
            MsgBox "Non vi sono piante rilevate!",vbExclamation,"CONECOFOR MOBILE"
            Exit Sub
        End If
    End If
End Sub



Private Sub CEF_FormLISTPIANTE_BtnPREV_click()
    'Controllo se la pianta corrente e' completata
    If (Application.UserProperties("CEF_SELECTED_PIANTA_TRASPAR_INS") And Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI")=0) Then
        MsgBox "Nella pianta corrente si deve inserire almeno un sintomo!",vbExclamation,"CONECOFOR MOBILE"
        ThisEvent.Result = False
        Exit Sub
    End If
    If (Not Application.UserProperties("CEF_SELECTED_PIANTA_TRASPAR_INS") And Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI")>0) Then
        MsgBox "Nella pianta corrente si deve inserire trasparenza e fruttificazione!",vbExclamation,"CONECOFOR MOBILE"
        ThisEvent.Result = False
        Exit Sub
    End If
    Application.UserProperties("CEF_SELECTED_PIANTA_POS") = Application.UserProperties("CEF_SELECTED_PIANTA_POS")-1
    Application.UserProperties("CEF_SELECTED_PIANTA_BMK") = CEF_piante_bookmark_array(Application.UserProperties("CEF_SELECTED_PIANTA_POS"),1)
    Application.UserProperties("CEF_SELECTED_PIANTA_ID") = CEF_piante_bookmark_array(Application.UserProperties("CEF_SELECTED_PIANTA_POS"),2)
    Dim lp1Page
    Set lp1Page = ThisEvent.Object.Parent
    lp1Page.Activate
End Sub

Private Sub CEF_FormLISTPIANTE_BtnPREV10_click()
    'Controllo se la pianta corrente e' completata
    If (Application.UserProperties("CEF_SELECTED_PIANTA_TRASPAR_INS") And Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI")=0) Then
        MsgBox "Nella pianta corrente si deve inserire almeno un sintomo!",vbExclamation,"CONECOFOR MOBILE"
        ThisEvent.Result = False
        Exit Sub
    End If
    If (Not Application.UserProperties("CEF_SELECTED_PIANTA_TRASPAR_INS") And Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI")>0) Then
        MsgBox "Nella pianta corrente si deve inserire trasparenza e fruttificazione!",vbExclamation,"CONECOFOR MOBILE"
        ThisEvent.Result = False
        Exit Sub
    End If
    Dim new_pos
    If Application.UserProperties("CEF_SELECTED_PIANTA_POS") <= 10 Then
        new_pos = 1
    Else
        new_pos = Application.UserProperties("CEF_SELECTED_PIANTA_POS")-10
    End If
    Application.UserProperties("CEF_SELECTED_PIANTA_POS") = new_pos
    Application.UserProperties("CEF_SELECTED_PIANTA_BMK") = CEF_piante_bookmark_array(Application.UserProperties("CEF_SELECTED_PIANTA_POS"),1)
    Application.UserProperties("CEF_SELECTED_PIANTA_ID") = CEF_piante_bookmark_array(Application.UserProperties("CEF_SELECTED_PIANTA_POS"),2)
    Dim lp1Page
    Set lp1Page = ThisEvent.Object.Parent
    lp1Page.Activate
End Sub

Private Sub CEF_FormLISTPIANTE_BtnNEXT_click()
    'Controllo se la pianta corrente e' completata
    If (Application.UserProperties("CEF_SELECTED_PIANTA_TRASPAR_INS") And Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI")=0) Then
        MsgBox "Nella pianta corrente si deve inserire almeno un sintomo!",vbExclamation,"CONECOFOR MOBILE"
        ThisEvent.Result = False
        Exit Sub
    End If
    If (Not Application.UserProperties("CEF_SELECTED_PIANTA_TRASPAR_INS") And Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI")>0) Then
        MsgBox "Nella pianta corrente si deve inserire trasparenza e fruttificazione!",vbExclamation,"CONECOFOR MOBILE"
        ThisEvent.Result = False
        Exit Sub
    End If
    Application.UserProperties("CEF_SELECTED_PIANTA_POS") = Application.UserProperties("CEF_SELECTED_PIANTA_POS")+1
    Application.UserProperties("CEF_SELECTED_PIANTA_BMK") = CEF_piante_bookmark_array(Application.UserProperties("CEF_SELECTED_PIANTA_POS"),1)
    Application.UserProperties("CEF_SELECTED_PIANTA_ID") = CEF_piante_bookmark_array(Application.UserProperties("CEF_SELECTED_PIANTA_POS"),2)
    Dim lp1Page
    Set lp1Page = ThisEvent.Object.Parent
    lp1Page.Activate
End Sub

Private Sub CEF_FormLISTPIANTE_BtnNEXT10_click()
    'Controllo se la pianta corrente e' completata
    If (Application.UserProperties("CEF_SELECTED_PIANTA_TRASPAR_INS") And Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI")=0) Then
        MsgBox "Nella pianta corrente si deve inserire almeno un sintomo!",vbExclamation,"CONECOFOR MOBILE"
        ThisEvent.Result = False
        Exit Sub
    End If
    If (Not Application.UserProperties("CEF_SELECTED_PIANTA_TRASPAR_INS") And Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI")>0) Then
        MsgBox "Nella pianta corrente si deve inserire trasparenza e fruttificazione!",vbExclamation,"CONECOFOR MOBILE"
        ThisEvent.Result = False
        Exit Sub
    End If
    Dim new_pos
    If Application.UserProperties("CEF_SELECTED_PIANTA_POS") >= (Application.UserProperties("CEF_LISTPIANTE_NPIANTE") - 10) Then
        new_pos = Application.UserProperties("CEF_LISTPIANTE_NPIANTE")
    Else
        new_pos = Application.UserProperties("CEF_SELECTED_PIANTA_POS")+10
    End If
    Application.UserProperties("CEF_SELECTED_PIANTA_POS") = new_pos
    Application.UserProperties("CEF_SELECTED_PIANTA_BMK") = CEF_piante_bookmark_array(Application.UserProperties("CEF_SELECTED_PIANTA_POS"),1)
    Application.UserProperties("CEF_SELECTED_PIANTA_ID") = CEF_piante_bookmark_array(Application.UserProperties("CEF_SELECTED_PIANTA_POS"),2)
    Dim lp1Page
    Set lp1Page = ThisEvent.Object.Parent
    lp1Page.Activate
End Sub

Private Sub CEF_FormLISTPIANTE_BtnPLUS_click()
    'Controllo se la pianta corrente e' completata
    If (Application.UserProperties("CEF_SELECTED_PIANTA_TRASPAR_INS") And Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI")=0) Then
        MsgBox "Nella pianta corrente si deve inserire almeno un sintomo!",vbExclamation,"CONECOFOR MOBILE"
        ThisEvent.Result = False
        Exit Sub
    End If
    If (Not Application.UserProperties("CEF_SELECTED_PIANTA_TRASPAR_INS") And Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI")>0) Then
        MsgBox "Nella pianta corrente si deve inserire trasparenza e fruttificazione!",vbExclamation,"CONECOFOR MOBILE"
        ThisEvent.Result = False
        Exit Sub
    End If
    
    Dim lp1Page
    Set lp1Page = ThisEvent.Object.Parent
    
    '------------------START DEMO CODE--------------------
        
       
'     If Application.UserProperties("CEF_LISTPIANTE_NPIANTE") > 9 Then
'         MsgBox "Versione DEMO." & vbNewLine & "In questa versione non e' concesso inserire piu' di 10 piante campione!",vbExclamation,"CONECOFOR MOBILE"
'         Exit sub
'     End If
                
            
    '------------------END DEMO CODE---------------------
    
    Dim appApplets, CEF_Applet
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
        
    Application.UserProperties("CEF_DATIPIANTA_NEW") = vbTrue
    
    Application.UserProperties("CEF_DATIPIANTA_IDPIANTA") = 0 
    Application.UserProperties("CEF_DATIPIANTA_SPECIE") = ""
    Application.UserProperties("CEF_DATIPIANTA_TRASPAR") = ""
    Application.UserProperties("CEF_DATIPIANTA_ASS_CROWN") = ""
    Application.UserProperties("CEF_DATIPIANTA_FRUTTIF") = ""
    Application.UserProperties("CEF_DATIPIANTA_DENDROT") = ""
    Application.UserProperties("CEF_DATIPIANTA_DIAM1") = ""
    Application.UserProperties("CEF_DATIPIANTA_DIAM2") = ""
    Application.UserProperties("CEF_DATIPIANTA_DIST") = 0
    Application.UserProperties("CEF_DATIPIANTA_AZ") = 0
    Application.UserProperties("CEF_DATIPIANTA_RM_OLD") = "2"
    
    
    Dim OKbutton_click
    OKbutton_click = CEF_Applet.Forms(CEF_FRM_DATIPIANTA).Show
    
    If OKbutton_click Then
        
        Dim area_x,area_y,dist,azimut,pPoint
        area_x = Application.UserProperties("CEF_SELECTED_AREA_COORDE")
        area_y = Application.UserProperties("CEF_SELECTED_AREA_COORDN")
        'create the new point geometry
        Set pPoint = Application.CreateAppObject("point")

        dist = Application.UserProperties("CEF_DATIPIANTA_DIST")
        azimut = 90 - Application.UserProperties("CEF_DATIPIANTA_AZ")
        pPoint.X = area_x + dist*cos((azimut*3.14159/180))
        pPoint.Y = area_y + dist*sin((azimut*3.14159/180))

        CEF_PianteRS.AddNew pPoint

        'copy over all the attribute values to the new record of the new shapefile

        CEF_PianteRS.Fields(CEF_PIANTE_FIELD_IDAREA).Value = Application.UserProperties("CEF_SELECTED_AREA_ID")
        CEF_PianteRS.Fields(CEF_PIANTE_FIELD_IDPIANTA).Value = Application.UserProperties("CEF_DATIPIANTA_IDPIANTA")
        CEF_PianteRS.Fields(CEF_PIANTE_FIELD_SPECIE).Value = Application.UserProperties("CEF_DATIPIANTA_SPECIE")
        CEF_PianteRS.Fields(CEF_PIANTE_FIELD_RM_OLD).Value = Application.UserProperties("CEF_DATIPIANTA_RM_OLD") 
        CEF_PianteRS.Fields(CEF_PIANTE_FIELD_REM_MORT).Value = Application.UserProperties("CEF_DATIPIANTA_REM_MORT")
        CEF_PianteRS.Fields(CEF_PIANTE_FIELD_DENDROT).Value = Application.UserProperties("CEF_DATIPIANTA_DENDROT")
        
        CEF_PianteRS.Fields(CEF_PIANTE_FIELD_ASS_CROWN).Value = Application.UserProperties("CEF_DATIPIANTA_ASS_CROWN")
        CEF_PianteRS.Fields(CEF_PIANTE_FIELD_TRASPAR).Value = Application.UserProperties("CEF_DATIPIANTA_TRASPAR")
        CEF_PianteRS.Fields(CEF_PIANTE_FIELD_FRUTTIF).Value = Application.UserProperties("CEF_DATIPIANTA_FRUTTIF") 
        
        CEF_PianteRS.Fields(CEF_PIANTE_FIELD_DIAM1).Value = Application.UserProperties("CEF_DATIPIANTA_DIAM1") 
        CEF_PianteRS.Fields(CEF_PIANTE_FIELD_DIAM2).Value = Application.UserProperties("CEF_DATIPIANTA_DIAM2") 
        CEF_PianteRS.Fields(CEF_PIANTE_FIELD_DIST).Value = Application.UserProperties("CEF_DATIPIANTA_DIST")
        CEF_PianteRS.Fields(CEF_PIANTE_FIELD_AZIMUT).Value = Application.UserProperties("CEF_DATIPIANTA_AZ")
        
        
        'Update the new record of the new shapefile to save the changes
        CEF_PianteRS.Update
        CEF_PianteRS.Pack
        'update bookmark piante array
        Call CEF_update_CEF_piante_bookmark_array
        
        'go to new pianta
        Dim pos
        For pos=1 to Application.UserProperties("CEF_LISTPIANTE_NPIANTE")
            If CEF_piante_bookmark_array(pos,2)=Application.UserProperties("CEF_DATIPIANTA_IDPIANTA") Then
                Exit For
            End If
        Next
        Application.UserProperties("CEF_SELECTED_PIANTA_POS") = pos
        Application.UserProperties("CEF_SELECTED_PIANTA_BMK") = CEF_piante_bookmark_array(Application.UserProperties("CEF_SELECTED_PIANTA_POS"),1)
        Application.UserProperties("CEF_SELECTED_PIANTA_ID") = CEF_piante_bookmark_array(Application.UserProperties("CEF_SELECTED_PIANTA_POS"),2)
        
        CEF_Applet.Forms(CEF_FRM_LISTSINTOMI).Show 
    End If
   
    Application.UserProperties("CEF_DATIPIANTA_NEW") = False
    
    lp1Page.Activate
    
End Sub

Private Sub CEF_FormLISTPIANTE_BtnMINUS_click()
    Dim lp1Page
    Set lp1Page = ThisEvent.Object.Parent
    
    If StrComp(CEF_PianteRS(CEF_PIANTE_FIELD_RM_OLD).Value,"2") = 0 Then
        Dim OKbutton_click,message
        message = "Confermi cancellazione pianta " & Application.UserProperties("CEF_SELECTED_PIANTA_ID")&"?" & vbNewLine & "Tutti i sintomi ad essa collegati saranno cancellati!"
        OKbutton_click = MsgBox (message,vBOkCancel,"CONECOFOR MOBILE")
        
        If OKbutton_click = vbOk Then
            
            'delete sintomi for seleted pianta
            Dim lBookmark,find_string
            find_string = "["&CEF_SINTOMI_FIELD_IDPIANTA&"] = "&Application.UserProperties("CEF_SELECTED_PIANTA_ID") & " AND ["&CEF_SINTOMI_FIELD_IDAREA&"] = """&Application.UserProperties("CEF_SELECTED_AREA_ID") & """"
            If CEF_SintomiRS.RecordCount <> 0 Then
                CEF_SintomiRS.MoveFirst
                lBookmark = CEF_SintomiRS.Find(find_string)
                Do While (lBookmark>0)
                    CEF_SintomiRS.Delete
                    CEF_SintomiRS.Update
                    lBookmark = CEF_SintomiRS.Find(find_string,,lBookmark)
                Loop
                CEF_SintomiRS.Pack
            End If
            
            CEF_PianteRS.Delete
            CEF_PianteRS.Update
            CEF_PianteRS.Pack
            
            'update bookmark piante array
            Call CEF_update_CEF_piante_bookmark_array
            
            If Application.UserProperties("CEF_LISTPIANTE_NPIANTE") > 0 Then
                If Application.UserProperties("CEF_SELECTED_PIANTA_POS") > Application.UserProperties("CEF_LISTPIANTE_NPIANTE") Then
                    Application.UserProperties("CEF_SELECTED_PIANTA_POS") = Application.UserProperties("CEF_SELECTED_PIANTA_POS") -1
                End If
                Application.UserProperties("CEF_SELECTED_PIANTA_BMK") = CEF_piante_bookmark_array(Application.UserProperties("CEF_SELECTED_PIANTA_POS"),1)
                Application.UserProperties("CEF_SELECTED_PIANTA_ID") = CEF_piante_bookmark_array(Application.UserProperties("CEF_SELECTED_PIANTA_POS"),2)
            Else
                Application.UserProperties("CEF_SELECTED_PIANTA_POS") = 0
                Application.UserProperties("CEF_SELECTED_PIANTA_BMK") = 0
                Application.UserProperties("CEF_SELECTED_PIANTA_ID") = 0 
            End If 
        End If
    Else
        MsgBox "Possono essere cancellate solo le piante nuove (Rimozione mortalita' = 2)!",vbExclamation,"CONECOFOR MOBILE"
    End If
 
    lp1Page.Activate 

    Set lp1Page = nothing
End Sub

Private Sub CEF_btnDATIPIANTA_Click()
    Dim control,lp1Page
    Set control = ThisEvent.Object
    Set lp1Page = control.Parent
    
	Dim appApplets, CEF_Applet
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
	Application.UserProperties("CEF_DATIPIANTA_NEW") = vbFalse
    
    'set the data variables
    Application.UserProperties("CEF_DATIPIANTA_IDPIANTA") = CEF_PianteRS.Fields(CEF_PIANTE_FIELD_IDPIANTA).Value 
    Application.UserProperties("CEF_DATIPIANTA_SPECIE") = CEF_PianteRS.Fields(CEF_PIANTE_FIELD_SPECIE).Value
    Application.UserProperties("CEF_DATIPIANTA_RM_OLD") = CEF_PianteRS.Fields(CEF_PIANTE_FIELD_RM_OLD).Value
    Application.UserProperties("CEF_DATIPIANTA_REM_MORT") = CEF_PianteRS.Fields(CEF_PIANTE_FIELD_REM_MORT).Value
    Application.UserProperties("CEF_DATIPIANTA_DENDROT") = CEF_PianteRS.Fields(CEF_PIANTE_FIELD_DENDROT).Value
    
    Application.UserProperties("CEF_DATIPIANTA_ASS_CROWN") = CEF_PianteRS.Fields(CEF_PIANTE_FIELD_ASS_CROWN).Value
    Application.UserProperties("CEF_DATIPIANTA_TRASPAR") = CEF_PianteRS.Fields(CEF_PIANTE_FIELD_TRASPAR).Value
    Application.UserProperties("CEF_DATIPIANTA_FRUTTIF") = CEF_PianteRS.Fields(CEF_PIANTE_FIELD_FRUTTIF).Value
    
    Application.UserProperties("CEF_DATIPIANTA_DIAM1") = CEF_PianteRS.Fields(CEF_PIANTE_FIELD_DIAM1).Value
    Application.UserProperties("CEF_DATIPIANTA_DIAM2") = CEF_PianteRS.Fields(CEF_PIANTE_FIELD_DIAM2).Value
    Application.UserProperties("CEF_DATIPIANTA_DIST") = CEF_PianteRS.Fields(CEF_PIANTE_FIELD_DIST).Value
    Application.UserProperties("CEF_DATIPIANTA_AZ") = CEF_PianteRS.Fields(CEF_PIANTE_FIELD_AZIMUT).Value
    
    
    Dim OKbutton_click
    OKbutton_click = CEF_Applet.Forms(CEF_FRM_DATIPIANTA).Show
    If OKbutton_click Then
        
        Dim area_x,area_y,dist,azimut,pPoint,fieldsRS
        area_x = Application.UserProperties("CEF_SELECTED_AREA_COORDE")
        area_y = Application.UserProperties("CEF_SELECTED_AREA_COORDN")
        'create the new point geometry
        Set pPoint = Application.CreateAppObject("point")

        dist = Application.UserProperties("CEF_DATIPIANTA_DIST")
        azimut = 90 - Application.UserProperties("CEF_DATIPIANTA_AZ")
        pPoint.X = area_x + dist*cos((azimut*3.14159/180))
        pPoint.Y = area_y + dist*sin((azimut*3.14159/180))
        Set fieldsRS = CEF_PianteRS.Fields
        Set fieldsRS.Shape = pPoint

        'copy over all the writabel attribute values to the the record of the  shapefile
        'CEF_PianteRS.Fields(CEF_PIANTE_FIELD_IDAREA).Value = Application.UserProperties("CEF_SELECTED_AREA_ID")
        'CEF_PianteRS.Fields(CEF_PIANTE_FIELD_IDPIANTA).Value = Application.UserProperties("CEF_DATIPIANTA_IDPIANTA")
        CEF_PianteRS.Fields(CEF_PIANTE_FIELD_SPECIE).Value = Application.UserProperties("CEF_DATIPIANTA_SPECIE")
        CEF_PianteRS.Fields(CEF_PIANTE_FIELD_REM_MORT).Value = Application.UserProperties("CEF_DATIPIANTA_REM_MORT")
        CEF_PianteRS.Fields(CEF_PIANTE_FIELD_DENDROT).Value = Application.UserProperties("CEF_DATIPIANTA_DENDROT") 
        
        CEF_PianteRS.Fields(CEF_PIANTE_FIELD_ASS_CROWN).Value = Application.UserProperties("CEF_DATIPIANTA_ASS_CROWN")
        CEF_PianteRS.Fields(CEF_PIANTE_FIELD_TRASPAR).Value = Application.UserProperties("CEF_DATIPIANTA_TRASPAR")
        CEF_PianteRS.Fields(CEF_PIANTE_FIELD_FRUTTIF).Value = Application.UserProperties("CEF_DATIPIANTA_FRUTTIF") 

        CEF_PianteRS.Fields(CEF_PIANTE_FIELD_DIAM1).Value = Application.UserProperties("CEF_DATIPIANTA_DIAM1") 
        CEF_PianteRS.Fields(CEF_PIANTE_FIELD_DIAM2).Value = Application.UserProperties("CEF_DATIPIANTA_DIAM2") 
        CEF_PianteRS.Fields(CEF_PIANTE_FIELD_DIST).Value = Application.UserProperties("CEF_DATIPIANTA_DIST")
        CEF_PianteRS.Fields(CEF_PIANTE_FIELD_AZIMUT).Value = Application.UserProperties("CEF_DATIPIANTA_AZ")
        
        'Update the new record of the new shapefile to save the changes
        CEF_PianteRS.Update
        
        
        lp1Page.Activate
    End If
End Sub 

Private Sub CEF_FormDATIPIANTA_onload()
    Dim piantaForm,p1Page,p2Page,p3Page
    Set piantaForm = thisevent.object
    Set p1Page = piantaForm(CEF_FRM_DATIPIANTA_DP1)
    Set p2Page = piantaForm(CEF_FRM_DATIPIANTA_DP2)
    Set p3Page = piantaForm(CEF_FRM_DATIPIANTA_DP3)
    If Application.UserProperties("CEF_DATIPIANTA_NEW") = vbFalse Then
        p1Page.Activate
        p1Page(CEF_FRM_DATIPIANTA_DP1_EDITIDPIANTA).Text = Application.UserProperties("CEF_DATIPIANTA_IDPIANTA") 
        p1Page(CEF_FRM_DATIPIANTA_DP1_EDITIDPIANTA).Enabled = false
        
        Dim find_String
        p1Page(CEF_FRM_DATIPIANTA_DP1_EDITIDSPECIEID).Text = Application.UserProperties("CEF_DATIPIANTA_SPECIE")
        p1Page(CEF_FRM_DATIPIANTA_DP1_EDITIDSPECIEID).Enabled = false
        If StrComp(Application.UserProperties("CEF_DATIPIANTA_SPECIE"),"") = 0 then
            p1Page(CEF_FRM_DATIPIANTA_DP1_EDITIDSPECIETEXT).Text = ""
        Else
            find_String = "[TABELLA]=""SPECIE"" AND [ID]= """ & Application.UserProperties("CEF_DATIPIANTA_SPECIE") & """"
            CEF_TabdecRS.MoveFirst
            CEF_TabdecRS.Find(find_String)
            p1Page(CEF_FRM_DATIPIANTA_DP1_EDITIDSPECIETEXT).Text = CEF_TabdecRS("TEXT").Value
        End If
        p1Page(CEF_FRM_DATIPIANTA_DP1_EDITIDSPECIETEXT).Enabled = false
        
        p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).Enabled = true
        p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).Clear
        
        Select Case Clng(Application.UserProperties("CEF_DATIPIANTA_RM_OLD"))
            Case 1:
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "1","1 albero vivo nella campagna corrente e precedente"
                
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "11","11 utlizzazione pianificata"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "12","12 taglio fitosanitario cause biotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "13","13 taglio fitosanitario cause abiotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "14","14 causa del taglio sconosciuta"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "18","18 scomparsa sconosciuta"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "19","19 scomparsa non determinata o osservata"
                
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "22","22 pesanti danni meccanici"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "23","23 uscita classi di Kraft 1, 2, 3"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "29","29 altre ragioni"
                
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "31","31 morte per ragioni biotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "32","32 morte per ragioni abiotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "38","38 morte per cause sconosciute"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "39","39 causa della morte non determinata o osservata"
                
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "41","41 caduto per ragioni abiotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "42","42 caduto per ragioni biotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "48","48 caduto per cause sconosciute"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "49","49 caduto per cause non determinate o osservate"
                 
            Case 2:
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "2","2 nuovo albero vivo"
            
            Case 18:
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "18","18 scomparsa sconosciuta"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "3","3 albero vivo non valutato nella precedente campagna"
                
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "11","11 utlizzazione pianificata"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "12","12 taglio fitosanitario cause biotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "13","13 taglio fitosanitario cause abiotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "14","14 causa del taglio sconosciuta"
                
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "22","22 pesanti danni meccanici"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "23","23 uscita classi di Kraft 1, 2, 3"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "29","29 altre ragioni"
                
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "31","31 morte per ragioni biotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "32","32 morte per ragioni abiotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "38","38 morte per cause sconosciute"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "39","39 causa della morte non determinata o osservata"
                
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "41","41 caduto per ragioni abiotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "42","42 caduto per ragioni biotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "48","48 caduto per cause sconosciute"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "49","49 caduto per cause non determinate o osservate"
            
            Case 19:
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "19","19 scomparsa non determinata o osservata"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "3","3 albero vivo non valutato nella precedente campagna"
                
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "11","11 utlizzazione pianificata"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "12","12 taglio fitosanitario cause biotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "13","13 taglio fitosanitario cause abiotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "14","14 causa del taglio sconosciuta"                
                
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "22","22 pesanti danni meccanici"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "23","23 uscita classi di Kraft 1, 2, 3"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "29","29 altre ragioni"
                
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "31","31 morte per ragioni biotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "32","32 morte per ragioni abiotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "38","38 morte per cause sconosciute"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "39","39 causa della morte non determinata o osservata"
                
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "41","41 caduto per ragioni abiotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "42","42 caduto per ragioni biotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "48","48 caduto per cause sconosciute"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "49","49 caduto per cause non determinate o osservate"
            
            Case 22:
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "22","22 pesanti danni meccanici"
                
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "3","3 albero vivo non valutato nella precedente campagna"
                
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "11","11 utlizzazione pianificata"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "12","12 taglio fitosanitario cause biotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "13","13 taglio fitosanitario cause abiotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "14","14 causa del taglio sconosciuta"   
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "18","18 scomparsa sconosciuta"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "19","19 scomparsa non determinata o osservata"
                
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "23","23 uscita classi di Kraft 1, 2, 3"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "29","29 altre ragioni"
                
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "31","31 morte per ragioni biotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "32","32 morte per ragioni abiotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "38","38 morte per cause sconosciute"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "39","39 causa della morte non determinata o osservata"
                
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "41","41 caduto per ragioni abiotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "42","42 caduto per ragioni biotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "48","48 caduto per cause sconosciute"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "49","49 caduto per cause non determinate o osservate"
            Case 23:
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "23","23 uscita classi di Kraft 1, 2, 3"

                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "3","3 albero vivo non valutato nella precedente campagna"
                
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "11","11 utlizzazione pianificata"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "12","12 taglio fitosanitario cause biotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "13","13 taglio fitosanitario cause abiotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "14","14 causa del taglio sconosciuta"   
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "18","18 scomparsa sconosciuta"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "19","19 scomparsa non determinata o osservata"
                
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "22","22 pesanti danni meccanici"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "29","29 altre ragioni"
                
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "31","31 morte per ragioni biotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "32","32 morte per ragioni abiotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "38","38 morte per cause sconosciute"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "39","39 causa della morte non determinata o osservata"
                
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "41","41 caduto per ragioni abiotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "42","42 caduto per ragioni biotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "48","48 caduto per cause sconosciute"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "49","49 caduto per cause non determinate o osservate"
            Case 29:
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "29","29 altre ragioni"
                
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "3","3 albero vivo non valutato nella precedente campagna"
                
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "11","11 utlizzazione pianificata"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "12","12 taglio fitosanitario cause biotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "13","13 taglio fitosanitario cause abiotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "14","14 causa del taglio sconosciuta"   
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "18","18 scomparsa sconosciuta"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "19","19 scomparsa non determinata o osservata"
                
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "22","22 pesanti danni meccanici"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "23","23 uscita classi di Kraft 1, 2, 3"

                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "31","31 morte per ragioni biotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "32","32 morte per ragioni abiotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "38","38 morte per cause sconosciute"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "39","39 causa della morte non determinata o osservata"
                
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "41","41 caduto per ragioni abiotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "42","42 caduto per ragioni biotiche"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "48","48 caduto per cause sconosciute"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "49","49 caduto per cause non determinate o osservate"
            Case 905:
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "905","905 albero esterno AdS18"
            Case 906:
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "906","906 albero non ancora idoneo"
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "902","902 nuovo albero vivo"
            Case Else:
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem Application.UserProperties("CEF_DATIPIANTA_RM_OLD"),Application.UserProperties("CEF_DATIPIANTA_RM_OLD")
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).Enabled = false
                MsgBox "Codice Rimozione mortalita' di inizio campagna non valido, contattare l'assistenza!",vbExclamation,"CONECOFOR MOBILE"
                
        End Select
        
        p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).ListIndex = ComboFind(p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM),Application.UserProperties("CEF_DATIPIANTA_REM_MORT"))
        
        if StrComp(Application.UserProperties("CEF_DATIPIANTA_DENDROT"),"") = 0 then
            p1Page(CEF_FRM_DATIPIANTA_DP1_COMBODENDRO).ListIndex = -1
        else
            p1Page(CEF_FRM_DATIPIANTA_DP1_COMBODENDRO).ListIndex = ComboFind(p1Page(CEF_FRM_DATIPIANTA_DP1_COMBODENDRO),Application.UserProperties("CEF_DATIPIANTA_DENDROT"))
        end if
        
        If Clng(Application.UserProperties("CEF_DATIPIANTA_REM_MORT"))<>2 Then
            p1Page(CEF_FRM_DATIPIANTA_DP1_BTNIMPORT).Enabled = false
            p1Page(CEF_FRM_DATIPIANTA_DP1_BTNSPECIE).Enabled = false
            p1Page(CEF_FRM_DATIPIANTA_DP1_COMBODENDRO).Enabled = false
        End if
        
        p2Page.Activate
        
        p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOCH_VAL).ListIndex = 0
        p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOCH_VAL).Enabled = false
        
        if StrComp(Application.UserProperties("CEF_DATIPIANTA_TRASPAR"),"") = 0 then
            p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOTRAS).ListIndex = -1
        else
            p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOTRAS).ListIndex = ComboFind(p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOTRAS),Application.UserProperties("CEF_DATIPIANTA_TRASPAR"))
        end if
        
        
        if StrComp(Application.UserProperties("CEF_DATIPIANTA_TRASPAR"),"100") = 0 Then
            p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOFRUT).ListIndex = -1
            p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOFRUT).Enabled = false
        Else
            if StrComp(Application.UserProperties("CEF_DATIPIANTA_FRUTTIF"),"") = 0 then
                p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOFRUT).ListIndex = -1
            else
                p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOFRUT).ListIndex = ComboFind(p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOFRUT),Application.UserProperties("CEF_DATIPIANTA_FRUTTIF"))
            end if
        End If
        
        Select Case Clng(Application.UserProperties("CEF_DATIPIANTA_REM_MORT"))
            Case 1,2,3,902:
                p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOTRAS).enabled=true
                p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOFRUT).enabled=true
            Case Else:
                p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOTRAS).enabled=false
                p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOFRUT).enabled=false
        End select
        
        p3Page.Activate
        
        p3Page(CEF_FRM_DATIPIANTA_DP3_EDITD1).Text = Application.UserProperties("CEF_DATIPIANTA_DIAM1")
        p3Page(CEF_FRM_DATIPIANTA_DP3_EDITD2).Text = Application.UserProperties("CEF_DATIPIANTA_DIAM2")
        p3Page(CEF_FRM_DATIPIANTA_DP3_EDITAZ).Text = Application.UserProperties("CEF_DATIPIANTA_AZ")
        p3Page(CEF_FRM_DATIPIANTA_DP3_EDITDIST).Text = Application.UserProperties("CEF_DATIPIANTA_DIST")
        
        Select Case Clng(Application.UserProperties("CEF_DATIPIANTA_REM_MORT")) 
            Case 2:
                p3Page(CEF_FRM_DATIPIANTA_DP3_EDITAZ).Enabled = true
                p3Page(CEF_FRM_DATIPIANTA_DP3_EDITDIST).Enabled = true
                p3Page(CEF_FRM_DATIPIANTA_DP3_EDITD1).Enabled = true
                p3Page(CEF_FRM_DATIPIANTA_DP3_EDITD2).Enabled = true
            Case 902:
                p3Page(CEF_FRM_DATIPIANTA_DP3_EDITAZ).Enabled = false
                p3Page(CEF_FRM_DATIPIANTA_DP3_EDITDIST).Enabled = false
                p3Page(CEF_FRM_DATIPIANTA_DP3_EDITD1).Enabled = true
                p3Page(CEF_FRM_DATIPIANTA_DP3_EDITD2).Enabled = true    
            Case Else:
                p3Page(CEF_FRM_DATIPIANTA_DP3_EDITAZ).Enabled = false
                p3Page(CEF_FRM_DATIPIANTA_DP3_EDITDIST).Enabled = false
                If Application.UserProperties("CEF_DATIPIANTA_DIAM1") > 0 Then
                    p3Page(CEF_FRM_DATIPIANTA_DP3_EDITD1).Enabled = false
                End If
                If Application.UserProperties("CEF_DATIPIANTA_DIAM2") > 0 Then
                    p3Page(CEF_FRM_DATIPIANTA_DP3_EDITD2).Enabled = false
                End If
        End select
        
        p1Page.Activate
        
    Else
         
        p1Page.Activate
        p1Page(CEF_FRM_DATIPIANTA_DP1_EDITIDPIANTA).Text = Application.UserProperties("CEF_LISTPIANTE_MAX_ID_PIANTA")+1
        p1Page(CEF_FRM_DATIPIANTA_DP1_EDITIDPIANTA).Enabled = false
        p1Page(CEF_FRM_DATIPIANTA_DP1_EDITIDSPECIEID).Text = ""
        p1Page(CEF_FRM_DATIPIANTA_DP1_EDITIDSPECIEID).Enabled = false
        p1Page(CEF_FRM_DATIPIANTA_DP1_EDITIDSPECIETEXT).Text = ""
        p1Page(CEF_FRM_DATIPIANTA_DP1_EDITIDSPECIETEXT).Enabled = false
        p1Page(CEF_FRM_DATIPIANTA_DP1_COMBODENDRO).ListIndex = -1
        
        p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).Clear
        p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).AddItem "2","2 nuovo albero vivo"
        p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).ListIndex = 0
        p1Page(CEF_FRM_DATIPIANTA_DP1_COMBORM).Enabled = false
       
        p2Page.Activate
        p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOCH_VAL).ListIndex = 0
        p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOCH_VAL).Enabled = false
        p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOTRAS).ListIndex = -1
        p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOFRUT).ListIndex = -1
       
       
        p3Page.Activate
        p3Page(CEF_FRM_DATIPIANTA_DP3_EDITD1).Text = ""
        p3Page(CEF_FRM_DATIPIANTA_DP3_EDITD2).Text = ""
        p3Page(CEF_FRM_DATIPIANTA_DP3_EDITAZ).Text = ""
        p3Page(CEF_FRM_DATIPIANTA_DP3_EDITDIST).Text = ""
        
        
        p1Page.Activate

    End If
        
End Sub

Private Sub CEF_FormDATIPIANTA_DP1_BtnIMPORT_Click()
    Dim button,p1Page,form,p2Page,p3Page
    Set button = ThisEvent.Object
    Set p1Page = button.parent
    Set form = p1Page.parent
    Set p2Page = form(CEF_FRM_DATIPIANTA_DP2)
    Set p3Page = form(CEF_FRM_DATIPIANTA_DP3)
    
    Dim appApplets, CEF_Applet
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
    
    Application.UserProperties("FrmGET_VALUE_TITLE") = "Importazione dati pianta cavallettata"
    Application.UserProperties("FrmGET_VALUE_LABEL") = "ID cavallettamento"
    Dim OKbutton_click
    OKbutton_click = CEF_Applet.Forms(CEF_FRM_GET_VALUE).Show
    If OKbutton_click Then
        Dim ID_piantacav
        ID_piantacav = Application.UserProperties("FrmGET_VALUE_EDIT")
        If CEF_value_check_range(ID_piantacav,1,300) Then
            Dim lBookmark,find_string
            find_string =  "["&CEF_CAV_FIELD_IDAREA&"] = """&Application.UserProperties("CEF_SELECTED_AREA_ID") & """" & "AND ["&CEF_CAV_FIELD_IDPIANTA&"] = """&ID_piantacav& """"
            CEF_CavRS.MoveFirst
            lBookmark = CEF_CavRS.Find(find_string)
            If lBookmark > 0 Then
            
                
                p1Page(CEF_FRM_DATIPIANTA_DP1_EDITIDSPECIEID).Text = CEF_CavRS(CEF_CAV_FIELD_SPECIE).Value
                find_String = "[TABELLA]=""SPECIE"" AND [ID]= """ & CEF_CavRS(CEF_CAV_FIELD_SPECIE).Value & """"
                CEF_TabdecRS.Find(find_String)
                p1Page(CEF_FRM_DATIPIANTA_DP1_EDITIDSPECIETEXT).Text = CEF_TabdecRS("TEXT").Value
                
                p1Page(CEF_FRM_DATIPIANTA_DP1_COMBODENDRO).ListIndex = ComboFind(p1Page(CEF_FRM_DATIPIANTA_DP1_COMBODENDRO),CEF_CavRS(CEF_CAV_FIELD_DENDROT).Value)
                
                p3Page.Activate
                
                p3Page(CEF_FRM_DATIPIANTA_DP3_EDITD1).Text = CEF_CavRS(CEF_CAV_FIELD_DIAM1).Value
                p3Page(CEF_FRM_DATIPIANTA_DP3_EDITD2).Text = CEF_CavRS(CEF_CAV_FIELD_DIAM2).Value
                
                p1Page.Activate
            Else
                MsgBox "ID cavallettamento non esistente!",vbExclamation,"CONECOFOR MOBILE"
            End If
        Else
            MsgBox "ID cavallettamento non valido!",vbExclamation,"CONECOFOR MOBILE"
        End If
    End If
End Sub

Private Sub CEF_FormDATIPIANTA_DP1_BtnSPECIE_Click()
    Dim button,pPage
    Set button = ThisEvent.Object
    Set pPage = button.parent
    Application.UserProperties("LIST_FILTER") ="[TABELLA] = ""SPECIE"""
    Application.UserProperties("LIST_FIELD_ID") = "ID"
    Application.UserProperties("LIST_FIELD_TEXT") = "TEXT"
    Dim appApplets, CEF_Applet
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
	If CEF_Applet.Forms("FrmLISTBOX").Show Then
        pPage(CEF_FRM_DATIPIANTA_DP1_EDITIDSPECIEID).Text = Application.UserProperties("FrmLISTBOX_RESULT_V")
        pPage(CEF_FRM_DATIPIANTA_DP1_EDITIDSPECIETEXT).Text = Application.UserProperties("FrmLISTBOX_RESULT_T")
    End If
End Sub

Private Sub CEF_FormDATIPIANTA_DP1_ComboRM_onselchange()
    Dim combRM,p1Page,p2Page,p3Page,pForm
    Set combRM = ThisEvent.Object
    Set p1Page = combRM.parent
    Set pForm = p1Page.parent
    Set p2Page = pForm(CEF_FRM_DATIPIANTA_DP2)
    Set p3Page = pForm(CEF_FRM_DATIPIANTA_DP3)
    
    p2Page.activate
    Select case Clng(combRM.value)
    Case 1,2,3,902:
        p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOTRAS).ListIndex = -1
        p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOTRAS).Enabled = true
        p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOFRUT).ListIndex = -1
        p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOFRUT).Enabled = true
    Case 11,12,13,14,31,32,38,39,41,42,48,49:
        p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOTRAS).ListIndex = ComboFind(p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOTRAS),"100")
        p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOTRAS).Enabled = false
        p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOFRUT).ListIndex = -1
        p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOFRUT).Enabled = false
    Case 18,19,23,29,905,906:
        p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOTRAS).ListIndex = -1
        p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOTRAS).Enabled = false
        p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOFRUT).ListIndex = -1
        p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOFRUT).Enabled = false
    Case 22:
        p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOTRAS).ListIndex = ComboFind(p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOTRAS),"99")
        p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOTRAS).Enabled = false
        p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOFRUT).ListIndex = -1
        p2Page(CEF_FRM_DATIPIANTA_DP2_COMBOFRUT).Enabled = true
    End Select
    p3Page.activate
    Select case Clng(combRM.value)
        Case 902:
            p3Page(CEF_FRM_DATIPIANTA_DP3_EDITD1).Enabled = true
            p3Page(CEF_FRM_DATIPIANTA_DP3_EDITD2).Enabled = true
        Case 2:
            p3Page(CEF_FRM_DATIPIANTA_DP3_EDITD1).Enabled = true
            p3Page(CEF_FRM_DATIPIANTA_DP3_EDITD2).Enabled = true
            p3Page(CEF_FRM_DATIPIANTA_DP3_EDITDIST).Enabled = true
            p3Page(CEF_FRM_DATIPIANTA_DP3_EDITAZ).Enabled = true
        Case else:
            p3Page(CEF_FRM_DATIPIANTA_DP3_EDITD1).Enabled = false
            p3Page(CEF_FRM_DATIPIANTA_DP3_EDITD2).Enabled = false
            p3Page(CEF_FRM_DATIPIANTA_DP3_EDITDIST).Enabled = false
            p3Page(CEF_FRM_DATIPIANTA_DP3_EDITAZ).Enabled = false
    End select
    p1Page.activate
End Sub


Private Sub CEF_FormDATIPIANTA_DP2_ComboTRAS_onselchange()
    Dim control,pPage
    Set control = ThisEvent.Object
    Set pPage = control.parent
    If StrComp(control.value,"100") = 0 Then
        pPage(CEF_FRM_DATIPIANTA_DP2_COMBOFRUT).ListIndex = -1
        pPage(CEF_FRM_DATIPIANTA_DP2_COMBOFRUT).Enabled = false
    Else
        pPage(CEF_FRM_DATIPIANTA_DP2_COMBOFRUT).Enabled = true
    End If
End Sub

Private Sub CEF_FormDATIPIANTA_DP1_validate()
    Dim pPage
    Set pPage = thisevent.object
    If Not CEF_value_check_range(pPage(CEF_FRM_DATIPIANTA_DP1_EDITIDPIANTA).Value,1,199) Then
        ThisEvent.Result = False
        ThisEvent.MessageText = "Inserire ID pianta!"
        ThisEvent.MessageType = 48
	    Exit Sub
    Else
        Dim idpianta,id_exist,i
        idpianta = CInt(pPage(CEF_FRM_DATIPIANTA_DP1_EDITIDPIANTA).Value)
        
        If Application.UserProperties("CEF_DATIPIANTA_NEW") = vbTrue Then
            id_exist = false
            For i = 1 To UBound(CEF_piante_bookmark_array,1)
                If CEF_piante_bookmark_array(i,2) = idpianta Then
                    id_exist = true
                    exit for
                End If
            Next
            If id_exist Then
                ThisEvent.Result = False
                ThisEvent.MessageText = "ID pianta ga' inserito!"
                ThisEvent.MessageType = 48
                Exit Sub
            End If
        End If
        Application.UserProperties("CEF_DATIPIANTA_IDPIANTA") = idpianta
    End If
    
    If StrComp(pPage(CEF_FRM_DATIPIANTA_DP1_EDITIDSPECIEID).Text,"")=0 Then
        ThisEvent.Result = False
        ThisEvent.MessageText = "Inserire specie!"
        ThisEvent.MessageType = 48
	    Exit Sub
    else
        Application.UserProperties("CEF_DATIPIANTA_SPECIE") = pPage(CEF_FRM_DATIPIANTA_DP1_EDITIDSPECIEID).Text
    End If
    
    if pPage(CEF_FRM_DATIPIANTA_DP1_COMBORM).ListIndex = -1 then
        Thisevent.result = false
        ThisEvent.MessageText = "Specificare rimozione mortalita'!"
        ThisEvent.MessageType = 48
        Exit sub
    else
        If  CLng(Application.UserProperties("CEF_DATIPIANTA_REM_MORT"))<>Clng(pPage(CEF_FRM_DATIPIANTA_DP1_COMBORM).Value ) Then
            Dim lBookmark,find_string,sintomi_presenti
            find_string = "["&CEF_SINTOMI_FIELD_IDPIANTA&"] = "&Application.UserProperties("CEF_SELECTED_PIANTA_ID") & " AND ["&CEF_SINTOMI_FIELD_IDAREA&"] = """&Application.UserProperties("CEF_SELECTED_AREA_ID") & """"
            sintomi_presenti=false
            If CEF_SintomiRS.RecordCount <> 0 Then
                CEF_SintomiRS.MoveFirst
                lBookmark = CEF_SintomiRS.Find(find_string)
                sintomi_presenti = lBookmark>0
            End If
            If sintomi_presenti Then
                Dim OKbutton_click,message
                message = "Stai cambiando lo stato rimozione mortalita', i sintomi collegati alla pianta saranno cancellati! Vuoi Procedere?"
                OKbutton_click = MsgBox (message,vBOkCancel,"CONECOFOR MOBILE")
            
                If OKbutton_click = vbOk Then
                    'delete sintomi for seleted pianta
                   
                    If CEF_SintomiRS.RecordCount <> 0 Then
                        CEF_SintomiRS.MoveFirst
                        lBookmark = CEF_SintomiRS.Find(find_string)
                        Do While (lBookmark>0)
                            CEF_SintomiRS.Delete
                            CEF_SintomiRS.Update
                            lBookmark = CEF_SintomiRS.Find(find_string,,lBookmark)
                        Loop
                        CEF_SintomiRS.Pack
                    End If
                    Application.UserProperties("CEF_DATIPIANTA_REM_MORT") = pPage(CEF_FRM_DATIPIANTA_DP1_COMBORM).Value
                Else
                    Thisevent.result = false
                    ThisEvent.MessageText = "Aggiornamento annullato dall'utente!"
                    ThisEvent.MessageType = 48
                End If
            else
                Application.UserProperties("CEF_DATIPIANTA_REM_MORT") = pPage(CEF_FRM_DATIPIANTA_DP1_COMBORM).Value 
            end If
        Else
            Application.UserProperties("CEF_DATIPIANTA_REM_MORT") = pPage(CEF_FRM_DATIPIANTA_DP1_COMBORM).Value
        End if
    end if
    
    if pPage(CEF_FRM_DATIPIANTA_DP1_COMBODENDRO).ListIndex = -1 then
        Thisevent.result = false
        ThisEvent.MessageText = "Inserire dendrotipo!"
        ThisEvent.MessageType = 48
        Exit sub
    else
        Application.UserProperties("CEF_DATIPIANTA_DENDROT") = pPage(CEF_FRM_DATIPIANTA_DP1_COMBODENDRO).Value 
    end if
End Sub

Private Sub CEF_FormDATIPIANTA_DP2_validate()
    Dim pPage
    Set pPage = thisevent.object
    
    if pPage(CEF_FRM_DATIPIANTA_DP2_COMBOCH_VAL).ListIndex = -1 then
        Thisevent.result = false
        ThisEvent.MessageText = "Inserire metodo valutazione chioma!"
        ThisEvent.MessageType = 48
        Exit sub
    else
        Application.UserProperties("CEF_DATIPIANTA_ASS_CROWN") = pPage(CEF_FRM_DATIPIANTA_DP2_COMBOCH_VAL).Value 
    end if
    
    
    if pPage(CEF_FRM_DATIPIANTA_DP2_COMBOTRAS).ListIndex = -1 then
        If Not pPage(CEF_FRM_DATIPIANTA_DP2_COMBOTRAS).enabled then
            Application.UserProperties("CEF_DATIPIANTA_TRASPAR") =""
        Else
            Thisevent.result = false
            ThisEvent.MessageText = "Inserire trasparenza!"
            ThisEvent.MessageType = 48
            Exit sub
        end if
    else
        Application.UserProperties("CEF_DATIPIANTA_TRASPAR") = pPage(CEF_FRM_DATIPIANTA_DP2_COMBOTRAS).Value 
    end if

    
    if pPage(CEF_FRM_DATIPIANTA_DP2_COMBOFRUT).ListIndex = -1 then
        If Not pPage(CEF_FRM_DATIPIANTA_DP2_COMBOFRUT).enabled then
            Application.UserProperties("CEF_DATIPIANTA_FRUTTIF") =""
        Else
            Thisevent.result = false
            ThisEvent.MessageText = "Inserire fruttificazione!"
            ThisEvent.MessageType = 48
            Exit sub
        end if
    else
        Application.UserProperties("CEF_DATIPIANTA_FRUTTIF") = pPage(CEF_FRM_DATIPIANTA_DP2_COMBOFRUT).Value 
    end if
    
End Sub

Private Sub CEF_FormDATIPIANTA_DP3_validate()
    Dim pPage
    Set pPage = thisevent.object
    
    dim dist,num_str,num_arr,num,num_dec
    Select case CLng(Application.UserProperties("CEF_DATIPIANTA_REM_MORT"))
    case 2,902:
        num_str = pPage(CEF_FRM_DATIPIANTA_DP3_EDITDIST).Value
        If Instr(num_str,".") > 0 Then
            ThisEvent.Result = False
            ThisEvent.MessageText = "Usare la virgola come separatore decimale!"
            ThisEvent.MessageType = 48
            Exit Sub
        End If
        If Instr(num_str,",") = 0 Then
            num_str = num_str & ",0"
        End If
        num_arr = split(num_str,",")
        
        If IsNumeric(num_arr(0)) = False or IsNumeric(num_arr(1)) = False Then
            ThisEvent.Result = False
                ThisEvent.MessageText = "Inserire valore numerico!"
                ThisEvent.MessageType = 48
                Exit Sub
        End if
        dist = CDbl(num_arr(0))+CDbl(num_arr(1))/10^Len(CDbl(num_arr(1)))
     
        if dist>18.0 then
            ThisEvent.Result = False
            ThisEvent.MessageText = "L'albero deve essere dentro AdS18 (18 m)!"
            ThisEvent.MessageType = 48
            Exit Sub
        else
            Application.UserProperties("CEF_DATIPIANTA_DIST") = dist
        end if
        
        dim d1,d2,dm
        d1 = pPage(CEF_FRM_DATIPIANTA_DP3_EDITD1).Value
        d2 = pPage(CEF_FRM_DATIPIANTA_DP3_EDITD2).Value
        If Not CEF_value_check_range(d1,0.1,999) Then
            ThisEvent.Result = False
            ThisEvent.MessageText = "Inserire diametro 1 valido!"
            ThisEvent.MessageType = 48
            Exit Sub
        Else
            If Not CEF_value_check_range(d2,0.1,999) Then
                ThisEvent.Result = False
                ThisEvent.MessageText = "Inserire diametro 2 valido!"
                ThisEvent.MessageType = 48
                Exit Sub
            Else
                dm = (CDbl(d1)+CDbl(d2))/2.0
                If dist<=13.0 then
                    If dm < 9.5 then
                        ThisEvent.Result = False
                        ThisEvent.MessageText = "Non si possono avere alberi compione con diametro medio inferiore a 9.5 entro i 13m!"
                        ThisEvent.MessageType = 48
                        Exit Sub
                    else
                        Application.UserProperties("CEF_DATIPIANTA_DIAM2") = CInt(pPage(CEF_FRM_DATIPIANTA_DP3_EDITD2).Value)
                        Application.UserProperties("CEF_DATIPIANTA_DIAM1") = CInt(pPage(CEF_FRM_DATIPIANTA_DP3_EDITD1).Value)
                    end if
                else
                    if dm < 39.5 then
                        ThisEvent.Result = False
                        ThisEvent.MessageText = "Non si possono avere alberi compione con diametro medio inferiore a 39.5 oltre i 13m!"
                        ThisEvent.MessageType = 48
                        Exit Sub
                    else 
                        Application.UserProperties("CEF_DATIPIANTA_DIAM2") = CInt(pPage(CEF_FRM_DATIPIANTA_DP3_EDITD2).Value)
                        Application.UserProperties("CEF_DATIPIANTA_DIAM1") = CInt(pPage(CEF_FRM_DATIPIANTA_DP3_EDITD1).Value)
                    end if
                end if
                
            End If
            
        End If
        
        

        Dim azimut
        num_str = pPage(CEF_FRM_DATIPIANTA_DP3_EDITAZ).Value
        If Instr(num_str,".") > 0 Then
            ThisEvent.Result = False
            ThisEvent.MessageText = "Usare la virgola come separatore decimale!"
            ThisEvent.MessageType = 48
            Exit Sub
        End If
        If Instr(num_str,",") = 0 Then
            num_str = num_str & ",0"
        End If
        num_arr = split(num_str,",")
        
        If IsNumeric(num_arr(0)) = False or IsNumeric(num_arr(1)) = False Then
            ThisEvent.Result = False
                ThisEvent.MessageText = "Inserire valore numerico!"
                ThisEvent.MessageType = 48
                Exit Sub
        End if
        azimut = CDbl(num_arr(0))+CDbl(num_arr(1))/10^Len(CDbl(num_arr(1)))
        If Not CEF_value_check_range(azimut,0,359.99) Then
            ThisEvent.Result = False
            ThisEvent.MessageText = "Inserire azimut tra 0 e 359!"
            ThisEvent.MessageType = 48
            Exit Sub
        Else
            Application.UserProperties("CEF_DATIPIANTA_AZ") = azimut
        End If
    case else:
        Exit sub
    End select
    
End Sub


Private Sub CEF_btnLISTSINTOMI_Click()
    Dim button,lp1Page
    Set button = ThisEvent.Object
    Set lp1Page = button.Parent
	Dim appApplets, CEF_Applet
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
    Application.UserProperties("LSFORM_ONLOAD") = vbFalse  
	CEF_Applet.Forms(CEF_FRM_LISTSINTOMI).Show
    
    lp1Page.Activate
End Sub

Private Sub CEF_FormLISTSINTOMI_onload()
    Dim listsintomiForm,ls1Page
    Set listsintomiForm = ThisEvent.Object
    listsintomiForm.caption = "SINTOMI PIANTA " & Application.UserProperties("CEF_SELECTED_PIANTA_ID")
    Set ls1Page = listsintomiForm.Pages(CEF_FRM_LISTSINTOMI_LS1)
 
    
    Call CEF_update_CEF_sintomi_bookmark_array
    
    '------------------START DEMO CODE--------------------
'         
'     If Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI") > 5 Then
'         MsgBox "Versione DEMO." & vbNewLine & "In questa versione non e' concesso avere piu' di 5 sintomi!",vbExclamation,"CONECOFOR MOBILE"
'         listsintomiForm.Close
'         Exit sub
'     End If
'             
        
    '------------------END DEMO CODE---------------------
        
    'select first sintomo if any sintomo exists
    If Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI") > 0 Then
        Application.UserProperties("CEF_SELECTED_SINTOMO_POS") = 1
        Application.UserProperties("CEF_SELECTED_SINTOMO_BMK") = CEF_sintomi_bookmark_array(Application.UserProperties("CEF_SELECTED_SINTOMO_POS"),1)
        Application.UserProperties("CEF_SELECTED_SINTOMO_ID") = CEF_sintomi_bookmark_array(Application.UserProperties("CEF_SELECTED_SINTOMO_POS"),2)    
    Else
        Application.UserProperties("CEF_SELECTED_SINTOMO_POS") = 0
        Application.UserProperties("CEF_SELECTED_SINTOMO_BMK") = 0
        Application.UserProperties("CEF_SELECTED_SINTOMO_ID") = 0 
    End If
    Application.UserProperties("LSFORM_ONLOAD") = vbTrue
    ls1Page.Activate
End Sub


Private Sub CEF_update_CEF_sintomi_bookmark_array()

    'create bookmark piante array
    Dim lBookmark,find_string,n_sintomi
    find_string = "["&CEF_SINTOMI_FIELD_IDPIANTA&"] = "&Application.UserProperties("CEF_SELECTED_PIANTA_ID") & " AND ["&CEF_SINTOMI_FIELD_IDAREA&"] = """&Application.UserProperties("CEF_SELECTED_AREA_ID") & """"
    n_sintomi = 0
    If CEF_SintomiRS.RecordCount = 0 Then
        Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI") = 0
        Exit Sub
    End If
    CEF_SintomiRS.MoveFirst
    lBookmark = CEF_SintomiRS.Find(find_string)
    Do While (lBookmark>0)
        n_sintomi = n_sintomi+1
        lBookmark = CEF_SintomiRS.Find(find_string,,lBookmark)
    Loop
    Dim CEF_sintomi_bookmark_array_tmp()
    ReDim CEF_sintomi_bookmark_array_tmp(n_sintomi,2)
    
    n_sintomi=0
    CEF_SintomiRS.MoveFirst
    lBookmark = CEF_SintomiRS.Find(find_string)
    Do While (lBookmark>0)
        n_sintomi = n_sintomi+1
        CEF_sintomi_bookmark_array_tmp(n_sintomi,1)=lBookmark
        CEF_sintomi_bookmark_array_tmp(n_sintomi,2)=CEF_SintomiRS(CEF_SINTOMI_FIELD_IDSINTOMO).Value
        lBookmark = CEF_SintomiRS.Find(find_string,,lBookmark)
    Loop
    If Ubound(CEF_sintomi_bookmark_array_tmp,1)>1 Then
        QuickSort CEF_sintomi_bookmark_array_tmp,1,n_sintomi,2
    End If
    
    'reset CEF_sintomi_bookmark_array array
    Dim i,l
    For i = 1 To UBound(CEF_sintomi_bookmark_array,1)
        For l = 1 To UBound(CEF_sintomi_bookmark_array,2)
            CEF_sintomi_bookmark_array(i,l) = 0
        Next    
    Next
    'copy CEF_piante_bookmark_array_tmp in CEF_piante_bookmark_array
    For i = 1 To UBound(CEF_sintomi_bookmark_array_tmp,1)
        For l = 1 To UBound(CEF_sintomi_bookmark_array_tmp,2)
            CEF_sintomi_bookmark_array(i,l) = CEF_sintomi_bookmark_array_tmp(i,l)
        Next
    Next
    'set the npiante value
    Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI") = UBound(CEF_sintomi_bookmark_array_tmp,1)

End Sub

Private Sub CEF_FormLISTSINTOMI_LS1_setactive()
    If Application.UserProperties("LSFORM_ONLOAD") Then
        Dim ls1Page
        Set ls1Page = ThisEvent.Object

        If Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI") > 0 Then
            
            CEF_SintomiRS.Bookmark = Application.UserProperties("CEF_SELECTED_SINTOMO_BMK")
                        
            ls1Page(CEF_FRM_LISTSINTOMI_LS1_EDITID).Text = CEF_SintomiRS(CEF_SINTOMI_FIELD_IDSINTOMO).Value
            
            ls1Page(CEF_FRM_LISTSINTOMI_LS1_BTNPREV).Enabled = true
            ls1Page(CEF_FRM_LISTSINTOMI_LS1_BTNNEXT).Enabled = true
            ls1Page(CEF_FRM_LISTSINTOMI_LS1_BTNPREV10).Enabled = true
            ls1Page(CEF_FRM_LISTSINTOMI_LS1_BTNNEXT10).Enabled = true
            
            ls1Page(CEF_FRM_LISTSINTOMI_LS1_BTNADD).Enabled = true
            ls1Page(CEF_FRM_LISTSINTOMI_LS1_BTNDEL).Enabled = true
    
            'manage buttons for first and last sintomo
            If Application.UserProperties("CEF_SELECTED_SINTOMO_POS") = 1 then
                ls1Page(CEF_FRM_LISTSINTOMI_LS1_BTNPREV).Enabled = false
                ls1Page(CEF_FRM_LISTSINTOMI_LS1_BTNPREV10).Enabled = false
            
            
            End If
   
            If Application.UserProperties("CEF_SELECTED_SINTOMO_POS") = Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI") then
                ls1Page(CEF_FRM_LISTSINTOMI_LS1_BTNNEXT).Enabled = false
                ls1Page(CEF_FRM_LISTSINTOMI_LS1_BTNNEXT10).Enabled = false
            
            End If
            
            'manage plus button for nessun sinstomo e pianta morta
            If (CEF_SintomiRS(CEF_SINTOMI_FIELD_PARTE).Value = "00" Or CEF_SintomiRS(CEF_SINTOMI_FIELD_PARTE).Value = "09" Or CEF_SintomiRS(CEF_SINTOMI_FIELD_PARTE).Value = "04" ) then
                ls1Page(CEF_FRM_LISTSINTOMI_LS1_BTNADD).Enabled = false
            end If
            
            
            ls1Page(CEF_FRM_LISTSINTOMI_LS1_LBLPARTEV).Text = CEF_SintomiRS(CEF_SINTOMI_FIELD_PARTE).Value
            ls1Page(CEF_FRM_LISTSINTOMI_LS1_LBLSINTV).Text = CEF_SintomiRS(CEF_SINTOMI_FIELD_TIPOSINT).Value
            ls1Page(CEF_FRM_LISTSINTOMI_LS1_LBLAGENTEV).Text = CEF_SintomiRS(CEF_SINTOMI_FIELD_AGENTE).Value

            ls1Page(CEF_FRM_LISTSINTOMI_LS1_BTNDATISINTOMO).Enabled = true
            
        Else
            ls1Page(CEF_FRM_LISTSINTOMI_LS1_EDITID).Text = "NO SINTOMO"
            ls1Page(CEF_FRM_LISTSINTOMI_LS1_BTNPREV).Enabled = false
            ls1Page(CEF_FRM_LISTSINTOMI_LS1_BTNNEXT).Enabled = false
            ls1Page(CEF_FRM_LISTSINTOMI_LS1_BTNPREV10).Enabled = false
            ls1Page(CEF_FRM_LISTSINTOMI_LS1_BTNNEXT10).Enabled = false
            
            ls1Page(CEF_FRM_LISTSINTOMI_LS1_BTNADD).Enabled = true
            ls1Page(CEF_FRM_LISTSINTOMI_LS1_BTNDEL).Enabled = false
            
            ls1Page(CEF_FRM_LISTSINTOMI_LS1_LBLPARTEV).Text = ""
            ls1Page(CEF_FRM_LISTSINTOMI_LS1_LBLSINTV).Text = ""
            ls1Page(CEF_FRM_LISTSINTOMI_LS1_LBLAGENTEV).Text = ""
            
            ls1Page(CEF_FRM_LISTSINTOMI_LS1_BTNDATISINTOMO).Enabled = false
            
            
        End If
    End If
End Sub

Private Sub CEF_FormLISTSINTOMI_LS1_onvalidate()
    If (Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI")=0) Then
        Dim answer,text
        text = "Nessun sintomo inserito!"& vbNewline &"Vuoi inserire il sintomo 00 - nessun sintomo ?"
        
        answer = MsgBox (text,vbYesNoCancel,"CONECOFOR MOBILE")
        If answer = vbYes Then
        
            'set sintomo 00
            CEF_SintomiRS.AddNew

            
            CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_IDAREA).Value = Application.UserProperties("CEF_SELECTED_AREA_ID")
            CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_IDPIANTA).Value = Application.UserProperties("CEF_SELECTED_PIANTA_ID")
            CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_IDSINTOMO).Value = 1
            CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_PARTE).Value = "00"
                
            'Update the new record of the new shapefile to save the changes
            CEF_SintomiRS.Update
            CEF_SintomiRS.Pack
            'update bookmark piante array
            Call CEF_update_CEF_sintomi_bookmark_array
 
            MsgBox "Inserito sintomo 00 !"
            ThisEvent.Result = True
        ElseIf answer = vbCancel Then
            ThisEvent.Result = False
        Else
            ThisEvent.Result = True
        End If
    End If
End Sub

Private Sub CEF_FormLISTSINTOMI_LS1_onquerycancel()
    If (Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI")=0) Then
        Dim answer,text
        text = "Nessun sintomo inserito!"& vbNewline &"Vuoi inserire il sintomo 00 - nessun sintomo ?"
        
        answer = MsgBox (text,vbYesNoCancel,"CONECOFOR MOBILE")
        If answer = vbYes Then
        
            'set sintomo 00
            CEF_SintomiRS.AddNew

            
            CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_IDAREA).Value = Application.UserProperties("CEF_SELECTED_AREA_ID")
            CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_IDPIANTA).Value = Application.UserProperties("CEF_SELECTED_PIANTA_ID")
            CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_IDSINTOMO).Value = 1
            CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_PARTE).Value = "00"
                
            'Update the new record of the new shapefile to save the changes
            CEF_SintomiRS.Update
            CEF_SintomiRS.Pack
            'update bookmark piante array
            Call CEF_update_CEF_sintomi_bookmark_array
 
            MsgBox "Inserito sintomo 00 !"
            ThisEvent.Result = True
        ElseIf answer = vbCancel Then
            ThisEvent.Result = False
        Else
            ThisEvent.Result = True
        End If
    End If
End Sub


Private Sub CEF_FormLISTSINTOMI_BtnPREV_click()
    Application.UserProperties("CEF_SELECTED_SINTOMO_POS") = Application.UserProperties("CEF_SELECTED_SINTOMO_POS")-1
    Application.UserProperties("CEF_SELECTED_SINTOMO_BMK") = CEF_sintomi_bookmark_array(Application.UserProperties("CEF_SELECTED_SINTOMO_POS"),1)
    Application.UserProperties("CEF_SELECTED_SINTOMO_ID") = CEF_sintomi_bookmark_array(Application.UserProperties("CEF_SELECTED_SINTOMO_POS"),2)
    Dim ls1Page
    Set ls1Page = ThisEvent.Object.Parent
    ls1Page.Activate
End Sub

Private Sub CEF_FormLISTSINTOMI_BtnPREV10_click()
    Dim new_pos
    If Application.UserProperties("CEF_SELECTED_SINTOMO_POS") <= 10 Then
        new_pos = 1
    Else
        new_pos = Application.UserProperties("CEF_SELECTED_SINTOMO_POS")-10
    End If
    Application.UserProperties("CEF_SELECTED_SINTOMO_POS") = new_pos
    Application.UserProperties("CEF_SELECTED_SINTOMO_BMK") = CEF_sintomi_bookmark_array(Application.UserProperties("CEF_SELECTED_SINTOMO_POS"),1)
    Application.UserProperties("CEF_SELECTED_SINTOMO_ID") = CEF_sintomi_bookmark_array(Application.UserProperties("CEF_SELECTED_SINTOMO_POS"),2)
    Dim ls1Page
    Set ls1Page = ThisEvent.Object.Parent
    ls1Page.Activate
End Sub

Private Sub CEF_FormLISTSINTOMI_BtnNEXT_click()
    Application.UserProperties("CEF_SELECTED_SINTOMO_POS") = Application.UserProperties("CEF_SELECTED_SINTOMO_POS")+1
    Application.UserProperties("CEF_SELECTED_SINTOMO_BMK") = CEF_sintomi_bookmark_array(Application.UserProperties("CEF_SELECTED_SINTOMO_POS"),1)
    Application.UserProperties("CEF_SELECTED_SINTOMO_ID") = CEF_sintomi_bookmark_array(Application.UserProperties("CEF_SELECTED_SINTOMO_POS"),2)
    Dim ls1Page
    Set ls1Page = ThisEvent.Object.Parent
    ls1Page.Activate
End Sub

Private Sub CEF_FormLISTSINTOMI_BtnNEXT10_click()
    Dim new_pos
    If Application.UserProperties("CEF_SELECTED_SINTOMO_POS") >= (Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI") - 10) Then
        new_pos = Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI")
    Else
        new_pos = Application.UserProperties("CEF_SELECTED_SINTOMO_POS")+10
    End If
    Application.UserProperties("CEF_SELECTED_SINTOMO_POS") = new_pos
    Application.UserProperties("CEF_SELECTED_SINTOMO_BMK") = CEF_sintomi_bookmark_array(Application.UserProperties("CEF_SELECTED_SINTOMO_POS"),1)
    Application.UserProperties("CEF_SELECTED_SINTOMO_ID") = CEF_sintomi_bookmark_array(Application.UserProperties("CEF_SELECTED_SINTOMO_POS"),2)
    Dim ls1Page
    Set ls1Page = ThisEvent.Object.Parent
    ls1Page.Activate
End Sub

Private Sub CEF_FormLISTSINTOMI_BtnPLUS_click()
    Dim ls1Page,lsForm
    Set ls1Page = ThisEvent.Object.Parent
    Set lsForm = ls1Page.parent
    
    '------------------START DEMO CODE--------------------
        
'     If Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI") > 4 Then
'         MsgBox "Versione DEMO." & vbNewLine & "In questa versione non e' concesso inserire piu' di 5 sintomi!",vbExclamation,"CONECOFOR MOBILE"
'         Exit sub
'     End If
            
    '------------------END DEMO CODE---------------------
    
    Dim appApplets, CEF_Applet
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
    
    Dim traspar_val
    If StrComp(CEF_PianteRS(CEF_PIANTE_FIELD_TRASPAR),"")=0 Then
        traspar_val = -1
    else
        traspar_val = Clng(CEF_PianteRS(CEF_PIANTE_FIELD_TRASPAR))
    end if
    
    If traspar_val = 0 and Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI") > 0 Then
        MsgBox "Si puo' inserire un solo sintomo per pianta con nessuna trasparenza (Trasp. = 0%)!",vbExclamation,"CONECOFOR MOBILE"
        Exit Sub
    End If
    
    If traspar_val = 100 and Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI") > 0 Then
        MsgBox "Si puo' inserire un solo sintomo per pianta morta (Trasp. = 100%)!",vbExclamation,"CONECOFOR MOBILE"
        Exit Sub
    End If
    
    Application.UserProperties("CEF_DATISINTOMO_NEW") = vbTrue
    
    Application.UserProperties("CEF_DATISINTOMO_ID") = CEF_sintomi_bookmark_array(Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI"),2)+1  
    Application.UserProperties("CEF_DATISINTOMO_PARTE") = ""
    Application.UserProperties("CEF_DATISINTOMO_TIPOSINT") = ""
    Application.UserProperties("CEF_DATISINTOMO_ETADANNO") = ""
    Application.UserProperties("CEF_DATISINTOMO_AGENTE") = ""
    Application.UserProperties("CEF_DATISINTOMO_AG_NOME") = ""
    Application.UserProperties("CEF_DATISINTOMO_CHIOMA_V") = ""
    Application.UserProperties("CEF_DATISINTOMO_AG_DIFF") = ""
    Application.UserProperties("CEF_DATISINTOMO_NOTE") = ""
    
    
    Dim OKbutton_click
    OKbutton_click = CEF_Applet.Forms(CEF_FRM_DATISINTOMO).Show
    
    If OKbutton_click Then

        CEF_SintomiRS.AddNew

        'copy over all the attribute values to the new record of the new shapefile

        CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_IDAREA).Value = Application.UserProperties("CEF_SELECTED_AREA_ID")
        CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_IDPIANTA).Value = Application.UserProperties("CEF_SELECTED_PIANTA_ID")
        CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_IDSINTOMO).Value = Application.UserProperties("CEF_DATISINTOMO_ID")
        CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_PARTE).Value = Application.UserProperties("CEF_DATISINTOMO_PARTE")
        CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_TIPOSINT).Value = Application.UserProperties("CEF_DATISINTOMO_TIPOSINT")
        CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_ETADANNO).Value = Application.UserProperties("CEF_DATISINTOMO_ETADANNO")
        CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_AGENTE).Value = Application.UserProperties("CEF_DATISINTOMO_AGENTE")
        CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_AG_NOME).Value = Application.UserProperties("CEF_DATISINTOMO_AG_NOME")
        CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_CHIOMA_V).Value = Application.UserProperties("CEF_DATISINTOMO_CHIOMA_V")
        CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_AG_DIFF).Value = Application.UserProperties("CEF_DATISINTOMO_AG_DIFF")
        CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_NOTE).Value = Application.UserProperties("CEF_DATISINTOMO_NOTE")
        
        'Update the new record of the new shapefile to save the changes
        CEF_SintomiRS.Update
        CEF_SintomiRS.Pack
        'update bookmark piante array
        Call CEF_update_CEF_sintomi_bookmark_array
        
        'go to new sintomo
        Dim i,pos
        pos=0
        For i=1 to Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI")
            If CEF_sintomi_bookmark_array(i,2)=Application.UserProperties("CEF_DATISINTOMO_ID") Then
                pos=i
                Exit For
            End If
        Next
        Application.UserProperties("CEF_SELECTED_SINTOMO_POS") = pos
        Application.UserProperties("CEF_SELECTED_SINTOMO_BMK") = CEF_sintomi_bookmark_array(Application.UserProperties("CEF_SELECTED_SINTOMO_POS"),1)
        Application.UserProperties("CEF_SELECTED_SINTOMO_ID") = CEF_sintomi_bookmark_array(Application.UserProperties("CEF_SELECTED_SINTOMO_POS"),2)
        
        
    End If
    Application.UserProperties("CEF_DATISINTOMO_NEW") = vbFalse 
    ls1Page.Activate 
End Sub

Private Sub CEF_FormLISTSINTOMI_BtnMINUS_click()
    Dim ls1Page
    Set ls1Page = ThisEvent.Object.Parent
     
    
    Dim OKbutton_click,message
    message = "Confermi cancellazione sintomo "&Application.UserProperties("CEF_SELECTED_SINTOMO_ID")&"?"
    OKbutton_click = MsgBox (message,vBOkCancel,"CONECOFOR MOBILE")
    
    If OKbutton_click = vbOk Then
        
        CEF_SintomiRS.Delete
        CEF_SintomiRS.Update
        CEF_SintomiRS.Pack
        
        'update bookmark piante array
        Call CEF_update_CEF_sintomi_bookmark_array
        
        If Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI") > 0 Then
            Application.UserProperties("CEF_SELECTED_SINTOMO_POS") = Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI")
            Application.UserProperties("CEF_SELECTED_SINTOMO_BMK") = CEF_sintomi_bookmark_array(Application.UserProperties("CEF_SELECTED_SINTOMO_POS"),1)
            Application.UserProperties("CEF_SELECTED_SINTOMO_ID") = CEF_sintomi_bookmark_array(Application.UserProperties("CEF_SELECTED_SINTOMO_POS"),2)
        Else
            Application.UserProperties("CEF_SELECTED_SINTOMO_POS") = 0
            Application.UserProperties("CEF_SELECTED_SINTOMO_BMK") = 0
            Application.UserProperties("CEF_SELECTED_SINTOMO_ID") = 0 
        End If 
    End If
   
    ls1Page.Activate 

    Set ls1Page = nothing
End Sub


Private Sub CEF_btnDATISINTOMO_Click()
    Dim ls1Page
    Set ls1Page = ThisEvent.Object.Parent

	Dim appApplets, CEF_Applet
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
	Application.UserProperties("CEF_DATISINTOMO_NEW") = vbFalse
    
    Application.UserProperties("CEF_DATISINTOMO_ID") = CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_IDSINTOMO).Value
    Application.UserProperties("CEF_DATISINTOMO_PARTE") = CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_PARTE).Value 
    Application.UserProperties("CEF_DATISINTOMO_TIPOSINT") = CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_TIPOSINT).Value 
    Application.UserProperties("CEF_DATISINTOMO_ETADANNO") = CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_ETADANNO).Value 
    Application.UserProperties("CEF_DATISINTOMO_AGENTE") = CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_AGENTE).Value 
    Application.UserProperties("CEF_DATISINTOMO_AG_NOME")= CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_AG_NOME).Value 
    Application.UserProperties("CEF_DATISINTOMO_CHIOMA_V")= CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_CHIOMA_V).Value 
    Application.UserProperties("CEF_DATISINTOMO_AG_DIFF") = CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_AG_DIFF).Value 
    Application.UserProperties("CEF_DATISINTOMO_NOTE") = CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_NOTE).Value 

    If CEF_Applet.Forms(CEF_FRM_DATISINTOMO).Show Then

        'copy over all the attribute values to the new record of the new shapefile

        'CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_IDAREA).Value = Application.UserProperties("CEF_SELECTED_AREA_ID")
        'CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_IDPIANTA).Value = Application.UserProperties("CEF_SELECTED_PIANTA_ID")
        'CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_IDSINTOMO).Value = Application.UserProperties("CEF_DATISINTOMO_ID")
        
        CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_PARTE).Value = Application.UserProperties("CEF_DATISINTOMO_PARTE")
        CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_TIPOSINT).Value = Application.UserProperties("CEF_DATISINTOMO_TIPOSINT")
        CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_ETADANNO).Value = Application.UserProperties("CEF_DATISINTOMO_ETADANNO")
        CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_AGENTE).Value = Application.UserProperties("CEF_DATISINTOMO_AGENTE")
        CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_AG_NOME).Value = Application.UserProperties("CEF_DATISINTOMO_AG_NOME")
        CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_CHIOMA_V).Value = Application.UserProperties("CEF_DATISINTOMO_CHIOMA_V")
        CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_AG_DIFF).Value = Application.UserProperties("CEF_DATISINTOMO_AG_DIFF")
        CEF_SintomiRS.Fields(CEF_SINTOMI_FIELD_NOTE).Value = Application.UserProperties("CEF_DATISINTOMO_NOTE")
        
        'Update the new record of the new shapefile to save the changes
        CEF_SintomiRS.Update
        CEF_SintomiRS.Pack
         
    End If
   
    ls1Page.Activate 

End Sub

Private Sub CEF_FormDATISINTOMO_onload()
    Dim dsForm,pPage,find_String
    Set dsForm = ThisEvent.Object
    
    dsForm.Caption = "SINTOMO " & Application.UserProperties("CEF_DATISINTOMO_ID")
    
    Set pPage = dsForm(CEF_FRM_DATISINTOMO_DS1)
    pPage.Activate
    
    Dim traspar_val 
    If StrComp(CEF_PianteRS(CEF_PIANTE_FIELD_TRASPAR),"")=0 Then
        traspar_val = -1
    else
        traspar_val = Clng(CEF_PianteRS(CEF_PIANTE_FIELD_TRASPAR))
    end if
    
    'Page DS1
    
    'Parte Id
    If traspar_val = 0 Then
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text = "00"
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Enabled = false
    ElseIf traspar_val = 100 Then
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text = "04"
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Enabled = false
    Else
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Enabled = false
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text = Application.UserProperties("CEF_DATISINTOMO_PARTE")
    End If
    'Parte Text
    If traspar_val = 0 Then
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTETEXT).Text = "Nessun sintomo su qualsiasi parte della pianta"
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTETEXT).Enabled = false
    ElseIf traspar_val = 100 Then
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTETEXT).Text = "Pianta morta"        
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTETEXT).Enabled = false
    Else
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTETEXT).Enabled = false
        If StrComp(Application.UserProperties("CEF_DATISINTOMO_PARTE"),"") = 0 then
            pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTETEXT).Text = ""
        Else
            find_String = "[TABELLA]=""PARTE"" AND [ID]= """ & Application.UserProperties("CEF_DATISINTOMO_PARTE") & """"
            CEF_TabdecRS.Find(find_String)
            pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTETEXT).Text = CEF_TabdecRS("TEXT").Value
        End If
    End If
    'Parte Btn
    If traspar_val = 0 Or traspar_val = 100 Then
        pPage(CEF_FRM_DATISINTOMO_DS1_BtnPARTE).Enabled = false
    Else
        pPage(CEF_FRM_DATISINTOMO_DS1_BtnPARTE).Enabled = true
    End If
    'Sint Id
    If traspar_val = 0 Or traspar_val = 100  Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "00" Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "09" Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "04" Then
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITSINTID).Text = ""
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITSINTID).Enabled = false
    Else
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITSINTID).Enabled = false
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITSINTID).Text = Application.UserProperties("CEF_DATISINTOMO_TIPOSINT")
    End If
    'Sint Text
    If traspar_val = 0 Or traspar_val = 100  Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "00" Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "09" Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "04" Then
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITSINTTEXT).Text = ""        
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITSINTTEXT).Enabled = false
    Else
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITSINTTEXT).Enabled = false
        If StrComp(Application.UserProperties("CEF_DATISINTOMO_TIPOSINT"),"") = 0 then
            pPage(CEF_FRM_DATISINTOMO_DS1_EDITSINTTEXT).Text = ""
        Else
            find_String = "[TABELLA]=""SINTOMO"" AND [ID]= """ & Application.UserProperties("CEF_DATISINTOMO_TIPOSINT") & """"
            CEF_TabdecRS.Find(find_String)
            pPage(CEF_FRM_DATISINTOMO_DS1_EDITSINTTEXT).Text = CEF_TabdecRS("TEXT").Value
        End If
    End If
    'Sint Btn
    If traspar_val = 0 Or traspar_val = 100  Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "00" Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "09" Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "04" Then
        pPage(CEF_FRM_DATISINTOMO_DS1_BtnSINT).Enabled = false
    Else
        pPage(CEF_FRM_DATISINTOMO_DS1_BtnSINT).Enabled = true
    End If
    'Eta'
    If traspar_val = 0  Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "00" Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "09" Then
        pPage(CEF_FRM_DATISINTOMO_DS1_COMBOETA).ListIndex = -1
        pPage(CEF_FRM_DATISINTOMO_DS1_COMBOETA).Enabled = false
    ElseIf traspar_val = 100 Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "04" Then
        pPage(CEF_FRM_DATISINTOMO_DS1_COMBOETA).ListIndex = 0
        pPage(CEF_FRM_DATISINTOMO_DS1_COMBOETA).Enabled = false
    Else
        pPage(CEF_FRM_DATISINTOMO_DS1_COMBOETA).Enabled = true
        if StrComp(Application.UserProperties("CEF_DATISINTOMO_ETADANNO"),"") = 0 then
            pPage(CEF_FRM_DATISINTOMO_DS1_COMBOETA).ListIndex = -1
        else
            pPage(CEF_FRM_DATISINTOMO_DS1_COMBOETA).ListIndex = ComboFind(pPage(CEF_FRM_DATISINTOMO_DS1_COMBOETA),Application.UserProperties("CEF_DATISINTOMO_ETADANNO"))
        end if
    End If

    'Page DS2
    Set pPage = dsForm(CEF_FRM_DATISINTOMO_DS2)
    pPage.Activate
    
    'Agente ID
    If traspar_val = 0  Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "00" Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "09" Then
        pPage(CEF_FRM_DATISINTOMO_DS2_EDITAGENTEID).Text = ""
        pPage(CEF_FRM_DATISINTOMO_DS2_EDITAGENTEID).Enabled = false
    Else
        pPage(CEF_FRM_DATISINTOMO_DS2_EDITAGENTEID).Enabled = false
        pPage(CEF_FRM_DATISINTOMO_DS2_EDITAGENTEID).Text = Application.UserProperties("CEF_DATISINTOMO_AGENTE")
    End If
    'Agente Text
    If traspar_val = 0  Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "00" Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "09" Then
        pPage(CEF_FRM_DATISINTOMO_DS2_EDITAGENTETEXT).Text = ""        
        pPage(CEF_FRM_DATISINTOMO_DS2_EDITAGENTETEXT).Enabled = false
    Else
        pPage(CEF_FRM_DATISINTOMO_DS2_EDITAGENTETEXT).Enabled = false
        If StrComp(Application.UserProperties("CEF_DATISINTOMO_AGENTE"),"") = 0 then
            pPage(CEF_FRM_DATISINTOMO_DS2_EDITAGENTETEXT).Text = ""
        Else
            find_String = "[TABELLA]=""AGENTE"" AND [ID]= """ & Application.UserProperties("CEF_DATISINTOMO_AGENTE") & """"
            CEF_TabdecRS.Find(find_String)
            pPage(CEF_FRM_DATISINTOMO_DS2_EDITAGENTETEXT).Text = CEF_TabdecRS("TEXT").Value
        End If
    End If
    'Agente Btn
    If traspar_val = 0  Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "00" Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "09" Then
        pPage(CEF_FRM_DATISINTOMO_DS2_BtnAGENTE).Enabled = false
    Else
        pPage(CEF_FRM_DATISINTOMO_DS2_BtnAGENTE).Enabled = true
    End If
    'NomeAgente ID
    If traspar_val = 0  Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "00" Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "09" Then
        pPage(CEF_FRM_DATISINTOMO_DS2_EDITNOMEAGENTEID).Text = ""
        pPage(CEF_FRM_DATISINTOMO_DS2_EDITNOMEAGENTEID).Enabled = false
    Else
        pPage(CEF_FRM_DATISINTOMO_DS2_EDITNOMEAGENTEID).Enabled = false
        pPage(CEF_FRM_DATISINTOMO_DS2_EDITNOMEAGENTEID).Text = Application.UserProperties("CEF_DATISINTOMO_AG_NOME")
    End If
    'NomeAgente Btn
    If traspar_val = 0  Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "00" Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "09" Then
        pPage(CEF_FRM_DATISINTOMO_DS2_BtnNOMEAGENTE).Enabled = false
    Else
        pPage(CEF_FRM_DATISINTOMO_DS2_BtnNOMEAGENTE).Enabled = true
    End If
    'Chioma
    If traspar_val = 0 Or traspar_val = 100 Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "00" Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "09" Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "04" Or Application.UserProperties("CEF_DATISINTOMO_TIPOSINT") = "10" Or Application.UserProperties("CEF_DATISINTOMO_TIPOSINT") = "11" Or Application.UserProperties("CEF_DATISINTOMO_TIPOSINT") = "12"  Or Application.UserProperties("CEF_DATISINTOMO_TIPOSINT") = "21" Or Application.UserProperties("CEF_DATISINTOMO_TIPOSINT") = "22" Then
        pPage(CEF_FRM_DATISINTOMO_DS2_COMBOCHIOMAVAL).ListIndex = -1
        pPage(CEF_FRM_DATISINTOMO_DS2_COMBOCHIOMAVAL).Enabled = false
    Else
        pPage(CEF_FRM_DATISINTOMO_DS2_COMBOCHIOMAVAL).Enabled = true
        if StrComp(Application.UserProperties("CEF_DATISINTOMO_CHIOMA_V"),"") = 0 then
            pPage(CEF_FRM_DATISINTOMO_DS2_COMBOCHIOMAVAL).ListIndex = -1
        else
            pPage(CEF_FRM_DATISINTOMO_DS2_COMBOCHIOMAVAL).ListIndex = ComboFind(pPage(CEF_FRM_DATISINTOMO_DS2_COMBOCHIOMAVAL),Application.UserProperties("CEF_DATISINTOMO_CHIOMA_V"))
        end if
    End If
    'Diffusione
    If traspar_val = 0 Or traspar_val = 100 Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "00" Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "09" Or Application.UserProperties("CEF_DATISINTOMO_PARTE") = "04" Or Application.UserProperties("CEF_DATISINTOMO_TIPOSINT") = "10" Or Application.UserProperties("CEF_DATISINTOMO_TIPOSINT") = "11" Or Application.UserProperties("CEF_DATISINTOMO_TIPOSINT") = "12"  Or Application.UserProperties("CEF_DATISINTOMO_TIPOSINT") = "21" Or Application.UserProperties("CEF_DATISINTOMO_TIPOSINT") = "22" Or Application.UserProperties("CEF_DATISINTOMO_CHIOMA_V") = "1" Then
        pPage(CEF_FRM_DATISINTOMO_DS2_COMBODIFF).ListIndex = -1
        pPage(CEF_FRM_DATISINTOMO_DS2_COMBODIFF).Enabled = false
    Else
        pPage(CEF_FRM_DATISINTOMO_DS2_COMBODIFF).Enabled = true
        if StrComp(Application.UserProperties("CEF_DATISINTOMO_AG_DIFF"),"") = 0 then
            pPage(CEF_FRM_DATISINTOMO_DS2_COMBODIFF).ListIndex = -1
        else
            pPage(CEF_FRM_DATISINTOMO_DS2_COMBODIFF).ListIndex = ComboFind(pPage(CEF_FRM_DATISINTOMO_DS2_COMBODIFF),Application.UserProperties("CEF_DATISINTOMO_AG_DIFF"))
        end if
    End If

    'Page DS3
    Set pPage = dsForm(CEF_FRM_DATISINTOMO_DS3)
    pPage.Activate
    pPage(CEF_FRM_DATISINTOMO_DS3_EDITNOTE).Text = Application.UserProperties("CEF_DATISINTOMO_NOTE")
    
    Set pPage = dsForm(CEF_FRM_DATISINTOMO_DS1)
    pPage.Activate   
End Sub


Private Sub CEF_FormDATISINTOMO_BtnPARTE_Click()
    Dim button,pPage
    Set button = ThisEvent.Object
    Set pPage = button.parent
    If CInt(CEF_PianteRS(CEF_PIANTE_FIELD_SPECIE)) < 100 Then
        Application.UserProperties("LIST_FILTER") = "[TABELLA] = ""PARTE""  AND ([ID]=""00"" OR [ID]=""04"" OR [ID]=""09"" OR [ID]=""14"" OR [ID]=""21"" OR [ID]=""22"" OR [ID]=""23"" OR [ID]=""24"" OR [ID]=""25"" OR [ID]=""26"" OR [ID]=""27"" OR [ID]=""31"" OR [ID]=""32"" OR [ID]=""33"" OR [ID]=""34"")"
    Else
        Application.UserProperties("LIST_FILTER") = "[TABELLA] = ""PARTE""  AND ([ID]=""00"" OR [ID]=""04"" OR [ID]=""09"" OR [ID]=""11"" OR [ID]=""12"" OR [ID]=""13"" OR [ID]=""21"" OR [ID]=""22"" OR [ID]=""23"" OR [ID]=""24"" OR [ID]=""25"" OR [ID]=""26"" OR [ID]=""27"" OR [ID]=""31"" OR [ID]=""32"" OR [ID]=""33"" OR [ID]=""34"")"
    End If
    Application.UserProperties("LIST_FIELD_ID") = "ID"
    Application.UserProperties("LIST_FIELD_TEXT") = "TEXT"
    Dim appApplets, CEF_Applet
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
	If CEF_Applet.Forms("FrmLISTBOX").Show Then
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text = Application.UserProperties("FrmLISTBOX_RESULT_V")
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTETEXT).Text = Application.UserProperties("FrmLISTBOX_RESULT_T")
        
        
    End If
End Sub

Private Sub CEF_FormDATISINTOMO_DS1_EditPARTEID_onchange()
    Dim control,pPage,dsForm
    Set control = ThisEvent.Object
    Set pPage = control.parent
    Set dsForm = pPage.parent
    If pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text = "00" Or pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text = "09" Then      
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITSINTID).Text = ""
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITSINTTEXT).Text = ""
        pPage(CEF_FRM_DATISINTOMO_DS1_BtnSINT).Enabled = false
        pPage(CEF_FRM_DATISINTOMO_DS1_COMBOETA).ListIndex = -1
        pPage(CEF_FRM_DATISINTOMO_DS1_COMBOETA).Enabled = false
        Set pPage = dsForm(CEF_FRM_DATISINTOMO_DS2)
        pPage.Activate
        pPage(CEF_FRM_DATISINTOMO_DS2_EDITAGENTEID).Text = ""
        pPage(CEF_FRM_DATISINTOMO_DS2_EDITAGENTETEXT).Text = ""
        pPage(CEF_FRM_DATISINTOMO_DS2_BtnAGENTE).Enabled = false
        pPage(CEF_FRM_DATISINTOMO_DS2_EDITNOMEAGENTEID).Text = ""
        pPage(CEF_FRM_DATISINTOMO_DS2_BtnNOMEAGENTE).Enabled = false
        pPage(CEF_FRM_DATISINTOMO_DS2_COMBOCHIOMAVAL).ListIndex = -1
        pPage(CEF_FRM_DATISINTOMO_DS2_COMBOCHIOMAVAL).Enabled = false
        pPage(CEF_FRM_DATISINTOMO_DS2_COMBODIFF).ListIndex = -1
        pPage(CEF_FRM_DATISINTOMO_DS2_COMBODIFF).Enabled = false
     ElseIf   pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text = "04" Then      
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITSINTID).Text = ""
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITSINTTEXT).Text = ""
        pPage(CEF_FRM_DATISINTOMO_DS1_BtnSINT).Enabled = false
        pPage(CEF_FRM_DATISINTOMO_DS1_COMBOETA).ListIndex = 0
        pPage(CEF_FRM_DATISINTOMO_DS1_COMBOETA).Enabled = false
        Set pPage = dsForm(CEF_FRM_DATISINTOMO_DS2)
        pPage.Activate
        pPage(CEF_FRM_DATISINTOMO_DS2_BtnAGENTE).Enabled = true
        pPage(CEF_FRM_DATISINTOMO_DS2_BtnNOMEAGENTE).Enabled = true
        pPage(CEF_FRM_DATISINTOMO_DS2_COMBOCHIOMAVAL).ListIndex = -1
        pPage(CEF_FRM_DATISINTOMO_DS2_COMBOCHIOMAVAL).Enabled = false
        pPage(CEF_FRM_DATISINTOMO_DS2_COMBODIFF).ListIndex = -1
        pPage(CEF_FRM_DATISINTOMO_DS2_COMBODIFF).Enabled = false
     Else
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITSINTID).Text = ""
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITSINTTEXT).Text = ""
        pPage(CEF_FRM_DATISINTOMO_DS1_BtnSINT).Enabled = true
        pPage(CEF_FRM_DATISINTOMO_DS1_COMBOETA).Enabled = true
        Set pPage = dsForm(CEF_FRM_DATISINTOMO_DS2)
        pPage.Activate
        pPage(CEF_FRM_DATISINTOMO_DS2_BtnAGENTE).Enabled = true
        pPage(CEF_FRM_DATISINTOMO_DS2_BtnNOMEAGENTE).Enabled = true
        pPage(CEF_FRM_DATISINTOMO_DS2_COMBOCHIOMAVAL).Enabled = true
        pPage(CEF_FRM_DATISINTOMO_DS2_COMBODIFF).Enabled = true
     End If
     Set pPage = dsForm(CEF_FRM_DATISINTOMO_DS1)
     pPage.Activate

End Sub

Private Sub CEF_FormDATISINTOMO_DS1_EditSINTID_onchange()
    Dim control,pPage,dsForm
    Set control = ThisEvent.Object
    Set pPage = control.parent
    Set dsForm = pPage.parent
    If pPage(CEF_FRM_DATISINTOMO_DS1_EDITSINTID).Text = "10" Or pPage(CEF_FRM_DATISINTOMO_DS1_EDITSINTID).Text = "11" Or pPage(CEF_FRM_DATISINTOMO_DS1_EDITSINTID).Text = "12" Or pPage(CEF_FRM_DATISINTOMO_DS1_EDITSINTID).Text = "21" Or pPage(CEF_FRM_DATISINTOMO_DS1_EDITSINTID).Text = "22" Then      
        Set pPage = dsForm(CEF_FRM_DATISINTOMO_DS2)
        pPage.Activate
        pPage(CEF_FRM_DATISINTOMO_DS2_COMBOCHIOMAVAL).ListIndex = -1
        pPage(CEF_FRM_DATISINTOMO_DS2_COMBOCHIOMAVAL).Enabled = false
        pPage(CEF_FRM_DATISINTOMO_DS2_COMBODIFF).ListIndex = -1
        pPage(CEF_FRM_DATISINTOMO_DS2_COMBODIFF).Enabled = false
     Else
        Set pPage = dsForm(CEF_FRM_DATISINTOMO_DS2)
        pPage.Activate
        pPage(CEF_FRM_DATISINTOMO_DS2_COMBOCHIOMAVAL).Enabled = true
        pPage(CEF_FRM_DATISINTOMO_DS2_COMBODIFF).Enabled = true
     End If
     Set pPage = dsForm(CEF_FRM_DATISINTOMO_DS1)
     pPage.Activate

End Sub

Private Sub CEF_FormDATISINTOMO_DS1_EditAGENTEID_onchange()
    Dim control,pPage,pForm,pPageDS1,diff_v
    Set control = ThisEvent.Object
    Set pPage = control.parent
    pPage(CEF_FRM_DATISINTOMO_DS2_EDITNOMEAGENTEID).Value = ""
End Sub

Private Sub CEF_FormDATISINTOMO_DS2_ComboCHIOMAVAL_onselchange()
    Dim control,pPage,pForm,pPageDS1,diff_v
    Set control = ThisEvent.Object
    Set pPage = control.parent
    If control.value = "1" Then
        pPage(CEF_FRM_DATISINTOMO_DS2_COMBODIFF).listindex = -1
        pPage(CEF_FRM_DATISINTOMO_DS2_COMBODIFF).enabled = false
    Else        
        pPage(CEF_FRM_DATISINTOMO_DS2_COMBODIFF).enabled = true
    End If
End Sub

Private Sub CEF_FormDATISINTOMO_DS2_ComboDIFF_onselchange()
    Dim control,pPage,pForm,pPageDS1,diff_v
    Set control = ThisEvent.Object
    Set pPage = control.parent
    Set pForm = pPage.parent
    Set pPageDS1 = pForm(CEF_FRM_DATISINTOMO_DS1)
    diff_v = CInt(control.value)
    
    If pPageDS1(CEF_FRM_DATISINTOMO_DS1_EDITSINTID) = "01" And (pPageDS1(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID) = "11" Or pPageDS1(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID) = "12" Or pPageDS1(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID) = "13" Or pPageDS1(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID) = "14") Then
        If diff_v > CLng(CEF_PianteRS(CEF_PIANTE_FIELD_TRASPAR))Then
            MsgBox "Se ID sintomo = 01 la diffusione non puo' superare la trasparenza!",vbExclamation,"CONECOFOR MOBILE"
            control.listindex = -1
        End If
    End If

End Sub

Private Sub CEF_FormDATISINTOMO_BtnSINT_Click()
    Dim button,pPage,vParte
    Set button = ThisEvent.Object
    Set pPage = button.parent
    vParte = pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text
    If vParte = "" Then
        MsgBox "Si deve prima selezionare una parte!",vbExclamation,"CONECOFOR MOBILE"
        exit sub
    ElseIf (vParte = "11" OR vParte = "12" OR vParte = "13" OR vParte = "14") Then 
        Application.UserProperties("LIST_FILTER") = "[TABELLA] = ""SINTOMO""  AND ([ID]=""01"" OR [ID]=""02"" OR [ID]=""03"" OR [ID]=""04"" OR [ID]=""05"" OR [ID]=""06"" OR [ID]=""07"" OR [ID]=""08"" OR [ID]=""09"" OR [ID]=""10"" OR [ID]=""11"" OR [ID]=""12"")"
    ElseIf (vParte = "21" OR vParte = "22" OR vParte = "23" OR vParte = "24" OR vParte = "25" OR vParte = "26" OR vParte = "27") Then
        Application.UserProperties("LIST_FILTER") = "[TABELLA] = ""SINTOMO""  AND ([ID]=""01"" OR [ID]=""08"" OR [ID]=""09"" OR [ID]=""10"" OR [ID]=""11"" OR [ID]=""12"" OR [ID]=""13"" OR [ID]=""14"" OR [ID]=""15"" OR [ID]=""16"" OR [ID]=""17"" OR [ID]=""18"" OR [ID]=""19"" OR [ID]=""20"" )"
    ElseIf (vParte = "31" OR vParte = "32" OR vParte = "33" OR vParte = "34" ) Then
        Application.UserProperties("LIST_FILTER") = "[TABELLA] = ""SINTOMO""  AND ([ID]=""08"" OR [ID]=""09"" OR [ID]=""10"" OR [ID]=""11"" OR [ID]=""12"" OR [ID]=""13"" OR [ID]=""16"" OR [ID]=""17"" OR [ID]=""18"" OR [ID]=""19"" OR [ID]=""20"" OR [ID]=""21"" OR [ID]=""22"" )"
    
    End If

    Application.UserProperties("LIST_FIELD_ID") = "ID"
    Application.UserProperties("LIST_FIELD_TEXT") = "TEXT"
    Dim appApplets, CEF_Applet
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
	If CEF_Applet.Forms("FrmLISTBOX").Show Then
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITSINTID).Text = Application.UserProperties("FrmLISTBOX_RESULT_V")
        pPage(CEF_FRM_DATISINTOMO_DS1_EDITSINTTEXT).Text = Application.UserProperties("FrmLISTBOX_RESULT_T")
    End If
End Sub

Private Sub CEF_FormDATISINTOMO_BtnAGENTE_Click()
    Dim button,pPage
    Set button = ThisEvent.Object
    Set pPage = button.parent
    Application.UserProperties("LIST_FILTER") = "[TABELLA] = ""AGENTE"""
    Application.UserProperties("LIST_FIELD_ID") = "ID"
    Application.UserProperties("LIST_FIELD_TEXT") = "TEXT"
    Dim appApplets, CEF_Applet
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
    
	If CEF_Applet.Forms("FrmLISTBOX").Show Then
        pPage(CEF_FRM_DATISINTOMO_DS2_EDITAGENTEID).Text = Application.UserProperties("FrmLISTBOX_RESULT_V")
        pPage(CEF_FRM_DATISINTOMO_DS2_EDITAGENTETEXT).Text = Application.UserProperties("FrmLISTBOX_RESULT_T")
        
        'cerca se esiste un solo nome agente per l'agente selezionato ed eventualmnte lo imposta
        Dim lBookmark,find_string,n_nomeagenti,nomeagente
        find_string = "[FIDAGENTE] = """ & Application.UserProperties("FrmLISTBOX_RESULT_V") & """"
        n_nomeagenti = 0
        If CEF_TabdecRS.RecordCount = 0 Then
            Exit Sub
        End If
        CEF_TabdecRS.MoveFirst
        lBookmark = CEF_TabdecRS.Find(find_string)
        Do While (lBookmark>0)
            n_nomeagenti = n_nomeagenti+1
            nomeagente = CEF_TabdecRS("TEXT").Value
            lBookmark = CEF_TabdecRS.Find(find_string,,lBookmark)
        Loop
        If(n_nomeagenti=1) Then
            pPage(CEF_FRM_DATISINTOMO_DS2_EDITNOMEAGENTEID).Text = nomeagente
        Else
            pPage(CEF_FRM_DATISINTOMO_DS2_EDITNOMEAGENTEID).Text = ""
        End If
    End If
End Sub

Private Sub CEF_FormDATISINTOMO_BtnNOMEAGENTE_Click()
    Dim button,pPage
    Set button = ThisEvent.Object
    Set pPage = button.parent
    If CInt(CEF_PianteRS(CEF_PIANTE_FIELD_SPECIE)) < 100 Then
        Application.UserProperties("LIST_FILTER") = "[TABELLA] = ""NOMEAGENTE"" AND [FIDAGENTE]=""" & pPage(CEF_FRM_DATISINTOMO_DS2_EDITAGENTEID) & """ AND ([FCLASSEOSP]=""L"" OR [FCLASSEOSP]="""")"
    Else
        Application.UserProperties("LIST_FILTER") = "[TABELLA] = ""NOMEAGENTE"" AND [FIDAGENTE]=""" & pPage(CEF_FRM_DATISINTOMO_DS2_EDITAGENTEID) & """ AND ([FCLASSEOSP]=""C"" OR [FCLASSEOSP]="""")"
    End If
    
    Application.UserProperties("LIST_FIELD_ID") = "ID"
    Application.UserProperties("LIST_FIELD_TEXT") = "TEXT"
    Dim appApplets, CEF_Applet
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
    
	If CEF_Applet.Forms("FrmLISTBOX_NOVALUES").Show Then
        pPage(CEF_FRM_DATISINTOMO_DS2_EDITNOMEAGENTEID).Text = Application.UserProperties("FrmLISTBOX_RESULT_T")
    End If
End Sub


Private Sub CEF_FormDATISINTOMO_DS1_validate()
    Dim pPage
    Set pPage = thisevent.object
    
    Dim traspar_val
    If StrComp(CEF_PianteRS(CEF_PIANTE_FIELD_TRASPAR),"")=0 Then
        traspar_val = -1
    else
        traspar_val = Clng(CEF_PianteRS(CEF_PIANTE_FIELD_TRASPAR))
    end if
    
    'Parte
    If StrComp(pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text,"")=0 Then
        MsgBox "Inserire parte danneggiata!",vbExclamation,"CONECOFOR MOBILE"
        ThisEvent.Result = False
        Exit Sub
    elseif ((pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text="00" Or pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text="09" Or pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text="04") And Application.UserProperties("CEF_DATISINTOMO_NEW") = vbTrue And Application.UserProperties("CEF_LISTSINTOMI_NSINTOMI")>0) Then
        MsgBox "Non si puo' inserire parte " & pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text & ", se e' gia' presente un sintomo!",vbExclamation,"CONECOFOR MOBILE"
        ThisEvent.Result = False
        Exit Sub
    else
        Application.UserProperties("CEF_DATISINTOMO_PARTE") = pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text
    End If
    
    'Tiposint
    If traspar_val = 0 Or traspar_val = 100 Or pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text = "00" Or pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text = "09" Or pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text = "04" Then
        Application.UserProperties("CEF_DATISINTOMO_TIPOSINT") = pPage(CEF_FRM_DATISINTOMO_DS1_EDITSINTID).Text
    Else
        If StrComp(pPage(CEF_FRM_DATISINTOMO_DS1_EDITSINTID).Text,"")=0 Then
            MsgBox "Inserire ID sintomo!",vbExclamation,"CONECOFOR MOBILE"
            ThisEvent.Result = False
            Exit Sub
        else
            Application.UserProperties("CEF_DATISINTOMO_TIPOSINT") = pPage(CEF_FRM_DATISINTOMO_DS1_EDITSINTID).Text
        End If
    End If
    
    'Eta' danno
    If traspar_val = 0 Or pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text = "00" Or pPage(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text = "09" Then
        Application.UserProperties("CEF_DATISINTOMO_ETADANNO") = pPage(CEF_FRM_DATISINTOMO_DS1_COMBOETA).Text
    Else
        if pPage(CEF_FRM_DATISINTOMO_DS1_COMBOETA).ListIndex = -1 then
            MsgBox "Inserire eta' danno!",vbExclamation,"CONECOFOR MOBILE"
            Thisevent.result = false
            Exit sub
        else
            Application.UserProperties("CEF_DATISINTOMO_ETADANNO") = pPage(CEF_FRM_DATISINTOMO_DS1_COMBOETA).Value 
        end if
    End If

End Sub

Private Sub CEF_FormDATISINTOMO_DS2_validate()
    Dim pPage,pForm,pPageDS1
    Set pPage = thisevent.object
    Set pForm = pPage.parent
    Set pPageDS1 = pForm(CEF_FRM_DATISINTOMO_DS1)
     
    Dim traspar_val
    If StrComp(CEF_PianteRS(CEF_PIANTE_FIELD_TRASPAR),"")=0 Then
        traspar_val = -1
    else
        traspar_val = Clng(CEF_PianteRS(CEF_PIANTE_FIELD_TRASPAR))
    end if
    
    'Id agente
    If traspar_val = 0 Or pPageDS1(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text = "00" Or pPageDS1(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text = "09" Then
        Application.UserProperties("CEF_DATISINTOMO_AGENTE") = pPage(CEF_FRM_DATISINTOMO_DS2_EDITAGENTEID).Text
    Else
        If StrComp(pPage(CEF_FRM_DATISINTOMO_DS2_EDITAGENTEID).Text,"")=0 Then
            MsgBox "Inserire ID agente!",vbExclamation,"CONECOFOR MOBILE"
            ThisEvent.Result = False
            Exit Sub
        else
            Application.UserProperties("CEF_DATISINTOMO_AGENTE") = pPage(CEF_FRM_DATISINTOMO_DS2_EDITAGENTEID).Text
        End If
    End If
    
    'Nome agente
    If traspar_val = 0 Or pPageDS1(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text = "00" Or pPageDS1(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text = "09" Then
        Application.UserProperties("CEF_DATISINTOMO_AG_NOME") = pPage(CEF_FRM_DATISINTOMO_DS2_EDITNOMEAGENTEID).Text
    Else
        If StrComp(pPage(CEF_FRM_DATISINTOMO_DS2_EDITNOMEAGENTEID).Text,"")=0 Then
            MsgBox "Inserire nome agente!",vbExclamation,"CONECOFOR MOBILE"
            ThisEvent.Result = False
            Exit Sub
        else
            Application.UserProperties("CEF_DATISINTOMO_AG_NOME") = pPage(CEF_FRM_DATISINTOMO_DS2_EDITNOMEAGENTEID).Text
        End If
    End If
    
    'Chioma
    If traspar_val = 0 Or traspar_val = 100 Or pPageDS1(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text = "00" Or pPageDS1(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text = "09" Or pPageDS1(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text = "04" Or pPageDS1(CEF_FRM_DATISINTOMO_DS1_EDITSINTID).Text = "10" Or pPageDS1(CEF_FRM_DATISINTOMO_DS1_EDITSINTID).Text = "11" Or pPageDS1(CEF_FRM_DATISINTOMO_DS1_EDITSINTID).Text = "12" Or pPageDS1(CEF_FRM_DATISINTOMO_DS1_EDITSINTID).Text = "21" Or pPageDS1(CEF_FRM_DATISINTOMO_DS1_EDITSINTID).Text = "22"   Then
        Application.UserProperties("CEF_DATISINTOMO_CHIOMA_V") = pPage(CEF_FRM_DATISINTOMO_DS2_COMBOCHIOMAVAL).Text
    Else
        if pPage(CEF_FRM_DATISINTOMO_DS2_COMBOCHIOMAVAL).ListIndex = -1 then
            MsgBox "Specificare se chioma non valutabile!",vbExclamation,"CONECOFOR MOBILE"
            Thisevent.result = false
            Exit sub
        else
            Application.UserProperties("CEF_DATISINTOMO_CHIOMA_V") = pPage(CEF_FRM_DATISINTOMO_DS2_COMBOCHIOMAVAL).Value 
        end if
    End If
    
    'Diffusione
    If traspar_val = 0 Or traspar_val = 100 Or pPageDS1(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text = "00" Or pPageDS1(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text = "09" Or pPageDS1(CEF_FRM_DATISINTOMO_DS1_EDITPARTEID).Text = "04" Or pPageDS1(CEF_FRM_DATISINTOMO_DS1_EDITSINTID).Text = "10" Or pPageDS1(CEF_FRM_DATISINTOMO_DS1_EDITSINTID).Text = "11" Or pPageDS1(CEF_FRM_DATISINTOMO_DS1_EDITSINTID).Text = "12"  Or pPageDS1(CEF_FRM_DATISINTOMO_DS1_EDITSINTID).Text = "21" Or pPageDS1(CEF_FRM_DATISINTOMO_DS1_EDITSINTID).Text = "22" Or pPage(CEF_FRM_DATISINTOMO_DS2_COMBOCHIOMAVAL).Value = "1" Then
        Application.UserProperties("CEF_DATISINTOMO_AG_DIFF") = pPage(CEF_FRM_DATISINTOMO_DS2_COMBODIFF).Text
    Else
        if pPage(CEF_FRM_DATISINTOMO_DS2_COMBODIFF).ListIndex = -1 then
            MsgBox "Inserire diffusione!",vbExclamation,"CONECOFOR MOBILE"
            Thisevent.result = false
            Exit sub
        else
            Application.UserProperties("CEF_DATISINTOMO_AG_DIFF") = pPage(CEF_FRM_DATISINTOMO_DS2_COMBODIFF).Value 
        end if
    End If

End Sub

Private Sub CEF_FormDATISINTOMO_DS3_validate()
    Dim pPage
    Set pPage = thisevent.object
    Application.UserProperties("CEF_DATISINTOMO_NOTE") = pPage(CEF_FRM_DATISINTOMO_DS3_EDITNOTE).Text
End Sub


Private Sub CEF_EditNote_Change()
	Dim pCtrl
	Set pCtrl = Thisevent.object
	If Len(pCtrl.value)>254 Then
		pCtrl.value = Left(pCtrl.value,254)
		Call MsgBox("Massimo 254 caratteri nelle note!",0,"CONECOFOR SW")
	End If
End Sub




Private Sub CEF_FormCAV_onload()
    Dim pForm,pPage
    Set pForm = ThisEvent.Object
    pForm.caption = "CAV. AREA " & Application.UserProperties("CEF_SELECTED_AREA_ID")
    Set pPage = pForm.Pages(CEF_FRM_CAV_C1)
 
    
    Call CEF_update_CEF_cav_bookmark_array
    
    
    '------------------START DEMO CODE--------------------
        
'     If Application.UserProperties("CEF_CAV_NCAV") > 10 Then
'         MsgBox "Versione DEMO." & vbNewLine & "In questa versione non e' concesso avere piu' di 10 alberi per il cavallettamento!",vbExclamation,"CONECOFOR MOBILE"
'         pForm.Close
'         Exit sub
'     End If
            
    '------------------END DEMO CODE---------------------
        
    'select first cav if any sintomo exists
    If Application.UserProperties("CEF_CAV_NCAV") > 0 Then
        Application.UserProperties("CEF_SELECTED_CAV_POS") = 1
        Application.UserProperties("CEF_SELECTED_CAV_BMK") = CEF_cav_bookmark_array(Application.UserProperties("CEF_SELECTED_CAV_POS"),1)
        Application.UserProperties("CEF_SELECTED_CAV_ID") = CEF_cav_bookmark_array(Application.UserProperties("CEF_SELECTED_CAV_POS"),2)    
    Else
        Application.UserProperties("CEF_SELECTED_CAV_POS") = 0
        Application.UserProperties("CEF_SELECTED_CAV_BMK") = 0
        Application.UserProperties("CEF_SELECTED_CAV_ID") = 0 
    End If
    Application.UserProperties("CAVFORM_ONLOAD") = vbTrue
    pPage.Activate
End Sub

Private Sub CEF_update_CEF_cav_bookmark_array()

    'create bookmark piante array
    Dim lBookmark,find_string,n_cav
    find_string =  "["&CEF_CAV_FIELD_IDAREA&"] = """&Application.UserProperties("CEF_SELECTED_AREA_ID") & """"
    n_cav = 0
    If CEF_CavRS.RecordCount = 0 Then
        Application.UserProperties("CEF_CAV_NCAV") = 0
        Exit Sub
    End If
    CEF_CavRS.MoveFirst
    lBookmark = CEF_CavRS.Find(find_string)
    Do While (lBookmark>0)
        n_cav = n_cav+1
        lBookmark = CEF_CavRS.Find(find_string,,lBookmark)
    Loop
    Dim CEF_cav_bookmark_array_tmp()
    ReDim CEF_cav_bookmark_array_tmp(n_cav,2)
    
    n_cav=0
    CEF_CavRS.MoveFirst
    lBookmark = CEF_CavRS.Find(find_string)
    Do While (lBookmark>0)
        n_cav = n_cav+1
        CEF_cav_bookmark_array_tmp(n_cav,1)=lBookmark
        CEF_cav_bookmark_array_tmp(n_cav,2)=CEF_CavRS(CEF_CAV_FIELD_IDPIANTA).Value
        lBookmark = CEF_CavRS.Find(find_string,,lBookmark)
    Loop
    If Ubound(CEF_cav_bookmark_array_tmp,1)>1 Then
        QuickSort CEF_cav_bookmark_array_tmp,1,n_cav,2
    End If
    
    'reset CEF_cav_bookmark_array array
    Dim i,l
    For i = 1 To UBound(CEF_cav_bookmark_array,1)
        For l = 1 To UBound(CEF_cav_bookmark_array,2)
            CEF_cav_bookmark_array(i,l) = 0
        Next    
    Next
    'copy CEF_piante_bookmark_array_tmp in CEF_piante_bookmark_array
    For i = 1 To UBound(CEF_cav_bookmark_array_tmp,1)
        For l = 1 To UBound(CEF_cav_bookmark_array_tmp,2)
            CEF_cav_bookmark_array(i,l) = CEF_cav_bookmark_array_tmp(i,l)
        Next
    Next
    'set the ncav value
    Application.UserProperties("CEF_CAV_NCAV") = UBound(CEF_cav_bookmark_array_tmp,1)

End Sub

Private Sub CEF_FormCAV_C1_setactive()
        If Application.UserProperties("CAVFORM_ONLOAD") Then
        Dim pPage
        Set pPage = ThisEvent.Object

        If Application.UserProperties("CEF_CAV_NCAV") > 0 Then
            
            CEF_CavRS.Bookmark = Application.UserProperties("CEF_SELECTED_CAV_BMK")
                        
            pPage(CEF_FRM_CAV_C1_EDITID).Text = CEF_CavRS(CEF_CAV_FIELD_IDPIANTA).Value
            
            pPage(CEF_FRM_CAV_C1_BTNPREV).Enabled = true
            pPage(CEF_FRM_CAV_C1_BTNNEXT).Enabled = true
            pPage(CEF_FRM_CAV_C1_BTNPREV10).Enabled = true
            pPage(CEF_FRM_CAV_C1_BTNNEXT10).Enabled = true
            
            pPage(CEF_FRM_CAV_C1_BTNADD).Enabled = true
            pPage(CEF_FRM_CAV_C1_BTNDEL).Enabled = true
    
            'manage buttons for first and last sintomo
            If Application.UserProperties("CEF_SELECTED_CAV_POS") = 1 then
                pPage(CEF_FRM_CAV_C1_BTNPREV).Enabled = false
                pPage(CEF_FRM_CAV_C1_BTNPREV10).Enabled = false
            
            
            End If
            
            If Application.UserProperties("CEF_SELECTED_CAV_POS") = Application.UserProperties("CEF_CAV_NCAV") then
                pPage(CEF_FRM_CAV_C1_BTNNEXT).Enabled = false
                pPage(CEF_FRM_CAV_C1_BTNNEXT10).Enabled = false
            
            End If
            
            'load data of current cav
            
            pPage(CEF_FRM_CAV_LblSPECIEID).Text = CEF_CavRS.Fields(CEF_CAV_FIELD_SPECIE).Value
            If StrComp(CEF_CavRS.Fields(CEF_CAV_FIELD_SPECIE).Value,"") = 0 then
                pPage(CEF_FRM_CAV_LblSPECIETEXT).Text = ""
            Else
                Dim find_string
                find_String = "[TABELLA]=""SPECIE"" AND [ID]= """ & CEF_CavRS.Fields(CEF_CAV_FIELD_SPECIE).Value & """"
                CEF_TabdecRS.Find(find_String)
                pPage(CEF_FRM_CAV_LblSPECIETEXT).Text = CEF_TabdecRS("TEXT").Value
            End If
            pPage(CEF_FRM_CAV_LblD1V).Text = CEF_CavRS.Fields(CEF_CAV_FIELD_DIAM1).Value
            pPage(CEF_FRM_CAV_LblD2V).Text = CEF_CavRS.Fields(CEF_CAV_FIELD_DIAM2).Value
            Select Case CEF_CavRS.Fields(CEF_CAV_FIELD_RIL_H).Value
                Case "1"  pPage(CEF_FRM_CAV_LblALTEZZAV).Text = "1 - Non rilevata"
                Case "2"  pPage(CEF_FRM_CAV_LblALTEZZAV).Text = "2 - H Troncatura" 
                Case "3"  pPage(CEF_FRM_CAV_LblALTEZZAV).Text = "3 - H Dominante"  
                Case Else pPage(CEF_FRM_CAV_LblALTEZZAV).Text = ""     
            End Select
            pPage(CEF_FRM_CAV_LblALTEZZAVM).Text = CEF_CavRS.Fields(CEF_CAV_FIELD_H).Value
            Select Case CEF_CavRS.Fields(CEF_CAV_FIELD_DENDROT).Value
                Case "1"  pPage(CEF_FRM_CAV_LblDENDROV).Text = "1 - Alto fusto"
                Case "2"  pPage(CEF_FRM_CAV_LblDENDROV).Text = "2 - Pollone" 
                Case "3"  pPage(CEF_FRM_CAV_LblDENDROV).Text = "3 - Matricina"
                Case "4"  pPage(CEF_FRM_CAV_LblDENDROV).Text = "4 - Non determ."
                Case Else pPage(CEF_FRM_CAV_LblALTEZZAV).Text = ""    
            End Select
        Else
            pPage(CEF_FRM_CAV_C1_EDITID).Text = "NO PIANTA"
            pPage(CEF_FRM_CAV_C1_BTNPREV).Enabled = false
            pPage(CEF_FRM_CAV_C1_BTNNEXT).Enabled = false
            pPage(CEF_FRM_CAV_C1_BTNPREV10).Enabled = false
            pPage(CEF_FRM_CAV_C1_BTNNEXT10).Enabled = false
            
            pPage(CEF_FRM_CAV_C1_BTNADD).Enabled = true
            pPage(CEF_FRM_CAV_C1_BTNDEL).Enabled = false
            
            pPage(CEF_FRM_CAV_LblSPECIEID).Text = ""
            pPage(CEF_FRM_CAV_LblSPECIETEXT).Text = ""
            pPage(CEF_FRM_CAV_LblD1V).Text = ""
            pPage(CEF_FRM_CAV_LblD2V).Text = ""
            pPage(CEF_FRM_CAV_LblALTEZZAV).Text = ""
            pPage(CEF_FRM_CAV_LblALTEZZAVM).Text = ""
            pPage(CEF_FRM_CAV_LblDENDROV).Text = ""
    
        End If
    End If
End Sub

Private Sub CEF_FormCAV_C1_onvalidate()

End Sub


Private Sub CEF_FormCAV_BtnPREV_click()
    Application.UserProperties("CEF_SELECTED_CAV_POS") = Application.UserProperties("CEF_SELECTED_CAV_POS")-1
    Application.UserProperties("CEF_SELECTED_CAV_BMK") = CEF_cav_bookmark_array(Application.UserProperties("CEF_SELECTED_CAV_POS"),1)
    Application.UserProperties("CEF_SELECTED_CAV_ID") = CEF_cav_bookmark_array(Application.UserProperties("CEF_SELECTED_CAV_POS"),2)
    Dim pPage
    Set pPage = ThisEvent.Object.Parent
    pPage.Activate
End Sub

Private Sub CEF_FormCAV_BtnPREV10_click()
    Dim new_pos
    If Application.UserProperties("CEF_SELECTED_CAV_POS") <= 10 Then
        new_pos = 1
    Else
        new_pos = Application.UserProperties("CEF_SELECTED_CAV_POS")-10
    End If
    Application.UserProperties("CEF_SELECTED_CAV_POS") = new_pos
    Application.UserProperties("CEF_SELECTED_CAV_BMK") = CEF_cav_bookmark_array(Application.UserProperties("CEF_SELECTED_CAV_POS"),1)
    Application.UserProperties("CEF_SELECTED_CAV_ID") = CEF_cav_bookmark_array(Application.UserProperties("CEF_SELECTED_CAV_POS"),2)
    Dim pPage
    Set pPage = ThisEvent.Object.Parent
    pPage.Activate
End Sub

Private Sub CEF_FormCAV_BtnNEXT_click()
    Application.UserProperties("CEF_SELECTED_CAV_POS") = Application.UserProperties("CEF_SELECTED_CAV_POS")+1
    Application.UserProperties("CEF_SELECTED_CAV_BMK") = CEF_cav_bookmark_array(Application.UserProperties("CEF_SELECTED_CAV_POS"),1)
    Application.UserProperties("CEF_SELECTED_CAV_ID") = CEF_cav_bookmark_array(Application.UserProperties("CEF_SELECTED_CAV_POS"),2)
    Dim pPage
    Set pPage = ThisEvent.Object.Parent
    pPage.Activate
End Sub

Private Sub CEF_FormCAV_BtnNEXT10_click()
    Dim new_pos
    If Application.UserProperties("CEF_SELECTED_CAV_POS") >= (Application.UserProperties("CEF_CAV_NCAV") - 10) Then
        new_pos = Application.UserProperties("CEF_CAV_NCAV")
    Else
        new_pos = Application.UserProperties("CEF_SELECTED_CAV_POS")+10
    End If
    Application.UserProperties("CEF_SELECTED_CAV_POS") = new_pos
    Application.UserProperties("CEF_SELECTED_CAV_BMK") = CEF_cav_bookmark_array(Application.UserProperties("CEF_SELECTED_CAV_POS"),1)
    Application.UserProperties("CEF_SELECTED_CAV_ID") = CEF_cav_bookmark_array(Application.UserProperties("CEF_SELECTED_CAV_POS"),2)
    Dim pPage
    Set pPage = ThisEvent.Object.Parent
    pPage.Activate
End Sub

Private Sub CEF_FormCAV_BtnPLUS_click
    Dim pPage
    Set pPage = ThisEvent.Object.Parent
    
    Dim appApplets, CEF_Applet
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
    
    '------------------START DEMO CODE--------------------
        
'     If Application.UserProperties("CEF_CAV_NCAV") > 9 Then
'         MsgBox "Versione DEMO." & vbNewLine & "In questa versione non e' concesso inserire piu' di 10 alberi per il cavallettamento!",vbExclamation,"CONECOFOR MOBILE"
'         Exit sub
'     End If
            
    '------------------END DEMO CODE---------------------
    
    
    Application.UserProperties("CEF_CAV_NEW") = vbTrue
    
    Application.UserProperties("CEF_CAV_IDPIANTA") = CEF_cav_bookmark_array(Application.UserProperties("CEF_CAV_NCAV"),2)+1  
    Application.UserProperties("CEF_CAV_SPECIE") = ""
    Application.UserProperties("CEF_CAV_DIAM1") = ""
    Application.UserProperties("CEF_CAV_DIAM2") = ""
    Application.UserProperties("CEF_CAV_DENDROT") = ""
    Application.UserProperties("CEF_CAV_RIL_H") = ""
    Application.UserProperties("CEF_CAV_H") = ""

    Dim OKbutton_click
    OKbutton_click = CEF_Applet.Forms(CEF_FRM_CAVNEW).Show
    
    If OKbutton_click Then

        CEF_CavRS.AddNew

        'copy over all the attribute values to the new record of the new shapefile

        CEF_CavRS.Fields(CEF_CAV_FIELD_IDAREA).Value = Application.UserProperties("CEF_SELECTED_AREA_ID")
        CEF_CavRS.Fields(CEF_CAV_FIELD_IDPIANTA).Value = Application.UserProperties("CEF_CAV_IDPIANTA")
        CEF_CavRS.Fields(CEF_CAV_FIELD_SPECIE).Value = Application.UserProperties("CEF_CAV_SPECIE")
        CEF_CavRS.Fields(CEF_CAV_FIELD_DIAM1).Value = Application.UserProperties("CEF_CAV_DIAM1")
        CEF_CavRS.Fields(CEF_CAV_FIELD_DIAM2).Value = Application.UserProperties("CEF_CAV_DIAM2")
        CEF_CavRS.Fields(CEF_CAV_FIELD_DENDROT).Value = Application.UserProperties("CEF_CAV_DENDROT")
        CEF_CavRS.Fields(CEF_CAV_FIELD_RIL_H).Value = Application.UserProperties("CEF_CAV_RIL_H")
        CEF_CavRS.Fields(CEF_CAV_FIELD_H).Value = Application.UserProperties("CEF_CAV_H")
        
        'Update the new record of the new shapefile to save the changes
        CEF_CavRS.Update
        CEF_CavRS.Pack
        'update bookmark piante array
        Call CEF_update_CEF_cav_bookmark_array
        
        'go to new sintomo
        Dim i,pos
        pos=0
        For i=1 to Application.UserProperties("CEF_CAV_NCAV")
            If CEF_cav_bookmark_array(i,2)=Application.UserProperties("CEF_CAV_IDPIANTA") Then
                pos=i
                Exit For
            End If
        Next
        Application.UserProperties("CEF_SELECTED_CAV_POS") = pos
        Application.UserProperties("CEF_SELECTED_CAV_BMK") = CEF_cav_bookmark_array(Application.UserProperties("CEF_SELECTED_CAV_POS"),1)
        Application.UserProperties("CEF_SELECTED_CAV_ID") = CEF_cav_bookmark_array(Application.UserProperties("CEF_SELECTED_CAV_POS"),2)
        
    End If
   
    pPage.Activate 
End Sub

Private Sub CEF_FormCAV_BtnREPEAT_click()
    Dim pPage
    Set pPage = ThisEvent.Object.Parent
    
    Dim appApplets, CEF_Applet
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
        
    '------------------START DEMO CODE--------------------
'         
'     If Application.UserProperties("CEF_CAV_NCAV") > 9 Then
'         MsgBox "Versione DEMO." & vbNewLine & "In questa versione non e' concesso inserire piu' di 10 alberi per il cavallettamento!",vbExclamation,"CONECOFOR MOBILE"
'         Exit sub
'     End If
            
    '------------------END DEMO CODE---------------------
    
    Application.UserProperties("CEF_CAV_NEW") = vbTrue
    
    Application.UserProperties("CEF_CAV_IDPIANTA") = CEF_cav_bookmark_array(Application.UserProperties("CEF_CAV_NCAV"),2)+1  
    Application.UserProperties("CEF_CAV_SPECIE") = CEF_CavRS.Fields(CEF_CAV_FIELD_SPECIE).Value
    Application.UserProperties("CEF_CAV_DIAM1") = ""
    Application.UserProperties("CEF_CAV_DIAM2") = ""
    Application.UserProperties("CEF_CAV_DENDROT") = CEF_CavRS.Fields(CEF_CAV_FIELD_DENDROT).Value
    Application.UserProperties("CEF_CAV_RIL_H") = ""
    Application.UserProperties("CEF_CAV_H") = ""

    Dim OKbutton_click
    OKbutton_click = CEF_Applet.Forms(CEF_FRM_CAVNEW).Show
    
    If OKbutton_click Then

        CEF_CavRS.AddNew

        'copy over all the attribute values to the new record of the new shapefile

        CEF_CavRS.Fields(CEF_CAV_FIELD_IDAREA).Value = Application.UserProperties("CEF_SELECTED_AREA_ID")
        CEF_CavRS.Fields(CEF_CAV_FIELD_IDPIANTA).Value = Application.UserProperties("CEF_CAV_IDPIANTA")
        CEF_CavRS.Fields(CEF_CAV_FIELD_SPECIE).Value = Application.UserProperties("CEF_CAV_SPECIE")
        CEF_CavRS.Fields(CEF_CAV_FIELD_DIAM1).Value = Application.UserProperties("CEF_CAV_DIAM1")
        CEF_CavRS.Fields(CEF_CAV_FIELD_DIAM2).Value = Application.UserProperties("CEF_CAV_DIAM2")
        CEF_CavRS.Fields(CEF_CAV_FIELD_DENDROT).Value = Application.UserProperties("CEF_CAV_DENDROT")
        CEF_CavRS.Fields(CEF_CAV_FIELD_RIL_H).Value = Application.UserProperties("CEF_CAV_RIL_H")
        CEF_CavRS.Fields(CEF_CAV_FIELD_H).Value = Application.UserProperties("CEF_CAV_H")
        
        'Update the new record of the new shapefile to save the changes
        CEF_CavRS.Update
        CEF_CavRS.Pack
        'update bookmark piante array
        Call CEF_update_CEF_cav_bookmark_array
        
        'go to new sintomo
        Dim i,pos
        pos=0
        For i=1 to Application.UserProperties("CEF_CAV_NCAV")
            If CEF_cav_bookmark_array(i,2)=Application.UserProperties("CEF_CAV_IDPIANTA") Then
                pos=i
                Exit For
            End If
        Next
        Application.UserProperties("CEF_SELECTED_CAV_POS") = pos
        Application.UserProperties("CEF_SELECTED_CAV_BMK") = CEF_cav_bookmark_array(Application.UserProperties("CEF_SELECTED_CAV_POS"),1)
        Application.UserProperties("CEF_SELECTED_CAV_ID") = CEF_cav_bookmark_array(Application.UserProperties("CEF_SELECTED_CAV_POS"),2)
        
    End If
   
    pPage.Activate 

End Sub


Private Sub CEF_FormCAV_BtnMINUS_click()
    Dim pPage
    Set pPage = ThisEvent.Object.Parent
     
    
    Dim OKbutton_click,message
    message = "Confermi cancellazione pianta "&Application.UserProperties("CEF_SELECTED_CAV_ID")&"?"
    OKbutton_click = MsgBox (message,vBOkCancel,"CONECOFOR MOBILE")
    
    If OKbutton_click = vbOk Then
        
        CEF_CavRS.Delete
        CEF_CavRS.Update
        CEF_CavRS.Pack
        
        'update bookmark piante array
        Call CEF_update_CEF_cav_bookmark_array
        
        If Application.UserProperties("CEF_CAV_NCAV") > 0 Then
            Application.UserProperties("CEF_SELECTED_CAV_POS") = Application.UserProperties("CEF_CAV_NCAV")
            Application.UserProperties("CEF_SELECTED_CAV_BMK") = CEF_cav_bookmark_array(Application.UserProperties("CEF_SELECTED_CAV_POS"),1)
            Application.UserProperties("CEF_SELECTED_CAV_ID") = CEF_cav_bookmark_array(Application.UserProperties("CEF_SELECTED_CAV_POS"),2)
        Else
            Application.UserProperties("CEF_SELECTED_CAV_POS") = 0
            Application.UserProperties("CEF_SELECTED_CAV_BMK") = 0
            Application.UserProperties("CEF_SELECTED_CAV_ID") = 0 
        End If 
    End If
 
    pPage.Activate 

    Set pPage = nothing
End Sub

Private Sub CEF_FormCAV_BtnMODIFICA_Click()
    Dim pPage
    Set pPage = ThisEvent.Object.Parent
    
    Dim appApplets, CEF_Applet
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
        
    Application.UserProperties("CEF_CAV_NEW") = vbTrue
    
    Application.UserProperties("CEF_CAV_IDPIANTA") = CEF_CavRS.Fields(CEF_CAV_FIELD_IDPIANTA).Value  
    Application.UserProperties("CEF_CAV_SPECIE") = CEF_CavRS.Fields(CEF_CAV_FIELD_SPECIE).Value
    Application.UserProperties("CEF_CAV_DIAM1") = CEF_CavRS.Fields(CEF_CAV_FIELD_DIAM1).Value
    Application.UserProperties("CEF_CAV_DIAM2") = CEF_CavRS.Fields(CEF_CAV_FIELD_DIAM2).Value
    Application.UserProperties("CEF_CAV_DENDROT") = CEF_CavRS.Fields(CEF_CAV_FIELD_DENDROT).Value
    Application.UserProperties("CEF_CAV_RIL_H") = CEF_CavRS.Fields(CEF_CAV_FIELD_RIL_H).Value
    Application.UserProperties("CEF_CAV_H") = CEF_CavRS.Fields(CEF_CAV_FIELD_H).Value

    Dim OKbutton_click
    OKbutton_click = CEF_Applet.Forms(CEF_FRM_CAVNEW).Show
    
    If OKbutton_click Then

        'copy over all the attribute values to the new record of the new shapefile

        CEF_CavRS.Fields(CEF_CAV_FIELD_IDAREA).Value = Application.UserProperties("CEF_SELECTED_AREA_ID")
        CEF_CavRS.Fields(CEF_CAV_FIELD_IDPIANTA).Value = Application.UserProperties("CEF_CAV_IDPIANTA")
        CEF_CavRS.Fields(CEF_CAV_FIELD_SPECIE).Value = Application.UserProperties("CEF_CAV_SPECIE")
        CEF_CavRS.Fields(CEF_CAV_FIELD_DIAM1).Value = Application.UserProperties("CEF_CAV_DIAM1")
        CEF_CavRS.Fields(CEF_CAV_FIELD_DIAM2).Value = Application.UserProperties("CEF_CAV_DIAM2")
        CEF_CavRS.Fields(CEF_CAV_FIELD_DENDROT).Value = Application.UserProperties("CEF_CAV_DENDROT")
        CEF_CavRS.Fields(CEF_CAV_FIELD_RIL_H).Value = Application.UserProperties("CEF_CAV_RIL_H")
        CEF_CavRS.Fields(CEF_CAV_FIELD_H).Value = Application.UserProperties("CEF_CAV_H")
        
        'Update the new record of the new shapefile to save the changes
        CEF_CavRS.Update
        CEF_CavRS.Pack
        'update bookmark piante array      
    End If
   
    pPage.Activate
End Sub

Private Sub CEF_FormCAVNEW_onload()
    Dim pForm
    Set pForm = ThisEvent.Object
    pForm.caption = "PIANTA " & Application.UserProperties("CEF_CAV_IDPIANTA")
    Dim pPage,find_string
    Set pPage = pForm(CEF_FRM_CAVNEW_C1)
    pPage(CEF_FRM_CAVNEW_EditSPECIEID).Text = Application.UserProperties("CEF_CAV_SPECIE")
    pPage(CEF_FRM_CAVNEW_EditSPECIEID).Enabled = false
    If StrComp(Application.UserProperties("CEF_CAV_SPECIE"),"") = 0 then
        pPage(CEF_FRM_CAVNEW_EditSPECIETEXT).Text = ""
    Else
        find_String = "[TABELLA]=""SPECIE"" AND [ID]= """ & pPage(CEF_FRM_CAVNEW_EditSPECIEID).Text & """"
        CEF_TabdecRS.Find(find_String)
        pPage(CEF_FRM_CAVNEW_EditSPECIETEXT).Text = CEF_TabdecRS("TEXT").Value
    End If
    pPage(CEF_FRM_CAVNEW_EditSPECIETEXT).Enabled = false
    
    pPage(CEF_FRM_CAVNEW_EditD1).Text = Application.UserProperties("CEF_CAV_DIAM1")
    pPage(CEF_FRM_CAVNEW_EditD2).Text = Application.UserProperties("CEF_CAV_DIAM2")
    If StrComp(Application.UserProperties("CEF_CAV_DENDROT"),"")=0 Then
        pPage(CEF_FRM_CAVNEW_ComboDENDRO).ListIndex = -1
    Else
        pPage(CEF_FRM_CAVNEW_ComboDENDRO).ListIndex= ComboFind(pPage(CEF_FRM_CAVNEW_ComboDENDRO),Application.UserProperties("CEF_CAV_DENDROT"))
    End If
    
    If StrComp(Application.UserProperties("CEF_CAV_RIL_H"),"3")=0 Then
        pPage(CEF_FRM_CAVNEW_ComboALTEZZA).clear
        pPage(CEF_FRM_CAVNEW_ComboALTEZZA).AddItem "1","1 - Non rilevata"
        pPage(CEF_FRM_CAVNEW_ComboALTEZZA).AddItem "2","2 - H Troncatura"
        pPage(CEF_FRM_CAVNEW_ComboALTEZZA).AddItem "3","3 - H dominante"
        pPage(CEF_FRM_CAVNEW_ComboALTEZZA).ListIndex= ComboFind(pPage(CEF_FRM_CAVNEW_ComboALTEZZA),Application.UserProperties("CEF_CAV_RIL_H"))        
        
        pPage(CEF_FRM_CAVNEW_EditALTEZZAV).Enabled = true
        pPage(CEF_FRM_CAVNEW_EditALTEZZAV).Text = Application.UserProperties("CEF_CAV_H")
    ElseIf StrComp(Application.UserProperties("CEF_CAV_RIL_H"),"2")=0 Then
        pPage(CEF_FRM_CAVNEW_ComboALTEZZA).clear
        pPage(CEF_FRM_CAVNEW_ComboALTEZZA).AddItem "1","1 - Non rilevata"
        pPage(CEF_FRM_CAVNEW_ComboALTEZZA).AddItem "2","2 - H Troncatura"
        pPage(CEF_FRM_CAVNEW_ComboALTEZZA).ListIndex= ComboFind(pPage(CEF_FRM_CAVNEW_ComboALTEZZA),Application.UserProperties("CEF_CAV_RIL_H"))        
        
        pPage(CEF_FRM_CAVNEW_EditALTEZZAV).Enabled = true
        pPage(CEF_FRM_CAVNEW_EditALTEZZAV).Text = Application.UserProperties("CEF_CAV_H")
    ElseIf StrComp(Application.UserProperties("CEF_CAV_RIL_H"),"1")=0 Then
        pPage(CEF_FRM_CAVNEW_ComboALTEZZA).clear
        pPage(CEF_FRM_CAVNEW_ComboALTEZZA).AddItem "1","1 - Non rilevata"
        pPage(CEF_FRM_CAVNEW_ComboALTEZZA).AddItem "2","2 - H Troncatura"
        pPage(CEF_FRM_CAVNEW_ComboALTEZZA).ListIndex= ComboFind(pPage(CEF_FRM_CAVNEW_ComboALTEZZA),Application.UserProperties("CEF_CAV_RIL_H"))        
        
        pPage(CEF_FRM_CAVNEW_EditALTEZZAV).Enabled = false
        pPage(CEF_FRM_CAVNEW_EditALTEZZAV).Text = ""
    ElseIf StrComp(Application.UserProperties("CEF_CAV_RIL_H"),"")=0 Then
        pPage(CEF_FRM_CAVNEW_ComboALTEZZA).clear
        pPage(CEF_FRM_CAVNEW_ComboALTEZZA).AddItem "1","1 - Non rilevata"
        pPage(CEF_FRM_CAVNEW_ComboALTEZZA).AddItem "2","2 - H Troncatura"
        pPage(CEF_FRM_CAVNEW_ComboALTEZZA).ListIndex = -1
        pPage(CEF_FRM_CAVNEW_EditALTEZZAV).Enabled = false
        pPage(CEF_FRM_CAVNEW_EditALTEZZAV).Text = ""
    End If
End Sub

Private Sub CEF_FormCAVNEW_C1_onload()

End Sub

Private Sub CEF_FormCAVNEW_BtnIMPORT_Click()
    Dim button,pPage
    Set button = ThisEvent.Object
    Set pPage = button.parent
    
    Dim appApplets, CEF_Applet
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
    
    Application.UserProperties("FrmGET_VALUE_TITLE") = "Importazione dati pianta campione"
    Application.UserProperties("FrmGET_VALUE_LABEL") = "ID campione"
    Dim OKbutton_click
    OKbutton_click = CEF_Applet.Forms(CEF_FRM_GET_VALUE).Show
    If OKbutton_click Then
        Dim ID_piantacamp
        ID_piantacamp = Application.UserProperties("FrmGET_VALUE_EDIT") 
        If CEF_value_check_range(ID_piantacamp,1,999) Then
            Dim CEF_PianteLayer
            Set CEF_PianteLayer = Application.Map.Layers.Item(Application.UserProperties("CEF_PIANTE_LAYER_NAME_STRING"))
            Set CEF_PianteRS = CEF_PianteLayer.Records
            Dim lBookmark,find_string
            find_string =  "["&CEF_PIANTE_FIELD_IDAREA&"] = """&Application.UserProperties("CEF_SELECTED_AREA_ID") & """" & "AND ["&CEF_PIANTE_FIELD_IDPIANTA&"] = """&ID_piantacamp& """"
            CEF_PianteRS.MoveFirst
            lBookmark = CEF_PianteRS.Find(find_string)
            If lBookmark > 0 Then
                Select case Clng(CEF_PianteRS(CEF_PIANTE_FIELD_REM_MORT).Value)
                    Case 1,2,3,902:
                        pPage(CEF_FRM_CAVNEW_EditSPECIEID).Value = CEF_PianteRS(CEF_PIANTE_FIELD_SPECIE).Value
                        find_String = "[TABELLA]=""SPECIE"" AND [ID]= """ & CEF_PianteRS(CEF_PIANTE_FIELD_SPECIE).Value & """"
                        CEF_TabdecRS.Find(find_String)
                        pPage(CEF_FRM_CAVNEW_EditSPECIETEXT).Value = CEF_TabdecRS("TEXT").Value
                    
                    
                        pPage(CEF_FRM_CAVNEW_ComboDENDRO).ListIndex= ComboFind(pPage(CEF_FRM_CAVNEW_ComboDENDRO),CEF_PianteRS(CEF_PIANTE_FIELD_DENDROT).Value)
                        pPage(CEF_FRM_CAVNEW_EditD1).Text = CEF_PianteRS(CEF_PIANTE_FIELD_DIAM1).Value
                        pPage(CEF_FRM_CAVNEW_EditD2).Text = CEF_PianteRS(CEF_PIANTE_FIELD_DIAM2).Value
                        
                        pPage.activate
                    Case Else:
                        MsgBox "Pianta uscita dal campione, non ritrovata o morta!",vbExclamation,"CONECOFOR MOBILE"
                    End Select
            Else
                MsgBox "ID rilievo chiome non esistente!",vbExclamation,"CONECOFOR MOBILE"
            End If
            Set CEF_PianteLayer = nothing
            Set CEF_PianteRS = nothing
        Else
            MsgBox "ID rilievo chiome non valido!",vbExclamation,"CONECOFOR MOBILE"
        End If
    End If
End Sub


Private Sub CEF_FormCAVNEW_BtnSPECIE_Click()
    Dim button,pPage
    Set button = ThisEvent.Object
    Set pPage = button.parent
    Application.UserProperties("LIST_FILTER") ="[TABELLA] = ""SPECIE"""
    Application.UserProperties("LIST_FIELD_ID") = "ID"
    Application.UserProperties("LIST_FIELD_TEXT") = "TEXT"
    Dim appApplets, CEF_Applet
	Set appApplets = Application.Applets
	Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
	If CEF_Applet.Forms("FrmLISTBOX").Show Then
        pPage(CEF_FRM_CAVNEW_EditSPECIEID).Text = Application.UserProperties("FrmLISTBOX_RESULT_V")
        pPage(CEF_FRM_CAVNEW_EditSPECIETEXT).Text = Application.UserProperties("FrmLISTBOX_RESULT_T")
    End If
End Sub

Private Sub CEF_FormCAVNEW_EditD1_Change()
    Dim control,pPage
    Set control = ThisEvent.Object
    Set pPage = control.parent
    If CEF_value_check_range(control.Value,0.1,9.5) then
        pPage(CEF_FRM_CAVNEW_EditD2).value = control.Value
    Else
        pPage(CEF_FRM_CAVNEW_EditD2).value = ""
    End If
End Sub

Private Sub  CEF_FormCAVNEW_C1__ComboALTEZZA_onselchange()
    Dim control,pPage
    Set control = ThisEvent.Object
    Set pPage = control.parent
    If pPage(CEF_FRM_CAVNEW_ComboALTEZZA).Value = "1" Then
        pPage(CEF_FRM_CAVNEW_EditALTEZZAV).Value=""
        pPage(CEF_FRM_CAVNEW_EditALTEZZAV).Enabled= false
    Else
        pPage(CEF_FRM_CAVNEW_EditALTEZZAV).Enabled= true
    End If
End Sub


Private Sub CEF_FormCAVNEW_C1_onvalidate()
    Dim pPage
    Set pPage = ThisEvent.Object
    If StrComp(pPage(CEF_FRM_CAVNEW_EditSPECIEID).Text,"")=0 Then
        ThisEvent.Result = False
        ThisEvent.MessageText = "Inserire specie!"
        ThisEvent.MessageType = 48
	    Exit Sub
    else
        Application.UserProperties("CEF_CAV_SPECIE") = pPage(CEF_FRM_CAVNEW_EditSPECIEID).Text
    End If
    
    If Not CEF_value_check_range(pPage(CEF_FRM_CAVNEW_EditD1).Value,0.1,999) Then
        ThisEvent.Result = False
        ThisEvent.MessageText = "Inserire diametro 1 valido!"
        ThisEvent.MessageType = 48
	    Exit Sub
    Else
        Application.UserProperties("CEF_CAV_DIAM1") = CInt(pPage(CEF_FRM_CAVNEW_EditD1).Value)
    End If
    
    If Not CEF_value_check_range(pPage(CEF_FRM_CAVNEW_EditD2).Value,0.1,999) Then
        ThisEvent.Result = False
        ThisEvent.MessageText = "Inserire diametro 2 valido!"
        ThisEvent.MessageType = 48
	    Exit Sub
    Else
        Application.UserProperties("CEF_CAV_DIAM2") = CInt(pPage(CEF_FRM_CAVNEW_EditD2).Value)
    End If
    
    if pPage(CEF_FRM_CAVNEW_ComboALTEZZA).ListIndex = -1 then
        Thisevent.result = false
        ThisEvent.MessageText = "Inserire indicazione altezza!"
        ThisEvent.MessageType = 48
        Exit sub
    else
        Application.UserProperties("CEF_CAV_RIL_H") = pPage(CEF_FRM_CAVNEW_ComboALTEZZA).Value 
    end if
    
    If pPage(CEF_FRM_CAVNEW_ComboALTEZZA).ListIndex = 0 Then
        Application.UserProperties("CEF_CAV_H") = 0
    Else
        If Not CEF_value_check_range(pPage(CEF_FRM_CAVNEW_EditALTEZZAV).Value,0.1,99) Then
            ThisEvent.Result = False
            ThisEvent.MessageText = "Inserire altezza valida!"
        ThisEvent.MessageType = 48
            Exit Sub
        Else
            Application.UserProperties("CEF_CAV_H") = CDbl(pPage(CEF_FRM_CAVNEW_EditALTEZZAV).Value)
        End If
    End If
    
    if pPage(CEF_FRM_CAVNEW_ComboDENDRO).ListIndex = -1 then
        Thisevent.result = false
        ThisEvent.MessageText = "Inserire dendrotipo!"
        ThisEvent.MessageType = 48
        Exit sub
    else
        Application.UserProperties("CEF_CAV_DENDROT") = pPage(CEF_FRM_CAVNEW_ComboDENDRO).Value 
    end if
    
End Sub

Private Sub CEF_FormHDOM_onload()
    Dim pForm,pPage
    Set pForm = ThisEvent.Object
    Set pPage = pForm(CEF_FRM_HDOM_HD1)
    If CEF_CavRS.RecordCount = 0 then
        MsgBox "Cavallettamento non effettuato!",vbExclamation,"CONECOFOR MOBILE"
        pForm.Close()
        Exit sub
    End If
    call CEF_update_CEF_hdom_bookmark_array
    If Application.UserProperties("CEF_HDOM_NHDOM") = 0 then
        MsgBox "Cavallettamento non effettuato o nessuna pianta valida!",vbExclamation,"CONECOFOR MOBILE"
        pForm.Close()
        Exit sub
    End If
    pPage(CEF_FRM_HDOM_HD1_EDITALTEZZAV).text = ""
    
    Dim i,imax
    CEF_CavRS.MoveFirst
    pPage(CEF_FRM_HDOM_HD1_LBOX).Clear
    If  Application.UserProperties("CEF_HDOM_NHDOM") < 10 Then
        imax = Application.UserProperties("CEF_HDOM_NHDOM")
    Else
        imax = 10
    End If
    For i=1 To imax
        CEF_CavRS.Bookmark = CEF_hdom_bookmark_array(i,1)
        Dim find_String,text_string
        find_String = "[TABELLA]=""SPECIE"" AND [ID]= """ & CEF_CavRS(CEF_CAV_FIELD_SPECIE).Value & """"
        CEF_TabdecRS.Find(find_String)
        text_string = Space(3-Len(CEF_CavRS(CEF_CAV_FIELD_IDPIANTA).Value)) & CStr(CEF_hdom_bookmark_array(i,2)) & Space(5-Len(CStr(CEF_hdom_bookmark_array(i,2)))) & CEF_TabdecRS("TEXT").Value
        pPage(CEF_FRM_HDOM_HD1_LBOX).AddItem CEF_CavRS(CEF_CAV_FIELD_IDPIANTA).Value,text_string
    Next
    
End Sub

Private Sub CEF_update_CEF_hdom_bookmark_array()

    'create bookmark piante array
    Dim lBookmark,find_string,n_hdom
    find_string =  "["&CEF_CAV_FIELD_IDAREA&"] = """&Application.UserProperties("CEF_SELECTED_AREA_ID")& """" & " AND NOT ["&CEF_CAV_FIELD_RIL_H&"] = ""2"""
    n_hdom = 0
    If CEF_CavRS.RecordCount = 0 Then
        Application.UserProperties("CEF_CAV_NCAV") = 0
        Exit Sub
    End If
    CEF_CavRS.MoveFirst
    lBookmark = CEF_CavRS.Find(find_string)
    Do While (lBookmark>0)
        n_hdom = n_hdom+1
        lBookmark = CEF_CavRS.Find(find_string,,lBookmark)
    Loop
    Dim CEF_hdom_bookmark_array_tmp()
    ReDim CEF_hdom_bookmark_array_tmp(n_hdom,2)
    
    n_hdom=0
    CEF_CavRS.MoveFirst
    lBookmark = CEF_CavRS.Find(find_string)
    Do While (lBookmark>0)
        n_hdom = n_hdom+1
        CEF_hdom_bookmark_array_tmp(n_hdom,1)=lBookmark
        CEF_hdom_bookmark_array_tmp(n_hdom,2)=(CEF_CavRS(CEF_CAV_FIELD_DIAM1).Value +CEF_CavRS(CEF_CAV_FIELD_DIAM2).Value)/2
        
        lBookmark = CEF_CavRS.Find(find_string,,lBookmark)
        
    Loop
    If Ubound(CEF_hdom_bookmark_array_tmp,1)>1 Then
        QuickSort CEF_hdom_bookmark_array_tmp,1,n_hdom,2
    End If
    
    'reset CEF_cav_bookmark_array array
    Dim i,l
    For i = 1 To UBound(CEF_hdom_bookmark_array,1)
        For l = 1 To UBound(CEF_hdom_bookmark_array,2)
            CEF_hdom_bookmark_array(i,l) = 0
        Next    
    Next
    'copy CEF_piante_bookmark_array_tmp in CEF_piante_bookmark_array REVERSE ORDER
    Dim reverse_i
    For i = 1 To UBound(CEF_hdom_bookmark_array_tmp,1)
        For l = 1 To UBound(CEF_hdom_bookmark_array_tmp,2)
            reverse_i = UBound(CEF_hdom_bookmark_array_tmp,1)+1 -i
            CEF_hdom_bookmark_array(reverse_i,l) = CEF_hdom_bookmark_array_tmp(i,l)
        Next
    Next
    'set the ncav value
    Application.UserProperties("CEF_HDOM_NHDOM") = UBound(CEF_hdom_bookmark_array_tmp,1)

End Sub


Private Sub CEF_FormHDOM_HD1_setactive()
    
End Sub


Private Sub CEF_FormHDOM_lbox_onselchange()
    Dim ctrl,pPage
    Set ctrl = thisevent.object
    Set pPage = ctrl.parent
    
    Dim find_String
    find_string =  "["&CEF_CAV_FIELD_IDAREA&"] = """&Application.UserProperties("CEF_SELECTED_AREA_ID")& """" & " AND ["&CEF_CAV_FIELD_IDPIANTA&"] = " & ctrl.value
    CEF_CavRS.Find(find_string)
    
    pPage(CEF_FRM_HDOM_HD1_EDITALTEZZAV).text = CEF_CavRS(CEF_CAV_FIELD_H).Value

End Sub

Private Sub CEF_FormHDOM_BtnSETH_Click()
    Dim ctrl,pPage
    Set ctrl = thisevent.object
    Set pPage = ctrl.parent
    
    If Not CEF_value_check_range(pPage(CEF_FRM_HDOM_HD1_EDITALTEZZAV).Value,0.1,99) Then
        MsgBox "Altezza non valida!",vbExclamation,"CONECOFOR MOBILE"
    Else
        Dim find_String,id_pianta
        id_pianta = pPage(CEF_FRM_HDOM_HD1_LBOX).value
        find_string =  "["&CEF_CAV_FIELD_IDAREA&"] = """&Application.UserProperties("CEF_SELECTED_AREA_ID")& """" & " AND ["&CEF_CAV_FIELD_IDPIANTA&"] = " & id_pianta
        CEF_CavRS.Find(find_string)
        CEF_CavRS(CEF_CAV_FIELD_H).Value = CDbl(pPage(CEF_FRM_HDOM_HD1_EDITALTEZZAV).text)
        CEF_CavRS(CEF_CAV_FIELD_RIL_H).Value = "3"
        CEF_CavRS.Update
        CEF_CavRS.Pack
        MsgBox "Altezza inserita!",vbInformation,"CONECOFOR MOBILE"
    End If
End Sub

Private Sub CEF_FormHDOM_HD1_validate()
    Dim lBookmark,find_string,n_cav,n_hdom
    find_string =  "["&CEF_CAV_FIELD_IDAREA&"] = """&Application.UserProperties("CEF_SELECTED_AREA_ID")& """"
    n_cav = 0
    n_hdom = 0
    If CEF_CavRS.RecordCount = 0 Then
        Exit Sub
    End If
    CEF_CavRS.MoveFirst
    lBookmark = CEF_CavRS.Find(find_string)
    Do While (lBookmark>0)
        n_cav = n_cav+1
        If CEF_CavRS(CEF_CAV_FIELD_RIL_H).Value = 3 Then
            n_hdom = n_hdom+1
        End If
        lBookmark = CEF_CavRS.Find(find_string,,lBookmark)
    Loop
    If n_cav >= 3 and n_hdom <> 3 Then
        MsgBox "Inserire 3 altezze dominanti!",vbExclamation,"CONECOFOR MOBILE"
    elseif n_cav < 3 and n_hdom <> n_cav then
        MsgBox "Inserire "& n_cav &" altezze dominanti!",vbExclamation,"CONECOFOR MOBILE"
    End If
End Sub


Private Sub CEF_info_click()
	Dim appApplets, RkApplet
	Set appApplets = Application.Applets
	Set RkApplet = appApplets.Item(CEF_APPLET_APP)
	
	RkApplet.Forms("INFOFORM").Show
End sub

Private Sub CEF_FrmINFOFORM_onload()
    Dim pForm
	pForm = thisevent.Object
    pForm("INFO").Activate
        pForm("INFO").Controls("editINFO").Value = "CONECOFOR MOBILE Release 3.0" & VbnewLine & "" & VbnewLine & "Copyright 2017 EFFETRESEIZERO srl <info@f360.it>. Tutti i diritti sono riservati." & VbnewLine & "" & VbnewLine & "CONECOFOR MOBILE e' concesso in licenza al Comando Unita' per la Tutela Forestale, Ambientale e Agroalimentare (C.U.T.F.A.A.) Carabinieri." & VbnewLine & "" & VbnewLine & "Questo programma e' tutelato dalle leggi sul copyright, dalle leggi sui diritti d'autore e dalle disposizioni dei trattati internazionali. La riproduzione e distribuzione non autorizzata di questo programma, o di parte di esso, sara' perseguibile civilmente e penalmente nella misura massima consentita dalla legge in vigore." & VbnewLine & "" & VbnewLine & "---" & VbnewLine & "" & VbnewLine & "CONECOFOR MOBILE Release 3.0" & VbnewLine & "" & VbnewLine & "Copyright 2017 EFFETRESEIZERO srl <info@f360.it>. All rights reserved." & VbnewLine & "" & VbnewLine & "CONECOFOR MOBILE is licensed to Comando Unita' per la Tutela Forestale, Ambientale e Agroalimentare (C.U.T.F.A.A.) Carabinieri." & VbnewLine & "" & VbnewLine & "This work is protected by copyright law and international treaties. Unauthorized reproduction or distribution of this program, or any portion of it, may result in severe civil and criminal penalties, and will be prosecuted to the maximum extent possible under the law."
	pForm("LICENCE").Activate

End Sub


'------------------------------------------------------------------



































'global const
Private Const C_POINT_C_UNDEFINED	= 0
Private Const C_POINT_C_SELECTED	= 1
Private Const C_POINT_C_CUSTOM		= 2

Private Const C_POINT_C_SET			= 0
Private Const C_POINT_C_UNSET		= 1

Private Const C_POINT_F_UNDEFINED	= 0
Private Const C_POINT_F_GPS			= 1
Private Const C_POINT_F_CUSTOM		= 2

Private Const C_POINT_F_SET			= 0
Private Const C_POINT_F_UNSET		= 1

const C_POINT_F_GPS_REC				= 1
const C_POINT_F_GPS_STOP			= 0

Private Const C_POINT_F_GPS_REC_TYPE_NPM  = 1

Private Const C_PARAM_C_SET			= 0
Private Const C_PARAM_C_UNSET		= 1

Private Const C_HDA_SET			= 0
Private Const C_HDA_UNSET		= 1

Private Const C_ID_SET			= 0
Private Const C_ID_UNSET		= 1


Private Const C_OFFSET_UNSET 	= 0
Private Const C_OFFSET_NO 		= 1
Private Const C_OFFSET_GPS 		= 1



'navmedia form const
Private Const C_FORM_NAV_MEDIA 		= "FORM_NAV_MEDIA"

'page_c page const
Private Const C_PC_PAGE_C				= "PAGE_C"
Private Const C_PC_CHK_SELECTED_C_P 	= "CHK_SELECTED_C_P"
Private Const C_PC_EDIT_SELECTED_C_N	= "EDIT_SELECTED_C_N"
Private Const C_PC_EDIT_SELECTED_C_E 	= "EDIT_SELECTED_C_E"
Private Const C_PC_EDIT_PROJ 			= "EDIT_PROJ"

Private Const C_PC_CHK_CUSTOM_C_P 		= "CHK_CUSTOM_C_P"
Private Const C_PC_EDIT_CUSTOM_C_N 		= "EDIT_CUSTOM_C_N"
Private Const C_PC_EDIT_CUSTOM_C_E 		= "EDIT_CUSTOM_C_E"

Private Const C_PC_BTN_SET_C			= "BTN_SET_C"

'page_f page const
Private Const C_PF_PAGE_F			= "PAGE_F"
Private Const C_PF_EDIT_GPS_POS_E	= "EDIT_GPS_POS_E"
Private Const C_PF_LBL_GPS_POS_R	= "LBL_GPS_POS_R"
Private Const C_PF_BTN_REC_GPS_F	= "BTN_REC_GPS_F"
Private Const C_PF_BTN_STOP_GPS_F	= "BTN_STOP_GPS_F"
Private Const C_PF_BTN_RESET_GPS_F	= "BTN_RESET_GPS_F"

Private Const C_PF_DEFALUT_POS_E 	= "170"

Private Const C_PF_CHK_GPS_F_P		= "CHK_GPS_F_P"
Private Const C_PF_EDIT_GPS_F_N		= "EDIT_GPS_F_N"
Private Const C_PF_EDIT_GPS_F_E		= "EDIT_GPS_F_E"

Private Const C_PF_CHK_CUSTOM_F_P	= "CHK_CUSTOM_F_P"
Private Const C_PF_EDIT_CUSTOM_F_N	= "EDIT_CUSTOM_F_N"
Private Const C_PF_EDIT_CUSTOM_F_E	= "EDIT_CUSTOM_F_E"
Private Const C_PF_LBL_CUSTOM_F_N	= "LBL_CUSTOM_F_N"
Private Const C_PF_LBL_CUSTOM_F_E	= "LBL_CUSTOM_F_E"

Private Const C_PF_BTN_SET_F		= "BTN_SET_F"

'page_const page const

Private Const C_DC_PAGE_CONST		= "PAGE_CONST"
Private Const C_DC_EDIT_CONST_C 	= "EDIT_CONST_C"
Private Const C_DC_BTN_SET_PARAM_C	= "BTN_SET_PARAM_C"

'page_aid page const
Private Const C_PAID_PAGE_AID		= "PAGE_AID"
Private Const C_PAID_BTN_GET_HD_A	= "BTN_GET_HD_A"
Private Const C_PAID_LBL_HDIST_VAL	= "LBL_HDIST_VAL"
Private Const C_PAID_LBL_A_VAL		= "LBL_A_VAL"
Private Const C_PAID_EDIT_INCL		= "EDIT_INCL"
Private Const C_PAID_BTN_GET_ID		= "BTN_GET_ID"
Private Const C_PAID_LBL_IDIST_VAL	= "LBL_IDIST_VAL"



'global variables
Private arrayPointFPosX()
Private arrayPointFPosY()

Private Sub NM_navMediaOnLoad_EventHandler()
	Application.UserProperties ("intPointFGpsRec") = C_POINT_F_GPS_STOP
	Application.UserProperties ("dblPointFAvgX") = 0.0
	Application.UserProperties ("dblPointFAvgY") = 0.0
	Application.UserProperties ("intPointFNumPos") = 0
	Application.UserProperties ("intPointFTotPos") = 170

	
End Sub

Private Sub NM_form_nav_media_load()
	Dim fForm,cPage,fPage,dcPage
' 	Dim cgpsPage,offsetPage
	Set fForm = ThisEvent.Object
	Set cPage = fForm.Pages(C_PC_PAGE_C)
	Set fPage = fForm.Pages(C_PF_PAGE_F)
	Set dcPage = fForm.Pages(C_DC_PAGE_CONST)
	
' 	Set offsetPage = fForm.Pages(C_POFFSET_PAGE_OFFSET)
' 	Set cgpsPage = fForm.Pages(C_PCGPS_PAGE_CGPS)

	cPage(C_PC_CHK_SELECTED_C_P).enabled = false
	cPage(C_PC_CHK_CUSTOM_C_P).value = false
	
	'set point c source as undefined
	Application.UserProperties ("intPointCSource") = C_POINT_C_UNDEFINED
	Application.UserProperties ("intPointCSetStatus") = C_POINT_C_UNSET
	Application.UserProperties ("dblPointC_X") = -1.0
	Application.UserProperties ("dblPointC_Y") = -1.0
			
	
	'set point f global variables
	Application.UserProperties ("dblPointFAvgX") = 0.0
	Application.UserProperties ("dblPointFAvgY") = 0.0
	Application.UserProperties ("intPointFNumPos") = 0
	Application.UserProperties ("dblPointF_X") = -1.0
	Application.UserProperties ("dblPointF_Y") = -1.0
	Application.UserProperties ("intPointFSetStatus") = C_POINT_F_UNSET
	
		
	'set param c global variables
	Application.UserProperties ("dblParamCValue") = 0.0
	Application.UserProperties ("intParamCSetStatus") = C_POINT_F_UNSET	
	
	' set aid global varibles
	Application.UserProperties ("intHdASetStatus") = C_HDA_UNSET
	Application.UserProperties ("intIDSetStatus") = C_ID_UNSET
	
	'
	'page c init
	
	'display current projection
	Dim currentCoordSys
	Set currentCoordSys = Map.CoordinateSystem
	cPage(C_PC_EDIT_PROJ).value = currentCoordSys.ProjectionName
	
	'check if selected feature exists
	If (Map.SelectionBookmark <> 0) Then
		'check if selected feature is a point feature
		Dim objSelLayer,objSelRS,lngSelShapeType
		Set objSelLayer = Map.SelectionLayer
		Set objSelRS = objSelLayer.Records
		objSelRS.Bookmark = Map.SelectionBookmark
		lngSelShapeType = objSelRS.Fields.ShapeType
		If (lngSelShapeType=1 Or lngSelShapeType=11 Or lngSelShapeType=21) Then
			'copy  choords of selected point feature
			cPage(C_PC_CHK_SELECTED_C_P).enabled = True

			Dim objShape
			Set objShape = objSelRS.Fields.Shape
	
			cPage(C_PC_EDIT_SELECTED_C_N).enabled = True
			cPage(C_PC_EDIT_SELECTED_C_E).enabled = True
			cPage(C_PC_EDIT_SELECTED_C_N).text = CStr(objShape.Y)
			cPage(C_PC_EDIT_SELECTED_C_E).text = CStr(objShape.X)
			cPage(C_PC_EDIT_SELECTED_C_N).enabled = false
			cPage(C_PC_EDIT_SELECTED_C_E).enabled = false
			Application.UserProperties ("dblSelectedPointN") = objShape.Y
			Application.UserProperties ("dblSelectedPointE") = objShape.X
			cPage(C_PC_CHK_SELECTED_C_P).value = true
			cPage(C_PC_EDIT_CUSTOM_C_N).enabled = false
			cPage(C_PC_EDIT_CUSTOM_C_E).enabled = false
			
			Application.UserProperties ("intPointCSource") = C_POINT_C_SELECTED
			
			
		Else
			cPage(C_PC_CHK_CUSTOM_C_P).value = false
			cPage(C_PC_EDIT_CUSTOM_C_N).enabled = False
			cPage(C_PC_EDIT_CUSTOM_C_E).enabled = False
			cPage(C_PC_EDIT_SELECTED_C_E).enabled = False
			
			cPage(C_PC_CHK_SELECTED_C_P).enabled = False
			cPage(C_PC_EDIT_SELECTED_C_N).enabled = False
			cPage(C_PC_EDIT_SELECTED_C_E).enabled = False
			
' 			MsgBox "Il posizionamento su CGPS non potra' essere salvato poiche' non e' stata selezionata una feature punto.",vbOKOnly,"WARNING!"
		End If  
	Else
		cPage(C_PC_CHK_CUSTOM_C_P).value = false		
		cPage(C_PC_EDIT_CUSTOM_C_N).enabled = False
		cPage(C_PC_EDIT_CUSTOM_C_E).enabled = False
		cPage(C_PC_CHK_SELECTED_C_P).enabled = False
		cPage(C_PC_EDIT_SELECTED_C_N).enabled = False
		cPage(C_PC_EDIT_SELECTED_C_E).enabled = False
' 		MsgBox "Il posizionamento su CGPS non potra' essere salvato poiche' non e' stata selezionata una feature punto.",vbOKOnly,"WARNING!"
	End If

	

	
	'
	' page f init
	fPage.Activate
	fPage(C_PF_BTN_STOP_GPS_F).Enabled = false
	fPage(C_PF_BTN_SET_F).Enabled = true
	'reset global variables F mean position
	Application.UserProperties ("dblPointFAvgX") = 0.0
	Application.UserProperties ("dblPointFAvgY") = 0.0
	Application.UserProperties ("intPointFNumPos") = 0
	fPage(C_PF_EDIT_GPS_POS_E).value = C_PF_DEFALUT_POS_E
	ReDim arrayPointFPosX(CInt(fPage(C_PF_EDIT_GPS_POS_E).value))
	ReDim arrayPointFPosY(CInt(fPage(C_PF_EDIT_GPS_POS_E).value))
	Application.UserProperties ("intPointFSource") = C_POINT_F_GPS
	'disable and hide point custom controls
	fPage(C_PF_CHK_CUSTOM_F_P).value = false
	fPage(C_PF_EDIT_CUSTOM_F_N).enabled = false
	fPage(C_PF_EDIT_CUSTOM_F_E).enabled = false
    fPage(C_PF_CHK_CUSTOM_F_P).visible = false
	fPage(C_PF_EDIT_CUSTOM_F_N).visible = false
	fPage(C_PF_EDIT_CUSTOM_F_E).visible = false
    fPage(C_PF_LBL_CUSTOM_F_N).visible = false
    fPage(C_PF_LBL_CUSTOM_F_E).visible = false
    
	'enable point gps controls
	fPage(C_PF_CHK_GPS_F_P).value = true
	

	cPage.Activate
	
	Set fForm = nothing
	Set cPage = nothing
	Set fPage = nothing
	Set dcPage = nothing
	
	
End Sub

Private Sub NM_form_nav_media_unload()
	'nav media global variables init
	Application.UserProperties ("intPointFGpsRec") = C_POINT_F_GPS_STOP
	Application.UserProperties ("dblPointFAvgX") = 0.0
	Application.UserProperties ("dblPointFAvgY") = 0.0
	Application.UserProperties ("intPointFNumPos") = 0
	Application.UserProperties ("intPointFTotPos") = 170
	
End Sub

Private Sub NM_page_aid_ok()
	If MsgBox ("Sei sicuro di voler uscire da NPM?", vbYesNo, "Warning!") = vbNO Then
		ThisEvent.Result = False
	End If
End Sub

Private Sub NM_page_aid_querycancel()
	If MsgBox ("Sei sicuro di voler uscire da NPM?", vbYesNo, "Warning!") = vbNO Then
		ThisEvent.Result = False
	End If
End Sub

Private Sub NM_btnSetC_Click()
	Dim cPage
	Set cPage = ThisEvent.Object.Parent
	Dim aidPage
	Set aidPage = cPage.Parent.Pages(C_PAID_PAGE_AID)	

' 	Dim cgpsPage
' 	Set cgpsPage = cPage.Parent.Pages(C_PCGPS_PAGE_CGPS)
' 	Dim offPage
' 	Set offPage = cPage.Parent.Pages(C_POFFSET_PAGE_OFFSET)
	
	'if c not set
	If (Application.UserProperties ("intPointCSetStatus") = C_POINT_C_UNSET) Then
		'if c source is defined
		If (Application.UserProperties ("intPointCSource") <> C_POINT_C_UNDEFINED) Then
			'if c source is a selected point
			If (Application.UserProperties ("intPointCSource") = C_POINT_C_SELECTED) Then
			
				
				'temporarily enable selected point edits
				cPage(C_PC_EDIT_SELECTED_C_E).enabled = true
				cPage(C_PC_EDIT_SELECTED_C_N).enabled = true
				
				'set point c values
				Application.UserProperties ("dblPointC_X") = Application.UserProperties ("dblSelectedPointE")
				Application.UserProperties ("dblPointC_Y") = Application.UserProperties ("dblSelectedPointN")
				
				'disable checks
				cPage(C_PC_CHK_SELECTED_C_P).enabled = false
				cPage(C_PC_CHK_CUSTOM_C_P).enabled = false
				cPage(C_PC_EDIT_SELECTED_C_E).enabled = false
				cPage(C_PC_EDIT_SELECTED_C_N).enabled = false
				
				Application.UserProperties ("intPointCSetStatus") = C_POINT_C_SET
				cPage(C_PC_BTN_SET_C).text = "UNSET C"
				
			'else if is a custom point
			Else
				'check if custom choords are in correct format
				If (CEF_value_check_real(cPage(C_PC_EDIT_CUSTOM_C_E).value) and CEF_value_check_real(cPage(C_PC_EDIT_CUSTOM_C_N).value)) Then
					
				
					'set point c values
					Application.UserProperties ("dblPointC_X") = CDbl(cPage(C_PC_EDIT_CUSTOM_C_E).value)
					Application.UserProperties ("dblPointC_Y") = CDbl(cPage(C_PC_EDIT_CUSTOM_C_N).value)
					
						
					'disable checks
					cPage(C_PC_CHK_SELECTED_C_P).enabled = false
					cPage(C_PC_CHK_CUSTOM_C_P).enabled = false
					cPage(C_PC_EDIT_CUSTOM_C_E).enabled = false
					cPage(C_PC_EDIT_CUSTOM_C_N).enabled = false
					
					Application.UserProperties ("intPointCSetStatus") = C_POINT_C_SET
					cPage(C_PC_BTN_SET_C).text = "UNSET C"
				Else
					MsgBox("Le coordinate devono essere numeri reali!")
				End If
			End if
		'else if c surce is not defined
		Else
			'do nothing
		End If
	'else if c is set
	Else
		'if c source is a selected point
		If (Map.SelectionBookmark <> 0) Then
			'check if selected feature is a point feature
			Dim objSelLayer,lngSelShapeType
			Set objSelLayer = Map.SelectionLayer
			lngSelShapeType = objSelLayer.Records.Fields.ShapeType
			If (lngSelShapeType=1 Or lngSelShapeType=11 Or lngSelShapeType=21) Then
				cPage(C_PC_CHK_SELECTED_C_P).enabled = true
			End If
		End If
		cPage(C_PC_CHK_CUSTOM_C_P).enabled = true				
		If (Application.UserProperties ("intPointCSource") = C_POINT_C_CUSTOM) Then
			cPage(C_PC_EDIT_CUSTOM_C_E).enabled = true
			cPage(C_PC_EDIT_CUSTOM_C_N).enabled = true
		End If
		Application.UserProperties ("intPointCSetStatus") = C_POINT_C_UNSET
		cPage(C_PC_BTN_SET_C).text = "SET C"
		Application.UserProperties ("dblPointC_X") = -1.0
		Application.UserProperties ("dblPointC_Y") = -1.0
		
		Application.UserProperties ("intHdASetStatus") = C_HDA_UNSET
		Application.UserProperties ("intIDSetStatus") = C_ID_UNSET
		aidPage(C_PAID_LBL_HDIST_VAL).text = "---"
		aidPage(C_PAID_LBL_A_VAL).text = "---"
		aidPage(C_PAID_EDIT_INCL).value = "0.0"
		aidPage(C_PAID_LBL_IDIST_VAL).text = "---"
		

		
	End If
	
	Set cPage = nothing
	Set aidPage = nothing
	
	'MsgBox (CStr(Application.UserProperties ("dblPointC_X")) & " - " & CStr(Application.UserProperties ("dblPointC_Y")))''''''''''''''''''''''''''''DEBUG
End Sub

Private Sub NM_chkSelectedP_click()
	If (ThisEvent.Object.value = true) Then
		Dim cPage
		Set cPage = ThisEvent.Object.Parent

		'disable point custom controls
		cPage(C_PC_CHK_CUSTOM_C_P).value = false
		cPage(C_PC_EDIT_CUSTOM_C_N).enabled = false
		cPage(C_PC_EDIT_CUSTOM_C_E).enabled = false
		'set point c source as selected
		Application.UserProperties ("intPointCSource") = C_POINT_C_SELECTED
		Set cPage = nothing
	Else
		ThisEvent.Object.value = true
	End if
End Sub

Private Sub NM_chkCustomP_click()
	If (ThisEvent.Object.value = true) Then
		Dim cPage
		Set cPage = ThisEvent.Object.Parent
		'enable point custom controls
		cPage(C_PC_EDIT_CUSTOM_C_N).enabled = true
		cPage(C_PC_EDIT_CUSTOM_C_E).enabled = true
		'unflag point selected 
		cPage(C_PC_CHK_SELECTED_C_P).value = false
		'set point c source as custom
		Application.UserProperties ("intPointCSource") = C_POINT_C_CUSTOM
		Set cPage = nothing
	Else
		ThisEvent.Object.value = true
	End If
End Sub

Private Sub NM_chkGpsFPoint_click()
	If (ThisEvent.Object.value = true) Then
		Dim fPage
		Set fPage = ThisEvent.Object.Parent

		'disable point custom controls
		fPage(C_PF_CHK_CUSTOM_F_P).value = false
		fPage(C_PF_EDIT_CUSTOM_F_N).enabled = false
		fPage(C_PF_EDIT_CUSTOM_F_E).enabled = false
		
		'enable point gps controls
		fPage(C_PF_EDIT_GPS_POS_E).enabled = true
		fPage(C_PF_BTN_REC_GPS_F).enabled = true

		fPage(C_PF_BTN_RESET_GPS_F).enabled = true
		
		'set point c source as selected
		Application.UserProperties ("intPointFSource") = C_POINT_F_GPS
		Set fPage = nothing
	Else
		ThisEvent.Object.value = true
	End if
End Sub

Private Sub NM_chkCustomFPoint_click()
	If (ThisEvent.Object.value = true) Then
		Dim fPage
		Set fPage = ThisEvent.Object.Parent

		'disable point gps controls
		fPage(C_PF_CHK_GPS_F_P).value = false
		fPage(C_PF_EDIT_GPS_POS_E).enabled = false
		fPage(C_PF_BTN_REC_GPS_F).enabled = false
		fPage(C_PF_BTN_STOP_GPS_F).enabled = false
		fPage(C_PF_BTN_RESET_GPS_F).enabled = false
		
		'enable point custom controls
		fPage(C_PF_EDIT_CUSTOM_F_N).enabled = true
		fPage(C_PF_EDIT_CUSTOM_F_E).enabled = true
		
		'set point c source as selected
		Application.UserProperties ("intPointFSource") = C_POINT_F_CUSTOM
		Set fPage = nothing
	Else
		ThisEvent.Object.value = true
	End if
End Sub

Private Sub NM_btnRecGpsF_Click()
	Dim fPage
	Set fPage = ThisEvent.Object.Parent
	if CEF_value_check_integer(fPage(C_PF_EDIT_GPS_POS_E).Value) then
		if CEF_value_check_range(fPage(C_PF_EDIT_GPS_POS_E).Value,0,9999) then
		
			'set control enable
			fPage(C_PF_EDIT_GPS_POS_E).Enabled = false
			fPage(C_PF_BTN_REC_GPS_F).Enabled = false
			fPage(C_PF_BTN_STOP_GPS_F).Enabled = true
			fPage(C_PF_BTN_RESET_GPS_F).Enabled = false
			
			fPage(C_PF_CHK_GPS_F_P).Enabled = false
			fPage(C_PF_CHK_CUSTOM_F_P).Enabled = false
			
			'set GPS REC global variable
			Application.UserProperties ("intPointFTotPos") = fPage(C_PF_EDIT_GPS_POS_E).value
			ReDim arrayPointFPosX(CInt(fPage(C_PF_EDIT_GPS_POS_E).value))
			ReDim arrayPointFPosY(CInt(fPage(C_PF_EDIT_GPS_POS_E).value))
			
			Application.UserProperties ("dblPointFAvgX") = 0.0
			Application.UserProperties ("dblPointFAvgY") = 0.0
			Application.UserProperties ("intPointFNumPos") = 0
			
			fPage(C_PF_LBL_GPS_POS_R).text = "0"
			fPage(C_PF_EDIT_GPS_F_N).value = "0"
			fPage(C_PF_EDIT_GPS_F_E).value = "0"
				
			
			
			'get pdop filter
			Dim n_Level, n_Active, n_PDOP
			Call GetAntennaSettings(n_Level, n_Active, n_PDOP)
			If (n_Active) Then
				Application.UserProperties ("intPdopValue") = n_PDOP
			Else
				Application.UserProperties ("intPdopValue") = 100
			End If
            
            
            'start positioning
			Application.UserProperties ("intPointFGpsRec") = C_POINT_F_GPS_REC
            Application.UserProperties ("intPointFGpsRecType") = C_POINT_F_GPS_REC_TYPE_NPM
			
			'unable button SET F
			fPage(C_PF_BTN_SET_F).Enabled = false
			
			
		end if
	end if
	Set fPage = nothing
End Sub

Private Sub GetAntennaSettings(ByRef p_Level, ByRef p_Active, ByRef p_PDOP)
	'Path to ArcPadPrefs.apx file 
	Dim strArcPadAPX 
	strArcPadAPX = Application.System.Properties("PersonalFolder") & "\ArcPadPrefs.apx" 

	'Attempt to create a reference to the MSXML DOM 
	On Error Resume Next 
	Dim pXML 
	Set pXML = CreateObject("Microsoft.XMLDOM") 
	If Err.Number <> 0 Then 
		MsgBox "MSXML is not present on this device.", vbCritical, "No MSXML" 
		Exit Sub 
	End If 
	On Error GoTo 0 
	
	'Read in ArcPadPrefs.apx 
	pXML.async = False
	Dim blnExists 
	blnExists = pXML.Load(strArcPadAPX) 
	
	Dim pNewElement ' Used for new elements that may need to be created along the way 
	
	'If it doesn't exist, create one 
	If Not blnExists Then 
		Set pNewElement = pXML.createNode(1,"ArcPad","") 
		Set pXML.documentElement = pNewElement 
		Set pNewElement = pXML.createNode(1,"PREFERENCES","") 
		pXML.documentElement.appendChild(pNewElement) 
		Set pNewElement = Nothing 
	End If 
	
	'Get the GPS and PREFERENCES element 
	Dim pPREFSElement, pGPSElement 
	Set pPREFSElement = pXML.documentElement.selectSingleNode("PREFERENCES") 
	Set pGPSElement = pPREFSElement.selectSingleNode("GPS") 
	
	'If the GPS element doesn't exist, create it 
	If pGPSElement Is Nothing Then 
		Set pNewElement = pXML.createNode(1,"GPS","") 
		Set pGPSElement = pPREFSElement.appendChild(pNewElement) 
		Set pNewElement = Nothing 
	End If 
	
	'Get the QUALITYCONTROL element 
	Dim pQLTElement 
	Set pQLTElement = pGPSElement.selectSingleNode("QUALITYCONTROL") 
	
	'If it doesn't exist, create it 
	If pQLTElement Is Nothing Then 
		Set pNewElement = pXML.createNode(1,"QUALITYCONTROL","") 
		Set pQLTElement = pGPSElement.appendChild(pNewElement) 
		Set pNewElement = Nothing
		pQLTElement.setAttribute "level", 0
	End If
	
	'Get the PDOP element 
	Dim pPDOPElement 
	Set pPDOPElement = pQLTElement.selectSingleNode("PDOP") 
	
	'If it doesn't exist, create it 
	If pPDOPElement Is Nothing Then 
		Set pNewElement = pXML.createNode(1,"PDOP","") 
		Set pPDOPElement = pQLTElement.appendChild(pNewElement) 
		Set pNewElement = Nothing
		pPDOPElement.setAttribute "active", "false"
		pPDOPElement.setAttribute "maximum", 8
	End If
	
	'Get the EPE element 
	Dim pEPEElement 
	Set pEPEElement = pQLTElement.selectSingleNode("EPE") 
	
	'If it doesn't exist, create it 
	If pEPEElement Is Nothing Then 
		Set pNewElement = pXML.createNode(1,"EPE","") 
		Set pEPEElement = pQLTElement.appendChild(pNewElement) 
		Set pNewElement = Nothing
	End If
	
	'Get the MODE element 
	Dim pMODEElement 
	Set pMODEElement = pQLTElement.selectSingleNode("MODE") 
	
	'If it doesn't exist, create it 
	If pMODEElement Is Nothing Then 
		Set pNewElement = pXML.createNode(1,"MODE","") 
		Set pMODEElement = pQLTElement.appendChild(pNewElement) 
		Set pNewElement = Nothing
	End If

	'Save the changes to ArcPadPrefs.apx 
	pXML.Save strArcPadAPX 
		
	'Force ArcPad to reload the settings from ArcPadPrefs.apx 
	Preferences.Read()
	
	'Get the attributes of the AVERAGING element
	p_Level = pQLTElement.getAttribute("level")
	If IsNull (p_Level) Then
		p_Level = 0
		pQLTElement.setAttribute "level", 0
	End if
	p_Active = pPDOPElement.getAttribute("active")
	If IsNull (p_Active) Then
		p_Active = "false"
		pPDOPElement.setAttribute "active", "false"
	End if
	p_PDOP = pPDOPElement.getAttribute("maximum")
	If IsNull (p_PDOP) Then
		p_PDOP = 8
		pPDOPElement.setAttribute "maximum", 8
	End if

	'Free resources 
	Set pXML = Nothing 
	Set pPREFSElement = Nothing
	Set pGPSElement = Nothing
	Set pQLTElement = Nothing 
	Set pPDOPElement = Nothing
	Set pEPEElement = Nothing
	Set pMODEElement = Nothing

End Sub

Private Sub NM_btnStopGpsF_Click()
	Dim fPage
	Set fPage = ThisEvent.Object.Parent
	If MsgBox("Stop GPS positioning?",vbYesNo) = vbYes Then	
	
		fPage(C_PF_BTN_REC_GPS_F).Enabled = false
		fPage(C_PF_BTN_STOP_GPS_F).Enabled = false
		fPage(C_PF_BTN_RESET_GPS_F).Enabled = true
		
		'stop positioning
		Application.UserProperties ("intPointFGpsRec") = C_POINT_F_GPS_STOP
        
		
		'make available SET button and f point choice chks
		fPage(C_PF_BTN_SET_F).Enabled = true
		fPage(C_PF_CHK_GPS_F_P).Enabled = true
		fPage(C_PF_CHK_CUSTOM_F_P).Enabled = true
	End If
	Set fPage = nothing
End Sub

Private Sub NM_btnResetGpsF_Click()
	Dim fPage
	Set fPage = ThisEvent.Object.Parent

	If MsgBox("Reset GPS recs?",vbYesNo) = vbYes Then	
		'reset global variables F mean position
		Application.UserProperties ("dblPointFAvgX") = 0.0
		Application.UserProperties ("dblPointFAvgY") = 0.0
		Application.UserProperties ("intPointFNumPos") = 0
		fPage(C_PF_EDIT_GPS_POS_E).Enabled = true
        fPage(C_PF_EDIT_GPS_POS_E).value = C_PF_DEFALUT_POS_E
		fPage(C_PF_EDIT_GPS_POS_E).value = C_PF_DEFALUT_POS_E
		fPage(C_PF_EDIT_GPS_F_N).value = "0"
		fPage(C_PF_EDIT_GPS_F_E).value = "0"
		
		fPage(C_PF_BTN_REC_GPS_F).Enabled = true
		fPage(C_PF_BTN_STOP_GPS_F).Enabled = false
		fPage(C_PF_BTN_RESET_GPS_F).Enabled = false
		
		ReDim arrayPointFPosX(CInt(fPage(C_PF_EDIT_GPS_POS_E).value))
		ReDim arrayPointFPosY(CInt(fPage(C_PF_EDIT_GPS_POS_E).value))
						
	End If
	Set fPage = nothing
	
End Sub

Private Sub GpsOnPosition_EventHandler()
	Dim p 
	Dim SumX,SumY,SumPDOP
	Dim i
	Dim fForm,fPage
' 	Dim cgpsPage

	'check point f recording
	
	If CInt(Application.UserProperties ("intPointFGpsRec")) = C_POINT_F_GPS_REC Then
		If (CDbl(Application.GPS.Properties("PDOP")) <= CDbl(Application.UserProperties ("intPdopValue"))) Then
			'check if total point f reached
			Application.UserProperties ("intPointFNumPos") = Application.UserProperties ("intPointFNumPos") +1
			p = CInt(Application.UserProperties ("intPointFNumPos"))
			If  p <= CInt(Application.UserProperties ("intPointFTotPos")) Then
				arrayPointFPosX(p)=Application.GPS.X
				arrayPointFPosY(p)=Application.GPS.Y
                
                
                
				SumX = 0
				SumY = 0
				for i=1 to (p)
					SumX = SumX + arrayPointFPosX(i)
					SumY = SumY + arrayPointFPosY(i)
				Next
				Application.UserProperties ("dblPointFAvgX") = SumX / p
				Application.UserProperties ("dblPointFAvgY") = SumY / p
				
				'display avg data in page f
                Dim appApplets, CEF_Applet
                Set appApplets = Application.Applets
                Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
                If Application.UserProperties ("intPointFGpsRecType") = C_POINT_F_GPS_REC_TYPE_POS Then
                    Set fForm = CEF_Applet.Forms(C_FORM_POS)
                Else
                    Set fForm = CEF_Applet.Forms(C_FORM_NAV_MEDIA)
                End If
				Set	fPage = fForm.Pages(C_PF_PAGE_F)
				fPage(C_PF_LBL_GPS_POS_R).text = CStr(p)
	
				fPage(C_PF_EDIT_GPS_F_E).value = CStr(Round((Application.UserProperties ("dblPointFAvgX")),2))
				fPage(C_PF_EDIT_GPS_F_N).value = CStr(Round((Application.UserProperties ("dblPointFAvgY")),2))
	
				Set fForm = nothing
				Set	fPage = nothing	
			Else
				Call pointFAvgReached
			End If
		End If
	End If
	
End Sub

Private Sub pointFAvgReached()
	'set GPS REC global variable
	Application.UserProperties ("intPointFGpsRec") = C_POINT_F_GPS_STOP
	
	Dim fForm,fPage
    Dim appApplets, CEF_Applet
    Set appApplets = Application.Applets
    Set CEF_Applet = appApplets.Item(CEF_APPLET_APP)
    If Application.UserProperties ("intPointFGpsRecType") = C_POINT_F_GPS_REC_TYPE_POS Then
        Set fForm = CEF_Applet.Forms(C_FORM_POS)
    Else
        Set fForm = CEF_Applet.Forms(C_FORM_NAV_MEDIA)
    End If
	
	Set	fPage = fForm.Pages(C_PF_PAGE_F)
		
	fPage(C_PF_EDIT_GPS_POS_E).Enabled = true
	fPage(C_PF_BTN_REC_GPS_F).Enabled = false
	fPage(C_PF_BTN_STOP_GPS_F).Enabled = false
	fPage(C_PF_BTN_RESET_GPS_F).Enabled = true
	
	'stop positioning
	Application.UserProperties ("intPointFGpsRec") = C_POINT_F_GPS_STOP
	
    
	'make available SET button and f point choice chks
	fPage(C_PF_BTN_SET_F).Enabled = true
    If Application.UserProperties ("intPointFGpsRecType") = C_POINT_F_GPS_REC_TYPE_NPM Then
        fPage(C_PF_CHK_GPS_F_P).Enabled = true
        fPage(C_PF_CHK_CUSTOM_F_P).Enabled = true
        MsgBox("Point F recorded")
    Else
        MsgBox("Point recorded")
    End If
    
    
	
	
	Set fForm = nothing
	Set	fPage = nothing
	
End Sub

Private Sub NM_btnSetF_Click()
	Dim fPage,aidPage
	Set fPage = ThisEvent.Object.Parent
	Set aidPage = fPage.Parent.Pages(C_PAID_PAGE_AID)
' 	Dim cgpsPage
' 	Set cgpsPage = fPage.Parent.Pages(C_PCGPS_PAGE_CGPS)
' 	Dim offPage
' 	Set offPage = fPage.Parent.Pages(C_POFFSET_PAGE_OFFSET)
	'if f not set
	If (Application.UserProperties ("intPointFSetStatus") = C_POINT_F_UNSET) Then
		If (Application.UserProperties ("intPointFSource") = C_POINT_F_GPS) Then
			Application.UserProperties ("intPointFSetStatus") = C_POINT_F_SET
			Application.UserProperties ("dblPointF_X") = Application.UserProperties ("dblPointFAvgX")
			Application.UserProperties ("dblPointF_Y") = Application.UserProperties ("dblPointFAvgY")
			fPage(C_PF_EDIT_GPS_POS_E).Enabled = false
			fPage(C_PF_BTN_REC_GPS_F).Enabled = false
			fPage(C_PF_BTN_STOP_GPS_F).Enabled = false
			fPage(C_PF_BTN_RESET_GPS_F).Enabled = false
			fPage(C_PF_CHK_GPS_F_P).Enabled = false
			fPage(C_PF_CHK_CUSTOM_F_P).Enabled = false

			fPage(C_PF_BTN_SET_F).text = "UNSET F"
		ElseIf (Application.UserProperties ("intPointFSource") = C_POINT_F_CUSTOM) Then
			If (CEF_value_check_real(fPage(C_PF_EDIT_CUSTOM_F_N).value) and CEF_value_check_real(fPage(C_PF_EDIT_CUSTOM_F_E).value)) Then
				Application.UserProperties ("intPointFSetStatus") = C_POINT_F_SET
				Application.UserProperties ("dblPointF_X") = CDbl(fPage(C_PF_EDIT_CUSTOM_F_E).value)
				Application.UserProperties ("dblPointF_Y") = CDbl(fPage(C_PF_EDIT_CUSTOM_F_N).value)
				fPage(C_PF_EDIT_CUSTOM_F_E).Enabled = false
				fPage(C_PF_EDIT_CUSTOM_F_N).Enabled = false	
				fPage(C_PF_CHK_GPS_F_P).Enabled = false
				fPage(C_PF_CHK_CUSTOM_F_P).Enabled = false
	
				fPage(C_PF_BTN_SET_F).text = "UNSET F"
			Else
				MsgBox ("Le coordinate devono essere numeri reali!")
			End If		
		Else
			'do nothing
		End If
	'else if f is set
	Else
		If (Application.UserProperties ("intPointFSource") = C_POINT_F_GPS) Then
			Application.UserProperties ("intPointFSetStatus") = C_POINT_F_UNSET
			
			fPage(C_PF_EDIT_GPS_POS_E).Enabled = true
			fPage(C_PF_BTN_REC_GPS_F).Enabled = false
			fPage(C_PF_BTN_STOP_GPS_F).Enabled = false
			fPage(C_PF_BTN_RESET_GPS_F).Enabled = true
			fPage(C_PF_CHK_GPS_F_P).Enabled = true
			fPage(C_PF_CHK_CUSTOM_F_P).Enabled = true

			fPage(C_PF_BTN_SET_F).text = "SET F"
			
			Application.UserProperties ("intHdASetStatus") = C_HDA_UNSET
			Application.UserProperties ("intIDSetStatus") = C_ID_UNSET
			aidPage(C_PAID_LBL_HDIST_VAL).text = "---"
			aidPage(C_PAID_LBL_A_VAL).text = "---"
			aidPage(C_PAID_EDIT_INCL).value = "0.0"
			aidPage(C_PAID_LBL_IDIST_VAL).text = "---"
			
		ElseIf (Application.UserProperties ("intPointFSource") = C_POINT_F_CUSTOM) Then
			Application.UserProperties ("intPointFSetStatus") = C_POINT_F_UNSET
			
			fPage(C_PF_EDIT_CUSTOM_F_E).Enabled = true
			fPage(C_PF_EDIT_CUSTOM_F_N).Enabled = true	
				
			fPage(C_PF_CHK_GPS_F_P).Enabled = true
			fPage(C_PF_CHK_CUSTOM_F_P).Enabled = true

			fPage(C_PF_BTN_SET_F).text = "SET F"
			
			Application.UserProperties ("intHdASetStatus") = C_HDA_UNSET
			Application.UserProperties ("intIDSetStatus") = C_ID_UNSET
			aidPage(C_PAID_LBL_HDIST_VAL).text = "---"
			aidPage(C_PAID_LBL_A_VAL).text = "---"
			aidPage(C_PAID_EDIT_INCL).value = "0.0"
			aidPage(C_PAID_LBL_IDIST_VAL).text = "---"
		Else
			'do nothing
		End If

	End If
	Set fPage = nothing
	Set aidPage = nothing
	'MsgBox (CStr(Application.UserProperties ("dblPointC_X")) & " - " & CStr(Application.UserProperties ("dblPointC_Y")))''''''''''''''''''''''''''''DEBUG
End Sub

Private Sub NM_btnSetParamC_Click()
	Dim dcPage
	Set dcPage = ThisEvent.Object.Parent
	Dim aidPage
	Set aidPage = dcPage.Parent.Pages(C_PAID_PAGE_AID)

' 	Dim cgpsPage
' 	Set cgpsPage = dcPage.Parent.Pages(C_PCGPS_PAGE_CGPS)
' 	Dim offPage
' 	Set offPage = dcPage.Parent.Pages(C_POFFSET_PAGE_OFFSET)
	If (Application.UserProperties ("intParamCSetStatus") = C_PARAM_C_UNSET) Then
		If (CEF_value_check_real(dcPage(C_DC_EDIT_CONST_C).value)) Then

			Application.UserProperties ("dblParamCValue") = dcPage(C_DC_EDIT_CONST_C).value
			dcPage(C_DC_EDIT_CONST_C).enabled = false
			dcPage(C_DC_BTN_SET_PARAM_C).text = "UNSET DC"

			Application.UserProperties ("intParamCSetStatus") = C_PARAM_C_SET
		Else
			MsgBox ("Il parametro C deve essere un numero reale!")
		End If
	Else
		Application.UserProperties ("dblParamCValue") = dcPage(C_DC_EDIT_CONST_C).value
		dcPage(C_DC_EDIT_CONST_C).enabled = true
		dcPage(C_DC_BTN_SET_PARAM_C).text = "SET DC"
		Application.UserProperties ("intParamCSetStatus") = C_PARAM_C_UNSET
		Application.UserProperties ("intHdASetStatus") = C_HDA_UNSET
		Application.UserProperties ("intIDSetStatus") = C_ID_UNSET
		aidPage(C_PAID_LBL_HDIST_VAL).text = "---"
		aidPage(C_PAID_LBL_A_VAL).text = "---"
		aidPage(C_PAID_EDIT_INCL).value = "0.0"
		aidPage(C_PAID_LBL_IDIST_VAL).text = "---"
			
		
	End If
	Set dcPage = nothing
	Set aidPage = nothing
End Sub

Private Sub NM_btnGetHdA_Click()
	'if c and f setted
	If ((Application.UserProperties ("intPointCSetStatus") = C_POINT_C_SET) and (Application.UserProperties ("intPointFSetStatus") = C_POINT_F_SET)  and (Application.UserProperties ("intParamCSetStatus") = C_PARAM_C_SET)) Then
		Dim aidPage
		Set aidPage = ThisEvent.Object.Parent

		
		Msgbox ("C Nord: " & CStr(Round((Application.UserProperties ("dblPointC_Y")),2)) & vbNewLine & "C Est: " & CStr(Round((Application.UserProperties ("dblPointC_X")),2)) & vbNewLine &"F Nord: " & CStr(Round((Application.UserProperties ("dblPointF_Y")),2)) & vbNewLine &"F Est: " & CStr(Round((Application.UserProperties ("dblPointF_X")),2))& vbNewLine &"Param C: " & CStr(Application.UserProperties ("dblParamCValue")) )
		'get horizontal distance
		Dim cxMinusFx, cyMinusFy
		cxMinusFx = (Application.UserProperties ("dblPointC_X")-Application.UserProperties ("dblPointF_X"))
		cyMinusFy = (Application.UserProperties ("dblPointC_Y")-Application.UserProperties ("dblPointF_Y"))
		Application.UserProperties ("dblFCHorDistance") = Sqr(cxMinusFx^2+cyMinusFy^2)
		aidPage(C_PAID_LBL_HDIST_VAL).text = CStr(Round((Application.UserProperties ("dblFCHorDistance")),2))
		'get azimuth
		'if F-->C distance is greater than 1 meter
		if Application.UserProperties ("dblFCHorDistance") > 1 then
			Dim pi
			pi = 4 * Atn(1)
			'from C and F choords
			'get azimuth from F to C with 0 at north
			'if C is exactly north to F
			If (cyMinusFy = 0) Then
				If (cxMinusFx > 0) then
					Application.UserProperties ("dblFCAzimuth") = 90.0 - Application.UserProperties ("dblParamCValue")
				Else
					Application.UserProperties ("dblFCAzimuth") = 270.0 - Application.UserProperties ("dblParamCValue")
				End If
			'else SUPERFORMULA
			Else
				If cyMinusFy<0 Then
					'azimuth = gradi(arctan((C.Y-F.Y)/(C.X-F.X)))+180-ParametroC
					Application.UserProperties ("dblFCAzimuth") = (180.0/pi)*(atn(cxMinusFx/cyMinusFy)) + 180 - Application.UserProperties ("dblParamCValue")
				Else
					If cxMinusFx<0 Then
						'azimuth = gradi(arctan((C.Y-F.Y)/(C.X-F.X)))+360-ParametroC
						Application.UserProperties ("dblFCAzimuth") = (180.0/pi)*(atn(cxMinusFx/cyMinusFy)) + 360 - Application.UserProperties ("dblParamCValue")
					'altrimenti se C.Y-F.Y >= 0
					Else
						'azimuth = gradi(arctan((C.Y-F.Y)/(C.X-F.X)))-ParametroC
						Application.UserProperties ("dblFCAzimuth") = (180.0/pi)*(atn(cxMinusFx/cyMinusFy)) - Application.UserProperties ("dblParamCValue")
					End If
				End If
			End If
			aidPage(C_PAID_LBL_A_VAL).text = CStr(Round((Application.UserProperties ("dblFCAzimuth")),0))
			
			Application.UserProperties ("intHdASetStatus") = C_HDA_SET
		Else
			MsgBox "La distanza tra F e C  inferiore al metro!"
		End If
		Set aidPage = nothing
	Else
		MsgBox ("Set C, F, DC!")
	End If
End Sub

Private Sub NM_btnGetId_Click()
	Dim aidPage
	set aidPage = ThisEvent.Object.Parent
	If(Application.UserProperties ("intHdASetStatus") = C_HDA_SET) then
		Dim pi
		pi = 4 * Atn(1)
		If((CEF_value_check_real(aidPage(C_PAID_EDIT_INCL).value)) and (CEF_value_check_range(CDbl(aidPage(C_PAID_EDIT_INCL).value),0, 89.9999))) Then
			aidPage(C_PAID_LBL_IDIST_VAL).text = CStr(Round((Application.UserProperties("dblFCHorDistance")/cos(CDbl(aidPage(C_PAID_EDIT_INCL).value)*pi/180)),2))
			Application.UserProperties ("intIDSetStatus") = C_ID_SET
		Else
			MsgBox("Inclinazione: numero reale compreso tra 0 e 89,9!")
		End If
	Else
		MsgBox("Prima calcolare dist/azimuth!") 
	End If
	set aidPage = nothing
End Sub


Private Sub CEF_FrmLISTBOX_onload()
    
	Dim pForm,pPage,filter
	Set pForm = ThisEvent.Object
	Set pPage = pForm("page1")
    pPage("lbox1").Clear
    Call pPage("lbox1").AddItemsFromTable(Application.UserProperties("CEF_TABDEC_DBF_PATH"),Application.UserProperties("LIST_FIELD_ID"),Application.UserProperties("LIST_FIELD_TEXT"), Application.UserProperties("LIST_FILTER"))
    
	Set pForm =  Nothing
	Set pPage = Nothing
End Sub

Private Sub CEF_FrmLISTBOX_page1_onvalidate()
	Dim pPage
	Set pPage = ThisEvent.Object
	If pPage("lbox1").ListIndex < 0 Then
       ThisEvent.Result = False             
       ThisEvent.MessageText = "Scegliere un elemento!"
       ThisEvent.MessageType = 48
       Exit Sub
	Else
		Application.UserProperties("FrmLISTBOX_RESULT_V") = pPage("lbox1").Value
        Application.UserProperties("FrmLISTBOX_RESULT_T") = pPage("lbox1").Text
        pPage("lbox1").Clear  
	End If
	Set pPage = Nothing
End Sub


Private Sub CEF_FrmGET_VALUE_onload()
    Dim pForm,pPage,filter
	Set pForm = ThisEvent.Object
	Set pPage = pForm("page1")
    pForm.Caption = Application.UserProperties("FrmGET_VALUE_TITLE")
    pPage("Lbl1").Text = Application.UserProperties("FrmGET_VALUE_LABEL")
	Set pForm =  Nothing
	Set pPage = Nothing
End Sub

Private Sub  CEF_FrmGET_VALUE_page1_onvalidate()
    Dim pPage
	Set pPage = ThisEvent.Object
    Application.UserProperties("FrmGET_VALUE_EDIT") = pPage("Edit1").Value
    pPage("Edit1").Value = ""
	Set pPage = Nothing
End Sub



'
'
' POSIZIONAMENTO MEDIO
'
'

'global constants 

' !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
'some are commented because already defined in NPM
' !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!





' Private Const C_POINT_C_UNDEFINED	= 0
' Private Const C_POINT_C_SELECTED	= 1
' Private Const C_POINT_C_CUSTOM		= 2
' 
' Private Const C_POINT_C_SET			= 0
' Private Const C_POINT_C_UNSET		= 1
' 
' Private Const C_POINT_F_UNDEFINED	= 0
' Private Const C_POINT_F_GPS			= 1
' Private Const C_POINT_F_CUSTOM		= 2
' 
' Private Const C_POINT_F_SET			= 0
' Private Const C_POINT_F_UNSET		= 1
' 
' const C_POINT_F_GPS_REC				= 1
' const C_POINT_F_GPS_STOP			= 0

' Private Const C_POINT_F_GPS_REC_TYPE_NPM  = 1
Private Const C_POINT_F_GPS_REC_TYPE_POS  = 2

' 
' Private Const C_PARAM_C_SET			= 0
' Private Const C_PARAM_C_UNSET		= 1
' 
' Private Const C_HDA_SET			= 0
' Private Const C_HDA_UNSET		= 1
' 
' Private Const C_ID_SET			= 0
' Private Const C_ID_UNSET		= 1
' 
' 
' Private Const C_OFFSET_UNSET 	= 0
' Private Const C_OFFSET_NO 		= 1
' Private Const C_OFFSET_GPS 		= 1
' 

Private Const C_AID_SET			= 0
Private Const C_AID_UNSET		= 1


'navmedia form const
Private Const C_FORM_POS 		= "FORM_POSIZIONAMENTO"



'page_aid page const


' Private Const C_PAID_PAGE_AID		    = "PAGE_AID"
Private Const C_PAID_EDIT_HDIST_VAL	    = "EDIT_HDIST_VAL"
Private Const C_PAID_EDIT_A_VAL		    = "EDIT_A_VAL"
' Private Const C_PAID_EDIT_INCL		    = "EDIT_INCL"
' Private Const C_PAID_BTN_GET_ID		    = "BTN_GET_ID"
' Private Const C_PAID_LBL_IDIST_VAL	    = "LBL_IDIST_VAL"
Private Const C_PAID_BTN_SET_PARAM_AID  = "BTN_SET_PARAM_AID"

'page_const page const

' Private Const C_DC_PAGE_CONST		= "PAGE_CONST"
' Private Const C_DC_EDIT_CONST_C 	= "EDIT_CONST_C"
' Private Const C_DC_BTN_SET_PARAM_C	= "BTN_SET_PARAM_C"

'page_f page const
' Private Const C_PF_PAGE_F			= "PAGE_F"
' Private Const C_PF_EDIT_GPS_POS_E	= "EDIT_GPS_POS_E"
' Private Const C_PF_LBL_GPS_POS_R	= "LBL_GPS_POS_R"
' Private Const C_PF_BTN_REC_GPS_F	= "BTN_REC_GPS_F"
' Private Const C_PF_BTN_STOP_GPS_F	= "BTN_STOP_GPS_F"
' Private Const C_PF_BTN_RESET_GPS_F	= "BTN_RESET_GPS_F"



' 
' Private Const C_PF_DEFALUT_POS_E 	= "170"
' 
' Private Const C_PF_CHK_GPS_F_P		= "CHK_GPS_F_P"
' Private Const C_PF_EDIT_GPS_F_N		= "EDIT_GPS_F_N"
' Private Const C_PF_EDIT_GPS_F_E		= "EDIT_GPS_F_E"
' 
' Private Const C_PF_CHK_CUSTOM_F_P	= "CHK_CUSTOM_F_P"
' Private Const C_PF_EDIT_CUSTOM_F_N	= "EDIT_CUSTOM_F_N"
' Private Const C_PF_EDIT_CUSTOM_F_E	= "EDIT_CUSTOM_F_E"
' 
' Private Const C_PF_BTN_SET_F		= "BTN_SET_F"

'page_c page const
' Private Const C_PC_PAGE_C				= "PAGE_C"

Private Const C_PC_LBL_SELECTED_C_N_VAL	= "LBL_SELECTED_C_N_VAL"
Private Const C_PC_LBL_SELECTED_C_E_VAL	= "LBL_SELECTED_C_E_VAL"
Private Const C_PC_LBL_SELECTED_C_POS_VAL	= "LBL_SELECTED_C_POS_VAL"
' Private Const C_PC_EDIT_PROJ 			= "EDIT_PROJ"


Private Sub POS_form_pos_load()
	Dim fForm,cPage,fPage,dcPage,aidPage
' 	Dim cgpsPage,offsetPage
	Set fForm = ThisEvent.Object
	
    Set aidPage = fForm.Pages(C_PAID_PAGE_AID)
	Set fPage = fForm.Pages(C_PF_PAGE_F)
	Set dcPage = fForm.Pages(C_DC_PAGE_CONST)
    Set cPage = fForm.Pages(C_PC_PAGE_C)
	
	
	
    
    ' set aid global varibles
	Application.UserProperties ("intHdASetStatus") = C_HDA_UNSET
	Application.UserProperties ("intIDSetStatus") = C_ID_UNSET
    Application.UserProperties ("dblAValue") = 0.0
    Application.UserProperties ("dblIDValue") = 0.0
    Application.UserProperties ("intAIDSetStatus") = C_AID_UNSET
	
    'set param c global variables
	Application.UserProperties ("dblParamCValue") = 0.0
	Application.UserProperties ("intParamCSetStatus") = C_POINT_F_UNSET	
	

    'set point f global variables as undefined
	Application.UserProperties ("dblPointFAvgX") = 0.0
	Application.UserProperties ("dblPointFAvgY") = 0.0
	Application.UserProperties ("intPointFNumPos") = 0
	Application.UserProperties ("dblPointF_X") = -1.0
	Application.UserProperties ("dblPointF_Y") = -1.0
	Application.UserProperties ("intPointFSetStatus") = C_POINT_F_UNSET
    
	'set point c source as undefined
	
	Application.UserProperties ("intPointCSetStatus") = C_POINT_C_UNSET
	Application.UserProperties ("intPointCNumPos") = 0
    Application.UserProperties ("intPointC_X") = 0.0
    Application.UserProperties ("intPointC_Y")  = 0.0
			
	

	
		

    
    '
    ' page AID init
    aidPage.Activate
    
    
    aidPage(C_PAID_EDIT_HDIST_VAL).Text = "0.0"
    aidPage(C_PAID_EDIT_A_VAL).Text = "0"
    aidPage(C_PAID_EDIT_INCL).Text = "0"
    aidPage(C_PAID_LBL_IDIST_VAL).Text = "0.0"
    aidPage(C_PAID_BTN_GET_ID).Enabled = true
    aidPage(C_PAID_BTN_SET_PARAM_AID).Enabled = false
    
    '
	' page f init
	fPage.Activate
	fPage(C_PF_BTN_STOP_GPS_F).Enabled = false
	fPage(C_PF_BTN_SET_F).Enabled = true
	'reset global variables F mean position
	Application.UserProperties ("dblPointFAvgX") = 0.0
	Application.UserProperties ("dblPointFAvgY") = 0.0
	Application.UserProperties ("intPointFNumPos") = 0
	fPage(C_PF_EDIT_GPS_POS_E).value = C_PF_DEFALUT_POS_E
	ReDim arrayPointFPosX(CInt(fPage(C_PF_EDIT_GPS_POS_E).value))
	ReDim arrayPointFPosY(CInt(fPage(C_PF_EDIT_GPS_POS_E).value))
	Application.UserProperties ("intPointFSource") = C_POINT_F_GPS
	
    
    
    
	'
	'page c init
	
	'display current projection
    
    cPage.Activate
    
	Dim currentCoordSys
	Set currentCoordSys = Map.CoordinateSystem
	cPage(C_PC_EDIT_PROJ).value = currentCoordSys.ProjectionName
	
	cPage(C_PC_LBL_SELECTED_C_N_VAL).Text = "---"
    cPage(C_PC_LBL_SELECTED_C_E_VAL).Text = "---"

	aidPage.Activate
	
	Set fForm = nothing
	Set cPage = nothing
	Set fPage = nothing
	Set dcPage = nothing
	
	
End Sub

Private Sub POS_form_pos_unload()
	'nav media global variables init
	Application.UserProperties ("intPointFGpsRec") = C_POINT_F_GPS_STOP
	Application.UserProperties ("dblPointFAvgX") = 0.0
	Application.UserProperties ("dblPointFAvgY") = 0.0
	Application.UserProperties ("intPointFNumPos") = 0
	Application.UserProperties ("intPointFTotPos") = 170
	
End Sub





Private Sub POS_page_c_querycancel()
	If MsgBox ("Sei sicuro di voler uscire dal POSIZIONAMENTO?", vbYesNo, "Warning!") = vbNO Then
		ThisEvent.Result = False
	End If
End Sub

Private Sub POS_page_c_onvalidate()
	If not Application.UserProperties("intPointCNumPos") > 0 Then
        Call MsgBox ("Posizionamento non completato!", vbExclamation, "POSIZIONAMENTO")
        ThisEvent.Result = False
    End If
End Sub


Private Sub POS_btnGetId_Click()
	Dim aidPage
	set aidPage = ThisEvent.Object.Parent
	If CEF_value_check_real(aidPage(C_PAID_EDIT_HDIST_VAL).value) then
		Dim pi
		pi = 4 * Atn(1)
		If((CEF_value_check_real(aidPage(C_PAID_EDIT_INCL).value)) and (CEF_value_check_range(CDbl(aidPage(C_PAID_EDIT_INCL).value),0, 89.9999))) Then
			aidPage(C_PAID_LBL_IDIST_VAL).text = CStr(Round((CDbl(aidPage(C_PAID_EDIT_HDIST_VAL).value)/cos(CDbl(aidPage(C_PAID_EDIT_INCL).value)*pi/180)),2))
			Application.UserProperties ("intIDSetStatus") = C_ID_SET
            aidPage(C_PAID_BTN_SET_PARAM_AID).Enabled = true
		Else
			MsgBox("Inclinazione: numero reale compreso tra 0 e 89,9!")
		End If
	Else
		MsgBox("Inserire distanza orizzontale valida!") 
	End If
	set aidPage = nothing
End Sub

Private Sub POS_btnSetParamAID_Click()
	Dim aidPage
	Set aidPage = ThisEvent.Object.Parent
	Dim cPage
	Set cPage = aidPage.Parent.Pages(C_PC_PAGE_C)

	If (Application.UserProperties ("intAIDSetStatus") = C_AID_UNSET) Then
		If (CEF_value_check_real(aidPage(C_PAID_LBL_IDIST_VAL).value) and CEF_value_check_range(aidPage(C_PAID_EDIT_A_VAL).value,0, 89.9999)) Then

			Application.UserProperties ("dblAValue") = aidPage(C_PAID_EDIT_A_VAL).value
            Application.UserProperties ("dblIDValue") = aidPage(C_PAID_LBL_IDIST_VAL).value
            aidPage(C_PAID_EDIT_HDIST_VAL).enabled = false
            aidPage(C_PAID_EDIT_A_VAL).enabled = false
            aidPage(C_PAID_EDIT_INCL).enabled = false
			aidPage(C_PAID_BTN_GET_ID).enabled = false
            
			aidPage(C_PAID_BTN_SET_PARAM_AID).text = "UNSET AID"
        
			Application.UserProperties ("intAIDSetStatus") = C_AID_SET
		Else
			MsgBox ("Il parametro C deve essere un numero reale!")
		End If
	Else
		aidPage(C_PAID_EDIT_HDIST_VAL).enabled = true
        aidPage(C_PAID_EDIT_A_VAL).enabled = true
        aidPage(C_PAID_EDIT_INCL).enabled = true
        aidPage(C_PAID_BTN_GET_ID).enabled = true
        aidPage(C_PAID_BTN_SET_PARAM_AID).Enabled = false
		aidPage(C_PAID_BTN_SET_PARAM_AID).text = "SET AID"
		Application.UserProperties ("intAIDSetStatus") = C_AID_UNSET
        
        
        cPage.Activate
        Application.UserProperties ("intPointCSetStatus") = C_POINT_C_UNSET
        cPage(C_PC_LBL_SELECTED_C_N_VAL).text = "---"
        cPage(C_PC_LBL_SELECTED_C_E_VAL).text = "---"
        cPage(C_PC_LBL_SELECTED_C_POS_VAL).text = "---"
        aidPage.Activate
        
			
		
	End If
	Set aidPage = nothing
	Set cPage = nothing
End Sub


Private Sub POS_btnRecGpsF_Click()
	Dim fPage
	Set fPage = ThisEvent.Object.Parent
	if CEF_value_check_integer(fPage(C_PF_EDIT_GPS_POS_E).Value) then
		if CEF_value_check_range(fPage(C_PF_EDIT_GPS_POS_E).Value,0,9999) then
		
			'set control enable
			fPage(C_PF_EDIT_GPS_POS_E).Enabled = false
			fPage(C_PF_BTN_REC_GPS_F).Enabled = false
			fPage(C_PF_BTN_STOP_GPS_F).Enabled = true
			fPage(C_PF_BTN_RESET_GPS_F).Enabled = false
			
			
			'set GPS REC global variable
                
			Application.UserProperties ("intPointFTotPos") = fPage(C_PF_EDIT_GPS_POS_E).value
			ReDim arrayPointFPosX(CInt(fPage(C_PF_EDIT_GPS_POS_E).value))
			ReDim arrayPointFPosY(CInt(fPage(C_PF_EDIT_GPS_POS_E).value))
			
			Application.UserProperties ("dblPointFAvgX") = 0.0
			Application.UserProperties ("dblPointFAvgY") = 0.0
			Application.UserProperties ("intPointFNumPos") = 0
			
			fPage(C_PF_LBL_GPS_POS_R).text = "0"
			fPage(C_PF_EDIT_GPS_F_N).value = "0"
			fPage(C_PF_EDIT_GPS_F_E).value = "0"
				
			
			
			'get pdop filter
			Dim n_Level, n_Active, n_PDOP
			Call GetAntennaSettings(n_Level, n_Active, n_PDOP)
			If (n_Active) Then
				Application.UserProperties ("intPdopValue") = n_PDOP
			Else
				Application.UserProperties ("intPdopValue") = 100
			End If
           
            
            'start positioning
			Application.UserProperties ("intPointFGpsRec") = C_POINT_F_GPS_REC
            Application.UserProperties ("intPointFGpsRecType") = C_POINT_F_GPS_REC_TYPE_POS
			
			'unable button SET F
			fPage(C_PF_BTN_SET_F).Enabled = false
			
			
		else
            Call MsgBox ("Numero di posizioni da acquisire non valido!", vbExclamation, "Warning!")
        end if
    else
        Call MsgBox ("Numero di posizioni da acquisire non valido!", vbExclamation, "Warning!")
	end if
	Set fPage = nothing
End Sub


Private Sub POS_btnStopGpsF_Click()
	Dim fPage
	Set fPage = ThisEvent.Object.Parent
	If MsgBox("Stop GPS positioning?",vbYesNo) = vbYes Then	
	
		fPage(C_PF_BTN_REC_GPS_F).Enabled = false
		fPage(C_PF_BTN_STOP_GPS_F).Enabled = false
		fPage(C_PF_BTN_RESET_GPS_F).Enabled = true
		
		'stop positioning
		Application.UserProperties ("intPointFGpsRec") = C_POINT_F_GPS_STOP
		
		'make available SET button and f point choice chks
		fPage(C_PF_BTN_SET_F).Enabled = true
	End If
	Set fPage = nothing
End Sub

Private Sub POS_btnResetGpsF_Click()
	Dim fPage
	Set fPage = ThisEvent.Object.Parent

	If MsgBox("Reset GPS recs?",vbYesNo) = vbYes Then	
		'reset global variables F mean position
		Application.UserProperties ("dblPointFAvgX") = 0.0
		Application.UserProperties ("dblPointFAvgY") = 0.0
		Application.UserProperties ("intPointFNumPos") = 0
		fPage(C_PF_LBL_GPS_POS_R).text = "0"
        fPage(C_PF_EDIT_GPS_POS_E).Enabled = true
		fPage(C_PF_EDIT_GPS_POS_E).value = C_PF_DEFALUT_POS_E
		fPage(C_PF_EDIT_GPS_F_N).value = "0"
		fPage(C_PF_EDIT_GPS_F_E).value = "0"
		
		fPage(C_PF_BTN_REC_GPS_F).Enabled = true
		fPage(C_PF_BTN_STOP_GPS_F).Enabled = false
		fPage(C_PF_BTN_RESET_GPS_F).Enabled = false
		
		ReDim arrayPointFPosX(CInt(fPage(C_PF_EDIT_GPS_POS_E).value))
		ReDim arrayPointFPosY(CInt(fPage(C_PF_EDIT_GPS_POS_E).value))
						
	End If
	Set fPage = nothing
	
End Sub

Private Sub POS_btnSetF_Click()
	Dim fPage,cPage
	Set fPage = ThisEvent.Object.Parent
	Set cPage = fPage.Parent.Pages(C_PC_PAGE_C)
' 	Dim cgpsPage
' 	Set cgpsPage = fPage.Parent.Pages(C_PCGPS_PAGE_CGPS)
' 	Dim offPage
' 	Set offPage = fPage.Parent.Pages(C_POFFSET_PAGE_OFFSET)
	'if f not set
	If (Application.UserProperties ("intPointFSetStatus") = C_POINT_F_UNSET) Then
		If CInt(fPage(C_PF_LBL_GPS_POS_R).Text)>0 Then
            Application.UserProperties ("intPointFSetStatus") = C_POINT_F_SET
            Application.UserProperties ("dblPointF_X") = Application.UserProperties ("dblPointFAvgX")
            Application.UserProperties ("dblPointF_Y") = Application.UserProperties ("dblPointFAvgY")
            Application.UserProperties ("intPointFNumPos") = CInt(fPage(C_PF_LBL_GPS_POS_R).Text)
            
            fPage(C_PF_EDIT_GPS_POS_E).Enabled = false
            fPage(C_PF_BTN_REC_GPS_F).Enabled = false
            fPage(C_PF_BTN_STOP_GPS_F).Enabled = false
            fPage(C_PF_BTN_RESET_GPS_F).Enabled = false

            fPage(C_PF_BTN_SET_F).text = "UNSET F"
        Else
            Call MsgBox ("Non e' stata registrata alcuna posizione GPS!",vbExclamation,"POSIZIONAMENTO")
        End If
	'else if f is set
	Else
		
        Application.UserProperties ("intPointFSetStatus") = C_POINT_F_UNSET
        
        fPage(C_PF_EDIT_GPS_POS_E).Enabled = true
        fPage(C_PF_BTN_REC_GPS_F).Enabled = false
        fPage(C_PF_BTN_STOP_GPS_F).Enabled = false
        fPage(C_PF_BTN_RESET_GPS_F).Enabled = true

        fPage(C_PF_BTN_SET_F).text = "SET F"
        
        
        
        cPage.Activate
        Application.UserProperties ("intPointCSetStatus") = C_POINT_C_UNSET
        cPage(C_PC_LBL_SELECTED_C_N_VAL).text = "---"
        cPage(C_PC_LBL_SELECTED_C_E_VAL).text = "---"
        cPage(C_PC_LBL_SELECTED_C_POS_VAL).text = "---"
        fPage.Activate
			
		

	End If
	Set fPage = nothing
	Set cPage = nothing
	'MsgBox (CStr(Application.UserProperties ("dblPointC_X")) & " - " & CStr(Application.UserProperties ("dblPointC_Y")))''''''''''''''''''''''''''''DEBUG
End Sub

Private Sub POS_btnSetParamC_Click()
	Dim dcPage
	Set dcPage = ThisEvent.Object.Parent
	Dim cPage
	Set cPage = dcPage.Parent.Pages(C_PC_PAGE_C)

' 	Dim cgpsPage
' 	Set cgpsPage = dcPage.Parent.Pages(C_PCGPS_PAGE_CGPS)
' 	Dim offPage
' 	Set offPage = dcPage.Parent.Pages(C_POFFSET_PAGE_OFFSET)
	If (Application.UserProperties ("intParamCSetStatus") = C_PARAM_C_UNSET) Then
		If (CEF_value_check_real(dcPage(C_DC_EDIT_CONST_C).value)) Then

			Application.UserProperties ("dblParamCValue") = dcPage(C_DC_EDIT_CONST_C).value
			dcPage(C_DC_EDIT_CONST_C).enabled = false
			dcPage(C_DC_BTN_SET_PARAM_C).text = "UNSET DC"

			Application.UserProperties ("intParamCSetStatus") = C_PARAM_C_SET
		Else
			MsgBox ("Il parametro C deve essere un numero reale!")
		End If
	Else
		dcPage(C_DC_EDIT_CONST_C).enabled = true
		dcPage(C_DC_BTN_SET_PARAM_C).text = "SET DC"
		Application.UserProperties ("intParamCSetStatus") = C_PARAM_C_UNSET
        
        
        cPage.Activate
        Application.UserProperties ("intPointCSetStatus") = C_POINT_C_UNSET
        cPage(C_PC_LBL_SELECTED_C_N_VAL).text = "---"
        cPage(C_PC_LBL_SELECTED_C_E_VAL).text = "---"
        cPage(C_PC_LBL_SELECTED_C_POS_VAL).text = "---"
        dcPage.Activate
        
			
		
	End If
	Set dcPage = nothing
	Set cPage = nothing
End Sub

Private Sub POS_btnGetCPOS_Click()
	'if c and f setted
	If ((Application.UserProperties ("intAIDSetStatus") = C_AID_SET) and (Application.UserProperties ("intPointFSetStatus") = C_POINT_F_SET)  and (Application.UserProperties ("intParamCSetStatus") = C_PARAM_C_SET)) Then
		Dim cPage
		Set cPage = ThisEvent.Object.Parent

		
		Msgbox ("Dist. offset: " & CStr(Application.UserProperties ("dblIDValue")) & vbNewLine & "Azimut offset: " & CStr(Application.UserProperties("dblAValue"))& vbNewLine &"Param C: " & CStr(Application.UserProperties ("dblParamCValue")) & vbNewLine &"F Nord: " & CStr(Round((Application.UserProperties ("dblPointF_Y")),2)) & vbNewLine &"F Est: " & CStr(Round((Application.UserProperties ("dblPointF_X")),2)) )
		
        
        Application.UserProperties ("intPointC_X") = Round((Application.UserProperties ("dblPointF_X") + Application.UserProperties("dblIDValue")*cos((Application.UserProperties("dblAValue")*3.14159/180))),2)
        Application.UserProperties ("intPointC_Y") = Round((Application.UserProperties ("dblPointF_Y") + Application.UserProperties("dblIDValue")*sin((Application.UserProperties("dblAValue")*3.14159/180))),2)
        Application.UserProperties ("intPointCNumPos") = Application.UserProperties ("intPointFNumPos")
        
        cPage(C_PC_LBL_SELECTED_C_N_VAL).Text = Application.UserProperties ("intPointC_Y")
        cPage(C_PC_LBL_SELECTED_C_E_VAL).Text = Application.UserProperties ("intPointC_X")
        cPage(C_PC_LBL_SELECTED_C_POS_VAL).Text = Application.UserProperties ("intPointCNumPos")
        
		Set cPage = nothing
	Else
		MsgBox ("Set AID, DC, F!")
	End If
End Sub





'
'
'
'   UTILITY FUNCTIONS
'
'


Private Sub CEF_check_integer()
	Dim pControl
	Set pControl = ThisEvent.Object
	Dim varValue
	varValue = pControl.Value
	If Not IsNumeric(varValue) Then
		ThisEvent.Result = False
		ThisEvent.MessageText = pControl.Name & ": inserire un valore numerico intero"
		ThisEvent.MessageType = vbExclamation
		Set pControl = Nothing
		Exit Sub
	End If
	Dim decimal_value
	decimal_value = Abs(varValue-fix(varValue))
	If decimal_value > 0 Then
		ThisEvent.Result = False
		ThisEvent.MessageText = pControl.Name & ": inserire un valore numerico intero"
		ThisEvent.MessageType = vbExclamation
		Set pControl = Nothing
		Exit Sub
	End If
	Set pControl = Nothing
End Sub

Private Sub CEF_check_real()
	Dim pControl
	Set pControl = ThisEvent.Object
	Dim varValue
	varValue = pControl.Value
	If IsNumeric(varValue) = False Then
		ThisEvent.Result = False
		ThisEvent.MessageText = pControl.Name & ": inserire un valore numerico (123.45)"
		ThisEvent.MessageType = vbExclamation
	End If
	Set pControl = Nothing
End Sub

Private Sub CEF_check_range(p_Min, p_Max)
	Dim pControl
	Set pControl = ThisEvent.Object

	Dim varValue
	varValue = pControl.Value
	If IsNumeric(varValue) Then
		If IsNull(p_Min) Then
			If CDbl(varValue) > p_Max Then
				ThisEvent.Result = False
				ThisEvent.MessageText = pControl.Name & ": inserire valore < " & p_Max
				ThisEvent.MessageType = vbExclamation
			End If
			Set pControl = Nothing
			Exit Sub
		ElseIf IsNull(p_Max) Then
			If CDbl(varValue) < p_Min Then
				ThisEvent.Result = False
				ThisEvent.MessageText = pControl.Name & ": inserire valore > " & p_Min
				ThisEvent.MessageType = vbExclamation
			End If
			Set pControl = Nothing
			Exit Sub
		ElseIf (CDbl(varValue) < CDbl(p_Min) Or CDbl(varValue) > p_Max) Then
			ThisEvent.Result = False
			ThisEvent.MessageText = pControl.Name & ": inserire valore compreso tra " & p_Min & " e " & p_Max
			ThisEvent.MessageType = vbExclamation
		End If
	Else
		ThisEvent.Result = False
		ThisEvent.MessageText = pControl.Name & ": inserire un valore numerico"
		ThisEvent.MessageType = vbExclamation
	End If

	Set pControl = Nothing
End Sub

function CEF_value_check_integer(varValue)

	If IsNumeric(varValue) = False Then
		CEF_value_check_integer = False
		Exit function
	End If
	Dim decimal_value
	decimal_value = Abs(varValue-fix(varValue))
	If decimal_value > 0 Then
		CEF_value_check_integer = False
		Exit function
	End If
	CEF_value_check_integer = True
End function

function CEF_value_check_real(varValue)
	If IsNumeric(varValue) = False Then
		CEF_value_check_real = False
		Exit function
	End If
	CEF_value_check_real = True
end function

function CEF_value_check_range(varValue,p_Min, p_Max)
	If IsNumeric(varValue) = False Then
		CEF_value_check_range = False
		Exit function
	Else
		If IsNull(p_Min) Then
			If CDbl(varValue) > p_Max Then
				CEF_value_check_range = False
				Exit function
			End If
		ElseIf IsNull(p_Max) Then
			If CDbl(varValue) < p_Min Then
				CEF_value_check_range = False
				Exit function
			End If
		ElseIf (CDbl(varValue) < CDbl(p_Min) Or CDbl(varValue) > p_Max) Then
			CEF_value_check_range = False
			Exit function
		End If
	End If
	CEF_value_check_range = True
End function




Sub SwapRows(ary,row1,row2)
  '== This proc swaps two rows of an array 
  Dim x,tempvar
  For x = 0 to Ubound(ary,2)
    tempvar = ary(row1,x)    
    ary(row1,x) = ary(row2,x)
    ary(row2,x) = tempvar
  Next
End Sub  'SwapRows

Private Sub QuickSort(vec,loBound,hiBound,SortField)

  '==--------------------------------------------------------==
  '== Sort a 2 dimensional array on SortField                ==
  '==                                                        ==
  '== This procedure is adapted from the algorithm given in: ==
  '==    ~ Data Abstractions & Structures using C++ by ~     ==
  '==    ~ Mark Headington and David Riley, pg. 586    ~     ==
  '== Quicksort is the fastest array sorting routine for     ==
  '== unordered arrays.  Its big O is  n log n               ==
  '==                                                        ==
  '== Parameters:                                            ==
  '== vec       - array to be sorted                         ==
  '== SortField - The field to sort on (2nd dimension value) ==
  '== loBound and hiBound are simply the upper and lower     ==
  '==   bounds of the array's 1st dimension.  It's probably  ==
  '==   easiest to use the LBound and UBound functions to    ==
  '==   set these.                                           ==
  '==--------------------------------------------------------==

  Dim pivot(),loSwap,hiSwap,temp,counter
  Redim pivot (Ubound(vec,2))

  '== Two items to sort
  if hiBound - loBound = 1 then
    if vec(loBound,SortField) > vec(hiBound,SortField) then Call SwapRows(vec,hiBound,loBound)
  End If

  '== Three or more items to sort
  
  For counter = 0 to Ubound(vec,2)
    pivot(counter) = vec(int((loBound + hiBound) / 2),counter)
    vec(int((loBound + hiBound) / 2),counter) = vec(loBound,counter)
    vec(loBound,counter) = pivot(counter)
  Next

  loSwap = loBound + 1
  hiSwap = hiBound
  
  do
    '== Find the right loSwap
    while loSwap < hiSwap and vec(loSwap,SortField) <= pivot(SortField)
      loSwap = loSwap + 1
    wend
    '== Find the right hiSwap
    while vec(hiSwap,SortField) > pivot(SortField)
      hiSwap = hiSwap - 1
    wend
    '== Swap values if loSwap is less then hiSwap
    if loSwap < hiSwap then Call SwapRows(vec,loSwap,hiSwap)


  loop while loSwap < hiSwap
  
  For counter = 0 to Ubound(vec,2)
    vec(loBound,counter) = vec(hiSwap,counter)
    vec(hiSwap,counter) = pivot(counter)
  Next
    
  '== Recursively call function .. the beauty of Quicksort
    '== 2 or more items in first section
    if loBound < (hiSwap - 1) then Call QuickSort(vec,loBound,hiSwap-1,SortField)
    '== 2 or more items in second section
    if hiSwap + 1 < hibound then Call QuickSort(vec,hiSwap+1,hiBound,SortField)

End Sub  'QuickSort

Private Sub ConsolePrintArray2dim(array2dim,up1,up2)
    Dim i,j
    For i=1 To up1
        Dim row
        row = ""
        For j=1 To up2
            row = row & array2dim(i,j) & " "
        Next
        Console.print row
    Next
End Sub

Private Function ComboFind(byval combo,value)
    dim i
    For i = 0 To combo.Listcount-1
        combo.Listindex = i
        If StrComp(combo.value,value) = 0 then
            ComboFind = i
            exit function
        End If
    Next
    ComboFind = -1
End Function

