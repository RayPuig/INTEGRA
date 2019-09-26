####################################
#[25.09.2019]:12:55
####################################
#----------------------------------#
#[24.09.2019]
#----------------------------------#
#[23.09.2019]
#----------------------------------#
#[20.09.2019]
#[19.09.2019]
#[18.09.2019]
#[17.09.2019]
#[16.09.2019]
#[13.09.2019]                      
#[12.09.2019]                      
#[10.09.2019]                      
#[05.09.2019]                      
#[04.09.2019]                      
#[03.09.2019]/13:47
#[31.07.2019]
#[25.07.2019]
#[23.07.2019]
#[18.07.2019]
#C:\Users\38122893W\Desktop\INTEGRA_FINAL
#[17.07.2019]
#[Acabar de fer bé l'esquema!]
#[11.07.2019]
#[10.07.2019]
#[09.07.2019]
#[03.07.2019]
#[27.06.2019]
#[26.06.2019]
#[20.06.2019]
#[13.06.2019]
#[12.06.2019]
#[07.06.2019]
#----------------------------------#



#                             [31.05.2019 ]
#    Estudio [I N T E G R A] ------ 
# Estrategia de intervención integral en pacientes con mal control Glucémico de la diabetis mellitus tipo2 
# en el ambito de atención primaria. 
#[29.05.2019][30.05.2019]


# OBJETIVO PRINCIPAL  del estudio ----------

#Determinar si el control glucémico , medido por la concentación media de la HbA1C del paciente deficentement
#controlado  con DM2, mejora cuando es evaluado y tratado en el ámbito de atención primaria mediante
#una de las TRES estrategias inetgrales propuestas en el estudio!.

#ESTUDIO DE INTERVENCIÓN CUASI-EXPERIMENTAL, CONTROLADO , DE GRUPOS PARALELOS, en el 
#que participarón todos los sujetos con DM2 y deficiente control glucémico de 13 centros de atención primaria.


#GRUPO Intervención 1 :[GInt1](se realizará mediante una estrategia múltiple integrada en el protocolo.)
#GRUPO Intervención 2 :[GInt2](se realizará mediante una estrategia múltiple integrada en el protocolo.)
#Grupo Control: El Grupo control estar? formado por difernetes centros d?nde se ha seguido el control habitual
#               por el médico de familia i enfermera según el protcolo actual de ICS.
#               Los datos del grupo Control serán obtenidos a partir del SIDIAP.
#....
# VISITA PRESELECCION:V0 (Evaluación de los resultados de la analática sanguínia, no requiere la presencia del paciente)
# después de la V0, inclusión de los pacientes definitivos en el estudio.
# Comunicación a los pacientes que no se incluyen en el estudio.

# Citaci?m de los pacientes para V1.
# VISITA INICIAL A GInt1  V1 :  V1(BASAL),CRD[anamnesis general  y exploración física basicas en relación Diabetis]
# V2 (03 meses después v1)
# V3 (06 meses después v1)
# v4 (12 meses después v1)
# VISITA INICIAL A GInt2  V1 :  V1(BASAL),CRD[anamnesis general  y exploración física basicas en relación Diabetis]
# V2 (03 meses despu?s v1)
# v4 (12 meses despues v1)

#RECORDEM!!!

#Dependiendo del progreso y tipo de su diabetes, 
#existen tratamientos con y sin insulina. 
#Aprenda las diferencias. 
#Si le acaban de diagnosticar o vive con diabetes desde hace tiempo, 
#hay muchos medicamentos que podrían ayudarle a bajar el azucar en la sangre. 
#Algunos de los usados más frecuentemente se describen en la siguiente sección.

#Su médico evaluará su situación y recomendará un medicamento con o sin insulina. 
#Recuerde que la diabetes progresa con el tiempo y que usar insulina no significa que usted ha hecho algo indebido, solo que su tratamiento tendrá que ajustarse para conformar los cambios en su diabetes.


#Medicamentos sin insulina:
  
#       . Píldoras llamadas antidiabéticos orales (ADO, también conocidos como OAD, por sus siglas en inglés)
#       . Inyecciones (que no llevan insulina)

#Píldoras: Antidiabéticos orales

#En general, los antidiabéticos orales son la primera categoría de medicamentos para la diabetes 
#que su médico le dará si tiene niveles altos de azúcar en la sangre. 
#Esta es una lista de los medicamentos orales que más suelen recetarse y cómo ayudan a controlar el azúcar en la sangre:
  
#       Metformina: Ayuda al cuerpo a utilizar la insulina que produce de manera más eficaz 
#        y reduce la cantidad de azúcar que produce el h?gado

#       Sulfonilureas: Ayudan al cuerpo a liberar más insulina

#       Inhibidores de la DPP-4: Ayudan a aumentar la producción de insulina en el páncreas 
#       y a reducir la cantidad de azúcar producida en el hígado

#       Tiazolidinedionas (TZD): Ayudan a que la insulina funcione mejor en los músculos y 
#       la grasa, disminuyendo la resistencia a la insulina,
#       y también reducen la cantidad de azúcar que se produce en el hígado

#       Inhibidores del SGLT2: Bloquean la absorción de azúcar en los riñones, 
#       lo que ayuda a que el exceso de azúcar salga del cuerpo a través de la orina

# Llibreries ---------------------


#------------------------------------------------------#
#install.packages("plyr")
#install.packages("dplyr") 
#install.packages("ggplot2")
#install.packages("survminer") 
#install.packages("purrr")
#install.packages("stringr")
#install.packages("tidyverse")
#install.packages("tidyr")
#install.packages("compareGroups")
#install.packages("rmarkdown")
#install.packages("RODBC")
#install.packages("devtools")
#install.packages("pander")
#install.packages("hablar")
#------------------------------------------------------#




#.libPaths("F:/llibrerires_R")
#.libPaths()


#https://stackoverflow.com/questions/15170399/change-r-default-library-path-using-libpaths-in-rprofile-site-fails-to-work

#######################################.
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
#######################################.








# 0. Directori arrel i Lectura de FUNCIONS PRÒPIES ----


#INTEGRA BBDD JULIO01.07.2019 


# setwd("C:/Users/38122893W/Desktop/INTEGRA_FINAL2")
# "C:/Users/38122893W/Desktop/INTEGRA_FINAL2"%>% file.path("FUNCIONS_PROPIES_RAI.r") %>% source()

"FUNCIONS_PROPIES_RAI.r" %>% source()


# funcions compartides github



link_source<-paste0("https://github.com/jrealgatius/Stat_codis/blob/master/funcions_propies.R","?raw=T")
devtools::source_url(link_source)



#versió antiga:[]
#link_source<-paste0("https://github.com/jrealgatius/Stat_codis/blob/39127ec412670c3ded5d48cd63277e71402fc475/funcions_propies.R","?raw=T")
#devtools::source_url(link_source)



# 1. FASE LECTURA ----                                 
# (LECTURA DE BASE DE DADES) 
   
#install.packages("RODBC")


#channel <-  odbcConnectAccess("integra_20190312")
#db<-file.path("C:/Users/38122893W/Desktop/integra/INTEGRABBDDJULIO01072019.accdb")
#db<-file.path("./dades/INTEGRABBDDJULIO01072019.accdb")







#----------------------------------------------------------------------#
#channel2<-odbcConnectAccess2007("INTEGRABBDDJULIO01072019.accdb")
#----------------------------------------------------------------------#
#----------------------------------------------------------------------#
channel2<-odbcConnectAccess2007("dades/INTEGRABBDDJULIO01072019_22.07.2019.accdb")
#----------------------------------------------------------------------#


#INTEGRABBDDJULIO01072019
#INTEGRABBDDJULIO01072019_22.07.2019


#------------------------------------------------------------------------------------------------------#
#01#]
altreMedicacioADO <- sqlQuery( channel2, paste ("select * from altreMedicacioADO"))
names(altreMedicacioADO)
#[1] "Id"                                          "visita_id"                                  
#[3] "adoCombiMetforminaLinaglibtina_id_ALTRES"    "adoCombiMetforminaLinaglibtinadosis_ALTRES" 
#[5] "adoCombiMetforminaAlogliptina_id_ALTRES"     "adoCombiMetforminaAlogliptinadosis_ALTRES"  
#[7] "adoAlogliptina_id_ALTRES"                    "adoAlogliptina_dosis_ALTRES"                
#[9] "adoCombiAlogliptinaPioglitazona_id_ALTRES"   "adoCombiAlogliptinaPioglitazonadosis_ALTRES"
#[11] "adoCombMetforminaEmpaglifozina_id_ALTRES"    "adoCombMetforminaEmpaglifozinadosis_ALTRES" 
#[13] "adoCombMetforminaDapaglifozina_id_ALTRES"    "adoCombMetforminaDapaglifozinaDosis_ALTRES" 
#------------------------------------------------------------------------------------------------------# 
#02#]
altreMedicacioGr <- sqlQuery( channel2, paste ("select * from altreMedicacioGr"))
names(altreMedicacioGr)
#[1] "Id"                                          "visita_id"                                  
#[3] "altreMedicacioGralDescripORIGIGINAL_ALTRES"  "altreMedicacioPrincipioactivoDescrip_ALTRES"
#[5] "ATC/DDD_ALTRES"                              "pharmacological subgroup_ALTRES"            
#[7] "altreMedicacioGral_id_ALTRES"                "antiagregantsPlaquetaris_id_ALTRES"         
#[9] "anticoagulants_id_ALTRES"                    "antihipertensius_id_ALTRES"                 
#[11] "hipolemiants_id_ALTRES"                      "ANTIDEPRESSANTS_id_ALTRES"                  
#[13] "ANTIPSYCHOTICS_id_ALTRES"                    "ANTIEPILEPTICS_id_ALTRES"                   
#[15] "ANXIOLYTICS_id_ALTRES"                       "OPIOIDS_id_ALTRES"                          
#[17] "CORTICOSTEROIDS_id_ALTRES"                   "OTHER ANALGESICS AND ANTIPYRETICS_id_ALTRES"
#[19] "NSAID_ALTRES"                                "ADRENERGICS, INHALANTS_id_ALTRES"           
#[21] "THYROID PREPARATIONS_id_ALTRES"              "HORMONES_id_ALTRES"                                  
#------------------------------------------------------------------------------------------------------#
#03#]
altreMedicacioInj <- sqlQuery( channel2, paste ("select * from altreMedicacioInj "))
names(altreMedicacioInj )
#altreMedicacioInj 
#[1] "Id"                                                    
#[2] "visita_id"                                             
#[3] "altreMedicacioInjInsulinaPrincipioactivoDescrip_ALTRES"
#[4] "injToujeo_id_ALTRES"                                   
#[5] "injToujeoDosi_ALTRES"                                  
#[6] "injTresiba_id_ALTRES"                                  
#[7] "injTresibaDosi_ALTRES"                                 
#[8] "injExenatida_id_ALTRES"                                
#[9] "injExenatidaDosi_ALTRES"                               
#[10] "injAbasaglar_id_ALTRES"                                
#[11] "injAbasaglarDosi_ALTRES"              
#------------------------------------------------------------------------------------------------------#
#04#] 
altresComplicacionsDescrip <- sqlQuery( channel2, paste ("select * from altresComplicacionsDescrip "))
names(altresComplicacionsDescrip)
#[1] "Id"                                "visita_id"                         "altresComplicacionsDescrip_ALTRES"
#[4] "CIE10_ALTRES"                      "Teritorio_ALTRES"                  "PATOLOGIA TIROIDAL_id_ALTRES"     
#[7] "MPOC_id_ALTRES"                    "MALALTIES MENTALS_id_ALTRES"       "DISFUNCI? SEXUAL_id_ALTRES"       
#[10] "NEOPLASIES_id_ALTRES"              "PEU DIAB?TIC_id_ALTRES"            "AMPUTACIONS_id_ALTRES"          
#------------------------------------------------------------------------------------------------------#
#05#] 
altresProblemesSalut<- sqlQuery( channel2, paste ("select * from altresProblemesSalut"))
names(altresProblemesSalut)
#[1] "Id"                                    "visita_id"                            
#[3] "altresProblemesSalutDescrip_ALTRES"    "c?digo CIE 10_ALTRES"                 
#[5] "Teritorio_ALTRES"                      "PATOLOGIA TIROIDAL BASAL_id_ALTRES"   
#[7] "MPOC BASAL_id_ALTRES"                  "MALALTIES MENTALS BASAL_id_ALTRES"    
#[9] "CARDIOPATIA ISQU?MICA BASAL_id_ALTRES" "RETINOPATIA DIAB?TICA BASAL_id_ALTRES"
#[11] "DISFUNCI? SEXUAL BASAL_id_ALTRES"      "NEOPLASIES BASAL_id_ALTRES"           
#[13] "PEU DIAB?TIC BASAL_id_ALTRES"          "AMPUTACIONS BASAL_id_ALTRES"      
#------------------------------------------------------------------------------------------------------#
#06#]
DT_ANALITICA<- sqlQuery( channel2, paste ("select * from DT_ANALITICA"))
names(DT_ANALITICA)
#[1] "Id"                              "visita_id"                       "alt"                             "ast"                            
#[5] "basofils"                        "colesterolHdl"                   "colesterolLdl"                   "colesterolNoHdl"                
#[9] "colesterolTtl"                   "concHGBCorspuscularMitja"        "creatinina"                      "dataAnalitica"                  
#[13] "eosinofils"                      "filtratGlomerular"               "formComplet"                     "ggt"                            
#[17] "glucosa"                         "hba1cIFCC"                       "hba1cNGSP"                       "hematies"                       
#[21] "hematocrit"                      "hemoglobina"                     "hemoglobinaCorpuscularMitja"     "ide"                            
#[25] "leucocits"                       "linfocits"                       "monocits"                        "neutrofils"                     
#[29] "orinaCreatinina"                 "orinaMicroalbuminuria"           "orinaMicroalbuminuriaCreatinina" "plaquetes"                      
#[33] "triglicerids"                    "verificat"                       "volumCorpuscularMig"             "filtratGlomerularSuperior60"    
#------------------------------------------------------------------------------------------------------# 
#07#] 
DT_CENTRE<-sqlQuery( channel2, paste ("select * from DT_CENTRE"))
names(DT_CENTRE)
#[1] "Id"              "centre_id"       "abrevCentre"     "codiCentre"      "grupIntervencio"
#[6] "nomCentre"       "pacients"       
#------------------------------------------------------------------------------------------------------#
#08#]
DT_COMPLICACIONS<- sqlQuery( channel2, paste ("select * from DT_COMPLICACIONS"))
names(DT_COMPLICACIONS)
#[1] "Id"                            "visita_id"                     "altresComplicacionsDescrip"    "dataDxArteriopatiaPeriferica" 
#[5] "dataDxCardiopatiaIsquemica"    "dataDxInsuficienciaCardiaca"   "dataDxMalaltiaCerebrovascular" "dataDxNefropatiaDiabetica"    
#[9] "dataDxNeuropatiaDiabetica"     "dataDxRetinopatiaDiabetica"    "formComplet"                   "numHipoglucemiesGreus"        
#[13] "verificat"                     "altresComplicacions_id"        "arteriopatiaPeriferica_id"     "cardiopatiaIsquemica_id"      
#[17] "insuficienciaCardiaca_id"      "malaltiaCerebrovascular_id"    "nefropatiaDiabetica_id"        "neuropatiaDiabetica_id"       
#[21] "retinopatiaDiabetica_id"     
#------------------------------------------------------------------------------------------------------#
#09#]
DT_COSTOSSANITARIS<-sqlQuery( channel2, paste ("select * from DT_COSTOSSANITARIS"))
names(DT_COSTOSSANITARIS)
#[1] "Id"                           "visita_id"                    "consExternaCopsRelDiabetesNo" "consExternaCopsRelDiabetesSi"
#[5] "costDerivacions"              "costIncapacitatsTemp"         "costLaboratori"               "costMedicacio"               
#[9] "costProfessionals"            "costProvesCompl"              "costTiresReactives"           "costVisites"                 
#[13] "formComplet"                  "ingresCopsRelDiabetesNo"      "ingresCopsRelDiabetesSi"      "numTiresReact1Any"           
#[17] "urgenciesCopsRelDiabetesNo"   "urgenciesCopsRelDiabetesSi"   "verificat"                    "consExterna_id"              
#[21] "ingres_id"                    "urgencies_id"                
#------------------------------------------------------------------------------------------------------#
#10#]
DT_CRITERIS<- sqlQuery( channel2, paste ("select * from DT_CRITERIS "))
names(DT_CRITERIS)
#[1] "Id"                                         "pacient_id"                                 "codiIdentificacioPacient"                  
#[4] "codiUBA"                                    "dataConsentiment"                           "formComplet"                               
#[7] "motiuNoConsentiment"                        "exclusioAltres_id"                          "exclusioDroguesAlcohol_id"                 
#[10] "exclusioEmabarasLactancia_id"               "exclusioFarmacsMetabHidrocarb_id"           "exclusioHemoglobinapatiesAnemia_id"        
#[13] "exclusioIMCSuperior45_id"                   "exclusioInsufCardiaca34NYHA_id"             "exclusioMalaltiaMentalDemencia_id"         
#[16] "exclusioMalaltiaTerminal_id"                "exclusioParticipacioAssaigClinicFarmacs_id" "exclusioTransplRenalDialisis_id"           
#[19] "exclusioTtFarmacsAprimar_id"                "exclusioTtGlucocorticoides_id"              "exclusioTtImmunosupresors_id"              
#[22] "exclusioTtNeoplasiaMaligna_id"              "inclusioConsentiment_id"                    "inclusioDxDM2_id"                          
#[25] "inclusioEdat3080_id"                        "inclusioHba1cGrau9minim_id"                 "inclusioSenseCanvisTt_id"                  
#[28] "exclusioCanvisTt_id"                        "exclusioHba1cInferior9en3mesos_id"          "exclusioControlEndocrinoleg_id"                           "exclusioHba1cInferior9en3mesos_id"          "exclusioControlEndocrinoleg_id"            
#------------------------------------------------------------------------------------------------------#
#11#]
DT_DEMOGRAFIA<- sqlQuery( channel2, paste ("select * from DT_DEMOGRAFIA "))
names(DT_DEMOGRAFIA)
#[1] "Id"                 "visita_id"          "dataNaixement"      "edat"               "formComplet"        "verificat"         
#[7] "sexe_id"            "codiSeguiment"      "etnia_id"           "altresEtniaDescrip"
#------------------------------------------------------------------------------------------------------# 
#12#]
DT_EXPLORACIOFISICA<- sqlQuery( channel2, paste ("select * from DT_EXPLORACIOFISICA "))
names(DT_EXPLORACIOFISICA)
#[1] "Id"               "visita_id"        "formComplet"      "freqCardiaca"     "imc"              "perimetreCintura" "pes"             
#[8] "talla"            "tensioDiastolica" "tensioSistolica"  "verificat"        "tensioBrac_id"   
#------------------------------------------------------------------------------------------------------#
#13#]
DT_FINALITZACIO<- sqlQuery( channel2, paste ("select * from DT_FINALITZACIO "))
names(DT_FINALITZACIO)
#[1] "Id"                            "pacient_id"                    "altresMotiusDescrip_Unificado" "dataFiEstudi"                 
#[5] "formComplet"                   "verificat"                     "finalitzaEstudi_id"            "motiuFinalEstudi_id" 
#------------------------------------------------------------------------------------------------------#
#14#]
DT_HABITS_TOXICS<- sqlQuery( channel2, paste ("select * from DT_HABITS_TOXICS "))
names(DT_HABITS_TOXICS)
#[1] "Id"             "visita_id"      "cigarretsDia"   "dataFiTabac"    "dataIniciTabac" "formComplet"    "verificat"      "fumador_id" 
#------------------------------------------------------------------------------------------------------#
#15#]
DT_HISTORIAMEDICA<- sqlQuery( channel2, paste ("select * from DT_HISTORIAMEDICA "))
names(DT_HISTORIAMEDICA)
#[1] "Id"                          "visita_id"                   "altresProblemesSalutDescrip" "clinicalRiskGroup"          
#[5] "dataDxDislipemia"            "dataDxHta"                   "duracioDiabetesAnys"         "duracioDiabetesMesos"       
#[9] "formComplet"                 "grupMorbiditatAjustada"      "verificat"                   "altresProblemesSalut_id"    
#[13] "dislipemia_id"               "hta_id"                      "problemesSalut_id"            
#------------------------------------------------------------------------------------------------------#
#16#]
DT_MEDICACIO_ADO<- sqlQuery( channel2, paste ("select * from DT_MEDICACIO_ADO"))
names(DT_MEDICACIO_ADO)
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
#17#]
DT_MEDICACIO_GENERAL<- sqlQuery( channel2, paste ("select * from DT_MEDICACIO_GENERAL"))
names(DT_MEDICACIO_GENERAL)
#[1] "Id"                          "visita_id"                   "altreMedicacioGralDescrip"   "formComplet"                
#[5] "verificat"                   "altreMedicacioGral_id"       "antiagregantsPlaquetaris_id" "anticoagulants_id"          
#[9] "antihipertensius_id"         "hipolemiants_id"    
#------------------------------------------------------------------------------------------------------#
#18#]
DT_MEDICACIO_INJECTABLES<- sqlQuery( channel2, paste ("select * from DT_MEDICACIO_INJECTABLES"))
names(DT_MEDICACIO_INJECTABLES)
#[1] "Id"                               "visita_id"                        "altreMedicacioInjInsulinaDescrip" "formComplet"                     
#[5] "injAbasaglarDosi"                 "injAbiglutidaDosi"                "injActrapidDosi"                  "injApidraDosi"                   
#[9] "injExenatidaDosi"                 "injHumalogBasalDosi"              "injHumalogDosi"                   "injHumalogMix25Dosi"             
#[13] "injHumalogMix50Dosi"              "injHumilana3070Dosi"              "injHumulinaNPHDosi"               "injHumulinaRegularDosi"          
#[17] "injInsulatardDosi"                "injLantusDosi"                    "injLevemirDosi"                   "injLiraglutidaDosi"              
#[21] "injLixisenatideDosi"              "injMixtard30Dosi"                 "injNovomix30Dosi"                 "injNovomix50Dosi"                
#[25] "injNovomix70Dosi"                 "injNovorapidDosi"                 "verificat"                        "altreMedicacioInjInsulina_id"    
#[29] "injAbasaglar_id"                  "injAbiglutida_id"                 "injActrapid_id"                   "injApidra_id"                    
#[33] "injExenatida_id"                  "injHumalog_id"                    "injHumalogBasal_id"               "injHumalogMix25_id"              
#[37] "injHumalogMix50_id"               "injHumilana3070_id"               "injHumulinaNPH_id"                "injHumulinaRegular_id"           
#[41] "injInsulatard_id"                 "injLantus_id"                     "injLevemir_id"                    "injLiraglutida_id"               
#[45] "injLixisenatide_id"               "injMixtard30_id"                  "injNovomix30_id"                  "injNovomix50_id"                 
#[49] "injNovomix70_id"                  "injNovorapid_id"   
#------------------------------------------------------------------------------------------------------#
#[  DT_PACIENT_DISCONTINUADOS     ]
#[  DT_PACIENT_EXCLUIDOS          ]
#[  DT_PACIENT_FALLO_DE_SCREENING ]
#[  DT_PACIENT_INCLUIDOS          ]
#------------------------------------------------------------------------------------------------------#
#19#]
DT_PACIENT_DISCONTINUADOS<- sqlQuery( channel2, paste ("select * from DT_PACIENT_DISCONTINUADOS"))
names(DT_PACIENT_DISCONTINUADOS)
#[1] "Id"                       "pacient_id"               "codiIdentificacioPacient" "codiPacient"              "codiUBA"                 
#[6] "dataCreacio"              "estat"                    "grupIntervencio"          "usuari_id"                "centre_id" 
#------------------------------------------------------------------------------------------------------#
#20#]
DT_PACIENT_EXCLUIDOS<- sqlQuery( channel2, paste ("select * from DT_PACIENT_EXCLUIDOS"))
names(DT_PACIENT_EXCLUIDOS)
#[1] "Id"                       "pacient_id"               "codiIdentificacioPacient" "codiPacient"              "codiUBA"                 
#[6] "dataCreacio"              "estat"                    "grupIntervencio"          "usuari_id"                "centre_id"     
#------------------------------------------------------------------------------------------------------#
#21#]
DT_PACIENT_FALLO_DE_SCREENING<- sqlQuery( channel2, paste ("select * from DT_PACIENT_FALLO_DE_SCREENING"))
names(DT_PACIENT_FALLO_DE_SCREENING)
#[1] "Id"                       "pacient_id"               "codiIdentificacioPacient" "codiPacient"              "codiUBA"                 
#[6] "dataCreacio"              "estat"                    "grupIntervencio"          "usuari_id"                "centre_id"       
#------------------------------------------------------------------------------------------------------#
#22#]
DT_PACIENT_INCLUIDOS<- sqlQuery( channel2, paste ("select * from DT_PACIENT_INCLUIDOS"))
names(DT_PACIENT_INCLUIDOS)
#[1] "Id"                       "pacient_id"               "codiIdentificacioPacient" "codiPacient"              "codiUBA"                 
#[6] "dataCreacio"              "estat"                    "grupIntervencio"          "usuari_id"                "centre_id"  
#------------------------------------------------------------------------------------------------------#
#23#]
DT_SEGUIMENT<- sqlQuery( channel2, paste ("select * from DT_SEGUIMENT"))
names(DT_SEGUIMENT)
#[1] "Id"                        "visita_id"                 "formComplet"               "motiuNoSeguiment"          "verificat"                
#[6] "seguimentRecomenacions_id"
#------------------------------------------------------------------------------------------------------#
#24#]
DT_VISITA<- sqlQuery( channel2, paste ("select * from DT_VISITA "))
names(DT_VISITA)
#[1] "Id"                 "tipus"              "visita_id"          "completa"           "dataVisita"         "pacient_pacient_id"
#------------------------------------------------------------------------------------------------------#

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






#16.07.2019#
#05.09.2019#

# 2. Fusi? de taules -----------------

DT_CRITERIS<-DT_CRITERIS%>%dplyr::select(-Id,-formComplet,-codiUBA,-codiIdentificacioPacient)
DT_FINALITZACIO<-DT_FINALITZACIO%>%dplyr::select(-Id,-formComplet,-verificat)
DT_CENTRE<-DT_CENTRE%>%dplyr::select(-grupIntervencio)

variable.names(DT_CRITERIS)
variable.names(DT_FINALITZACIO)
variable.names(DT_CENTRE)


#names(DT_CRITERIS)
#names(DT_FINALITZACIO)

#--------
DT_PACIENT_DISCONTINUADOS<-DT_PACIENT_DISCONTINUADOS%>%left_join(DT_CRITERIS   ,by="pacient_id")
DT_PACIENT_DISCONTINUADOS<-DT_PACIENT_DISCONTINUADOS%>%left_join(DT_FINALITZACIO   ,by="pacient_id")%>%dplyr::select(-altresMotiusDescrip_Unificado,-Id)
DT_PACIENT_DISCONTINUADOS<-DT_PACIENT_DISCONTINUADOS%>%left_join(DT_CENTRE   ,by="centre_id")
DT_PACIENT_DISCONTINUADOS<-DT_PACIENT_DISCONTINUADOS%>%mutate(GR="DISC")
variable.names(DT_PACIENT_DISCONTINUADOS)

#---------
DT_PACIENT_EXCLUIDOS<-DT_PACIENT_EXCLUIDOS%>%left_join(DT_CRITERIS   ,by="pacient_id")
DT_PACIENT_EXCLUIDOS<-DT_PACIENT_EXCLUIDOS%>%left_join(DT_FINALITZACIO   ,by="pacient_id")%>%dplyr::select(-altresMotiusDescrip_Unificado,-Id)
DT_PACIENT_EXCLUIDOS<-DT_PACIENT_EXCLUIDOS%>%left_join(DT_CENTRE   ,by="centre_id")
DT_PACIENT_EXCLUIDOS<-DT_PACIENT_EXCLUIDOS%>%mutate(GR="EXCL")
variable.names(DT_PACIENT_EXCLUIDOS)
#---------
DT_PACIENT_FALLO_DE_SCREENING<-DT_PACIENT_FALLO_DE_SCREENING%>%left_join(DT_CRITERIS   ,by="pacient_id")
DT_PACIENT_FALLO_DE_SCREENING<-DT_PACIENT_FALLO_DE_SCREENING%>%left_join(DT_FINALITZACIO   ,by="pacient_id")%>%dplyr::select(-altresMotiusDescrip_Unificado,-Id)
DT_PACIENT_FALLO_DE_SCREENING<-DT_PACIENT_FALLO_DE_SCREENING%>%left_join(DT_CENTRE   ,by="centre_id")
DT_PACIENT_FALLO_DE_SCREENING<-DT_PACIENT_FALLO_DE_SCREENING%>%mutate(GR="FALL_SCREEN")
variable.names(DT_PACIENT_FALLO_DE_SCREENING)
#---------
DT_PACIENT_INCLUIDOS<-DT_PACIENT_INCLUIDOS%>%left_join(DT_CRITERIS   ,by="pacient_id")
DT_PACIENT_INCLUIDOS<-DT_PACIENT_INCLUIDOS%>%left_join(DT_FINALITZACIO   ,by="pacient_id")%>%dplyr::select(-altresMotiusDescrip_Unificado,-Id)
DT_PACIENT_INCLUIDOS<-DT_PACIENT_INCLUIDOS%>%left_join(DT_CENTRE   ,by="centre_id")
DT_PACIENT_INCLUIDOS<-DT_PACIENT_INCLUIDOS%>%mutate(GR="INCL")
variable.names(DT_PACIENT_INCLUIDOS)
#---------





# 3. Exploratori rápid  ---------------------



#i
DT_PACIENT_DISCONTINUADOS_taula<-descrTable(~.,data=DT_PACIENT_DISCONTINUADOS,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40)
DT_PACIENT_DISCONTINUADOS_taula

#ii
DT_PACIENT_EXCLUIDOS_taula<-descrTable(~.,data=DT_PACIENT_EXCLUIDOS,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40)
DT_PACIENT_EXCLUIDOS_taula

#iii
DT_PACIENT_FALLO_DE_SCREENING_taula<-descrTable(~.,data=DT_PACIENT_FALLO_DE_SCREENING,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40)
DT_PACIENT_FALLO_DE_SCREENING_taula

#iv
DT_PACIENT_INCLUIDOS_taula<-descrTable(~.,data=DT_PACIENT_INCLUIDOS,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40)
DT_PACIENT_INCLUIDOS_taula




#[rectificació dades! , però s'haurien de passar a l'Acces!]

names(DT_PACIENT_INCLUIDOS)

#Tabla PACIENTES INCLUIDOS
# Los pacientes que no tienen datos de exclusioHba1cInferior9en3mesos_id(código 1), 
# realmente deberían tener el código 2, ya que este criterio se añadiá posteriori 
# y no se podía modificar el dato para los pacientes ya introducidos.
# Variable : exclusioControlEndocrinoleg_id: lo mismo

#DT_PACIENT_INCLUIDOS$exclusioHba1cInferior9en3mesos_id<-ifelse(DT_PACIENT_INCLUIDOS$exclusioHba1cInferior9en3mesos_id%%2==1,2,DT_PACIENT_INCLUIDOS$exclusioHba1cInferior9en3mesos_id)
#DT_PACIENT_INCLUIDOS$exclusioHba1cInferior9en3mesos_id






#[]#

#Corregit!
#DT_PACIENT_INCLUIDOS<-DT_PACIENT_INCLUIDOS%>%mutate(exclusioHba1cInferior9en3mesos_id=case_when(exclusioHba1cInferior9en3mesos_id==1~ 2,TRUE~exclusioHba1cInferior9en3mesos_id))
#DT_PACIENT_INCLUIDOS$exclusioHba1cInferior9en3mesos_id

# el mateix:[]Variable : exclusioControlEndocrinoleg_id: lo mismo
#Corregit!
#DT_PACIENT_INCLUIDOS$exclusioControlEndocrinoleg_id<-ifelse(DT_PACIENT_INCLUIDOS$exclusioControlEndocrinoleg_id%%2==1,2,DT_PACIENT_INCLUIDOS$exclusioControlEndocrinoleg_id)
#DT_PACIENT_INCLUIDOS$exclusioControlEndocrinoleg_id

#Corregit!
#DT_PACIENT_INCLUIDOS<-DT_PACIENT_INCLUIDOS%>%mutate(exclusioControlEndocrinoleg_id=case_when(exclusioControlEndocrinoleg_id==1~2,TRUE~exclusioControlEndocrinoleg_id))
#DT_PACIENT_INCLUIDOS$exclusioControlEndocrinoleg_id




#-------------------------------#
#Taula Generla de  PACIENT  !!!
#-------------------------------#


DT_PACIENT<-rbind(DT_PACIENT_DISCONTINUADOS,DT_PACIENT_EXCLUIDOS,DT_PACIENT_FALLO_DE_SCREENING,DT_PACIENT_INCLUIDOS)
#DT_PACIENT
names(DT_PACIENT)
#
conductor_variables<-"taulavariables_v1.xls"

#0
DT_PACIENT_taula<-descrTable(~.,data=DT_PACIENT,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40)
DT_PACIENT_taula

#---------------#
DT_PACIENT_lab<-convertir_dates(d=DT_PACIENT,taulavariables=conductor_variables)
#---------------#
DT_PACIENT_lab<-etiquetar(d=DT_PACIENT_lab,taulavariables=conductor_variables)
#---------------#
DT_PACIENT_lab<-LAB_ETIQ_v2(dt=DT_PACIENT_lab,variables_factors=conductor_variables,fulla="etiquetes0",idioma="etiqueta2")
#---------------#
DT_PACIENT_lab
#---------------#
#na.action=T
DT_PACIENT_lab_taula<-descrTable(~.,data=DT_PACIENT_lab,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40,show.n=T)
#---------------#
DT_PACIENT_lab_taula
#---------------#





#---------------#
formula_taula_HISTORIC<-formula_compare("taula0",y="grupIntervencio",taulavariables = conductor_variables)
T0<-descrTable(formula_taula_HISTORIC,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_PACIENT_lab,max.xlev = 40)
T0
#---------------#




#--> PASSAR-HO A EXCEL!!
#DT_PACIENT_lab
#write.csv2(DT_PACIENT_lab, file = "DT_PACIENT_lab.csv")
#






# 3. FASE PREPARAcIÓ   ------------------

#( fase del CONDUCTOR i gravar-ho per fer el RMarkDown! ["INTEGRA_FINAL.Rdata"])
#DT_VISITA_BASAL2

# ParametritzaciÓ 
conductor_variables<-"taulavariables_v1.xls"

#---------------#
DT_PACIENT_DISCONTINUADOS_lab<-convertir_dates(d=DT_PACIENT_DISCONTINUADOS,taulavariables=conductor_variables)
#---------------#
DT_PACIENT_DISCONTINUADOS_lab<-etiquetar(d=DT_PACIENT_DISCONTINUADOS_lab,taulavariables=conductor_variables)
#---------------#
DT_PACIENT_DISCONTINUADOS_lab<-LAB_ETIQ_v2(dt=DT_PACIENT_DISCONTINUADOS_lab,variables_factors=conductor_variables,fulla="etiquetes0",idioma="etiqueta2")
#---------------#
DT_PACIENT_DISCONTINUADOS_lab
#---------------#
#na.action=T
DT_PACIENT_DISCONTINUADOS_lab_taula<-descrTable(~.,data=DT_PACIENT_DISCONTINUADOS_lab,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40,show.n=T)
#---------------#
DT_PACIENT_DISCONTINUADOS_lab_taula
#---------------#

#---------------#
formula_taula_HISTORIC<-formula_compare("taula0",y="grupIntervencio",taulavariables = conductor_variables)
T1<-descrTable(formula_taula_HISTORIC,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_PACIENT_DISCONTINUADOS_lab,max.xlev = 40)
T1
#---------------#

















#---------------#
DT_PACIENT_EXCLUIDOS_lab<-convertir_dates(d=DT_PACIENT_EXCLUIDOS,taulavariables=conductor_variables)
#---------------#
DT_PACIENT_EXCLUIDOS_lab<-etiquetar(d=DT_PACIENT_EXCLUIDOS_lab,taulavariables=conductor_variables)
#---------------#
DT_PACIENT_EXCLUIDOS_lab<-LAB_ETIQ_v2(dt=DT_PACIENT_EXCLUIDOS_lab,variables_factors=conductor_variables,fulla="etiquetes0",idioma="etiqueta2")
#---------------#
DT_PACIENT_EXCLUIDOS_lab
#---------------#
#na.action=T
DT_PACIENT_EXCLUIDOS_lab_taula<-descrTable(~.,data=DT_PACIENT_EXCLUIDOS_lab,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40,show.n=T)
#---------------#
DT_PACIENT_EXCLUIDOS_lab_taula
#---------------#
#---------------#
formula_taula_HISTORIC<-formula_compare("taula0",y="grupIntervencio",taulavariables = conductor_variables)
T2<-descrTable(formula_taula_HISTORIC,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_PACIENT_EXCLUIDOS_lab,max.xlev = 40)
T2
#---------------#







#---------------#
DT_PACIENT_FALLO_DE_SCREENING_lab<-convertir_dates(d=DT_PACIENT_FALLO_DE_SCREENING,taulavariables=conductor_variables)
#---------------#
DT_PACIENT_FALLO_DE_SCREENING_lab<-etiquetar(d=DT_PACIENT_FALLO_DE_SCREENING_lab,taulavariables=conductor_variables)
#---------------#
DT_PACIENT_FALLO_DE_SCREENING_lab<-LAB_ETIQ_v2(dt=DT_PACIENT_FALLO_DE_SCREENING_lab,variables_factors=conductor_variables,fulla="etiquetes0",idioma="etiqueta2")
#---------------#
DT_PACIENT_FALLO_DE_SCREENING_lab
#---------------#
#na.action=T
DT_PACIENT_FALLO_DE_SCREENING_lab_taula<-descrTable(~.,data=DT_PACIENT_FALLO_DE_SCREENING_lab,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40,show.n=T)
#---------------#
DT_PACIENT_FALLO_DE_SCREENING_lab_taula
#---------------#
#---------------#
formula_taula_HISTORIC<-formula_compare("taula0",y="grupIntervencio",taulavariables = conductor_variables)
T3<-descrTable(formula_taula_HISTORIC,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_PACIENT_FALLO_DE_SCREENING_lab,max.xlev = 40)
T3
#---------------#








#---------------#
DT_PACIENT_INCLUIDOS_lab<-convertir_dates(d=DT_PACIENT_INCLUIDOS,taulavariables=conductor_variables)
#---------------#
DT_PACIENT_INCLUIDOS_lab<-etiquetar(d=DT_PACIENT_INCLUIDOS_lab,taulavariables=conductor_variables)
#---------------#
DT_PACIENT_INCLUIDOS_lab<-LAB_ETIQ_v2(dt=DT_PACIENT_INCLUIDOS_lab,variables_factors=conductor_variables,fulla="etiquetes0",idioma="etiqueta2")
#---------------#
DT_PACIENT_INCLUIDOS_lab
#---------------#
#na.action=T
DT_PACIENT_INCLUIDOS_lab_taula<-descrTable(~.,data=DT_PACIENT_INCLUIDOS_lab,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40,show.n=T)
#---------------#
DT_PACIENT_INCLUIDOS_lab_taula
#---------------#
#---------------#
formula_taula_HISTORIC<-formula_compare("taula0",y="grupIntervencio",taulavariables = conductor_variables)
T4<-descrTable(formula_taula_HISTORIC,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_PACIENT_INCLUIDOS_lab,max.xlev = 40)
T4
#---------------#



save.image("resultats/INTEGRA_PACIENT.Rdata")




#altresComplicacionsDescrip 




#dels pacients INCLUITS + DICONTINUATS== PACIENTS!!!!

#....................................#
#       VISITA BASAL                 #
#....................................#
#DT_PACIENT		
#DT_VISITA		
#DT_DEMOGRAFIA		
#DT_HISTORIAMEDICA		
#DT_EXPLORACIOFISICA		
#DT_MEDICACIO_GENERAL		
#DT_MEDICACIO_ADO		
#DT_MEDICACIO_INJECTABLES		
#DT_ANALITICA		
#DT_HABITS_TOXICS		
#DT_SEGUIMENT		
#DT_COMPLICACIONS		
#DT_COSTOSSANITARIS		


#....................................#
#X VISITES en funcio per cada gruP #
#....................................#
#DT_PACIENT		
#DT_VISITA		
#DT_DEMOGRAFIA		
#DT_HISTORIAMEDICA		
#DT_EXPLORACIOFISICA		
#DT_MEDICACIO_GENERAL		
#DT_MEDICACIO_ADO		
#DT_MEDICACIO_INJECTABLES		
#DT_ANALITICA		
#DT_HABITS_TOXICS		
#DT_SEGUIMENT		
#DT_COMPLICACIONS		
#DT_COSTOSSANITARIS		







#####################################################################.
# [[Pacients INCLUITS + DICONTINUATS!!!!]]   N=[108+299]--------> 407.
#####################################################################.
#


#13.09.2019#
# falta :
#Te paso de nuevo la bbdd con todas las tablas, 
#si quieres te hago un template de excel con todas las columnas que tiene que contener esta tabla plana?

#En principio solo falta añadir otros problemas de salud y otros fármacos. 

#Intentare pasarte las columnas para la tabla plana mañana
#Gracias, 
#B


#Esta dentro de la tabla altramedicacioGr, 
#dentro del Access todas las tablas que tienen prefijo "altra"  
#son sub tablas de 
#DT historia medica, 
#DT MEDICACION ADO, 
#DT Medicacion inyectable, 
#DT Complicaciones DT medicación general, 

#por favor confirmame si has podido identificar las tablas, se deberían incluir tb en la tabla plana
#--------------------------------------------------------------------#.






length(DT_PACIENT_INCLUIDOS$Id)
#n=299.
length(DT_PACIENT_DISCONTINUADOS$Id)
#n=108.
#--------------------------------------#
#N=[407]
#--------------------------------------#

#

DT_PACIENT<-rbind(DT_PACIENT_DISCONTINUADOS,DT_PACIENT_INCLUIDOS)
DT_PACIENT_SELECT<-DT_PACIENT%>%dplyr::select(pacient_id)
 #names(DT_PACIENT_DISCONTINUADOS)
#names(DT_PACIENT_INCLUIDOS)
DT_PACIENT_SELECT
#[DT_PACIENT_SELECT]# N==(407)



#DT_PACIENT		
#DT_VISITA		
#DT_DEMOGRAFIA		
#DT_HISTORIAMEDICA		
#DT_EXPLORACIOFISICA		
#DT_MEDICACIO_GENERAL		
#DT_MEDICACIO_ADO		
#DT_MEDICACIO_INJECTABLES		
#DT_ANALITICA		
#DT_HABITS_TOXICS		
#DT_SEGUIMENT		
#DT_COMPLICACIONS		
#DT_COSTOSSANITARIS		






#EPS RECTIFICACIÓ!!!

#Tabla Dt_Demografia
#La etnia árabe y gitana se tiene que  juntar con la etnia caucásica,
#Hay que analizar las columnas A, B, C, F, H 


#dataNiaxament/edat/Sexe/Etnia_id

#[rectificat]#

#DT_DEMOGRAFIA	<-DT_DEMOGRAFIA%>%mutate(etnia_id=case_when(altresEtniaDescrip=="gitana"~ 1,altresEtniaDescrip=="Árabe magrebí"~ 1,TRUE~etnia_id))
#DT_DEMOGRAFIA$altresEtniaDescrip
#DT_DEMOGRAFIA$etnia_id
#[1,2,3,4,5,6]#




#Tabla DT_Historiamedica
#La variable duracioDiabetesAnys se tiene que convertir en duracioDiabetesMesos (convertir los años en meses) 
#Hay que analizar columnas: A, C, D, E, F, G, I, K, L, M, N
#Otros problemas de salud se tienen que clasificar por Angels


#

DT_HISTORIAMEDICA$duracioDiabetesMesos

DT_HISTORIAMEDICA<-DT_HISTORIAMEDICA%>%mutate(duracioDiabetesMesos=if_na(duracioDiabetesMesos,0))
DT_HISTORIAMEDICA<-DT_HISTORIAMEDICA%>%mutate(duracioDiabetesMesos2=duracioDiabetesAnys*12+duracioDiabetesMesos)

DT_HISTORIAMEDICA$duracioDiabetesMesos2

#clinicalRiskGroup
#dataDxDislipemia
#dataDxHta
#duracioDiabetesAnys
#duracioDiabetesMesos
#grupMorbiditatAjustada
#altresProblemesSalut_id	
#dislipemia_id	
#hta_id	
#problemesSalut_id


  


# hem convertit els anys a mesos --> [duracioDiabetesMesos2]




#rectifiquem pacient_id=pacient_pacient_id  a la base de dades DT_VISITA


#---------------##---------------##---------------##---------------##---------------#
DT_VISITA_HISTORIC<-DT_VISITA%>%mutate(pacient_id=pacient_pacient_id)%>%dplyr::select(tipus,pacient_id,visita_id,completa,dataVisita)


#De la base de dades dels Hist?rics agafem nom?s els PACIENT INCLU?TS [N=407!]
#FEM dues base de dades :[DT_VISITA_HISTORIC] i [DT_VISITA_HISTORIC_MES00]/mes00.

DT_VISITA_HISTORIC<-DT_VISITA_HISTORIC%>%filter(pacient_id%in%DT_PACIENT_SELECT$pacient_id)
#---------------##---------------##---------------##---------------##---------------#

#---------------##---------------##---------------##---------------##---------------#
DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC%>%filter(tipus=="Mes00")
#---------------##---------------##---------------##---------------##---------------#

names(DT_VISITA_HISTORIC_MES00)

#---------------##---------------##---------------##---------------##---------------#  
# DT_VISITA_HISTORIC_MES00(BASAL,mes00)  i DT_VISITA_HISTORIC(tots els mesos!)
#---------------##---------------##---------------##---------------##---------------#  


# tan del Historic com l'Historic mes00 , i afegim aquetses variables ,[COMENTAR BOGDAN]!! 

#---------------##---------------##---------------##---------------##---------------#  
#DT_PACIENT		
#DT_VISITA		                            [importaci? ACCES!]
#ii)    DT_DEMOGRAFIA		
#iii)   DT_HISTORIAMEDICA		
#iv)    DT_EXPLORACIOFISICA		
#v)     DT_MEDICACIO_GENERAL		
#vi)    DT_MEDICACIO_ADO		
#vii)   DT_MEDICACIO_INJECTABLES		
#viii)  DT_ANALITICA		
#ix)    DT_HABITS_TOXICS		
#x)     DT_SEGUIMENT		
#xi)    DT_COMPLICACIONS	


#xii)   [DT_COSTOSSANITARIS]	            [importaci? EXCEL!]	
#---------------##---------------##---------------##---------------##---------------#  

#Id




#[altreMedicacioGr]+[altresProblemesSalut]



#falten!!!!


#1) altreMedicacioADO 
#2) altreMedicacioGr
#3) altreMedicacioInj
#4) altresComplicacionsDescrip 
#5) altresProblemesSalut

#[DT_PACIENT+DT_SEGUIMENT+DT_ANALITICA+DT_HISTORIAMEDICA+DT_HABITS_TOXICS+DT_EXPLORACIOFISICA+DT_DEMOGRAFIA+DT_COSTOSSANITARIS]


DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%left_join(DT_PACIENT   ,by="pacient_id")%>%dplyr::select(-Id)
names(DT_VISITA_HISTORIC_MES00)

#ii)
#DT_DEMOGRAFIA
DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%left_join(DT_DEMOGRAFIA   ,by="visita_id")
#[traiem formComplet,verificat]
DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%dplyr::select(-formComplet,-verificat,-Id)
#names(DT_DEMOGRAFIA)
#--------------#
#iii)
#DT_HISTORIAMEDICA
DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%left_join(DT_HISTORIAMEDICA  ,by="visita_id")
#[traiem formComplet,verificat]
DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%dplyr::select(-formComplet,-verificat,-Id)
#names(DT_HISTORIAMEDICA)
#--------------#
#iv)
#DT_EXPLORACIOFISICA
DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%left_join(DT_EXPLORACIOFISICA  ,by="visita_id")
#[traiem formComplet,verificat]
DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%dplyr::select(-formComplet,-verificat,-Id)
#names(DT_EXPLORACIOFISICA)
#---------------#
#viii)
#DT_ANALITICA
DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%left_join(DT_ANALITICA ,by="visita_id")
#[traiem formComplet,verificat]
DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%dplyr::select(-formComplet,-verificat,-Id)
#names(DT_ANALITICA)
#--------------#
#ix)
#DT_HABITS_TOXICS
DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%left_join(DT_HABITS_TOXICS  ,by="visita_id")
#[traiem formComplet,verificat]
DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%dplyr::select(-formComplet,-verificat,-Id)
#names(DT_HABITS_TOXICS)
#--------------#
#x)
#DT_SEGUIMENT
DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%left_join(DT_SEGUIMENT  ,by="visita_id")
#[traiem formComplet,verificat]
DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%dplyr::select(-formComplet,-verificat,-Id)
#names(DT_SEGUIMENT)
#--------------#
#xii)
#DT_COSTOSSANITARIS
#--------------#
DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%left_join(DT_COSTOSSANITARIS ,by="visita_id")
#[traiem formComplet,verificat]
DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%dplyr::select(-formComplet,-verificat,-Id)
#names(DT_COSTOSSANITARIS)






#v)
#DT_MEDICACIO_GENERAL
#DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%left_join(DT_MEDICACIO_GENERAL  ,by="visita_id")
#[traiem formComplet,verificat]
#DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%dplyr::select(-formComplet,-verificat,-Id)
#names(DT_MEDICACIO_GENERAL)
#--------------#
#vi)
#DT_MEDICACIO_ADO
#DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%left_join(DT_MEDICACIO_ADO  ,by="visita_id")
#[traiem formComplet,verificat]
#DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%dplyr::select(-formComplet,-verificat,-Id)
#names(DT_MEDICACIO_ADO)
#--------------#
#vii)
#DT_MEDICACIO_INJECTABLES
#DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%left_join(DT_MEDICACIO_INJECTABLES  ,by="visita_id")
#[traiem formComplet,verificat]
#DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%dplyr::select(-formComplet,-verificat,-Id)
#names(DT_MEDICACIO_INJECTABLES)
#--------------#
#altresComplicacionsDescrip 
#xi)
#DT_COMPLICACIONS
#--------------#
#DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%left_join(DT_COMPLICACIONS ,by="visita_id")
#[traiem formComplet,verificat]
#DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%dplyr::select(-formComplet,-verificat,-Id)
#names(DT_COMPLICACIONS)













#--------------------------------------------------
#hi afageixo:[] names(altresProblemesSalut)  names(altreMedicacioGr)

#--------------------------------------------------



#-----------------------------------------------------
#DT_MEDICACIO_ADO
###altreMedicacioADO 
#names(altreMedicacioADO)
#[1] "Id"                                          "visita_id"                                  
#[3] "adoCombiMetforminaLinaglibtina_id_ALTRES"    "adoCombiMetforminaLinaglibtinadosis_ALTRES" 
#[5] "adoCombiMetforminaAlogliptina_id_ALTRES"     "adoCombiMetforminaAlogliptinadosis_ALTRES"  
#[7] "adoAlogliptina_id_ALTRES"                    "adoAlogliptina_dosis_ALTRES"                
#[9] "adoCombiAlogliptinaPioglitazona_id_ALTRES"   "adoCombiAlogliptinaPioglitazonadosis_ALTRES"
#[11] "adoCombMetforminaEmpaglifozina_id_ALTRES"    "adoCombMetforminaEmpaglifozinadosis_ALTRES" 
#[13] "adoCombMetforminaDapaglifozina_id_ALTRES"    "adoCombMetforminaDapaglifozinaDosis_ALTRES" 
#-----------------------------------------------------
#DT_MEDICACIO_GENERAL
###altreMedicacioGr
#names(altreMedicacioGr)
#[1] "Id"                                          "visita_id"                                  
#[3] "altreMedicacioGralDescripORIGIGINAL_ALTRES"  "altreMedicacioPrincipioactivoDescrip_ALTRES"
#[5] "ATC/DDD_ALTRES"                              "pharmacological subgroup_ALTRES"            
#[7] "altreMedicacioGral_id_ALTRES"                "antiagregantsPlaquetaris_id_ALTRES"         
#[9] "anticoagulants_id_ALTRES"                    "antihipertensius_id_ALTRES"                 
#[11] "hipolemiants_id_ALTRES"                      "ANTIDEPRESSANTS_id_ALTRES"                  
#[13] "ANTIPSYCHOTICS_id_ALTRES"                    "ANTIEPILEPTICS_id_ALTRES"                   
#[15] "ANXIOLYTICS_id_ALTRES"                       "OPIOIDS_id_ALTRES"                          
#[17] "CORTICOSTEROIDS_id_ALTRES"                   "OTHER ANALGESICS AND ANTIPYRETICS_id_ALTRES"
#[19] "NSAID_ALTRES"                                "ADRENERGICS, INHALANTS_id_ALTRES"           
#[21] "THYROID PREPARATIONS_id_ALTRES"              "HORMONES_id_ALTRES"    
#-----------------------------------------------------
#DT_MEDICACIO_INJECTABLES
###altreMedicacioInj
#names(altreMedicacioInj)
#[1] "Id"                                                     "visita_id"                                             
#[3] "altreMedicacioInjInsulinaPrincipioactivoDescrip_ALTRES" "injToujeo_id_ALTRES"                                   
#[5] "injToujeoDosi_ALTRES"                                   "injTresiba_id_ALTRES"                                  
#[7] "injTresibaDosi_ALTRES"                                  "injExenatida_id_ALTRES"                                
#[9] "injExenatidaDosi_ALTRES"                                "injAbasaglar_id_ALTRES"                                
#[11] "injAbasaglarDosi_ALTRES"                                      
#-----------------------------------------------------
#DT_COMPLICACIONS
###altresComplicacionsDescrip 
#names(altresComplicacionsDescrip)
#[1] "Id"                                "visita_id"                         "altresComplicacionsDescrip_ALTRES"
#[4] "CIE10_ALTRES"                      "Teritorio_ALTRES1"                  "PATOLOGIA TIROIDAL_id_ALTRES"     
#[7] "MPOC_id_ALTRES"                    "MALALTIES MENTALS_id_ALTRES"       "DISFUNCI? SEXUAL_id_ALTRES"       
#[10] "NEOPLASIES_id_ALTRES"              "PEU DIAB?TIC_id_ALTRES"            "AMPUTACIONS_id_ALTRES"   
#-----------------------------------------------------
###altresProblemesSalut
#names(altresProblemesSalut)
#[1] "Id"                                    "visita_id"                             "altresProblemesSalutDescrip_ALTRES"   
#[4] "c?digo CIE 10_ALTRES"                  "Teritorio_ALTRES2"                      "PATOLOGIA TIROIDAL BASAL_id_ALTRES"   
#[7] "MPOC BASAL_id_ALTRES"                  "MALALTIES MENTALS BASAL_id_ALTRES"     "CARDIOPATIA ISQU?MICA BASAL_id_ALTRES"
#[10] "RETINOPATIA DIAB?TICA BASAL_id_ALTRES" "DISFUNCI? SEXUAL BASAL_id_ALTRES"      "NEOPLASIES BASAL_id_ALTRES"           
#[13] "PEU DIAB?TIC BASAL_id_ALTRES"          "AMPUTACIONS BASAL_id_ALTRES"  
#-----------------------------------------------------



#-----------------------------------------------------
###altreMedicacioADO 
###altreMedicacioGr
###altreMedicacioInj
###altresComplicacionsDescrip 
###altresProblemesSalut
#-----------------------------------------------------

#xiii)
###altreMedicacioADO 
#--------------#
#DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%left_join(altreMedicacioADO  ,by="visita_id")
#names(DT_VISITA_HISTORIC_MES00)
#[traiem -Id]
#DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%dplyr::select(-Id)
#--------------#






#xiv)
###altreMedicacioGr 
#--------------#
#DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%left_join(altreMedicacioGr   ,by="visita_id")
#names(DT_VISITA_HISTORIC_MES00)
#[traiem -Id]
#DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%dplyr::select(-Id)
#--------------#
#xv)
###altreMedicacioInj
#--------------#
#DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%left_join(altreMedicacioInj   ,by="visita_id")
#names(DT_VISITA_HISTORIC_MES00)
#[traiem -Id]
#DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%dplyr::select(-Id)
#--------------#
#xvi)
###altresComplicacionsDescrip
#--------------#
#DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%left_join(altresComplicacionsDescrip   ,by="visita_id")
#names(DT_VISITA_HISTORIC_MES00)
#[traiem -Id]
#DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%dplyr::select(-Id)
#--------------#
#xvii)
###altresComplicacionsDescrip
#--------------#
#DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%left_join(altresProblemesSalut   ,by="visita_id")
#names(DT_VISITA_HISTORIC_MES00)
#[traiem -Id]
#DT_VISITA_HISTORIC_MES00<-DT_VISITA_HISTORIC_MES00%>%dplyr::select(-Id)
#--------------#



















#DT_VISITA_HISTORIC [Total!!!]


DT_VISITA_HISTORIC<-DT_VISITA_HISTORIC%>%left_join(DT_PACIENT   ,by="pacient_id")%>%dplyr::select(-Id)
names(DT_VISITA_HISTORIC)

#ii)
#DT_DEMOGRAFIA
DT_VISITA_HISTORIC<-DT_VISITA_HISTORIC%>%left_join(DT_DEMOGRAFIA   ,by="visita_id")
#[traiem formComplet,verificat]
DT_VISITA_HISTORIC<-DT_VISITA_HISTORIC%>%dplyr::select(-formComplet,-verificat,-Id)
#names(DT_DEMOGRAFIA)
#--------------#
#iii)
#DT_HISTORIAMEDICA
DT_VISITA_HISTORIC<-DT_VISITA_HISTORIC%>%left_join(DT_HISTORIAMEDICA  ,by="visita_id")
#[traiem formComplet,verificat]
DT_VISITA_HISTORIC<-DT_VISITA_HISTORIC%>%dplyr::select(-formComplet,-verificat,-Id)
#names(DT_HISTORIAMEDICA)
#--------------#
#iv)
#DT_EXPLORACIOFISICA
DT_VISITA_HISTORIC<-DT_VISITA_HISTORIC%>%left_join(DT_EXPLORACIOFISICA  ,by="visita_id")
#[traiem formComplet,verificat]
DT_VISITA_HISTORIC<-DT_VISITA_HISTORIC%>%dplyr::select(-formComplet,-verificat,-Id)
#names(DT_EXPLORACIOFISICA)
#---------------#
#viii)
#DT_ANALITICA
DT_VISITA_HISTORIC<-DT_VISITA_HISTORIC%>%left_join(DT_ANALITICA ,by="visita_id")
#[traiem formComplet,verificat]
DT_VISITA_HISTORIC<-DT_VISITA_HISTORIC%>%dplyr::select(-formComplet,-verificat,-Id)
#names(DT_ANALITICA)
#--------------#
#ix)
#DT_HABITS_TOXICS
DT_VISITA_HISTORIC<-DT_VISITA_HISTORIC%>%left_join(DT_HABITS_TOXICS  ,by="visita_id")
#[traiem formComplet,verificat]
DT_VISITA_HISTORIC<-DT_VISITA_HISTORIC%>%dplyr::select(-formComplet,-verificat,-Id)
#names(DT_HABITS_TOXICS)
#--------------#
#x)
#DT_SEGUIMENT
DT_VISITA_HISTORIC<-DT_VISITA_HISTORIC%>%left_join(DT_SEGUIMENT  ,by="visita_id")
#[traiem formComplet,verificat]
DT_VISITA_HISTORIC<-DT_VISITA_HISTORIC%>%dplyr::select(-formComplet,-verificat,-Id)
#names(DT_SEGUIMENT)
#--------------#
#xii)
#DT_COSTOSSANITARIS
#--------------#
DT_VISITA_HISTORIC<-DT_VISITA_HISTORIC%>%left_join(DT_COSTOSSANITARIS ,by="visita_id")
#[traiem formComplet,verificat]
DT_VISITA_HISTORIC<-DT_VISITA_HISTORIC%>%dplyr::select(-formComplet,-verificat,-Id)
#names(DT_COSTOSSANITARIS)




#--------------#
#DT_VISITA_HISTORIC_MES00
#DT_VISITA_HISTORIC
#--------------#

names(DT_VISITA_HISTORIC)
names(DT_VISITA_HISTORIC_MES00)

DT_VISITA_HISTORIC_00_TABLES<-descrTable(~.,data=DT_VISITA_HISTORIC_MES00,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40)
DT_VISITA_HISTORIC_TABLES<-descrTable(~.,data=DT_VISITA_HISTORIC,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40)

DT_VISITA_HISTORIC_00_TABLES
DT_VISITA_HISTORIC_TABLES








#P  R E P A R C I O  amb els CONDUCTORS  taulavariables_v2b.xls: ()



#--------------#
#DT_VISITA_HISTORIC_MES00
#DT_VISITA_HISTORIC
#--------------#













#DT_VISITA_HISTORIC_MES00


# 2. FASE PREPARCI?   ####

#---------------#
conductor_variables2<-"taulavariables_v2.xls"
#---------------#

#---------------#
DT_VISITA_HISTORIC_MES00_lab<-convertir_dates(d=DT_VISITA_HISTORIC_MES00,taulavariables=conductor_variables2)
#---------------#
DT_VISITA_HISTORIC_MES00_lab<-etiquetar(d=DT_VISITA_HISTORIC_MES00_lab,taulavariables=conductor_variables2)
#---------------#
DT_VISITA_HISTORIC_MES00_lab<-LAB_ETIQ_v2(dt=DT_VISITA_HISTORIC_MES00_lab,variables_factors=conductor_variables2,fulla="etiquetes0",idioma="etiqueta2")
#---------------#

DT_VISITA_HISTORIC_MES00_lab



variable.names(DT_VISITA_HISTORIC_MES00)



#na.action=T
DT_VISITA_HISTORIC_MES00_lab2<-descrTable(~.,data=DT_VISITA_HISTORIC_MES00_lab,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40,show.n=T)
#---------------#
DT_VISITA_HISTORIC_MES00_lab2
#---------------#

#---------------#
formula_taula_HISTORIC<-formula_compare("taula0",y="grupIntervencio",taulavariables = conductor_variables2)


T1<-descrTable(formula_taula_HISTORIC,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_VISITA_HISTORIC_MES00_lab,max.xlev = 40)
T1
#---------------#


write.csv2(DT_VISITA_HISTORIC_MES00_lab, file ="resultats/DT_VISITA_HISTORIC_MES00_lab.csv")



save.image("resultats/INTEGRA_VISITA_HISTORIC_MES0.Rdata")

#[]



#???
#pharmacologicalsubgroup_ALTRES













                          #####################################
                          #V  I S I T A       H I S T O R I C #
                          #####################################





DT_VISITA_HISTORIC_TABLES<-descrTable(~.,data=DT_VISITA_HISTORIC,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40)
names(DT_VISITA_HISTORIC)
DT_VISITA_HISTORIC_TABLES






#DT_VISITA_HISTORIC_MES00


# 2. FASE PREPARCIÓ   ####

#---------------#
conductor_variables2<-"taulavariables_v2.xls"
#---------------#



#---------------#
DT_VISITA_HISTORIC_lab<-convertir_dates(d=DT_VISITA_HISTORIC,taulavariables=conductor_variables2)
#---------------#
DT_VISITA_HISTORIC_lab<-etiquetar(d=DT_VISITA_HISTORIC_lab,taulavariables=conductor_variables2)
#---------------#
DT_VISITA_HISTORIC_lab<-LAB_ETIQ_v2(dt=DT_VISITA_HISTORIC_lab,variables_factors=conductor_variables,fulla="etiquetes0",idioma="etiqueta2")
#---------------#
DT_VISITA_HISTORIC_lab
write.csv2(DT_VISITA_HISTORIC_lab, file = "resultats/DT_VISITA_HISTORIC_lab.csv")

#

#na.action=T
DT_VISITA_HISTORIC_lab2<-descrTable(~.,data=DT_VISITA_HISTORIC_lab,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40,show.n=T)
#---------------#
DT_VISITA_HISTORIC_lab2
#---------------#
#---------------#


#grupIntervencio

#formula_taula_HISTORIC<-formula_compare("taula0",y=c("tipus","grupIntervencio"),taulavariables = conductor_variables2)
formula_taula_HISTORIC<-formula_compare("taula0",y="grupIntervencio",taulavariables = conductor_variables2)


T1<-descrTable(formula_taula_HISTORIC,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_VISITA_HISTORIC_lab,max.xlev = 80)
T1
#---------------#


save.image("resultats/INTEGRA_VISITA_HISTORIC.Rdata")







#### GRUP1
DT_VISITA_HISTORIC_lab_GRUP1<-DT_VISITA_HISTORIC_lab%>%filter(grupIntervencio=="grup1")
#na.action=T
DT_VISITA_HISTORIC_lab2_GRUP1<-descrTable(~.,data=DT_VISITA_HISTORIC_lab_GRUP1,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40,show.n=T)
#---------------#
DT_VISITA_HISTORIC_lab2_GRUP1
#---------------#
#grupIntervencio
formula_taula_HISTORIC_GRUP1<-formula_compare("taula0",y="tipus",taulavariables = conductor_variables2)
T1<-descrTable(formula_taula_HISTORIC_GRUP1,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_VISITA_HISTORIC_lab_GRUP1,max.xlev = 40)
T1
#---------------#
save.image("resultats/INTEGRA_VISITA_HISTORIC_GRUP1.Rdata")




#### GRUP2
DT_VISITA_HISTORIC_lab_GRUP2<-DT_VISITA_HISTORIC_lab%>%filter(grupIntervencio=="grup2")
#na.action=T
DT_VISITA_HISTORIC_lab2_GRUP2<-descrTable(~.,data=DT_VISITA_HISTORIC_lab_GRUP2,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40,show.n=T)
#---------------#
DT_VISITA_HISTORIC_lab2_GRUP2
#---------------#
#grupIntervencio
formula_taula_HISTORIC_GRUP2<-formula_compare("taula0",y="tipus",taulavariables = conductor_variables2)
T1<-descrTable(formula_taula_HISTORIC_GRUP2,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_VISITA_HISTORIC_lab_GRUP2,max.xlev = 40)
T1
#---------------#
save.image("resultats/INTEGRA_VISITA_HISTORIC_GRUP2.Rdata")


#23.09.2019
#------------------------------------------------------------------------------------------------------#
#DT_MEDICACIO_ADO<- sqlQuery( channel2, paste ("select * from DT_MEDICACIO_ADO"))
#names(DT_MEDICACIO_ADO)
#     "Id"                                  
#     "visita_id"                                                       
#     "adoAcarbosa_id"    **                  
#     "adoCanagliflozina_id"  **             
#     "adoClorpopramida_id"   **              
#     "adoCombiGlimepiridaPioglitazona_id"  **
#     "adoCombiMetforminaPioglitazona_id"  **
#     "adoCombiMetforminaSaxaglitina_id"    **
#     "adoCombiMetforminaSitagliptina_id"   **
#     "adoCombiMetforminaVildagliptina_id" **
#     "adoDapagliflozina_id"        **        
#     "adoEmpagliflozina_id"      **          
#     "adoGlibenclamida_id"      **          
#     "adoGlibornurida_id"      **           
#     "adoGliclazida_id"      **              
#     "adoGlimepirida_id"        **          
#     "adoGlipizida_id"      **              
#     "adoGliquidona_id"      **              
#     "adoLinagliptina_id"    **             
#     "adoMetformina_id"       **             
#     "adoMiglitol_id"          **            
#     "adoNateglinida_id"     **             
#     "adoPioglitazona_id"        **          
#     "adoRepaglinida_id"       **            
#     "adoSaxagliptina_id"        **         
#     "adoSitagliptina_id"  **                
#     "adoTolbutamida_id"   **                
#     "adoVildagliptina_id"     **           
#     "altreMedicacioADO_id"      ** 
#------------------------------------------------------------------------------------------------------#
#01#]
#altreMedicacioADO <- sqlQuery( channel2, paste ("select * from altreMedicacioADO"))
#names(altreMedicacioADO)
#[1]  "Id"                                          
#     "visita_id"                                  
#[3]  "adoCombiMetforminaLinaglibtina_id_ALTRES"    
#[5]  "adoCombiMetforminaAlogliptina_id_ALTRES"     
#[7]  "adoAlogliptina_id_ALTRES"                                   
#[9]  "adoCombiAlogliptinaPioglitazona_id_ALTRES"  
#[11] "adoCombMetforminaEmpaglifozina_id_ALTRES"    
#[13] "adoCombMetforminaDapaglifozina_id_ALTRES"    
#------------------------------------------------------------------------------------------------------# 
#------------------------------------------------------------------------------------------------------#
#17#]
#DT_MEDICACIO_GENERAL<- sqlQuery( channel2, paste ("select * from DT_MEDICACIO_GENERAL"))
#names(DT_MEDICACIO_GENERAL)
#[1] "Id"                          
#"visita_id"                         
#"altreMedicacioGral_id"       
#"antiagregantsPlaquetaris_id" 
#"anticoagulants_id"          
#"antihipertensius_id"         
#"hipolemiants_id"    
#------------------------------------------------------------------------------------------------------#
#02#]
#altreMedicacioGr <- sqlQuery( channel2, paste ("select * from altreMedicacioGr"))
#names(altreMedicacioGr)
#[1] "Id"                                          
#"visita_id"                                  
#[7] "altreMedicacioGral_id_ALTRES"    *            
#"antiagregantsPlaquetaris_id_ALTRES" *       
#[9] "anticoagulants_id_ALTRES"        *            
#"antihipertensius_id_ALTRES"    *             
#[11] "hipolemiants_id_ALTRES"     *                 
#"ANTIDEPRESSANTS_id_ALTRES"     *             
#[13] "ANTIPSYCHOTICS_id_ALTRES"     *               
#"ANTIEPILEPTICS_id_ALTRES"       *            
#[15] "ANXIOLYTICS_id_ALTRES"      *                 
#"OPIOIDS_id_ALTRES"         *                 
#[17] "CORTICOSTEROIDS_id_ALTRES"    *               
#"OTHERANALGESICSANDANTIPYRETICS_id_ALTRES"
#[19] "NSAID_ALTRES"                                
#"ADRENERGICS_INHALANTS_id_ALTRES"           
#[21] "THYROIDPREPARATIONS_id_ALTRES"              
#"HORMONES_id_ALTRES" 
#------------------------------------------------------------------------------------------------------#

#18#]
#DT_MEDICACIO_INJECTABLES<- sqlQuery( channel2, paste ("select * from DT_MEDICACIO_INJECTABLES"))
#names(DT_MEDICACIO_INJECTABLES)                  
##"altreMedicacioInjInsulina_id"    
##"injAbasaglar_id"                  
##"injAbiglutida_id"                 
##"injActrapid_id"                  
##"injApidra_id"                    
##"injExenatida_id"     
##"injHumalog_id"                    
##"injHumalogBasal_id"               
##"injHumalogMix25_id"              
##"injHumalogMix50_id"               
##"injHumilana3070_id"             
##"injHumulinaNPH_id"                
##"injHumulinaRegular_id"           
##"injInsulatard_id"                
##"injLantus_id"                     
##"injLevemir_id"                    
##"injLiraglutida_id"               
##"injLixisenatide_id"     
##"injMixtard30_id"                  
##"injNovomix30_id"                
##"injNovomix50_id"                 
##"injNovomix70_id"                 
##"injNovorapid_id"   
#------------------------------------------------------------------------------------------------------#
#03#]
#altreMedicacioInj <- sqlQuery( channel2, paste ("select * from altreMedicacioInj "))
#names(altreMedicacioInj )
#altreMedicacioInj 
#[1] "Id"                                                    
#[2] "visita_id"                                             
#[4] "injToujeo_id_ALTRES"                                   
#[6] "injTresiba_id_ALTRES"                                  
#[8] "injExenatida_id_ALTRES"                                
#[10]"injAbasaglar_id_ALTRES"                                
       





#eps!
#----------------------------------------------------------------------------#
#iii] iv]  TAULA PLANA!
###################
##  TAULA PLANA MEDICAMENTS!
DT_VISITA_HISTORIC<-DT_VISITA%>%mutate(pacient_id=pacient_pacient_id)%>%dplyr::select(tipus,pacient_id,visita_id,completa,dataVisita)
DT_VISITA_HISTORIC2<-DT_MEDICACIO_INJECTABLES%>%dplyr::select(-Id,-verificat,-formComplet)%>%
  left_join(altreMedicacioInj   ,by="visita_id")%>%dplyr::select(-Id)%>%
  left_join(DT_MEDICACIO_ADO   ,by="visita_id")%>%dplyr::select(-Id,-verificat,-formComplet)%>%
  left_join(altreMedicacioADO   ,by="visita_id")%>%dplyr::select(-Id)%>%
  left_join(DT_MEDICACIO_GENERAL   ,by="visita_id")%>%dplyr::select(-Id,-verificat,-formComplet)%>%
  left_join(altreMedicacioGr   ,by="visita_id")%>%dplyr::select(-Id)
DT_VISITA_HISTORIC2<-DT_VISITA_HISTORIC2%>% left_join(DT_VISITA_HISTORIC  ,by="visita_id")
DT_VISITA_HISTORIC2<-DT_VISITA_HISTORIC2%>%filter(pacient_id%in%DT_PACIENT_SELECT$pacient_id)
#----------------------------------------------------------------------------#
#Fer descripció a partir dels basal:tipus="M00"[AGGREGATE!]
#----------------------------------------------------------------------------#
DT_VISITA_HISTORIC2<-DT_VISITA_HISTORIC2%>%left_join(DT_PACIENT   ,by="pacient_id")%>%dplyr::select(-Id)
variable.names(DT_VISITA_HISTORIC2)
#----------------------------------------------------------------------------#

#%>%left_join(DT_PACIENT   ,by="pacient_id")%>%dplyr::select(-Id)


DT_VISITA_HISTORIC2_agg<-DT_VISITA_HISTORIC2%>%filter(tipus=="Mes00")%>%group_by(visita_id)%>%
            summarise(grupIntervencio=max(grupIntervencio),
                      adoAcarbosa_id2=max(adoAcarbosa_id) ,
                      adoCanagliflozina_id2=max(adoCanagliflozina_id),
                      adoClorpopramida_id2=max(adoClorpopramida_id) ,
                      adoCombiGlimepiridaPioglitazona_id2=max(adoCombiGlimepiridaPioglitazona_id) ,
                      adoCombiMetforminaPioglitazona_id2=max(adoCombiMetforminaPioglitazona_id) ,
                      adoCombiMetforminaSaxaglitina_id2=max(adoCombiMetforminaSaxaglitina_id) ,
                      adoCombiMetforminaSitagliptina_id2=max(adoCombiMetforminaSitagliptina_id) ,
                      adoCombiMetforminaVildagliptina_id2=max( adoCombiMetforminaVildagliptina_id) ,
                      adoDapagliflozina_id2=max(adoDapagliflozina_id) ,
                      adoEmpagliflozina_i2=max(adoEmpagliflozina_id) ,
                      adoGlibenclamida_id2=max(adoGlibenclamida_id) ,
                      adoGlibornurida_id2=max(adoGlibornurida_id) ,
                      adoGliclazida_id2=max(adoGliclazida_id) ,
                      adoGlimepirida_id2=max(adoGlimepirida_id) ,
                      adoGlipizida_id2=max(adoGlipizida_id) ,
                      adoGliquidona_id2=max(adoGliquidona_id) ,
                      adoLinagliptina_id2=max(adoLinagliptina_id) ,
                      adoMetformina_id2=max(adoMetformina_id) ,
                      adoMiglitol_id2=max(adoMiglitol_id) ,
                      adoNateglinida_id2=max(adoNateglinida_id) ,
                      adoPioglitazona_id2=max(adoPioglitazona_id),
                      adoRepaglinida_id2=max(adoRepaglinida_id),
                      adoSaxagliptina_id2=max(adoSaxagliptina_id),
                      adoSitagliptina_id2=max(adoSitagliptina_id),
                      adoTolbutamida_id2=max(adoTolbutamida_id),
                      adoVildagliptina_id2=max(adoVildagliptina_id),
                      altreMedicacioADO_id2=max(altreMedicacioADO_id),
                      adoCombiMetforminaLinaglibtina_id_ALTRES2=max(adoCombiMetforminaLinaglibtina_id_ALTRES),
                      adoCombiMetforminaAlogliptina_id_ALTRES2=max(adoCombiMetforminaAlogliptina_id_ALTRES),
                      adoAlogliptina_id_ALTRES2=max(adoAlogliptina_id_ALTRES),
                      adoCombiAlogliptinaPioglitazona_id_ALTRES2=max(adoCombiAlogliptinaPioglitazona_id_ALTRES),
                      adoCombMetforminaEmpaglifozina_id_ALTRES2=max(adoCombMetforminaEmpaglifozina_id_ALTRES),
                      adoCombMetforminaDapaglifozina_id_ALTRES2=max(adoCombMetforminaDapaglifozina_id_ALTRES),
                      altreMedicacioGral_id2=max(altreMedicacioGral_id),
                      antiagregantsPlaquetaris_id2=max(antiagregantsPlaquetaris_id),
                      anticoagulants_id2=max(anticoagulants_id),
                      antihipertensius_id2=max(antihipertensius_id),
                      hipolemiants_id2=max(hipolemiants_id),
                      altreMedicacioGral_id_ALTRES2=max(altreMedicacioGral_id_ALTRES),
                      antiagregantsPlaquetaris_id_ALTRES2=max(antiagregantsPlaquetaris_id_ALTRES),
                      anticoagulants_id_ALTRES2=max(anticoagulants_id_ALTRES),
                      antihipertensius_id_ALTRES2=max(antihipertensius_id_ALTRES),
                      hipolemiants_id_ALTRES2=max(hipolemiants_id_ALTRES),
                      ANTIDEPRESSANTS_id_ALTRES2=max(ANTIDEPRESSANTS_id_ALTRES),
                      ANTIPSYCHOTICS_id_ALTRES2=max( ANTIPSYCHOTICS_id_ALTRES),
                      ANTIEPILEPTICS_id_ALTRES2=max( ANTIEPILEPTICS_id_ALTRES),
                      ANXIOLYTICS_id_ALTRES2=max(ANXIOLYTICS_id_ALTRES),
                      OPIOIDS_id_ALTRES2=max(OPIOIDS_id_ALTRES),
                      CORTICOSTEROIDS_id_ALTRES2=max(CORTICOSTEROIDS_id_ALTRES),
                      OTHERANALGESICSANDANTIPYRETICS_id_ALTRES2=max(OTHERANALGESICSANDANTIPYRETICS_id_ALTRES),
                      NSAID_ALTRES2=max(NSAID_ALTRES),
                      ADRENERGICS_INHALANTS_id_ALTRES2=max(ADRENERGICS_INHALANTS_id_ALTRES),
                      THYROIDPREPARATIONS_id_ALTRES2=max(THYROIDPREPARATIONS_id_ALTRES),
                      HORMONES_id_ALTRES2=max(HORMONES_id_ALTRES),
                      altreMedicacioInjInsulina_id2=max(altreMedicacioInjInsulina_id),
                      injAbasaglar_id2=max(injAbasaglar_id),
                      injAbiglutida_id2=max(injAbiglutida_id),
                      injActrapid_id2=max(injActrapid_id),
                      injApidra_id2=max(injApidra_id),
                      injExenatida_id2=max(injExenatida_id),
                      injHumalog_id2=max(injHumalog_id),
                      injHumalogBasal_id2=max(injHumalogBasal_id),
                      injHumalogMix25_id2=max(injHumalogMix25_id),
                      injHumalogMix50_id2=max(injHumalogMix50_id),
                      injHumilana3070_id2=max(injHumilana3070_id),
                      injHumulinaNPH_id2=max(injHumulinaNPH_id),
                      injHumulinaRegular_id2=max(injHumulinaRegular_id),
                      injInsulatard_id2=max(injInsulatard_id),
                      injLantus_id2=max(injLantus_id),
                      injLevemir_id2=max(injLevemir_id),
                      injLiraglutida_id2=max(injLiraglutida_id),
                      injLixisenatide_id2=max(injLixisenatide_id),
                      injMixtard30_id2=max(injMixtard30_id),
                      injNovomix30_id2=max(injNovomix30_id),
                      injNovomix50_id2=max(injNovomix50_id),
                      injNovomix70_id2=max(injNovomix70_id),
                      injNovorapid_id2=max(injNovorapid_id),
                      injToujeo_id_ALTRES2=max(injToujeo_id_ALTRES),
                      injTresiba_id_ALTRES2=max(injTresiba_id_ALTRES),
                      injExenatida_id_ALTRES2=max(injExenatida_id_ALTRES),
                      injAbasaglar_id_ALTRES2=max(injAbasaglar_id_ALTRES)
                      
                      )
              
variable.names(DT_VISITA_HISTORIC2_agg)
DT_VISITA_HISTORIC2_agg







#----------------------------------------------------------------------------#
##  TAULA PLANA COMPLICACIONS!




#08#]
#DT_COMPLICACIONS<- sqlQuery( channel2, paste ("select * from DT_COMPLICACIONS"))
#names(DT_COMPLICACIONS)
#[1] "Id"                            "visita_id"                      
#     "altresComplicacions_id"        
#     "arteriopatiaPeriferica_id"     
#     "cardiopatiaIsquemica_id"      
#     "insuficienciaCardiaca_id"      
#     "malaltiaCerebrovascular_id"    
#     "nefropatiaDiabetica_id"        
#     "neuropatiaDiabetica_id"       
#     "retinopatiaDiabetica_id"     
#------------------------------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------#
#04#] 
#altresComplicacionsDescrip <- sqlQuery( channel2, paste ("select * from altresComplicacionsDescrip "))
#names(altresComplicacionsDescrip)
#[1] "Id"                                "visita_id"                        
#     "PATOLOGIA TIROIDAL_id_ALTRES"     
#     "MPOC_id_ALTRES"                    
#     "MALALTIES MENTALS_id_ALTRES"       
#     "DISFUNCI? SEXUAL_id_ALTRES"       
#     "NEOPLASIES_id_ALTRES"              
#     "PEU DIAB?TIC_id_ALTRES"            
#     "AMPUTACIONS_id_ALTRES"          
#------------------------------------------------------------------------------------------------------#
#05#] 
#altresProblemesSalut<- sqlQuery( channel2, paste ("select * from altresProblemesSalut"))
#names(altresProblemesSalut)
#[1] "Id"                                    "visita_id"                            
#   "PATOLOGIA TIROIDAL BASAL_id_ALTRES"   
#   "MPOC BASAL_id_ALTRES"                  
#   "MALALTIES MENTALS BASAL_id_ALTRES"    
#   "CARDIOPATIA ISQU?MICA BASAL_id_ALTRES" 
#   "RETINOPATIA DIAB?TICA BASAL_id_ALTRES"
#   "DISFUNCI? SEXUAL BASAL_id_ALTRES"      
#   "NEOPLASIES BASAL_id_ALTRES"           
#   "PEU DIAB?TIC BASAL_id_ALTRES"          
#   "AMPUTACIONS BASAL_id_ALTRES"      
#------------------------------------------------------------------------------------------------------

DT_VISITA_HISTORIC<-DT_VISITA%>%mutate(pacient_id=pacient_pacient_id)%>%dplyr::select(tipus,pacient_id,visita_id,completa,dataVisita)
DT_VISITA_HISTORIC3<-DT_COMPLICACIONS%>%dplyr::select(-Id,-verificat,-formComplet)%>%
  left_join(altresComplicacionsDescrip    ,by="visita_id")%>%dplyr::select(-Id)%>%
  left_join(altresProblemesSalut   ,by="visita_id")%>%dplyr::select(-Id)
DT_VISITA_HISTORIC3<-DT_VISITA_HISTORIC3%>% left_join(DT_VISITA_HISTORIC  ,by="visita_id")
DT_VISITA_HISTORIC3<-DT_VISITA_HISTORIC3%>%filter(pacient_id%in%DT_PACIENT_SELECT$pacient_id)
DT_VISITA_HISTORIC3<-DT_VISITA_HISTORIC3%>%left_join(DT_PACIENT   ,by="pacient_id")%>%dplyr::select(-Id)
variable.names(DT_VISITA_HISTORIC3)

#





DT_VISITA_HISTORIC3_agg<-DT_VISITA_HISTORIC3%>%filter(tipus=="Mes00")%>%
  group_by(visita_id)%>%summarise(grupIntervencio=max(grupIntervencio),
            altresComplicacions_id2=max(altresComplicacions_id) ,
            arteriopatiaPeriferica_id2=max(arteriopatiaPeriferica_id) ,
            cardiopatiaIsquemica_id2=max(cardiopatiaIsquemica_id) ,
            insuficienciaCardiaca_id2=max(insuficienciaCardiaca_id) ,
            malaltiaCerebrovascular_id2=max(malaltiaCerebrovascular_id) ,
            nefropatiaDiabetica_id2=max(nefropatiaDiabetica_id) ,
            neuropatiaDiabetica_id2=max(neuropatiaDiabetica_id) ,
            retinopatiaDiabetica_id2=max(retinopatiaDiabetica_id) ,
            PATOLOGIATIROIDAL_id_ALTRES2=max(PATOLOGIATIROIDAL_id_ALTRES),
            MPOC_id_ALTRES2=max(MPOC_id_ALTRES) ,
            MALALTIESMENTALS_id_ALTRES2=max(MALALTIESMENTALS_id_ALTRES) ,
            DISFUNCIÓSEXUAL_id_ALTRES2=max(DISFUNCIÓSEXUAL_id_ALTRES) ,
            NEOPLASIES_id_ALTRES2=max(NEOPLASIES_id_ALTRES) ,
            PEUDIABÈTICBASAL_id_ALTRES2=max(PEUDIABÈTICBASAL_id_ALTRES) ,
            AMPUTACIONS_id_ALTRES2=max(AMPUTACIONS_id_ALTRES) ,
            PATOLOGIATIROIDALBASAL_id_ALTRES2=max(PATOLOGIATIROIDALBASAL_id_ALTRES) ,
            MPOCBASAL_id_ALTRES2=max( MPOCBASAL_id_ALTRES) ,
            MALALTIESMENTALSBASAL_id_ALTRES2=max(MALALTIESMENTALSBASAL_id_ALTRES) ,
            CARDIOPATIAISQUÈMICABASAL_id_ALTRES2=max(CARDIOPATIAISQUÈMICABASAL_id_ALTRES) ,
            RETINOPATIADIABÈTICABASAL_id_ALTRES2=max(RETINOPATIADIABÈTICABASAL_id_ALTRES) ,
            DISFUNCIÓSEXUALBASAL_id_ALTRES2=max(DISFUNCIÓSEXUALBASAL_id_ALTRES) ,
            NEOPLASIESBASAL_id_ALTRES2=max(NEOPLASIESBASAL_id_ALTRES) ,
            PEUDIABÈTICBASAL_id_ALTRES2=max(PEUDIABÈTICBASAL_id_ALTRES) ,
            AMPUTACIONSBASAL_id_ALTRES2=max(AMPUTACIONSBASAL_id_ALTRES) 
  )

variable.names(DT_VISITA_HISTORIC3_agg)
DT_VISITA_HISTORIC3_agg




#----------------------------------------------------------------------------#
names(DT_VISITA_HISTORIC2_agg)
names(DT_VISITA_HISTORIC3_agg)
#----------------------------------------------------------------------------#




#--> PASSAR-HO A EXCEL!!
#TAULA_PLANA_lab
#----------------------------------------------------------------------------#
write.csv2(DT_VISITA_HISTORIC2, file = "resultats/DT_VISITA_HISTORIC_MEDICAMENTS.csv")
write.csv2(DT_VISITA_HISTORIC3, file = "resultats/DT_VISITA_HISTORIC_COMPLICACIONS.csv")
#----------------------------------------------------------------------------#
#
save.image("resultats/INTEGRA_TAULA_PLANA.Rdata")

#
#
#
#
# save.image("INTEGRA_PACIENT.Rdata")                #
# save.image("INTEGRA_VISITA_HISTORIC_MES0.Rdata")   #
# save.image("INTEGRA_VISITA_HISTORIC_GRUP1.Rdata")  #
# save.image("INTEGRA_VISITA_HISTORIC_GRUP2.Rdata")  #
# save.image("INTEGRA_TAULA_PLANA.Rdata")            #
######################################################






#DT_VISITA_HISTORIC_MES00


# 2. FASE PREPARCI?   ####

#---------------#
conductor_variables3<-"taulavariables_v3.xls"
conductor_variables4<-"taulavariables_v4.xls"
conductor_variables5<-"taulavariables_v5.xls"
conductor_variables6<-"taulavariables_v6.xls"


#---------------#
names(DT_VISITA_HISTORIC2_agg)
names(DT_VISITA_HISTORIC3_agg)
#








#---------------#
DT_VISITA_HISTORIC_lab3<-convertir_dates(d=DT_VISITA_HISTORIC2_agg,taulavariables=conductor_variables3)
#---------------#
DT_VISITA_HISTORIC_lab3<-etiquetar(d=DT_VISITA_HISTORIC_lab3,taulavariables=conductor_variables3)
#---------------#
DT_VISITA_HISTORIC_lab3<-LAB_ETIQ_v2(dt=DT_VISITA_HISTORIC_lab3,variables_factors=conductor_variables3,fulla="etiquetes0",idioma="etiqueta2")
#---------------#
DT_VISITA_HISTORIC_lab3
write.csv2(DT_VISITA_HISTORIC_lab3, file = "resultats/DT_VISITA_HISTORIC_lab3.csv")
#
#na.action=T
DT_VISITA_HISTORIC_lab3b<-descrTable(~.,data=DT_VISITA_HISTORIC_lab3,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40,show.n=T)
#---------------#
DT_VISITA_HISTORIC_lab3b
#---------------#
#---------------#
#grupIntervencio
#formula_taula_HISTORIC<-formula_compare("taula0",y=c("tipus","grupIntervencio"),taulavariables = conductor_variables2)
#function  (x="taula1",y="grup",elimina=c("IDP"),taulavariables="variables_R.xls") {
formula_taula_HISTORIC<-formula_compare("taula0",y="grupIntervencio",taulavariables = conductor_variables3)
T1<-descrTable(formula_taula_HISTORIC,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_VISITA_HISTORIC_lab3,max.xlev = 80)
T1
#---------------#


#---------------#
DT_VISITA_HISTORIC_lab4<-convertir_dates(d=DT_VISITA_HISTORIC3_agg,taulavariables=conductor_variables4)
#---------------#
DT_VISITA_HISTORIC_lab4<-etiquetar(d=DT_VISITA_HISTORIC_lab4,taulavariables=conductor_variables4)
#---------------#
DT_VISITA_HISTORIC_lab4<-LAB_ETIQ_v2(dt=DT_VISITA_HISTORIC_lab4,variables_factors=conductor_variables4,fulla="etiquetes0",idioma="etiqueta2")
#---------------#
#DT_VISITA_HISTORIC_labzz
write.csv2(DT_VISITA_HISTORIC_lab4, file = "resultats/DT_VISITA_HISTORIC_lab4.csv")
#
#na.action=T
DT_VISITA_HISTORIC_lab4b<-descrTable(~.,data=DT_VISITA_HISTORIC_lab4,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40,show.n=T)
#---------------#
DT_VISITA_HISTORIC_lab4b
#---------------#
#---------------#
#grupIntervencio
#formula_taula_HISTORIC<-formula_compare("taula0",y=c("tipus","grupIntervencio"),taulavariables = conductor_variables2)
#function  (x="taula1",y="grup",elimina=c("IDP"),taulavariables="variables_R.xls") {
formula_taula_HISTORIC2<-formula_compare("taula0",y="grupIntervencio",taulavariables = conductor_variables4)
#---------------#
T2<-descrTable(formula_taula_HISTORIC2,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_VISITA_HISTORIC_lab4,max.xlev = 80)
T2
#---------------#







#Global!!!
#---------------#
DT_VISITA_HISTORIC_lab5<-convertir_dates(d=DT_VISITA_HISTORIC2,taulavariables=conductor_variables5)
#---------------#
DT_VISITA_HISTORIC_lab5<-etiquetar(d=DT_VISITA_HISTORIC_lab5,taulavariables=conductor_variables5)
#---------------#
DT_VISITA_HISTORIC_lab5<-LAB_ETIQ_v2(dt=DT_VISITA_HISTORIC_lab5,variables_factors=conductor_variables5,fulla="etiquetes0",idioma="etiqueta2")
#---------------#
DT_VISITA_HISTORIC_lab5
write.csv2(DT_VISITA_HISTORIC_lab5, file = "resultats/DT_VISITA_HISTORIC_lab5.csv")
#
#na.action=T
DT_VISITA_HISTORIC_lab5b<-descrTable(~.,data=DT_VISITA_HISTORIC_lab5,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40,show.n=T)
#---------------#
DT_VISITA_HISTORIC_lab5b
#---------------#
#---------------#
#grupIntervencio
#formula_taula_HISTORIC<-formula_compare("taula0",y=c("tipus","grupIntervencio"),taulavariables = conductor_variables2)
#function  (x="taula1",y="grup",elimina=c("IDP"),taulavariables="variables_R.xls") {
formula_taula_HISTORIC<-formula_compare("taula0",y="grupIntervencio",taulavariables = conductor_variables5)
T3<-descrTable(formula_taula_HISTORIC,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_VISITA_HISTORIC_lab5,max.xlev = 80)
T3
#---------------#
variable.names(DT_VISITA_HISTORIC_lab5)


#---------------#
DT_VISITA_HISTORIC_lab6<-convertir_dates(d=DT_VISITA_HISTORIC3,taulavariables=conductor_variables6)
#---------------#
DT_VISITA_HISTORIC_lab6<-etiquetar(d=DT_VISITA_HISTORIC_lab6,taulavariables=conductor_variables6)
#---------------#
DT_VISITA_HISTORIC_lab6<-LAB_ETIQ_v2(dt=DT_VISITA_HISTORIC_lab6,variables_factors=conductor_variables6,fulla="etiquetes0",idioma="etiqueta2")
#---------------#
#DT_VISITA_HISTORIC_labzz
write.csv2(DT_VISITA_HISTORIC_lab6, file = "resultats/DT_VISITA_HISTORIC_lab6.csv")
#
#na.action=T
DT_VISITA_HISTORIC_lab6b<-descrTable(~.,data=DT_VISITA_HISTORIC_lab6,show.p.overall=F,method = 2,Q1=0,Q3=1,max.xlev = 40,show.n=T)
#---------------#
DT_VISITA_HISTORIC_lab6b
#---------------#
#---------------#
#grupIntervencio
#formula_taula_HISTORIC<-formula_compare("taula0",y=c("tipus","grupIntervencio"),taulavariables = conductor_variables2)
#function  (x="taula1",y="grup",elimina=c("IDP"),taulavariables="variables_R.xls") {
formula_taula_HISTORIC2<-formula_compare("taula0",y="grupIntervencio",taulavariables = conductor_variables6)
#---------------#
T4<-descrTable(formula_taula_HISTORIC2,method = 2,Q1 = 0, Q3 =1 ,show.p.overall = F,data=DT_VISITA_HISTORIC_lab6,max.xlev = 80)
T4
#---------------#
variable.names(DT_VISITA_HISTORIC_lab6)




save.image("resultats/INTEGRA_VISITA_HISTORIC_MEDICAMENTS_PROBLEMES.Rdata")






#####################################################
#E  R R O R S!
#####################################################



#
#
#
#
#
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
#-------------------------------------------------------------------------
#B)  altreMedicacioGr[ADRENERGICS,INHALANTS_id_ALTRES]  --> altreMedicacioGr[ADRENERGICS_INHALANTS_id_ALTRES]
#C)  altreMedicacioGr[ATC/DDD_ALTRES]                   --> altreMedicacioGr[ATC_DDD_ALTRES] 
#D)  altreMedicacioGr[pharmacological subgroup_ALTRES]             --> altreMedicacioGr[pharmacologicalsubgroup_ALTRES]
#E)  altreMedicacioGr[OTHER ANALGESICS AND ANTIPYRETICS_id_ALTRES] -->  altreMedicacioGr[OTHERANALGESICSANDANTIPYRETICS_id_ALTRES]
#F)  altreMedicacioGr[THYROID PREPARATIONS_id_ALTRES]--> altreMedicacioGr[THYROIDPREPARATIONS_id_ALTRES]
#----------------------------------------------------------------------------#
#G)  altresProblemesSalut[código CIE 10_ALTRES]-->altresProblemesSalut[códigoCIE10_ALTRES]
#H)  altresProblemesSalut[PATOLOGIA TIROIDAL BASAL_id_ALTRES]-->altresProblemesSalut[PATOLOGIATIROIDALBASAL_id_ALTRES]
#I)  altresProblemesSalut[MPOC BASAL_id_ALTRES]--> altresProblemesSalut[MPOCBASAL_id_ALTRES]
#J)  altresProblemesSalut[MALALTIES MENTALS BASAL_id_ALTRES]-->altresProblemesSalut[MALALTIESMENTALSBASAL_id_ALTRES]
#K)  altresProblemesSalut[CARDIOPATIA ISQUÉMICA BASAL_id_ALTRES]-->altresProblemesSalut[CARDIOPATIAISQUÉMICABASAL_id_ALTRES]
#L)  altresProblemesSalut[RETINOPATIA DIABÉTICA BASAL_id_ALTRES]-->altresProblemesSalut[RETINOPATIADIABÉTICABASAL_id_ALTRES]
#M)  altresProblemesSalut[DISFUNCIÓ SEXUAL BASAL_id_ALTRES]-->altresProblemesSalut[DISFUNCIÓSEXUALBASAL_id_ALTRES]
#N)  altresProblemesSalut[NEOPLASIES BASAL_id_ALTRES]-->altresProblemesSalut[NEOPLASIESBASAL_id_ALTRES]
#O)  altresProblemesSalut[PEU DIABÈTIC BASAL_id_ALTRES]-->altresProblemesSalut[PEUDIABÈTICBASAL_id_ALTRES]
#P)  altresProblemesSalut[AMPUTACIONS BASAL_id_ALTRES]-->altresProblemesSalut[AMPUTACIONSBASAL_id_ALTRES]
#Q)  altresProblemesSalut[PATOLOGIA TIROIDAL_id_ALTRES]-->altresProblemesSalut[PATOLOGIATIROIDAL_id_ALTRES]
#-------------------------------------------------------------------------
#R) altresComplicacionsDescrip[DISFUNCIÓ SEXUAL_id_ALTRES]-->altresComplicacionsDescrip[DISFUNCIÓSEXUAL_id_ALTRES]
#S) altresComplicacionsDescrip[PEU DIABÉTIC_id_ALTRES]-->altresComplicacionsDescrip[PEUDIABÉTIC_id_ALTRES]
#T) altresComplicacionsDescrip[MALALTIES MENTALS_id_ALTRES]-->altresComplicacionsDescrip[MALALTIESMENTALS_id_ALTRES]
#U) altresComplicacionsDescrip[DISFUNCIÓSEXUAL BASAL_id_ALTRES]-->altresComplicacionsDescrip[DISFUNCIÓSEXUALBASAL_id_ALTRES]
#X) altresComplicacionsDescrip[PEU DIABÉTICBASAL_id_ALTRES]-->altresComplicacionsDescrip[PEUDIABÉTICBASAL_id_ALTRES]

#Z)DT_VISITA%>%mutate(pacient_id=pacient_pacient_id)!!!!!!!!!!!!!!!


#dataTable


#library(data.table)
###############################################################################
#dt <- data.table("ID" = c(1,2,3,4),"none" = c(0,5,5,3), 
#                 "ten" = c(3,2,5,4),"twenty" = c(0,2,3,1),"sex"=c(1,1,1,0))
#dt
#kk<-dt %>% group_by(sex) %>% summarise(med =median(ten))
#kk
#kkk<-dt[, .(mean = mean(value1, na.rm = TRUE),
#        median = median(value1, na.rm = TRUE),
#        min = min(value1, na.rm = TRUE),
#        max = max(value1, na.rm = TRUE))]
################################################################################
