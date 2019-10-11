
# OBJETIVO PRINCIPAL  del  Estudio [I N T E G R A] ----------



# Estrategia de intervencion integral en pacientes con mal control Glucemico de la diabetis mellitus tipo2 
# en el ambito de atencion primaria. 

#Determinar si el control glucemico , medido por la concentacion media de la HbA1C del paciente deficentement
#controlado  con DM2, mejora cuando es evaluado y tratado en el ambito de atencion primaria mediante
#una de las TRES estrategias inetgrales propuestas en el estudio!.

#ESTUDIO DE INTERVENCIoN CUASI-EXPERIMENTAL, CONTROLADO , DE GRUPOS PARALELOS, en el 
#que participaran todos los sujetos con DM2 y deficiente control glucemico de 13 centros de atencion primaria.


#GRUPO Intervencion 1 :[GInt1](se realizara mediante una estrategia multiple integrada en el protocolo.)

#GRUPO Intervencion 2 :[GInt2](se realizara mediante una estrategia multiple integrada en el protocolo.)

#Grupo Control        :El Grupo control estara formado por difernetes centros donde se ha seguido el control habitual
#                      por el medico de familia i enfermera segun el protcolo actual de ICS.
#                      Los datos del grupo Control seran obtenidos a partir del SIDIAP.
#


# VISITA PRESELECCION:V0 (Evaluacion de los resultados de la analatica sangunia, no requiere la presencia del paciente)
# despues de la V0, inclusion de los pacientes definitivos en el estudio.
# Comunicacion a los pacientes que no se incluyen en el estudio.

# Citacion de los pacientes para V1.
# VISITA INICIAL A GInt1  V1 :  V1(BASAL),CRD[anamnesis general  y exploracion fisica basicas en relacion Diabetis]
# V2 (03 meses despues v1)
# V3 (06 meses despues v1)
# v4 (12 meses despues v1)

# VISITA INICIAL A GInt2  V1 :  V1(BASAL),CRD[anamnesis general  y exploracion fisica basicas en relacion Diabetis]
# V2 (03 meses despu?s v1)
# v4 (12 meses despues v1)

#RECORDEM!!!

#Dependiendo del progreso y tipo de su diabetes, 
#existen tratamientos con y sin insulina. 
#Aprenda las diferencias. 
#Si le acaban de diagnosticar o vive con diabetes desde hace tiempo, 
#hay muchos medicamentos que podrian ayudarle a bajar el azucar en la sangre. 
#Algunos de los usados mas frecuentemente se describen en la siguiente seccion.

#Su medico evaluara su situacion y recomendara un medicamento con o sin insulina. 
#Recuerde que la diabetes progresa con el tiempo y que usar insulina no significa que usted ha hecho algo indebido, 
#solo que su tratamiento tendra que ajustarse para conformar los cambios en su diabetes.


#Medicamentos sin insulina:

#       Pildoras llamadas antidiabeticos orales (ADO, tambien conocidos como OAD, por sus siglas en ingles)
#       Inyecciones (que no llevan insulina)

#Pildoras: Antidiabeticos orales

#En general, los antidiabeticos orales son la primera categoria de medicamentos para la diabetes 
#que su medico le dara si tiene niveles altos de azucar en la sangre. 
#Esta es una lista de los medicamentos orales que m?s suelen recetarse y como ayudan a controlar el azucar en la sangre:

#       Metformina: Ayuda al cuerpo a utilizar la insulina que produce de manera mqs eficaz 
#       y reduce la cantidad de azucar que produce el higado

#       Sulfonilureas: Ayudan al cuerpo a liberar mas insulina

#       Inhibidores de la DPP-4: Ayudan a aumentar la produccion de insulina en el pancreas 
#       y a reducir la cantidad de azucar producida en el higado

#       Tiazolidinedionas (TZD): Ayudan a que la insulina funcione mejor en los musculos y 
#       la grasa, disminuyendo la resistencia a la insulina,
#       y tambi?n reducen la cantidad de azucar que se produce en el higado

#       Inhibidores del SGLT2: Bloquean la absorcion de azucar en los riñones, 
#       lo que ayuda a que el exceso de azucar salga del cuerpo a traves de la orina

# 0. Directori arrel i Lectura de FUNCIONS PROPIES ----


#----------------------------------------#.
library("plyr")
library("dplyr")
library("survminer")
library("purrr")
library("stringr")
library("tidyverse")
library("tidyr")
library("compareGroups")
library("rmarkdown")
library("RODBC")
library("devtools")
library("pander")
library("hablar")
#----------------------------------------#.

#----------------------------------------#.
##    [31.05.2019]--->[11.10.2019]
#----------------------------------------#.



#INTEGRA BBDD JULIO01.07.2019 


# setwd("C:/Users/38122893W/Desktop/INTEGRA_FINAL2")
# "C:/Users/38122893W/Desktop/INTEGRA_FINAL2"%>% file.path("FUNCIONS_PROPIES_RAI.r") %>% source()

"FUNCIONS_PROPIES_RAI.r" %>% source()


# funcions compartides github

link_source<-paste0("https://github.com/jrealgatius/Stat_codis/blob/master/funcions_propies.R","?raw=T")
devtools::source_url(link_source)


# 1. FASE LECTURA PRINCIPAL----                                 
# (LECTURA DE BASE DE DADES) 
   

#----------------------------------------------------------------------#
channel2<-odbcConnectAccess2007("dades/INTEGRABBDDJULIO01072019_22.07.2019.accdb")
#----------------------------------------------------------------------#


#INTEGRABBDDJULIO01072019
#INTEGRABBDDJULIO01072019_22.07.2019


#------------------------------------------------------------------------------------------------------#
#01#]
altreMedicacioADO <- sqlQuery( channel2, paste ("select * from altreMedicacioADO"))
#names(altreMedicacioADO)
altreMedicacioADO <- netejar.accents.variables(dt=altreMedicacioADO)
#names(altreMedicacioADO)
#[1] "Id"                                          "visita_id"                                  
#[3] "adoCombiMetforminaLinaglibtina_id_ALTRES"    "adoCombiMetforminaLinaglibtinadosis_ALTRES" 
#[5] "adoCombiMetforminaAlogliptina_id_ALTRES"     "adoCombiMetforminaAlogliptinadosis_ALTRES"  
#[7] "adoAlogliptina_id_ALTRES"                    "adoAlogliptina_dosis_ALTRES"                
#[9] "adoCombiAlogliptinaPioglitazona_id_ALTRES"   "adoCombiAlogliptinaPioglitazonadosis_ALTRES"
#[11] "adoCombMetforminaEmpaglifozina_id_ALTRES"    "adoCombMetforminaEmpaglifozinadosis_ALTRES" 
#[13] "adoCombMetforminaDapaglifozina_id_ALTRES"    "adoCombMetforminaDapaglifozinaDosis_ALTRES" 
#------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------# 
#02#]
altreMedicacioGr <- sqlQuery( channel2, paste ("select * from altreMedicacioGr"))
#names(altreMedicacioGr)
altreMedicacioGr <- netejar.accents.variables(dt=altreMedicacioGr)
#names(altreMedicacioGr)
#[1] "Id"                                          "visita_id"                                  
#[3] "altreMedicacioGralDescripORIGIGINAL_ALTRES"  "altreMedicacioPrincipioactivoDescrip_ALTRES"
#[5] "ATC_DDD_ALTRES"                              "pharmacologicalsubgroup_ALTRES"             
#[7] "altreMedicacioGral_id_ALTRES"                "antiagregantsPlaquetaris_id_ALTRES"         
#[9] "anticoagulants_id_ALTRES"                    "antihipertensius_id_ALTRES"                 
#[11] "hipolemiants_id_ALTRES"                      "ANTIDEPRESSANTS_id_ALTRES"                  
#[13] "ANTIPSYCHOTICS_id_ALTRES"                    "ANTIEPILEPTICS_id_ALTRES"                   
#[15] "ANXIOLYTICS_id_ALTRES"                       "OPIOIDS_id_ALTRES"                          
#[17] "CORTICOSTEROIDS_id_ALTRES"                   "OTHERANALGESICSANDANTIPYRETICS_id_ALTRES"   
#[19] "NSAID_ALTRES"                                "ADRENERGICS_INHALANTS_id_ALTRES"            
#[21] "THYROIDPREPARATIONS_id_ALTRES"               "HORMONES_id_ALTRES"                
#------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------#
#03#]
altreMedicacioInj <- sqlQuery( channel2, paste ("select * from altreMedicacioInj "))
#names(altreMedicacioInj )
altreMedicacioInj <- netejar.accents.variables(dt=altreMedicacioInj)
#names(altreMedicacioInj )
#[1] "Id"                                                     "visita_id"                                             
#[3] "altreMedicacioInjInsulinaPrincipioactivoDescrip_ALTRES" "injToujeo_id_ALTRES"                                   
#[5] "injToujeoDosi_ALTRES"                                   "injTresiba_id_ALTRES"                                  
#[7] "injTresibaDosi_ALTRES"                                  "injExenatida_id_ALTRES"                                
#[9] "injExenatidaDosi_ALTRES"                                "injAbasaglar_id_ALTRES"                                
#[11] "injAbasaglarDosi_ALTRES"                          
#------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------#
#04#] 
altresComplicacionsDescrip <- sqlQuery( channel2, paste ("select * from altresComplicacionsDescrip "))
#names(altresComplicacionsDescrip)
altresComplicacionsDescrip <- netejar.accents.variables(dt=altresComplicacionsDescrip)
#names(altresComplicacionsDescrip)
#[1] "Id"                                "visita_id"                         "altresComplicacionsDescrip_ALTRES"
#[4] "CIE10_ALTRES"                      "Teritorio_ALTRES1"                 "PATOLOGIATIROIDAL_id_ALTRES"      
#[7] "MPOC_id_ALTRES"                    "MALALTIESMENTALS_id_ALTRES"        "DISFUNCIOSEXUAL_id_ALTRES"        
#[10] "NEOPLASIES_id_ALTRES"              "PEUDIABETIC_id_ALTRES"             "AMPUTACIONS_id_ALTRES"    
#------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------#
#05#] 
altresProblemesSalut<- sqlQuery( channel2, paste ("select * from altresProblemesSalut"))
#names(altresProblemesSalut)
altresProblemesSalut<- netejar.accents.variables(dt=altresProblemesSalut)
#names(altresProblemesSalut)
#[1] "Id"                                  "visita_id"                           "altresProblemesSalutDescrip_ALTRES" 
#[4] "codigoCIE10_ALTRES"                  "Teritorio_ALTRES2"                   "PATOLOGIATIROIDALBASAL_id_ALTRES"   
#[7] "MPOCBASAL_id_ALTRES"                 "MALALTIESMENTALSBASAL_id_ALTRES"     "CARDIOPATIAISQUEMICABASAL_id_ALTRES"
#[10] "RETINOPATIADIABETICABASAL_id_ALTRES" "DISFUNCIOSEXUALBASAL_id_ALTRES"      "NEOPLASIESBASAL_id_ALTRES"          
#[13] "PEUDIABETICBASAL_id_ALTRES"          "AMPUTACIONSBASAL_id_ALTRES"         
#------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------#
#06#]
DT_ANALITICA<- sqlQuery( channel2, paste ("select * from DT_ANALITICA"))
#names(DT_ANALITICA)
DT_ANALITICA<- netejar.accents.variables(dt=DT_ANALITICA)
#names(DT_ANALITICA)
#[1] "Id"                              "visita_id"                       "alt"                            
#[4] "ast"                             "basofils"                        "colesterolHdl"                  
#[7] "colesterolLdl"                   "colesterolNoHdl"                 "colesterolTtl"                  
#[10] "concHGBCorspuscularMitja"        "creatinina"                      "dataAnalitica"                  
#[13] "eosinofils"                      "filtratGlomerular"               "formComplet"                    
#[16] "ggt"                             "glucosa"                         "hba1cIFCC"                      
#[19] "hba1cNGSP"                       "hematies"                        "hematocrit"                     
#[22] "hemoglobina"                     "hemoglobinaCorpuscularMitja"     "ide"                            
#[25] "leucocits"                       "linfocits"                       "monocits"                       
#[28] "neutrofils"                      "orinaCreatinina"                 "orinaMicroalbuminuria"          
#[31] "orinaMicroalbuminuriaCreatinina" "plaquetes"                       "triglicerids"                   
#[34] "verificat"                       "volumCorpuscularMig"             "filtratGlomerularSuperior60"    
#------------------------------------------------------------------------------------------------------# 
#------------------------------------------------------------------------------------------------------# 
#07#] 
DT_CENTRE<-sqlQuery( channel2, paste ("select * from DT_CENTRE"))
#names(DT_CENTRE)
DT_CENTRE<- netejar.accents.variables(dt=DT_CENTRE)
#names(DT_CENTRE)
#[1] "Id"              "centre_id"       "abrevCentre"     "codiCentre"      "grupIntervencio" "nomCentre"      
#[7] "pacients"
#------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------#
#08#]
DT_COMPLICACIONS<- sqlQuery( channel2, paste ("select * from DT_COMPLICACIONS"))
#names(DT_COMPLICACIONS)
DT_COMPLICACIONS<- netejar.accents.variables(dt=DT_COMPLICACIONS)
#names(DT_COMPLICACIONS)
#[1] "Id"                            "visita_id"                     "altresComplicacionsDescrip"   
#[4] "dataDxArteriopatiaPeriferica"  "dataDxCardiopatiaIsquemica"    "dataDxInsuficienciaCardiaca"  
#[7] "dataDxMalaltiaCerebrovascular" "dataDxNefropatiaDiabetica"     "dataDxNeuropatiaDiabetica"    
#[10] "dataDxRetinopatiaDiabetica"    "formComplet"                   "numHipoglucemiesGreus"        
#[13] "verificat"                     "altresComplicacions_id"        "arteriopatiaPeriferica_id"    
#[16] "cardiopatiaIsquemica_id"       "insuficienciaCardiaca_id"      "malaltiaCerebrovascular_id"   
#[19] "nefropatiaDiabetica_id"        "neuropatiaDiabetica_id"        "retinopatiaDiabetica_id"      
#------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------#
#09#]
DT_COSTOSSANITARIS<-sqlQuery( channel2, paste ("select * from DT_COSTOSSANITARIS"))
#names(DT_COSTOSSANITARIS)
DT_COSTOSSANITARIS<- netejar.accents.variables(dt=DT_COSTOSSANITARIS)
#names(DT_COSTOSSANITARIS)
#[1] "Id"                           "visita_id"                    "consExternaCopsRelDiabetesNo"
#[4] "consExternaCopsRelDiabetesSi" "costDerivacions"              "costIncapacitatsTemp"        
#[7] "costLaboratori"               "costMedicacio"                "costProfessionals"           
#[10] "costProvesCompl"              "costTiresReactives"           "costVisites"                 
#[13] "formComplet"                  "ingresCopsRelDiabetesNo"      "ingresCopsRelDiabetesSi"     
#[16] "numTiresReact1Any"            "urgenciesCopsRelDiabetesNo"   "urgenciesCopsRelDiabetesSi"  
#[19] "verificat"                    "consExterna_id"               "ingres_id"                   
#[22] "urgencies_id"   
#------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------#
#10#]
DT_CRITERIS<- sqlQuery( channel2, paste ("select * from DT_CRITERIS "))
#names(DT_CRITERIS)
DT_CRITERIS<- netejar.accents.variables(dt=DT_CRITERIS)
#names(DT_CRITERIS)
#[1] "Id"                                         "pacient_id"                                
#[3] "codiIdentificacioPacient"                   "codiUBA"                                   
#[5] "dataConsentiment"                           "formComplet"                               
#[7] "motiuNoConsentiment"                        "exclusioAltres_id"                         
#[9] "exclusioDroguesAlcohol_id"                  "exclusioEmabarasLactancia_id"              
#[11] "exclusioFarmacsMetabHidrocarb_id"           "exclusioHemoglobinapatiesAnemia_id"        
#[13] "exclusioIMCSuperior45_id"                   "exclusioInsufCardiaca34NYHA_id"            
#[15] "exclusioMalaltiaMentalDemencia_id"          "exclusioMalaltiaTerminal_id"               
#[17] "exclusioParticipacioAssaigClinicFarmacs_id" "exclusioTransplRenalDialisis_id"           
#[19] "exclusioTtFarmacsAprimar_id"                "exclusioTtGlucocorticoides_id"             
#[21] "exclusioTtImmunosupresors_id"               "exclusioTtNeoplasiaMaligna_id"             
#[23] "inclusioConsentiment_id"                    "inclusioDxDM2_id"                          
#[25] "inclusioEdat3080_id"                        "inclusioHba1cGrau9minim_id"                
#[27] "inclusioSenseCanvisTt_id"                   "exclusioCanvisTt_id"                       
#[29] "exclusioHba1cInferior9en3mesos_id"          "exclusioControlEndocrinoleg_id"
#------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------#
#11#]
DT_DEMOGRAFIA<- sqlQuery( channel2, paste ("select * from DT_DEMOGRAFIA "))
#names(DT_DEMOGRAFIA)
DT_DEMOGRAFIA<- netejar.accents.variables(dt=DT_DEMOGRAFIA)
#names(DT_DEMOGRAFIA)
#[1] "Id"                 "visita_id"          "dataNaixement"      "edat"               "formComplet"       
#[6] "verificat"          "sexe_id"            "codiSeguiment"      "etnia_id"           "altresEtniaDescrip"
#------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------# 
#12#]
DT_EXPLORACIOFISICA<- sqlQuery( channel2, paste ("select * from DT_EXPLORACIOFISICA "))
#names(DT_EXPLORACIOFISICA)
DT_EXPLORACIOFISICA<- netejar.accents.variables(dt=DT_EXPLORACIOFISICA)
#names(DT_EXPLORACIOFISICA)
#[1] "Id"               "visita_id"        "formComplet"      "freqCardiaca"     "imc"              "perimetreCintura"
#[7] "pes"              "talla"            "tensioDiastolica" "tensioSistolica"  "verificat"        "tensioBrac_id"
#------------------------------------------------------------------------------------------------------# 
#------------------------------------------------------------------------------------------------------#
#13#]
DT_FINALITZACIO<- sqlQuery( channel2, paste ("select * from DT_FINALITZACIO "))
#names(DT_FINALITZACIO)
DT_FINALITZACIO<- netejar.accents.variables(dt=DT_FINALITZACIO)
#names(DT_FINALITZACIO)
#[1] "Id"                            "pacient_id"                    "altresMotiusDescrip_Unificado"
#[4] "dataFiEstudi"                  "formComplet"                   "verificat"                    
#[7] "finalitzaEstudi_id"            "motiuFinalEstudi_id"     
#------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------#
#14#]
DT_HABITS_TOXICS<- sqlQuery( channel2, paste ("select * from DT_HABITS_TOXICS "))
#names(DT_HABITS_TOXICS)
DT_HABITS_TOXICS<- netejar.accents.variables(dt=DT_HABITS_TOXICS)
#names(DT_HABITS_TOXICS)
#[1] "Id"             "visita_id"      "cigarretsDia"   "dataFiTabac"    "dataIniciTabac" "formComplet"    "verificat"     
#[8] "fumador_id"  
#------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------#
#15#]
DT_HISTORIAMEDICA<- sqlQuery( channel2, paste ("select * from DT_HISTORIAMEDICA "))
#names(DT_HISTORIAMEDICA)
DT_HISTORIAMEDICA<- netejar.accents.variables(dt=DT_HISTORIAMEDICA)
#names(DT_HISTORIAMEDICA)
#[1] "Id"                          "visita_id"                   "altresProblemesSalutDescrip" "clinicalRiskGroup"          
#[5] "dataDxDislipemia"            "dataDxHta"                   "duracioDiabetesAnys"         "duracioDiabetesMesos"       
#[9] "formComplet"                 "grupMorbiditatAjustada"      "verificat"                   "altresProblemesSalut_id"    
#[13] "dislipemia_id"               "hta_id"                      "problemesSalut_id"
#------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------#
#16#]
DT_MEDICACIO_ADO<- sqlQuery( channel2, paste ("select * from DT_MEDICACIO_ADO"))
#names(DT_MEDICACIO_ADO)
DT_MEDICACIO_ADO<- netejar.accents.variables(dt=DT_MEDICACIO_ADO)
#names(DT_MEDICACIO_ADO)
#[1] "Id"                                  "visita_id"                           "adoAcarbosaDosi"                    
#[4] "adoCanagliflozinaDosi"               "adoClorpopramidaDosi"                "adoCombiGlimepiridaPioglitazonaDosi"
#[7] "adoCombiMetforminaPioglitazonaDosi"  "adoCombiMetforminaSaxaglitinaDosi"   "adoCombiMetforminaSitagliptinaDosi" 
#[10] "adoCombiMetforminaVildagliptinaDosi" "adoDapagliflozinaDosi"               "adoEmpagliflozinaDosi"              
#[13] "adoGlibenclamidaDosi"                "adoGlibornuridaDosi"                 "adoGliclazidaDosi"                  
#[16] "adoGlimepiridaDosi"                  "adoGlipizidaDosi"                    "adoGliquidonaDosi"                  
#[19] "adoLinagliptinaDosi"                 "adoMetforminaDosi"                   "adoMiglitolDosi"                    
#[22] "adoNateglinidaDosi"                  "adoPioglitazonaDosi"                 "adoRepaglinidaDosi"                 
#[25] "adoSaxagliptinaDosi"                 "adoSitagliptinaDosi"                 "adoTolbutamidaDosi"                 
#[28] "adoVildagliptinaDosi"                "altreMedicacioADODescrip"            "formComplet"                        
#[31] "verificat"                           "adoAcarbosa_id"                      "adoCanagliflozina_id"               
#[34] "adoClorpopramida_id"                 "adoCombiGlimepiridaPioglitazona_id"  "adoCombiMetforminaPioglitazona_id"  
#[37] "adoCombiMetforminaSaxaglitina_id"    "adoCombiMetforminaSitagliptina_id"   "adoCombiMetforminaVildagliptina_id" 
#[40] "adoDapagliflozina_id"                "adoEmpagliflozina_id"                "adoGlibenclamida_id"                
#[43] "adoGlibornurida_id"                  "adoGliclazida_id"                    "adoGlimepirida_id"                  
#[46] "adoGlipizida_id"                     "adoGliquidona_id"                    "adoLinagliptina_id"                 
#[49] "adoMetformina_id"                    "adoMiglitol_id"                      "adoNateglinida_id"                  
#[52] "adoPioglitazona_id"                  "adoRepaglinida_id"                   "adoSaxagliptina_id"                 
#[55] "adoSitagliptina_id"                  "adoTolbutamida_id"                   "adoVildagliptina_id"                
#[58] "altreMedicacioADO_id"               
#------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------#
#17#]
DT_MEDICACIO_GENERAL<- sqlQuery( channel2, paste ("select * from DT_MEDICACIO_GENERAL"))
#names(DT_MEDICACIO_GENERAL)
DT_MEDICACIO_GENERAL<- netejar.accents.variables(dt=DT_MEDICACIO_GENERAL)
#names(DT_MEDICACIO_GENERAL)
#[1] "Id"                          "visita_id"                   "altreMedicacioGralDescrip"   "formComplet"                
#[5] "verificat"                   "altreMedicacioGral_id"       "antiagregantsPlaquetaris_id" "anticoagulants_id"          
#[9] "antihipertensius_id"         "hipolemiants_id"     
#------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------#
#18#]
DT_MEDICACIO_INJECTABLES<- sqlQuery( channel2, paste ("select * from DT_MEDICACIO_INJECTABLES"))
#names(DT_MEDICACIO_INJECTABLES)
DT_MEDICACIO_INJECTABLES<- netejar.accents.variables(dt=DT_MEDICACIO_INJECTABLES)
#names(DT_MEDICACIO_INJECTABLES)
#[1] "Id"                               "visita_id"                        "altreMedicacioInjInsulinaDescrip"
#[4] "formComplet"                      "injAbasaglarDosi"                 "injAbiglutidaDosi"               
#[7] "injActrapidDosi"                  "injApidraDosi"                    "injExenatidaDosi"                
#[10] "injHumalogBasalDosi"              "injHumalogDosi"                   "injHumalogMix25Dosi"             
#[13] "injHumalogMix50Dosi"              "injHumilana3070Dosi"              "injHumulinaNPHDosi"              
#[16] "injHumulinaRegularDosi"           "injInsulatardDosi"                "injLantusDosi"                   
#[19] "injLevemirDosi"                   "injLiraglutidaDosi"               "injLixisenatideDosi"             
#[22] "injMixtard30Dosi"                 "injNovomix30Dosi"                 "injNovomix50Dosi"                
#[25] "injNovomix70Dosi"                 "injNovorapidDosi"                 "verificat"                       
#[28] "altreMedicacioInjInsulina_id"     "injAbasaglar_id"                  "injAbiglutida_id"                
#[31] "injActrapid_id"                   "injApidra_id"                     "injExenatida_id"                 
#[34] "injHumalog_id"                    "injHumalogBasal_id"               "injHumalogMix25_id"              
#[37] "injHumalogMix50_id"               "injHumilana3070_id"               "injHumulinaNPH_id"               
#[40] "injHumulinaRegular_id"            "injInsulatard_id"                 "injLantus_id"                    
#[43] "injLevemir_id"                    "injLiraglutida_id"                "injLixisenatide_id"              
#[46] "injMixtard30_id"                  "injNovomix30_id"                  "injNovomix50_id"                 
#[49] "injNovomix70_id"                  "injNovorapid_id"                 
#------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------#
#[  DT_PACIENT_DISCONTINUADOS     ]
#[  DT_PACIENT_EXCLUIDOS          ]
#[  DT_PACIENT_FALLO_DE_SCREENING ]
#[  DT_PACIENT_INCLUIDOS          ]
#------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------#
#19#]
DT_PACIENT_DISCONTINUADOS<- sqlQuery( channel2, paste ("select * from DT_PACIENT_DISCONTINUADOS"))
#names(DT_PACIENT_DISCONTINUADOS)
DT_PACIENT_DISCONTINUADOS<- netejar.accents.variables(dt=DT_PACIENT_DISCONTINUADOS)
#names(DT_PACIENT_DISCONTINUADOS)
#[1] "Id"                       "pacient_id"               "codiIdentificacioPacient" "codiPacient"             
#[5] "codiUBA"                  "dataCreacio"              "estat"                    "grupIntervencio"         
#[9] "usuari_id"                "centre_id"   
#------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------#
#20#]
DT_PACIENT_EXCLUIDOS<- sqlQuery( channel2, paste ("select * from DT_PACIENT_EXCLUIDOS"))
#names(DT_PACIENT_EXCLUIDOS)
DT_PACIENT_EXCLUIDOS<- netejar.accents.variables(dt=DT_PACIENT_EXCLUIDOS)
#names(DT_PACIENT_EXCLUIDOS)
#[1] "Id"                       "pacient_id"               "codiIdentificacioPacient" "codiPacient"             
#[5] "codiUBA"                  "dataCreacio"              "estat"                    "grupIntervencio"         
#[9] "usuari_id"                "centre_id"        
#------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------#
#21#]
DT_PACIENT_FALLO_DE_SCREENING<- sqlQuery( channel2, paste ("select * from DT_PACIENT_FALLO_DE_SCREENING"))
#names(DT_PACIENT_FALLO_DE_SCREENING)
DT_PACIENT_FALLO_DE_SCREENING<- netejar.accents.variables(dt=DT_PACIENT_FALLO_DE_SCREENING)
#names(DT_PACIENT_FALLO_DE_SCREENING)
#[1] "Id"                       "pacient_id"               "codiIdentificacioPacient" "codiPacient"             
#[5] "codiUBA"                  "dataCreacio"              "estat"                    "grupIntervencio"         
#[9] "usuari_id"                "centre_id"
#------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------#
#22#]
DT_PACIENT_INCLUIDOS<- sqlQuery( channel2, paste ("select * from DT_PACIENT_INCLUIDOS"))
#names(DT_PACIENT_INCLUIDOS)
DT_PACIENT_INCLUIDOS<- netejar.accents.variables(dt=DT_PACIENT_INCLUIDOS)
#names(DT_PACIENT_INCLUIDOS)
#[1] "Id"                       "pacient_id"               "codiIdentificacioPacient" "codiPacient"             
#[5] "codiUBA"                  "dataCreacio"              "estat"                    "grupIntervencio"         
#[9] "usuari_id"                "centre_id" 
#------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------#
#23#]
DT_SEGUIMENT<- sqlQuery( channel2, paste ("select * from DT_SEGUIMENT"))
#names(DT_SEGUIMENT)
DT_SEGUIMENT<- netejar.accents.variables(dt=DT_SEGUIMENT)
#names(DT_SEGUIMENT)
#[1] "Id"                        "visita_id"                 "formComplet"               "motiuNoSeguiment"         
#[5] "verificat"                 "seguimentRecomenacions_id"
#------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------#
#24#]
DT_VISITA<- sqlQuery( channel2, paste ("select * from DT_VISITA "))
#names(DT_VISITA)
DT_VISITA<- netejar.accents.variables(dt=DT_VISITA)
#names(DT_VISITA)
#[1] "Id"                 "tipus"              "visita_id"          "completa"           "dataVisita"        
#[6] "pacient_pacient_id"
#------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------#





################# P  A  R T       P R I M E R A   [EXCEL PACIENTS(TOTS)] 




#------------------------------------------------------------------------------------------------------#
#names(DT_PACIENT_DISCONTINUADOS)
#[1] "Id"                       "pacient_id"               "codiIdentificacioPacient" "codiPacient"              "codiUBA"                 
#[6] "dataCreacio"              "estat"                    "grupIntervencio"          "usuari_id"                "centre_id"               
#names(DT_PACIENT_EXCLUIDOS)
#[1] "Id"                       "pacient_id"               "codiIdentificacioPacient" "codiPacient"              "codiUBA"                 
#[6] "dataCreacio"              "estat"                    "grupIntervencio"          "usuari_id"                "centre_id"   
#names(DT_PACIENT_FALLO_DE_SCREENING)
#[1] "Id"                       "pacient_id"               "codiIdentificacioPacient" "codiPacient"              "codiUBA"                 
#[6] "dataCreacio"              "estat"                    "grupIntervencio"          "usuari_id"                "centre_id"               
#names(DT_PACIENT_INCLUIDOS)
#[1] "Id"                       "pacient_id"               "codiIdentificacioPacient" "codiPacient"              "codiUBA"                 
#[6] "dataCreacio"              "estat"                    "grupIntervencio"          "usuari_id"                "centre_id"               
#
#------------------------------------------------------------------------------------------------------#

#DT_PACIENT:[]
#DT_PACIENT_DISCONTINUADOS
#DT_PACIENT_EXCLUIDOS
#DT_PACIENT_FALLO DE SCREENING
#DT_PACIENT_INCLUIDOS
#
#DT_CRITERIS
#DT_FINALITZACIO


# 2. Fusio de         Taules PACIENTS: -----------------

DT_CRITERIS<-DT_CRITERIS%>%dplyr::select(-Id,-formComplet,-codiUBA,-codiIdentificacioPacient)
DT_FINALITZACIO<-DT_FINALITZACIO%>%dplyr::select(-Id,-formComplet,-verificat)
DT_CENTRE<-DT_CENTRE%>%dplyr::select(-grupIntervencio)

#variable.names(DT_CRITERIS)
#variable.names(DT_FINALITZACIO)
#variable.names(DT_CENTRE)

#variable.names(DT_PACIENT_DISCONTINUADOS)
#variable.names(DT_PACIENT_EXCLUIDOS)
#variable.names(DT_PACIENT_FALLO_DE_SCREENING)
#variable.names(DT_PACIENT_INCLUIDOS)



#
DT_PACIENT_DISCONTINUADOS<-DT_PACIENT_DISCONTINUADOS%>%left_join(DT_CRITERIS   ,by="pacient_id")
DT_PACIENT_DISCONTINUADOS<-DT_PACIENT_DISCONTINUADOS%>%left_join(DT_FINALITZACIO   ,by="pacient_id")%>%dplyr::select(-altresMotiusDescrip_Unificado,-Id)
DT_PACIENT_DISCONTINUADOS<-DT_PACIENT_DISCONTINUADOS%>%left_join(DT_CENTRE   ,by="centre_id")
DT_PACIENT_DISCONTINUADOS<-DT_PACIENT_DISCONTINUADOS%>%mutate(GR="DISC")
#variable.names(DT_PACIENT_DISCONTINUADOS)
#
DT_PACIENT_EXCLUIDOS<-DT_PACIENT_EXCLUIDOS%>%left_join(DT_CRITERIS   ,by="pacient_id")
DT_PACIENT_EXCLUIDOS<-DT_PACIENT_EXCLUIDOS%>%left_join(DT_FINALITZACIO   ,by="pacient_id")%>%dplyr::select(-altresMotiusDescrip_Unificado,-Id)
DT_PACIENT_EXCLUIDOS<-DT_PACIENT_EXCLUIDOS%>%left_join(DT_CENTRE   ,by="centre_id")
DT_PACIENT_EXCLUIDOS<-DT_PACIENT_EXCLUIDOS%>%mutate(GR="EXCL")
#variable.names(DT_PACIENT_EXCLUIDOS)
#
DT_PACIENT_FALLO_DE_SCREENING<-DT_PACIENT_FALLO_DE_SCREENING%>%left_join(DT_CRITERIS   ,by="pacient_id")
DT_PACIENT_FALLO_DE_SCREENING<-DT_PACIENT_FALLO_DE_SCREENING%>%left_join(DT_FINALITZACIO   ,by="pacient_id")%>%dplyr::select(-altresMotiusDescrip_Unificado,-Id)
DT_PACIENT_FALLO_DE_SCREENING<-DT_PACIENT_FALLO_DE_SCREENING%>%left_join(DT_CENTRE   ,by="centre_id")
DT_PACIENT_FALLO_DE_SCREENING<-DT_PACIENT_FALLO_DE_SCREENING%>%mutate(GR="FALL_SCREEN")
#variable.names(DT_PACIENT_FALLO_DE_SCREENING)
#
DT_PACIENT_INCLUIDOS<-DT_PACIENT_INCLUIDOS%>%left_join(DT_CRITERIS   ,by="pacient_id")
DT_PACIENT_INCLUIDOS<-DT_PACIENT_INCLUIDOS%>%left_join(DT_FINALITZACIO   ,by="pacient_id")%>%dplyr::select(-altresMotiusDescrip_Unificado,-Id)
DT_PACIENT_INCLUIDOS<-DT_PACIENT_INCLUIDOS%>%left_join(DT_CENTRE   ,by="centre_id")
DT_PACIENT_INCLUIDOS<-DT_PACIENT_INCLUIDOS%>%mutate(GR="INCL")
#variable.names(DT_PACIENT_INCLUIDOS)
#




# 3. Exploratori      Taules PACIENTS ---------------------

#i
DT_PACIENT_DISCONTINUADOS_taula<-descrTable(~.,data=DT_PACIENT_DISCONTINUADOS,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40)
#DT_PACIENT_DISCONTINUADOS_taula

#ii
DT_PACIENT_EXCLUIDOS_taula<-descrTable(~.,data=DT_PACIENT_EXCLUIDOS,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40)
#DT_PACIENT_EXCLUIDOS_taula

#iii
DT_PACIENT_FALLO_DE_SCREENING_taula<-descrTable(~.,data=DT_PACIENT_FALLO_DE_SCREENING,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40)
#DT_PACIENT_FALLO_DE_SCREENING_taula

#iv
DT_PACIENT_INCLUIDOS_taula<-descrTable(~.,data=DT_PACIENT_INCLUIDOS,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40)
#DT_PACIENT_INCLUIDOS_taula


#[Dades Corregides!]#
#Tabla PACIENTES INCLUIDOS
# Los pacientes que no tienen datos de exclusioHba1cInferior9en3mesos_id(codigo 1), 
# realmente deberian tener el codigo 2, ya que este criterio se añadia posteriori 
# y no se podia modificar el dato para los pacientes ya introducidos.
# Variable : exclusioControlEndocrinoleg_id: lo mismo

#DT_PACIENT_INCLUIDOS$exclusioHba1cInferior9en3mesos_id<-ifelse(DT_PACIENT_INCLUIDOS$exclusioHba1cInferior9en3mesos_id%%2==1,2,DT_PACIENT_INCLUIDOS$exclusioHba1cInferior9en3mesos_id)
#DT_PACIENT_INCLUIDOS$exclusioHba1cInferior9en3mesos_id

#[Dades Corregides!]#
#DT_PACIENT_INCLUIDOS<-DT_PACIENT_INCLUIDOS%>%mutate(exclusioHba1cInferior9en3mesos_id=case_when(exclusioHba1cInferior9en3mesos_id==1~ 2,TRUE~exclusioHba1cInferior9en3mesos_id))
#DT_PACIENT_INCLUIDOS$exclusioHba1cInferior9en3mesos_id

# el mateix:[]Variable : exclusioControlEndocrinoleg_id: lo mismo

##[Dades Corregides!]#
#DT_PACIENT_INCLUIDOS$exclusioControlEndocrinoleg_id<-ifelse(DT_PACIENT_INCLUIDOS$exclusioControlEndocrinoleg_id%%2==1,2,DT_PACIENT_INCLUIDOS$exclusioControlEndocrinoleg_id)
#DT_PACIENT_INCLUIDOS$exclusioControlEndocrinoleg_id

##[Dades Corregides!]#
#DT_PACIENT_INCLUIDOS<-DT_PACIENT_INCLUIDOS%>%mutate(exclusioControlEndocrinoleg_id=case_when(exclusioControlEndocrinoleg_id==1~2,TRUE~exclusioControlEndocrinoleg_id))
#DT_PACIENT_INCLUIDOS$exclusioControlEndocrinoleg_id





#-------------------------------#
#Taula Generla de  PACIENT  !!!
#-------------------------------#


DT_PACIENT<-rbind(DT_PACIENT_DISCONTINUADOS,DT_PACIENT_EXCLUIDOS,DT_PACIENT_FALLO_DE_SCREENING,DT_PACIENT_INCLUIDOS)
#DT_PACIENT
#names(DT_PACIENT)
#
conductor_variables1<-"taulavariables_TOTAL1.xls"

#0
#DT_PACIENT_taula<-descrTable(~.,data=DT_PACIENT,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40)
#DT_PACIENT_taula

Ordre_Taula1<-extreure.variables("taula_ordre1",conductor_variables1)
DT_PACIENT_ORD<-DT_PACIENT%>%select(Ordre_Taula1)

variable.names(DT_PACIENT_ORD)

#---------------#
DT_PACIENT_lab<-convertir_dates(d=DT_PACIENT_ORD,taulavariables=conductor_variables1)
#---------------#
DT_PACIENT_lab<-etiquetar(d=DT_PACIENT_lab,taulavariables=conductor_variables1)
#---------------#
DT_PACIENT_lab<-LAB_ETIQ_v2(dt=DT_PACIENT_lab,variables_factors=conductor_variables1,fulla="etiquetes0",idioma="etiqueta2")
#---------------#

#[excel pacients-->]
write.csv2(DT_PACIENT_ORD, file = "resultats/DT_PACIENT.csv")
write.csv2(DT_PACIENT_lab, file = "resultats/DT_PACIENT_lab.csv")






#------------------------------------------------------------------------------------------#
#P  A R T     D E S C R I P T I V A:P  A  R T       P R I M E R A   [EXCEL PACIENTS(TOTS)] #
#------------------------------------------------------------------------------------------#



#---------------#
formula_taula_HISTORIC<-formula_compare("taula_ordre1",y="grupIntervencio",taulavariables = conductor_variables1)
T0<-descrTable(formula_taula_HISTORIC,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_PACIENT_lab,max.xlev = 100)
T0
#---------------#


conductor_variables1<-"taulavariables_TOTAL1.xls"
#---------------#
DT_PACIENT_DISCONTINUADOS_lab<-convertir_dates(d=DT_PACIENT_DISCONTINUADOS,taulavariables=conductor_variables1)
#---------------#
DT_PACIENT_DISCONTINUADOS_lab<-etiquetar(d=DT_PACIENT_DISCONTINUADOS_lab,taulavariables=conductor_variables1)
#---------------#
DT_PACIENT_DISCONTINUADOS_lab<-LAB_ETIQ_v2(dt=DT_PACIENT_DISCONTINUADOS_lab,variables_factors=conductor_variables1,fulla="etiquetes0",idioma="etiqueta2")
#---------------#
#DT_PACIENT_DISCONTINUADOS_lab
#---------------#
#na.action=T
DT_PACIENT_DISCONTINUADOS_lab_taula<-descrTable(~.,data=DT_PACIENT_DISCONTINUADOS_lab,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40,show.n=T)
#---------------#
#DT_PACIENT_DISCONTINUADOS_lab_taula
#---------------#

#---------------#
formula_taula_HISTORIC<-formula_compare("taula_ordre1",y="grupIntervencio",taulavariables = conductor_variables1)
T1<-descrTable(formula_taula_HISTORIC,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_PACIENT_DISCONTINUADOS_lab,max.xlev = 40)
#T1
#---------------#


#---------------#
DT_PACIENT_EXCLUIDOS_lab<-convertir_dates(d=DT_PACIENT_EXCLUIDOS,taulavariables=conductor_variables1)
#---------------#
DT_PACIENT_EXCLUIDOS_lab<-etiquetar(d=DT_PACIENT_EXCLUIDOS_lab,taulavariables=conductor_variables1)
#---------------#
DT_PACIENT_EXCLUIDOS_lab<-LAB_ETIQ_v2(dt=DT_PACIENT_EXCLUIDOS_lab,variables_factors=conductor_variables1,fulla="etiquetes0",idioma="etiqueta2")
#---------------#
#DT_PACIENT_EXCLUIDOS_lab
#---------------#
#na.action=T
DT_PACIENT_EXCLUIDOS_lab_taula<-descrTable(~.,data=DT_PACIENT_EXCLUIDOS_lab,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40,show.n=T)
#---------------#
#DT_PACIENT_EXCLUIDOS_lab_taula
#---------------#
#---------------#
formula_taula_HISTORIC<-formula_compare("taula_ordre1",y="grupIntervencio",taulavariables = conductor_variables1)
T2<-descrTable(formula_taula_HISTORIC,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_PACIENT_EXCLUIDOS_lab,max.xlev = 40)
#T2
#---------------#


#---------------#
DT_PACIENT_FALLO_DE_SCREENING_lab<-convertir_dates(d=DT_PACIENT_FALLO_DE_SCREENING,taulavariables=conductor_variables1)
#---------------#
DT_PACIENT_FALLO_DE_SCREENING_lab<-etiquetar(d=DT_PACIENT_FALLO_DE_SCREENING_lab,taulavariables=conductor_variables1)
#---------------#
DT_PACIENT_FALLO_DE_SCREENING_lab<-LAB_ETIQ_v2(dt=DT_PACIENT_FALLO_DE_SCREENING_lab,variables_factors=conductor_variables1,fulla="etiquetes0",idioma="etiqueta2")
#---------------#
#DT_PACIENT_FALLO_DE_SCREENING_lab
#---------------#
#na.action=T
DT_PACIENT_FALLO_DE_SCREENING_lab_taula<-descrTable(~.,data=DT_PACIENT_FALLO_DE_SCREENING_lab,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40,show.n=T)
#---------------#
#DT_PACIENT_FALLO_DE_SCREENING_lab_taula
#---------------#
#---------------#
formula_taula_HISTORIC<-formula_compare("taula_ordre1",y="grupIntervencio",taulavariables = conductor_variables1)
T3<-descrTable(formula_taula_HISTORIC,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_PACIENT_FALLO_DE_SCREENING_lab,max.xlev = 40)
#T3
#---------------#


#---------------#
DT_PACIENT_INCLUIDOS_lab<-convertir_dates(d=DT_PACIENT_INCLUIDOS,taulavariables=conductor_variables1)
#---------------#
DT_PACIENT_INCLUIDOS_lab<-etiquetar(d=DT_PACIENT_INCLUIDOS_lab,taulavariables=conductor_variables1)
#---------------#
DT_PACIENT_INCLUIDOS_lab<-LAB_ETIQ_v2(dt=DT_PACIENT_INCLUIDOS_lab,variables_factors=conductor_variables1,fulla="etiquetes0",idioma="etiqueta2")
#---------------#
#DT_PACIENT_INCLUIDOS_lab
#---------------#
#na.action=T
DT_PACIENT_INCLUIDOS_lab_taula<-descrTable(~.,data=DT_PACIENT_INCLUIDOS_lab,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40,show.n=T)
#---------------#
#DT_PACIENT_INCLUIDOS_lab_taula
#---------------#
#---------------#
formula_taula_HISTORIC<-formula_compare("taula_ordre1",y="grupIntervencio",taulavariables = conductor_variables1)
T4<-descrTable(formula_taula_HISTORIC,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_PACIENT_INCLUIDOS_lab,max.xlev = 40)
#T4



#---------------#
#T0
#---------------#
#T1
#---------------#
#T2
#---------------#
#T3
#---------------#
#T4
#---------------#


#---------------#
save.image("resultats/INTEGRA_PACIENT.Rdata")



# 4. Fusio de         Taules VISITES HISTORIQUES i Taules MEDICAMENTS i PROBLEMES  dels (Pac. INCLUITS + Pac. DICONTINUATS) ---------------------


#   P  A  R T       S E G O N A    [B A S E     D E     D A D E S]
#------------------------------------------------------------------------------------#
# HISTORICS [Pacients INCLUITS N==299  + DICONTINUATS N=108]      --> N==407         # 
#------------------------------------------------------------------------------------#



#length(DT_PACIENT_INCLUIDOS$Id)
#n=299.
#length(DT_PACIENT_DISCONTINUADOS$Id)
#n=108.

#--------------------------------------#
#N=[407]
#--------------------------------------#

#

DT_PACIENT<-rbind(DT_PACIENT_DISCONTINUADOS,DT_PACIENT_INCLUIDOS)
DT_PACIENT_SELECT<-DT_PACIENT%>%dplyr::select(pacient_id)
 #names(DT_PACIENT_DISCONTINUADOS)
#names(DT_PACIENT_INCLUIDOS)

#DT_PACIENT_SELECT
#[DT_PACIENT_SELECT]# N==(407)









#[rectificat]#

#Tabla Dt_Demografia
#La etnia Arabe y gitana se tiene que  juntar con la etnia caucasica,
#Hay que analizar las columnas A, B, C, F, H 


#dataNiaxament/edat/Sexe/Etnia_id

#[rectificat]#

#DT_DEMOGRAFIA	<-DT_DEMOGRAFIA%>%mutate(etnia_id=case_when(altresEtniaDescrip=="gitana"~ 1,altresEtniaDescrip=="?rabe magreb?"~ 1,TRUE~etnia_id))
#DT_DEMOGRAFIA$altresEtniaDescrip
#DT_DEMOGRAFIA$etnia_id
#[1,2,3,4,5,6]#


#[rectificat]#

#Tabla DT_Historiamedica
#La variable duracioDiabetesAnys se tiene que convertir en duracioDiabetesMesos (convertir los a?os en meses) 
#Hay que analizar columnas: A, C, D, E, F, G, I, K, L, M, N
#Otros problemas de salud se tienen que clasificar por Angels


#

#DT_HISTORIAMEDICA$duracioDiabetesMesos

DT_HISTORIAMEDICA<-DT_HISTORIAMEDICA%>%mutate(duracioDiabetesMesos=if_na(duracioDiabetesMesos,0))
DT_HISTORIAMEDICA<-DT_HISTORIAMEDICA%>%mutate(duracioDiabetesMesos2=duracioDiabetesAnys*12+duracioDiabetesMesos)

#DT_HISTORIAMEDICA$duracioDiabetesMesos2







#
#altresProblemesSalut_agg<-altresProblemesSalut%>%
#  group_by(visita_id)%>%summarise( PATOLOGIATIROIDALBASAL_id_ALTRES2=max(MPOCBASAL_id_ALTRES),
#                                   MPOCBASAL_id_ALTRES2=max(MPOCBASAL_id_ALTRES),
#                                   MALALTIESMENTALSBASAL_id_ALTRES2=max(MALALTIESMENTALSBASAL_id_ALTRES),
#                                   CARDIOPATIAISQUEMICABASAL_id_ALTRES2=max(CARDIOPATIAISQUEMICABASAL_id_ALTRES),
#                                   RETINOPATIADIABETICABASAL_id_ALTRES2=max(RETINOPATIADIABETICABASAL_id_ALTRES),
#                                   DISFUNCIOSEXUALBASAL_id_ALTRES2=max(DISFUNCIOSEXUALBASAL_id_ALTRES),
#                                   NEOPLASIESBASAL_id_ALTRES2=max(NEOPLASIESBASAL_id_ALTRES),          
#                                   PEUDIABETICBASAL_id_ALTRES2=max(PEUDIABETICBASAL_id_ALTRES),
#                                   AMPUTACIONSBASAL_id_ALTRES2=max( AMPUTACIONSBASAL_id_ALTRES))
#
#variable.names(altresProblemesSalut)

# Metode alternatiu minimitzat #
altresProblemesSalut_agg<-altresProblemesSalut%>% 
  group_by(visita_id)%>% summarise_if(is.numeric,max,na.rm=T)



#variable.names(altresProblemesSalut_agg)
#variable.names(altresProblemesSalut)  


#ATOLOGIATIROIDALBASAL_id_ALTRES2=max(ATOLOGIATIROIDALBASAL_id_ALTRES),

# hem convertit els anys a mesos --> [duracioDiabetesMesos2]




#rectifiquem pacient_id=pacient_pacient_id  a la base de dades DT_VISITA




#-----------------------------------#
#1  DT_VISITA
#2  DT_PACIENT
#3  DT_DEMOGRAFIA
#4  DT_HISTORIAMEDICA
#5  DT_EXPLORACIOFISICA
#6  DT_ANALITICA
#7  DT_HABITS_TOXICS
#8  DT_SEGUIMENT
#9  DT_COSTOSSANITARIS 
#10 altresProblemesSalut_agg
#-----------------------------------#


#---------------##---------------##---------------##---------------##---------------#
DT_VISITA_HISTORIC<-DT_VISITA%>%mutate(pacient_id=pacient_pacient_id)%>%dplyr::select(tipus,pacient_id,visita_id,completa,dataVisita)
#De la base de dades dels Hist?rics agafem nom?s els PACIENT INCLU?TS [N=407!]
#FEM dues base de dades :[DT_VISITA_HISTORIC] i [DT_VISITA_HISTORIC_MES00]/mes00.
DT_VISITA_HISTORIC<-DT_VISITA_HISTORIC%>%filter(pacient_id%in%DT_PACIENT_SELECT$pacient_id)
#---------------##---------------##---------------##---------------##---------------#
DT_VISITA_HISTORIC<-DT_VISITA_HISTORIC%>%left_join(DT_PACIENT   ,by="pacient_id")%>%dplyr::select(-Id)
#names(DT_VISITA_HISTORIC)

#ii)
#DT_DEMOGRAFIA
DT_VISITA_HISTORIC1<-DT_VISITA_HISTORIC%>%left_join(DT_DEMOGRAFIA   ,by="visita_id")
#[traiem formComplet,verificat]
DT_VISITA_HISTORIC1<-DT_VISITA_HISTORIC1%>%dplyr::select(-formComplet,-verificat,-Id)
#names(DT_DEMOGRAFIA)
#--------------#
#iii)
#DT_HISTORIAMEDICA
DT_VISITA_HISTORIC1<-DT_VISITA_HISTORIC1%>%left_join(DT_HISTORIAMEDICA  ,by="visita_id")
#[traiem formComplet,verificat]
DT_VISITA_HISTORIC1<-DT_VISITA_HISTORIC1%>%dplyr::select(-formComplet,-verificat,-Id)
#names(DT_HISTORIAMEDICA)
#--------------#
#iv)
#DT_EXPLORACIOFISICA
DT_VISITA_HISTORIC1<-DT_VISITA_HISTORIC1%>%left_join(DT_EXPLORACIOFISICA  ,by="visita_id")
#[traiem formComplet,verificat]
DT_VISITA_HISTORIC1<-DT_VISITA_HISTORIC1%>%dplyr::select(-formComplet,-verificat,-Id)
#names(DT_EXPLORACIOFISICA)
#---------------#
#viii)
#DT_ANALITICA
DT_VISITA_HISTORIC1<-DT_VISITA_HISTORIC1%>%left_join(DT_ANALITICA ,by="visita_id")
#[traiem formComplet,verificat]
DT_VISITA_HISTORIC1<-DT_VISITA_HISTORIC1%>%dplyr::select(-formComplet,-verificat,-Id)
#names(DT_ANALITICA)
#--------------#
#ix)
#DT_HABITS_TOXICS
DT_VISITA_HISTORIC1<-DT_VISITA_HISTORIC1%>%left_join(DT_HABITS_TOXICS  ,by="visita_id")
#[traiem formComplet,verificat]
DT_VISITA_HISTORIC1<-DT_VISITA_HISTORIC1%>%dplyr::select(-formComplet,-verificat,-Id)
#names(DT_HABITS_TOXICS)
#--------------#
#x)
#DT_SEGUIMENT
DT_VISITA_HISTORIC1<-DT_VISITA_HISTORIC1%>%left_join(DT_SEGUIMENT  ,by="visita_id")
#[traiem formComplet,verificat]
DT_VISITA_HISTORIC1<-DT_VISITA_HISTORIC1%>%dplyr::select(-formComplet,-verificat,-Id)
#names(DT_SEGUIMENT)
#--------------#
#xii)
#DT_COSTOSSANITARIS
#--------------#
DT_VISITA_HISTORIC1<-DT_VISITA_HISTORIC1%>%left_join(DT_COSTOSSANITARIS ,by="visita_id")
#[traiem formComplet,verificat]
DT_VISITA_HISTORIC1<-DT_VISITA_HISTORIC1%>%dplyr::select(-formComplet,-verificat,-Id)
#names(DT_COSTOSSANITARIS)
#--------------#
#
#
#
#
#xiii)
#altresProblemesSalut
#--------------#
DT_VISITA_HISTORIC1<-DT_VISITA_HISTORIC1%>%left_join(altresProblemesSalut_agg ,by="visita_id")
#[traiem formComplet,verificat]
#names(altresProblemesSalut)

#eps!
#----------------------------------------------------------------------------#
#iii] iv]  TAULA PLANA!
#------------------------------------------------------#
##  TAULA PLANA MEDICAMENTS!
#DT_VISITA
#DT_MEDICACIO_INJECTABLES
#altreMedicacioInj
#DT_MEDICACIO_ADO
#altreMedicacioADO
#DT_MEDICACIO_GENERAL
#altreMedicacioGr

DT_VISITA_HISTORIC<-DT_VISITA%>%mutate(pacient_id=pacient_pacient_id)%>%dplyr::select(tipus,pacient_id,visita_id,completa,dataVisita)
DT_VISITA_HISTORIC2<-DT_MEDICACIO_INJECTABLES%>%dplyr::select(-Id,-verificat,-formComplet)%>%
  left_join(altreMedicacioInj   ,by="visita_id")%>%dplyr::select(-Id)%>%
  left_join(DT_MEDICACIO_ADO   ,by="visita_id")%>%dplyr::select(-Id,-verificat,-formComplet)%>%
  left_join(altreMedicacioADO   ,by="visita_id")%>%dplyr::select(-Id)%>%
  left_join(DT_MEDICACIO_GENERAL   ,by="visita_id")%>%dplyr::select(-Id,-verificat,-formComplet)%>%
  left_join(altreMedicacioGr   ,by="visita_id")%>%dplyr::select(-Id)
DT_VISITA_HISTORIC2<-DT_VISITA_HISTORIC2%>% left_join(DT_VISITA_HISTORIC ,by="visita_id")
DT_VISITA_HISTORIC2<-DT_VISITA_HISTORIC2%>%filter(pacient_id%in%DT_PACIENT_SELECT$pacient_id)
#----------------------------------------------------------------------------#
#Fer descripcio a partir dels basal:tipus="M00"[AGGREGATE!]
#----------------------------------------------------------------------------#
DT_VISITA_HISTORIC2<-DT_VISITA_HISTORIC2%>%left_join(DT_PACIENT   ,by="pacient_id")%>%dplyr::select(-Id)
#variable.names(DT_VISITA_HISTORIC2)
#----------------------------------------------------------------------------#
#
#DT_VISITA_HISTORIC2_agg<-DT_VISITA_HISTORIC2%>%filter(tipus=="Mes00")%>%group_by(visita_id)%>%
#            summarise(grupIntervencio=max(grupIntervencio),
#                      adoAcarbosa_id2=max(adoAcarbosa_id) ,
#                      adoCanagliflozina_id2=max(adoCanagliflozina_id),
#                      adoClorpopramida_id2=max(adoClorpopramida_id) ,
#                      adoCombiGlimepiridaPioglitazona_id2=max(adoCombiGlimepiridaPioglitazona_id) ,
#                      adoCombiMetforminaPioglitazona_id2=max(adoCombiMetforminaPioglitazona_id) ,
#                      adoCombiMetforminaSaxaglitina_id2=max(adoCombiMetforminaSaxaglitina_id) ,
#                      adoCombiMetforminaSitagliptina_id2=max(adoCombiMetforminaSitagliptina_id) ,
#                      adoCombiMetforminaVildagliptina_id2=max( adoCombiMetforminaVildagliptina_id) ,
#                      adoDapagliflozina_id2=max(adoDapagliflozina_id) ,
#                      adoEmpagliflozina_i2=max(adoEmpagliflozina_id) ,
#                      adoGlibenclamida_id2=max(adoGlibenclamida_id) ,
#                      adoGlibornurida_id2=max(adoGlibornurida_id) ,
#                      adoGliclazida_id2=max(adoGliclazida_id) ,
#                      adoGlimepirida_id2=max(adoGlimepirida_id) ,
#                      adoGlipizida_id2=max(adoGlipizida_id) ,
#                      adoGliquidona_id2=max(adoGliquidona_id) ,
#                      adoLinagliptina_id2=max(adoLinagliptina_id) ,
#                      adoMetformina_id2=max(adoMetformina_id) ,
#                      adoMiglitol_id2=max(adoMiglitol_id) ,
#                      adoNateglinida_id2=max(adoNateglinida_id) ,
#                      adoPioglitazona_id2=max(adoPioglitazona_id),
#                      adoRepaglinida_id2=max(adoRepaglinida_id),
#                      adoSaxagliptina_id2=max(adoSaxagliptina_id),
#                      adoSitagliptina_id2=max(adoSitagliptina_id),
#                      adoTolbutamida_id2=max(adoTolbutamida_id),
#                      adoVildagliptina_id2=max(adoVildagliptina_id),
#                      altreMedicacioADO_id2=max(altreMedicacioADO_id),
#                      adoCombiMetforminaLinaglibtina_id_ALTRES2=max(adoCombiMetforminaLinaglibtina_id_ALTRES),
#                      adoCombiMetforminaAlogliptina_id_ALTRES2=max(adoCombiMetforminaAlogliptina_id_ALTRES),
#                      adoAlogliptina_id_ALTRES2=max(adoAlogliptina_id_ALTRES),
#                      adoCombiAlogliptinaPioglitazona_id_ALTRES2=max(adoCombiAlogliptinaPioglitazona_id_ALTRES),
#                      adoCombMetforminaEmpaglifozina_id_ALTRES2=max(adoCombMetforminaEmpaglifozina_id_ALTRES),
#                      adoCombMetforminaDapaglifozina_id_ALTRES2=max(adoCombMetforminaDapaglifozina_id_ALTRES),
#                      altreMedicacioGral_id2=max(altreMedicacioGral_id),
#                      antiagregantsPlaquetaris_id2=max(antiagregantsPlaquetaris_id),
#                      anticoagulants_id2=max(anticoagulants_id),
#                      antihipertensius_id2=max(antihipertensius_id),
#                      hipolemiants_id2=max(hipolemiants_id),
#                      altreMedicacioGral_id_ALTRES2=max(altreMedicacioGral_id_ALTRES),
#                      antiagregantsPlaquetaris_id_ALTRES2=max(antiagregantsPlaquetaris_id_ALTRES),
#                      anticoagulants_id_ALTRES2=max(anticoagulants_id_ALTRES),
#                      antihipertensius_id_ALTRES2=max(antihipertensius_id_ALTRES),
#                      hipolemiants_id_ALTRES2=max(hipolemiants_id_ALTRES),
#                      ANTIDEPRESSANTS_id_ALTRES2=max(ANTIDEPRESSANTS_id_ALTRES),
#                      ANTIPSYCHOTICS_id_ALTRES2=max( ANTIPSYCHOTICS_id_ALTRES),
#                      ANTIEPILEPTICS_id_ALTRES2=max( ANTIEPILEPTICS_id_ALTRES),
#                      ANXIOLYTICS_id_ALTRES2=max(ANXIOLYTICS_id_ALTRES),
#                      OPIOIDS_id_ALTRES2=max(OPIOIDS_id_ALTRES),
#                      CORTICOSTEROIDS_id_ALTRES2=max(CORTICOSTEROIDS_id_ALTRES),
#                      OTHERANALGESICSANDANTIPYRETICS_id_ALTRES2=max(OTHERANALGESICSANDANTIPYRETICS_id_ALTRES),
#                      NSAID_ALTRES2=max(NSAID_ALTRES),
#                      ADRENERGICS_INHALANTS_id_ALTRES2=max(ADRENERGICS_INHALANTS_id_ALTRES),
#                      THYROIDPREPARATIONS_id_ALTRES2=max(THYROIDPREPARATIONS_id_ALTRES),
#                      HORMONES_id_ALTRES2=max(HORMONES_id_ALTRES),
#                      altreMedicacioInjInsulina_id2=max(altreMedicacioInjInsulina_id),
#                      injAbasaglar_id2=max(injAbasaglar_id),
#                      injAbiglutida_id2=max(injAbiglutida_id),
#                      injActrapid_id2=max(injActrapid_id),
#                      injApidra_id2=max(injApidra_id),
#                      injExenatida_id2=max(injExenatida_id),
#                      injHumalog_id2=max(injHumalog_id),
#                      injHumalogBasal_id2=max(injHumalogBasal_id),
#                      injHumalogMix25_id2=max(injHumalogMix25_id),
#                      injHumalogMix50_id2=max(injHumalogMix50_id),
#                      injHumilana3070_id2=max(injHumilana3070_id),
#                      injHumulinaNPH_id2=max(injHumulinaNPH_id),
#                      injHumulinaRegular_id2=max(injHumulinaRegular_id),
#                      injInsulatard_id2=max(injInsulatard_id),
#                      injLantus_id2=max(injLantus_id),
#                      injLevemir_id2=max(injLevemir_id),
#                      injLiraglutida_id2=max(injLiraglutida_id),
#                      injLixisenatide_id2=max(injLixisenatide_id),
#                      injMixtard30_id2=max(injMixtard30_id),
#                      injNovomix30_id2=max(injNovomix30_id),
#                      injNovomix50_id2=max(injNovomix50_id),
#                      injNovomix70_id2=max(injNovomix70_id),
#                      injNovorapid_id2=max(injNovorapid_id),
#                      injToujeo_id_ALTRES2=max(injToujeo_id_ALTRES),
#                      injTresiba_id_ALTRES2=max(injTresiba_id_ALTRES),
#                      injExenatida_id_ALTRES2=max(injExenatida_id_ALTRES),
#                      injAbasaglar_id_ALTRES2=max(injAbasaglar_id_ALTRES)
#                      
#                      )
#              


#DT_VISITA_HISTORIC2_agg<-DT_VISITA_HISTORIC2%>%group_by(visita_id)%>% summarise_if(is.numeric,max,na.rm=T)
#DT_VISITA_HISTORIC2_agg_MES00<-DT_VISITA_HISTORIC2%>%filter(tipus=="Mes00")%>%group_by(visita_id)%>% summarise_if(is.numeric,max,na.rm=T)

#variable.names(DT_VISITA_HISTORIC2_agg)
#variable.names(DT_VISITA_HISTORIC3_agg)



#iv]  TAULA PLANA!
##  TAULA PLANA COMPLICACIONS!
#DT_VISITA
#DT_COMPLICACIONS
#altresComplicacionsDescrip

DT_VISITA_HISTORIC<-DT_VISITA%>%mutate(pacient_id=pacient_pacient_id)%>%dplyr::select(tipus,pacient_id,visita_id,completa,dataVisita)
DT_VISITA_HISTORIC3<-DT_COMPLICACIONS%>%dplyr::select(-Id,-verificat,-formComplet)%>%
  left_join(altresComplicacionsDescrip    ,by="visita_id")%>%dplyr::select(-Id)
DT_VISITA_HISTORIC3<-DT_VISITA_HISTORIC3%>% left_join(DT_VISITA_HISTORIC  ,by="visita_id")

DT_VISITA_HISTORIC3<-DT_VISITA_HISTORIC3%>%filter(pacient_id%in%DT_PACIENT_SELECT$pacient_id)
DT_VISITA_HISTORIC3<-DT_VISITA_HISTORIC3%>%left_join(DT_PACIENT   ,by="pacient_id")%>%dplyr::select(-Id)
#variable.names(DT_VISITA_HISTORIC3)

#




#DT_VISITA_HISTORIC3_agg2<-DT_VISITA_HISTORIC3%>%filter(tipus=="Mes00")%>%
#  group_by(visita_id)%>%summarise(grupIntervencio=max(grupIntervencio),
#            altresComplicacions_id2=max(altresComplicacions_id) ,
#            arteriopatiaPeriferica_id2=max(arteriopatiaPeriferica_id) ,
#            cardiopatiaIsquemica_id2=max(cardiopatiaIsquemica_id) ,
#            insuficienciaCardiaca_id2=max(insuficienciaCardiaca_id) ,
#            malaltiaCerebrovascular_id2=max(malaltiaCerebrovascular_id) ,
#            nefropatiaDiabetica_id2=max(nefropatiaDiabetica_id) ,
#            neuropatiaDiabetica_id2=max(neuropatiaDiabetica_id) ,
#            retinopatiaDiabetica_id2=max(retinopatiaDiabetica_id) ,
#            PATOLOGIATIROIDAL_id_ALTRES2=max(PATOLOGIATIROIDAL_id_ALTRES),
#            MPOC_id_ALTRES2=max(MPOC_id_ALTRES) ,
#            MALALTIESMENTALS_id_ALTRES2=max(MALALTIESMENTALS_id_ALTRES) ,
#            DISFUNCI?SEXUAL_id_ALTRES2=max(DISFUNCI?SEXUAL_id_ALTRES) ,
#            NEOPLASIES_id_ALTRES2=max(NEOPLASIES_id_ALTRES) ,
#            PEUDIAB?TICBASAL_id_ALTRES2=max(PEUDIAB?TICBASAL_id_ALTRES) ,
#            AMPUTACIONS_id_ALTRES2=max(AMPUTACIONS_id_ALTRES) 
#             
#  )





#DT_VISITA_HISTORIC3_agg<-DT_VISITA_HISTORIC3%>%filter(tipus=="Mes00")%>%group_by(visita_id)%>% summarise_if(is.numeric,max,na.rm=T)
#DT_VISITA_HISTORIC3_agg<-DT_VISITA_HISTORIC3%>%group_by(visita_id)%>% summarise_if(is.numeric,max,na.rm=T)
#DT_VISITA_HISTORIC3_agg_MES00<-DT_VISITA_HISTORIC3%>%filter(tipus=="Mes00")%>%group_by(visita_id)%>% summarise_if(is.numeric,max,na.rm=T)


#----------------------------------------------#
#[]#
#----------------------------------------------#
#----------------------------------------------#
#variable.names(DT_VISITA_HISTORIC2_agg)
#variable.names(DT_VISITA_HISTORIC3_agg)
#---------------------------------------------#




#[HEM DE SELECCIONAR ! i fer una funció senzilla!]
#conductor_variables2<-"taulavariables_v3.xls"
#library(dplyr)
# exemple::

#extreure.variables("taula0",conductor_variables2)






#prova!!!correcte!!!!




#Exemples d'abans!!!!
#DT_VISITA_HISTORIC2_agg_SELC<-DT_VISITA_HISTORIC2_agg %>% select(extreure.variables("taula0",conductor_variables2))
#DT_VISITA_HISTORIC2_agg_SELB<-select_conductor(dt=DT_VISITA_HISTORIC2_agg,taulavariables=conductor_variables2)



#DT_VISITA_HISTORIC2_agg_SEL<-DT_VISITA_HISTORIC2_agg%>%select(visita_id,
#                                                              adoAcarbosa_id,                      
#                                                               adoCanagliflozina_id,                     
#                                                               adoClorpopramida_id  ,                    
#                                                               adoCombiGlimepiridaPioglitazona_id,
#                                                               adoCombiMetforminaPioglitazona_id  ,                    
#                                                               adoCombiMetforminaSaxaglitina_id,                      
#                                                               adoCombiMetforminaSitagliptina_id,                      
#                                                               adoCombiMetforminaVildagliptina_id,                      
#                                                               adoDapagliflozina_id,                      
#                                                               adoEmpagliflozina_id,                      
#                                                               adoGlibenclamida_id ,                     
#                                                               adoGlibornurida_id,
#                                                               adoGliclazida_id,
#                                                               adoGlimepirida_id,
#                                                               adoGlipizida_id,
#                                                               adoGliquidona_id,
#                                                               adoLinagliptina_id,
#                                                               adoMetformina_id,
#                                                               adoMiglitol_id,
#                                                               adoNateglinida_id,
#                                                               adoPioglitazona_id,
#                                                               adoRepaglinida_id,
#                                                               adoSaxagliptina_id,
#                                                               adoSitagliptina_id,
#                                                               adoTolbutamida_id,
#                                                               adoVildagliptina_id,
#                                                               altreMedicacioADO_id,
#                                                               adoCombiMetforminaLinaglibtina_id_ALTRES,
#                                                               adoCombiMetforminaAlogliptina_id_ALTRES  ,                
#                                                               adoAlogliptina_id_ALTRES,                  
#                                                               adoCombiAlogliptinaPioglitazona_id_ALTRES,                  
#                                                               adoCombMetforminaEmpaglifozina_id_ALTRES,
#                                                               adoCombMetforminaDapaglifozina_id_ALTRES ,          
#                                                               altreMedicacioGral_id,                      
#                                                               antiagregantsPlaquetaris_id,                      
#                                                               anticoagulants_id,                      
#                                                               antihipertensius_id,                      
#                                                               hipolemiants_id,                      
#                                                               altreMedicacioGral_id_ALTRES,                  
#                                                               antiagregantsPlaquetaris_id_ALTRES,                  
#                                                               anticoagulants_id_ALTRES,                  
#                                                               antihipertensius_id_ALTRES,                  
#                                                               hipolemiants_id_ALTRES,                 
#                                                               ANTIDEPRESSANTS_id_ALTRES,                  
#                                                               ANTIPSYCHOTICS_id_ALTRES,                 
#                                                               ANTIEPILEPTICS_id_ALTRES,                  
#                                                               ANXIOLYTICS_id_ALTRES,                  
#                                                               OPIOIDS_id_ALTRES,                  
#                                                               CORTICOSTEROIDS_id_ALTRES,                  
#                                                               OTHERANALGESICSANDANTIPYRETICS_id_ALTRES,
#                                                               NSAID_ALTRES,                  
#                                                               ADRENERGICS_INHALANTS_id_ALTRES,                  
#                                                               THYROIDPREPARATIONS_id_ALTRES,
#                                                               HORMONES_id_ALTRES,                  
#                                                               altreMedicacioInjInsulina_id,                      
#                                                               injAbasaglar_id,
#                                                               injAbiglutida_id,                      
#                                                               injActrapid_id,                      
#                                                               injApidra_id,
#                                                               injExenatida_id,                      
#                                                               injHumalog_id,                      
#                                                               injHumalogBasal_id,                      
#                                                               injHumalogMix25_id,                     
#                                                               injHumalogMix50_id,                      
#                                                               injHumilana3070_id,                      
#                                                               injHumulinaNPH_id ,                     
#                                                               injHumulinaRegular_id,                      
#                                                               injInsulatard_id,
#                                                               injLantus_id    ,                  
#                                                               injLevemir_id ,                     
#                                                               injLiraglutida_id,
#                                                               injLixisenatide_id,                      
#                                                               injMixtard30_id ,                     
#                                                               injNovomix30_id ,                     
#                                                               injNovomix50_id,
#                                                               injNovomix70_id,
#                                                               injNovorapid_id ,                     
#                                                               injToujeo_id_ALTRES ,                 
#                                                               injTresiba_id_ALTRES ,                 
#                                                               injExenatida_id_ALTRES,
#                                                               injAbasaglar_id_ALTRES)
#---------------------------------------------------------------------------------------------#
# variable.names(DT_VISITA_HISTORIC2_agg_SEL)
# variable.names(DT_VISITA_HISTORIC2_agg_SEL_ñ)
#---------------------------------------------------------------------------------------------#
#DT_VISITA_HISTORIC2_agg_SEL_MES00<-DT_VISITA_HISTORIC2_agg_MES00%>%select(visita_id,
#                                                              adoAcarbosa_id,                      
#                                                              adoCanagliflozina_id,                     
#                                                              adoClorpopramida_id  ,                    
#                                                              adoCombiGlimepiridaPioglitazona_id,
#                                                              adoCombiMetforminaPioglitazona_id  ,                    
#                                                              adoCombiMetforminaSaxaglitina_id,                      
#                                                              adoCombiMetforminaSitagliptina_id,                      
#                                                              adoCombiMetforminaVildagliptina_id,                      
#                                                              adoDapagliflozina_id,                      
#                                                              adoEmpagliflozina_id,                      
#                                                              adoGlibenclamida_id ,                     
#                                                              adoGlibornurida_id,
#                                                              adoGliclazida_id,
#                                                              adoGlimepirida_id,
#                                                              adoGlipizida_id,
#                                                              adoGliquidona_id,
#                                                              adoLinagliptina_id,
#                                                              adoMetformina_id,
#                                                              adoMiglitol_id,
#                                                              adoNateglinida_id,
#                                                              adoPioglitazona_id,
#                                                              adoRepaglinida_id,
#                                                              adoSaxagliptina_id,
#                                                              adoSitagliptina_id,
#                                                              adoTolbutamida_id,
#                                                              adoVildagliptina_id,
#                                                              altreMedicacioADO_id,
#                                                              adoCombiMetforminaLinaglibtina_id_ALTRES,
#                                                              adoCombiMetforminaAlogliptina_id_ALTRES  ,                
#                                                              adoAlogliptina_id_ALTRES,                  
#                                                              adoCombiAlogliptinaPioglitazona_id_ALTRES,                  
#                                                              adoCombMetforminaEmpaglifozina_id_ALTRES,
#                                                              adoCombMetforminaDapaglifozina_id_ALTRES ,          
#                                                              altreMedicacioGral_id,                      
#                                                              antiagregantsPlaquetaris_id,                      
#                                                              anticoagulants_id,                      
#                                                              antihipertensius_id,                      
#                                                              hipolemiants_id,                      
#                                                              altreMedicacioGral_id_ALTRES,                  
#                                                              antiagregantsPlaquetaris_id_ALTRES,                  
#                                                              anticoagulants_id_ALTRES,                  
#                                                              antihipertensius_id_ALTRES,                  
#                                                              hipolemiants_id_ALTRES,                 
#                                                              ANTIDEPRESSANTS_id_ALTRES,                  
#                                                              ANTIPSYCHOTICS_id_ALTRES,                 
#                                                              ANTIEPILEPTICS_id_ALTRES,                  
#                                                              ANXIOLYTICS_id_ALTRES,                  
#                                                              OPIOIDS_id_ALTRES,                  
#                                                              CORTICOSTEROIDS_id_ALTRES,                  
#                                                              OTHERANALGESICSANDANTIPYRETICS_id_ALTRES,
#                                                              NSAID_ALTRES,                  
#                                                              ADRENERGICS_INHALANTS_id_ALTRES,                  
#                                                              THYROIDPREPARATIONS_id_ALTRES,
#                                                              HORMONES_id_ALTRES,                  
#                                                              altreMedicacioInjInsulina_id,                      
#                                                              injAbasaglar_id,
#                                                              injAbiglutida_id,                      
#                                                              injActrapid_id,                      
#                                                              injApidra_id,
#                                                              injExenatida_id,                      
#                                                              injHumalog_id,                      
#                                                              injHumalogBasal_id,                      
#                                                              injHumalogMix25_id,                     
#                                                              injHumalogMix50_id,                      
#                                                              injHumilana3070_id,                      
#                                                              injHumulinaNPH_id ,                     
#                                                              injHumulinaRegular_id,                      
#                                                              injInsulatard_id,
#                                                              injLantus_id    ,                  
#                                                              injLevemir_id ,                     
#                                                              injLiraglutida_id,
#                                                              injLixisenatide_id,                      
#                                                              injMixtard30_id ,                     
#                                                              injNovomix30_id ,                     
#                                                              injNovomix50_id,
#                                                              injNovomix70_id,
#                                                              injNovorapid_id ,                     
#                                                              injToujeo_id_ALTRES ,                 
#                                                              injTresiba_id_ALTRES ,                 
#                                                              injExenatida_id_ALTRES,
#                                                              injAbasaglar_id_ALTRES,
#                                                              grupIntervencio)
#variable.names(DT_VISITA_HISTORIC_lab3_SEL)
#variable.names(DT_VISITA_HISTORIC_lab3)
#----------------------------------------------------------------------#
#DT_VISITA_HISTORIC3_agg_SEL<-DT_VISITA_HISTORIC3_agg%>%select(visita_id,
#                                                              altresComplicacions_id,
#                                                              arteriopatiaPeriferica_id,
#                                                              cardiopatiaIsquemica_id,
#                                                              insuficienciaCardiaca_id,
#                                                              malaltiaCerebrovascular_id,
#                                                              nefropatiaDiabetica_id,
#                                                              neuropatiaDiabetica_id,
#                                                              retinopatiaDiabetica_id,
#                                                               PATOLOGIATIROIDAL_id_ALTRES,
#                                                               MPOC_id_ALTRES,
#                                                               MALALTIESMENTALS_id_ALTRES,
#                                                               DISFUNCIOSEXUAL_id_ALTRES,
#                                                               NEOPLASIES_id_ALTRES,
#                                                               PEUDIABETIC_id_ALTRES,
#                                                               AMPUTACIONS_id_ALTRES)      
#----------------------------------------------------------------------#
#----------------------------------------------------------------------#
#----------------------------------------------------------------------#
#DT_VISITA_HISTORIC3_agg_SEL_MES00<-DT_VISITA_HISTORIC3_agg_MES00%>%select(visita_id,
#                                                              altresComplicacions_id,
#                                                              arteriopatiaPeriferica_id,
#                                                              cardiopatiaIsquemica_id,
#                                                              insuficienciaCardiaca_id,
#                                                              malaltiaCerebrovascular_id,
#                                                              nefropatiaDiabetica_id,
#                                                              neuropatiaDiabetica_id,
#                                                              retinopatiaDiabetica_id,
#                                                              PATOLOGIATIROIDAL_id_ALTRES,
#                                                              MPOC_id_ALTRES,
#                                                              MALALTIESMENTALS_id_ALTRES,
#                                                              DISFUNCIOSEXUAL_id_ALTRES,
#                                                              NEOPLASIES_id_ALTRES,
#                                                              PEUDIABETIC_id_ALTRES,
#                                                              AMPUTACIONS_id_ALTRES,
#                                                              grupIntervencio)      
#----------------------------------------------------------------------#
#DT_VISITA_HISTORIC2_agg_SEL<- replace(DT_VISITA_HISTORIC2_agg_SEL, DT_VISITA_HISTORIC2_agg_SEL ==  -Inf, NA)
#DT_VISITA_HISTORIC2_agg_SEL_MES00<- replace(DT_VISITA_HISTORIC2_agg_SEL_MES00, DT_VISITA_HISTORIC2_agg_SEL_MES00 ==  -Inf, NA)
#DT_VISITA_HISTORIC3_agg_SEL<- replace(DT_VISITA_HISTORIC3_agg_SEL, DT_VISITA_HISTORIC3_agg_SEL ==  -Inf, NA)
#DT_VISITA_HISTORIC3_agg_SEL_MES00<- replace(DT_VISITA_HISTORIC3_agg_SEL_MES00, DT_VISITA_HISTORIC3_agg_SEL_MES00 ==  -Inf, NA)
#Canviat!!!! %>%dplyr::arrange




#taula_ordre



conductor_variables2<-"taulavariables_TOTAL2.xls"



#----------------------------------------------------------------------#
DT_VISITA_HISTORIC2_agg_SEL<-DT_VISITA_HISTORIC2%>%
  group_by(visita_id)%>%
    summarise_at(extreure.variables("taula_ordre2",conductor_variables2),max,na.rm=T)
#----------------------------------------------------------------------#
DT_VISITA_HISTORIC2_agg_SEL_MES00<-DT_VISITA_HISTORIC2%>%filter(tipus=="Mes00")%>%
  group_by(visita_id)%>%
   summarise_at(extreure.variables("taula_ordre2",conductor_variables2),max,na.rm=T)
#----------------------------------------------------------------------#
DT_VISITA_HISTORIC2_agg_SEL<- replace(DT_VISITA_HISTORIC2_agg_SEL, DT_VISITA_HISTORIC2_agg_SEL ==  -Inf, NA)
DT_VISITA_HISTORIC2_agg_SEL_MES00<- replace(DT_VISITA_HISTORIC2_agg_SEL_MES00, DT_VISITA_HISTORIC2_agg_SEL_MES00 ==  -Inf, NA)
#----------------------------------------------------------------------#




DT_VISITA_HISTORIC3_agg_SEL<-DT_VISITA_HISTORIC3%>%
  group_by(visita_id)%>%
    summarise_at(extreure.variables("taula_ordre3",conductor_variables2),max,na.rm=T)
#----------------------------------------------------------------------#
DT_VISITA_HISTORIC3_agg_SEL_MES00<-DT_VISITA_HISTORIC3%>%
  filter(tipus=="Mes00")%>%group_by(visita_id)%>%
    summarise_at(extreure.variables("taula_ordre3",conductor_variables2),max,na.rm=T)
#----------------------------------------------------------------------#
DT_VISITA_HISTORIC3_agg_SEL<- replace(DT_VISITA_HISTORIC3_agg_SEL, DT_VISITA_HISTORIC3_agg_SEL ==  -Inf, NA)
DT_VISITA_HISTORIC3_agg_SEL_MES00<- replace(DT_VISITA_HISTORIC3_agg_SEL_MES00, DT_VISITA_HISTORIC3_agg_SEL_MES00 ==  -Inf, NA)
#----------------------------------------------------------------------#


#Comprovació:[]
#----------------------------------------------------------------------#
#variable.names(DT_VISITA_HISTORIC2_agg_SEL)
#variable.names(DT_VISITA_HISTORIC2_agg_SEL_MES00)
#variable.names(DT_VISITA_HISTORIC3_agg_SEL)
#variable.names(DT_VISITA_HISTORIC3_agg_SEL_MES00)
#---------------------------------------------------------------------#

#View(DT_VISITA_HISTORIC2_agg_SEL)


  
  

#----------------------------------------------------------------------#

DT_VISITA_HISTORIC_PLANA<-DT_VISITA_HISTORIC1%>%
  left_join(DT_VISITA_HISTORIC2_agg_SEL ,by="visita_id")%>%
      left_join(DT_VISITA_HISTORIC3_agg_SEL ,by="visita_id")

#----------------------------------------------------------------------#






conductor_variables2<-"taulavariables_TOTAL2.xls"
Ordre_Taula<-extreure.variables("taula_ordre1",conductor_variables2)
Ordre_Taula



DT_VISITA_HISTORIC_PLANA_ORD<-DT_VISITA_HISTORIC_PLANA%>%select(Ordre_Taula)
variable.names(DT_VISITA_HISTORIC_PLANA_ORD)





#---------------#
#conductor_variables2<-"taulavariables_TOTAL2.xls"



#---------------#
DT_VISITA_HISTORIC_PLANA_ORD_lab<-convertir_dates(d=DT_VISITA_HISTORIC_PLANA,taulavariables=conductor_variables2)
#---------------#
DT_VISITA_HISTORIC_PLANA_ORD_lab<-etiquetar(d=DT_VISITA_HISTORIC_PLANA_ORD_lab,taulavariables=conductor_variables2)
#---------------#
DT_VISITA_HISTORIC_PLANA_ORD_lab<-LAB_ETIQ_v2(dt=DT_VISITA_HISTORIC_PLANA_ORD_lab,variables_factors=conductor_variables2,fulla="etiquetes0",idioma="etiqueta2")
#---------------#
DT_VISITA_HISTORIC_PLANA_ORD_lab<-DT_VISITA_HISTORIC_PLANA_ORD_lab%>%select(Ordre_Taula)




write.csv2(DT_VISITA_HISTORIC_PLANA_ORD, file = "resultats/DT_VISITA_HISTORIC_PLANA.csv")
write.csv2(DT_VISITA_HISTORIC_PLANA_ORD_lab, file = "resultats/DT_VISITA_HISTORIC_PLANA_lab.csv")








#-------------------------------------------------------------#
#P  A R T     D E S C R I P T I V A 
#     H I S T O R I C S   #
#-------------------------------------------------------------#





#---------------##---------------##---------------##---------------##---------------#
DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_PLANA%>%filter(tipus=="Mes00")
#---------------##---------------##---------------##---------------##---------------#
DT_VISITA_HISTORIC_MES03<-DT_VISITA_HISTORIC_PLANA%>%filter(tipus=="Mes03")
#---------------##---------------##---------------##---------------##---------------#
DT_VISITA_HISTORIC_MES06<-DT_VISITA_HISTORIC_PLANA%>%filter(tipus=="Mes06")
#---------------##---------------##---------------##---------------##---------------#
DT_VISITA_HISTORIC_MES12<-DT_VISITA_HISTORIC_PLANA%>%filter(tipus=="Mes12")
#---------------##---------------##---------------##---------------##---------------#






#---------------##---------------##---------------##---------------##---------------#  
# DT_VISITA_HISTORIC_MES00(BASAL,mes00)  i DT_VISITA_HISTORIC(tots els mesos!)
#---------------##---------------##---------------##---------------##---------------#  


# tan del Historic com l'Historic mes00 , i afegim aquetses variables ,[COMENTAR BOGDAN]!! 



#-------------------------------------------------#
#ii)
#DT_VISITA_HISTORIC+ 
#DT_PACIENT+
#DT_DEMOGRAFIA+
#DT_HISTORIAMEDICA+
#DT_EXPLORACIOFISICA+
#DT_ANALITICA+
#DT_HABITS_TOXICS+
#DT_SEGUIMENT+DT_COSTOSSANITARIS+
#altresProblemesSalut [EPSS!]
#-------------------------------------------------#




#------------------------------------------#
#variable.names(DT_VISITA_HISTORIC_MES00)
#variable.names(altresProblemesSalut)
#------------------------------------------#




#P  R E P A R C I O  amb els CONDUCTORS  taulavariables_v2b.xls: ()



#--------------#
#DT_VISITA_HISTORIC_MES00
#DT_VISITA_HISTORIC
#--------------#





#DT_VISITA_HISTORIC_MES00

# 5. Exploratori      Taules VISITES HISTORIQUES   ------------------


#MES BASAL!#
#---------------#
conductor_variables2<-"taulavariables_TOTAL2.xls"
#---------------#
#---------------#
DT_VISITA_HISTORIC_MES00_lab<-convertir_dates(d=DT_VISITA_HISTORIC_MES00,taulavariables=conductor_variables2)
#---------------#
DT_VISITA_HISTORIC_MES00_lab<-etiquetar(d=DT_VISITA_HISTORIC_MES00_lab,taulavariables=conductor_variables2)
#---------------#
DT_VISITA_HISTORIC_MES00_lab<-LAB_ETIQ_v2(dt=DT_VISITA_HISTORIC_MES00_lab,variables_factors=conductor_variables2,fulla="etiquetes0",idioma="etiqueta2")
#---------------#



formula_taula_HISTORIC<-formula_compare("taula_ordre1",y="grupIntervencio",taulavariables = conductor_variables2)
formula_taula_HISTORIC2<-formula_compare("taula_ordre1",y="",taulavariables = conductor_variables2)

#---------------#
T00<-descrTable(formula_taula_HISTORIC,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_VISITA_HISTORIC_MES00_lab,max.xlev = 40,show.n=T)
T00B<-descrTable(formula_taula_HISTORIC,method = 1,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_VISITA_HISTORIC_MES00_lab,max.xlev = 40,show.n=T)
T00C<-descrTable(formula_taula_HISTORIC2,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_VISITA_HISTORIC_MES00_lab,max.xlev = 40,show.n=T)


variable.names(DT_VISITA_HISTORIC_MES00_lab)

#MES 03#
#---------------#
#DT_VISITA_HISTORIC_MES03
#---------------#
#---------------#
#conductor_variables2<-"taulavariables_v2.xls"
#---------------#
#---------------#
DT_VISITA_HISTORIC_MES03_lab<-convertir_dates(d=DT_VISITA_HISTORIC_MES03,taulavariables=conductor_variables2)
#---------------#
DT_VISITA_HISTORIC_MES03_lab<-etiquetar(d=DT_VISITA_HISTORIC_MES03_lab,taulavariables=conductor_variables2)
#---------------#
DT_VISITA_HISTORIC_MES03_lab<-LAB_ETIQ_v2(dt=DT_VISITA_HISTORIC_MES03_lab,variables_factors=conductor_variables2,fulla="etiquetes0",idioma="etiqueta2")
#---------------#
formula_taula_HISTORIC<-formula_compare("taula_ordre1",y="grupIntervencio",taulavariables = conductor_variables2)
formula_taula_HISTORIC2<-formula_compare("taula_ordre1",y="",taulavariables = conductor_variables2)
#---------------#
T03<-descrTable(formula_taula_HISTORIC,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_VISITA_HISTORIC_MES03_lab,max.xlev = 40,show.n=T)
T03B<-descrTable(formula_taula_HISTORIC,method = 1,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_VISITA_HISTORIC_MES03_lab,max.xlev = 40,show.n=T)
T03C<-descrTable(formula_taula_HISTORIC2,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_VISITA_HISTORIC_MES03_lab,max.xlev = 40,show.n=T)
#---------------#
#T03
#T03B
#---------------#



#MES 06#
#---------------#
#DT_VISITA_HISTORIC_MES06
#---------------#
#---------------#
#conductor_variables2<-"taulavariables_v2.xls"
#---------------#
#---------------#
DT_VISITA_HISTORIC_MES06_lab<-convertir_dates(d=DT_VISITA_HISTORIC_MES06,taulavariables=conductor_variables2)
#---------------#
DT_VISITA_HISTORIC_MES06_lab<-etiquetar(d=DT_VISITA_HISTORIC_MES06_lab,taulavariables=conductor_variables2)
#---------------#
DT_VISITA_HISTORIC_MES06_lab<-LAB_ETIQ_v2(dt=DT_VISITA_HISTORIC_MES06_lab,variables_factors=conductor_variables2,fulla="etiquetes0",idioma="etiqueta2")
#---------------#
formula_taula_HISTORIC<-formula_compare("taula_ordre1",y="grupIntervencio",taulavariables = conductor_variables2)
formula_taula_HISTORIC2<-formula_compare("taula_ordre1",y="",taulavariables = conductor_variables2)
#---------------#
T06<-descrTable(formula_taula_HISTORIC,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_VISITA_HISTORIC_MES06_lab,max.xlev = 40,show.n=T)
T06B<-descrTable(formula_taula_HISTORIC,method = 1,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_VISITA_HISTORIC_MES06_lab,max.xlev = 40,show.n=T)
T06C<-descrTable(formula_taula_HISTORIC2,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_VISITA_HISTORIC_MES06_lab,max.xlev = 40,show.n=T)
#---------------#
#T06
#T06B
#---------------#


#MES 12#
#---------------#
#DT_VISITA_HISTORIC_MES12
#---------------#
#---------------#
#conductor_variables2<-"taulavariables_v2.xls"
#---------------#
#---------------#
DT_VISITA_HISTORIC_MES12_lab<-convertir_dates(d=DT_VISITA_HISTORIC_MES12,taulavariables=conductor_variables2)
#---------------#
DT_VISITA_HISTORIC_MES12_lab<-etiquetar(d=DT_VISITA_HISTORIC_MES12_lab,taulavariables=conductor_variables2)
#---------------#
DT_VISITA_HISTORIC_MES12_lab<-LAB_ETIQ_v2(dt=DT_VISITA_HISTORIC_MES12_lab,variables_factors=conductor_variables2,fulla="etiquetes0",idioma="etiqueta2")
#---------------#
formula_taula_HISTORIC<-formula_compare("taula_ordre1",y="grupIntervencio",taulavariables = conductor_variables2)
formula_taula_HISTORIC2<-formula_compare("taula_ordre1",y="",taulavariables = conductor_variables2)
#---------------#
T12<-descrTable(formula_taula_HISTORIC,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_VISITA_HISTORIC_MES12_lab,max.xlev = 40,show.n=T)
T12B<-descrTable(formula_taula_HISTORIC,method = 1,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_VISITA_HISTORIC_MES12_lab,max.xlev = 40,show.n=T)
T12C<-descrTable(formula_taula_HISTORIC2,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_VISITA_HISTORIC_MES12_lab,max.xlev = 40,show.n=T)
#---------------#
#T12
#T12B
#---------------#


#T0
#T1
#T2
#T3
#T4

#---------------#

#T00
#T00B
#T00C
#T03
#T03B
#T03C
#T06
#T06B
#T06C
#T12
#T12B
#T12C

#---------------#
#write.csv2(DT_VISITA_HISTORIC_MES00_lab, file ="resultats/DT_VISITA_HISTORIC_MES00_lab.csv")
#save.image("resultats/INTEGRA_VISITA_HISTORIC_MES0.Rdata")
#write.csv2(DT_VISITA_HISTORIC_MES03_lab, file ="resultats/DT_VISITA_HISTORIC_MES03_lab.csv")
#save.image("resultats/INTEGRA_VISITA_HISTORIC_MES0.Rdata")
#---------------#

save.image("resultats/INTEGRA_VISITES_HISTORIQUES.Rdata")






#DT_VISITA_HISTORIC_MES00



conductor_variables2<-"taulavariables_TOTAL2.xls"

# 6. Exploratori      VISITA_HISTORIC BASAL MEDICAMENTS i PROBLEMES   ####







formula_taula_HISTORIC<-formula_compare("taula_ordre1",y="grupIntervencio",taulavariables = conductor_variables2)
formula_taula_HISTORIC2<-formula_compare("taula_ordre1",y="",taulavariables = conductor_variables2)

#---------------#
T00<-descrTable(formula_taula_HISTORIC,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_VISITA_HISTORIC_MES00_lab,max.xlev = 40,show.n=T)
T00B<-descrTable(formula_taula_HISTORIC,method = 1,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_VISITA_HISTORIC_MES00_lab,max.xlev = 40,show.n=T)
T00C<-descrTable(formula_taula_HISTORIC2,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_VISITA_HISTORIC_MES00_lab,max.xlev = 40,show.n=T)








#---------------#
#DT_VISITA_HISTORIC_lab3<-convertir_dates(d=DT_VISITA_HISTORIC2_agg_SEL_MES00,taulavariables=conductor_variables3)
#DT_VISITA_HISTORIC_lab3<-etiquetar(d=DT_VISITA_HISTORIC_lab3,taulavariables=conductor_variables3)
#DT_VISITA_HISTORIC_lab3<-LAB_ETIQ_v2(dt=DT_VISITA_HISTORIC_lab3,variables_factors=conductor_variables3,fulla="etiquetes0",idioma="etiqueta2")
#---------------#


conductor_variables2<-"taulavariables_TOTAL2.xls"
formula_taula_HISTORIC<-formula_compare("taula_ordre2",y="grupIntervencio",taulavariables = conductor_variables2)
T1<-descrTable(formula_taula_HISTORIC,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_VISITA_HISTORIC_MES00_lab,max.xlev = 80,show.n=T)




conductor_variables2<-"taulavariables_TOTAL2.xls"
formula_taula_HISTORIC2<-formula_compare("taula_ordre3",y="grupIntervencio",taulavariables = conductor_variables2)
#---------------#
T2<-descrTable(formula_taula_HISTORIC2,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_VISITA_HISTORIC_MES00_lab,max.xlev = 80,show.n=T)
#T2
#---------------#
save.image("resultats/INTEGRA_VISITA_HISTORIC_BASAL_MEDICAMENTS_PROBLEMES.Rdata")





#RESUM:

#------------------------------------------------------------------------------------------#
#DT_PACIENT_lab#[excel]
#write.csv2(DT_PACIENT_lab, file = "resultats/DT_PACIENT_lab.csv")
#------------------------------------------------------------------------------------------#
#[rmarkdown]
#resultats/INTEGRA_PACIENT.Rdata
#T0;T1;T2;T3;T4
#[CONDUCTORS]:taulavariables_v1.xls

#------------------------------------------------------------------------------------------#
#DT_VISITA_HISTORIC_PLANA#[excel]
#write.csv2(DT_VISITA_HISTORIC_PLANA, file = "resultats/DT_VISITA_HISTORIC_PLANA.csv")
#------------------------------------------------------------------------------------------#
#[rmarkdown]
#resultats/INTEGRA_VISITES_HISTORIQUES.Rdata
#T00;T00B;T00C;T03;T03B;T03C;T06;T06B;T06C;T12;T12B;T12C
#[CONDUCTORS]:taulavariables_v2.xls
#------------------------------------------------------------------------------------------#
#[rmarkdown]
#resultats/INTEGRA_VISITA_HISTORIC_BASAL_MEDICAMENTS_PROBLEMES.Rdata
#T1;T2
#[CONDUCTORS]:taulavariables_v3.xls
#[CONDUCTORS]:taulavariables_v4.xls
#------------------------------------------------------------------------------------------#





# 7. [E  R R O R S!]  ---------------------


#----------------------------------------------------------------------------#
#He canviat a l'ORIGINAL!
#----------------------------------------------------------------------------#
#Fallos BOGDAN!
#----------------------------------------------------------------------------#
#A) Tots els camps de...posem _ALTRES
#*altrMedicacioADO:
#*altreMedicacioGr:
#*altresMedicacioInj:
#*altresComplicacionsDescrip:
#*altresProblemesSalut:
#-------------------------------------------------------------------------#
#B)  altreMedicacioGr[ADRENERGICS,INHALANTS_id_ALTRES]  --> altreMedicacioGr[ADRENERGICS_INHALANTS_id_ALTRES]
#C)  altreMedicacioGr[ATC/DDD_ALTRES]                   --> altreMedicacioGr[ATC_DDD_ALTRES] 
#D)  altreMedicacioGr[pharmacological subgroup_ALTRES]             --> altreMedicacioGr[pharmacologicalsubgroup_ALTRES]
#E)  altreMedicacioGr[OTHER ANALGESICS AND ANTIPYRETICS_id_ALTRES] -->  altreMedicacioGr[OTHERANALGESICSANDANTIPYRETICS_id_ALTRES]
#F)  altreMedicacioGr[THYROID PREPARATIONS_id_ALTRES]--> altreMedicacioGr[THYROIDPREPARATIONS_id_ALTRES]
#----------------------------------------------------------------------------#
#G)  altresProblemesSalut[codigo CIE 10_ALTRES]-->altresProblemesSalut[codigoCIE10_ALTRES]
#H)  altresProblemesSalut[PATOLOGIA TIROIDAL BASAL_id_ALTRES]-->altresProblemesSalut[PATOLOGIATIROIDALBASAL_id_ALTRES]
#I)  altresProblemesSalut[MPOC BASAL_id_ALTRES]--> altresProblemesSalut[MPOCBASAL_id_ALTRES]
#J)  altresProblemesSalut[MALALTIES MENTALS BASAL_id_ALTRES]-->altresProblemesSalut[MALALTIESMENTALSBASAL_id_ALTRES]
#K)  altresProblemesSalut[CARDIOPATIA ISQUEMICA BASAL_id_ALTRES]-->altresProblemesSalut[CARDIOPATIAISQUEMICABASAL_id_ALTRES]
#L)  altresProblemesSalut[RETINOPATIA DIABETICA BASAL_id_ALTRES]-->altresProblemesSalut[RETINOPATIADIABETICABASAL_id_ALTRES]
#M)  altresProblemesSalut[DISFUNCIO SEXUAL BASAL_id_ALTRES]-->altresProblemesSalut[DISFUNCIOSEXUALBASAL_id_ALTRES]
#N)  altresProblemesSalut[NEOPLASIES BASAL_id_ALTRES]-->altresProblemesSalut[NEOPLASIESBASAL_id_ALTRES]
#O)  altresProblemesSalut[PEU DIAB?TIC BASAL_id_ALTRES]-->altresProblemesSalut[PEUDIABETICBASAL_id_ALTRES]
#P)  altresProblemesSalut[AMPUTACIONS BASAL_id_ALTRES]-->altresProblemesSalut[AMPUTACIONSBASAL_id_ALTRES]
#Q)  altresProblemesSalut[PATOLOGIA TIROIDAL_id_ALTRES]-->altresProblemesSalut[PATOLOGIATIROIDAL_id_ALTRES]
#-------------------------------------------------------------------------#
#R) altresComplicacionsDescrip[DISFUNCIO SEXUAL_id_ALTRES]-->altresComplicacionsDescrip[DISFUNCIOSEXUAL_id_ALTRES]
#S) altresComplicacionsDescrip[PEU DIABETIC_id_ALTRES]-->altresComplicacionsDescrip[PEUDIABETIC_id_ALTRES]
#T) altresComplicacionsDescrip[MALALTIES MENTALS_id_ALTRES]-->altresComplicacionsDescrip[MALALTIESMENTALS_id_ALTRES]
#U) altresComplicacionsDescrip[DISFUNCIOSEXUAL BASAL_id_ALTRES]-->altresComplicacionsDescrip[DISFUNCIOSEXUALBASAL_id_ALTRES]
#X) altresComplicacionsDescrip[PEU DIABETICBASAL_id_ALTRES]-->altresComplicacionsDescrip[PEUDIABETICBASAL_id_ALTRES]

#Z)DT_VISITA%>%mutate(pacient_id=pacient_pacient_id)!!!!!!!!!!!!!!!






#[----------------------------------------------]#
# DUBTES Bogdan Vlacho:[] 
#[----------------------------------------------]#
#Table#1  (Part.Descriptiva : PACIENTS/GRUPS)

#[[finalitzaEstudi_id]]:(son pacientes del centro Balaguer que al final no se pudo cerrar así
#que constan como pacientes discontinuados...)




#Table#2  (Part.Descriptiva : HISTORICS_BASAL_M00/GRUPS)

#[[etnia_id]]:(se deberia censurar la rayita, son pacientes de Balaguer..)

#[[filtratGlomerularSuperior60]]:(describir con moda)




#Table#3  (Part.Descriptiva : HISTORICS_GRUP1/VISITES[M00.M03.M06.M12] )

#[[dataDxDislipemia]]  (esto es la moda no?)

#[[duracioDiabetesMesos2]] (esto puede provocar confusiones, 
#ya que según el protocolo no se podían incluir pacientes si no tenían mínimo 1 año de diabetes. 
#entiendo que el valor mínimo que sale son de la variable meses solo. 
#Creo que todos los "" de diabetes se tienen que convertir en meses 
#y sumar con la variable meses...me explico?? )

#[[tensioBrac_id]]:(esto igual se tendría que censurar ya que son pacientes del CAP Balaguer, 
# que no se han podido ni monitorizar ni cerrar...:( no sabemos si el brazo ha sido izquerdo o derecho )

#[[dataAnalitica]]:(no deberiamos analizar esta variable, ya que no nos aporta mucho, )

#[[fumador_id]]:(censurar la rayita)

#[[consExternaCopsRelDiabetesNo]]:(esto se debería describir de otra manera, con la moda...)

#Table#4  (Part.Descriptiva : HISTORICS_GRUP2/VISITES[M00.M03.M06.M12])

#[[costDerivacions]]:(faltan variables, analíticas de la visita mes 12 no??? 
#complicaciones diabetes etc..? confirmar por favor, gracias )


#Table#5  (Part.Descriptiva : HISTORICS_MEDICAMENTS_COMPLICACIONS_BASAL_M00/GRUPS)
#discontinuados + incluidos 

#[[adoCanagliflozina_id2]]:(sumar con los de NO,  la ralla significa que no se conoce , )

#[[adoMiglitol_id2]]:(sumar con NO)

#[[adoNateglinida_id2]]:(sumar con NO)

#[[adoPioglitazona_id2]]:(sumar con NO)

#[[adoRepaglinida_id2]]:(sumar con NO)

#[[anticoagulants_id_ALTRES2]]:(hay que sumar con el resto de anticoagulantes)

#[[antihipertensius_id_ALTRES2]]:(hay que sumar con el resto de anticoagulantes)

#[[hipolemiants_id_ALTRES2]]:(hay que sumar con el resto de anticoagulantes)

#[[injHumalogMix50_id2]]:(sumar con NO)

#[[injMixtard30_id2]]:(sumar con NO)

#[[injNovorapid_id2]]:(sumar con NO)

#[[Analisi Descriptiu Complicaciones]]:(esta tabla no toca aquí, 
#esto son criterios de exclusión y inclusión)
#Pendiente tabla complicaciones diabetes )

#--------------------------(FI)--------------------------------#

