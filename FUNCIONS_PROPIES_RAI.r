##################
####[29.5.2019]###
##[FUNCIONS RAI]##
##################
#------------------------------------------------------------------------------------------#
#                        0. SELECCIONAR VARIABLES! []
#------------------------------------------------------------------------------------------#






#[HEM DE SELECCIONAR ! i fer una funció senzilla!]

#conductor_variables2<-"taulavariables_v3.xls"



select_conductor<-function(dt=DT_VISITA_HISTORIC2_agg,taulavariables=conductor_variables2) {
 
  #-----------------------------------------------
  
  #taulavariables="taulavariables_v3.xls"
  #dt=DT_VISITA_HISTORIC2_agg
  
 
  
  ####  Llegir conductor  i seleccionar ####
  
  variables <- readxl::read_excel(taulavariables)
  variables[is.na(variables)]<- 0
 
  arrimades<-variables
  arrimades<-arrimades %>%dplyr::filter(taula0>0)
  arrimades<-arrimades %>% dplyr::select(camp)%>% as.vector()
  dt<-dt%>%dplyr::select(arrimades$camp)
  dt
  
  #--------------------------------------------------
  

}



#------------------------------------------------------------------------------------------#
#                        1. ETIQUETAR VARIABLES! []
#------------------------------------------------------------------------------------------#
#------------------------------------------------------------------#
etiquetar<-function(d=dadestotal,taulavariables="variables_R.xls") {
  
  ####  Llegir etiquetes i variables a analitzar ####
  variables <- readxl::read_excel(taulavariables)
  variables[is.na(variables)]<- 0
  #
  #
  ###################################   etiquetar variables         
  seleccio<-variables
  camp<- as.vector(seleccio$camp) #
  descripcio<- as.vector(seleccio$descripcio) #
  ### etiquetar variables seleccionades     #
  for (i in 2:length(descripcio)){if (any(colnames(d) == camp[i])) {Hmisc::label(d[[camp[i]]]) <- descripcio[i]}}
  d
}
#------------------------------------------------------------------#
#------------------------------------------------------------------#



convertir_dates<-function(d=dadestotal,taulavariables="variables_R.xls")
  
{
  ####  Llegir etiquetes i variables a analitzar ####
  variables <- readxl::read_excel(taulavariables)
  variables[is.na(variables)]<- 0
  #
  #
  ###################################   etiquetar variables         
  seleccio<-variables
  camp<- as.vector(seleccio$camp) #
  # dates<-as.vector(seleccio$dates)
  # dates<-seleccio[[campdata]]
  ### etiquetar variables seleccionades     #
  
  for (i in 1:length(camp)){if (seleccio$dates[i]==1) { 
    
    pepito<-paste0("as.Date(d[[camp[",i,"]]], '%Y%d%m')")
    
    d[[camp[i]]]<-eval(parse(text=pepito))
    
  } }
  
  d
  
}



#------------------------------------------------------------------#
#------------------------------------------------------------------#
LAB_ETIQ<-function(dt=dades,variables_factors=conductor_variables,fulla="etiquetes",idioma="etiqueta1"){
  
  #dt=dades
  #variables_factors=conductor_variables
  #fulla="etiquetes"
  #idioma="etiqueta2"
  
  
  variables_factors<-readxl::read_excel(variables_factors,sheet=fulla)
  
  if (idioma=="etiqueta1") {
    
    k<-variables_factors%>%select(camp, valor,etiqueta1)
    
  } else if (idioma=="etiqueta2") {
    
    k<-variables_factors%>%select(camp, valor,etiqueta2)
    k<-k%>%mutate(etiqueta1=etiqueta2)
    k<-k%>%select(camp, valor,etiqueta1)
    
  }
  
  k2<-k%>%spread(key=valor,value=etiqueta1)
  
  noms_variables<-(k2$camp)
  num_vars<-length(k2$camp)
  
  
  pepito<-k%>% split(list(.$camp))
  
  for (i in 1:num_vars) {
    
    dt[noms_variables[i]]<-lapply(dt[noms_variables[i]],function(y) factor(y,levels=pepito[[i]]$valor,labels=pepito[[i]]$etiqueta1))
  }
  
  dt}
#------------------------------------------------------------------#



#------------------------------------------------------------------#
LAB_ETIQ_v2<-function(dt=dades,variables_factors=conductor_variables,fulla="etiquetes",idioma="etiqueta1"){
  
  #dt=DT_FINAL
  #variables_factors=conductor_variables
  #fulla="etiquetes"
  #idioma="etiqueta1"
  
  
  #------------------------------------------------------------------#
  variables_factors<-readxl::read_excel(variables_factors,sheet=fulla)
  #------------------------------------------------------------------#
  
  
  
  if (idioma=="etiqueta1") {
    
    k<-variables_factors%>%dplyr::select(camp, valor,etiqueta1)
    
  } else if (idioma=="etiqueta2") {
    
    k<-variables_factors%>%dplyr::select(camp, valor,etiqueta2)
    k<-k%>%mutate(etiqueta1=etiqueta2)
    k<-k%>%dplyr::select(camp, valor,etiqueta1)
    
  }
  
  
  #------------------------------------------------------------------#
  pepe<-k %>% split(list(.$camp))
  #------------------------------------------------------------------#
  #
  noms_variables<-names(pepe)
  num_vars<-length(noms_variables)
  
  #dt[noms_variables[1]]
  
  for (i in 1:num_vars) {
    
    
    dt[noms_variables[i]]<-lapply(dt[noms_variables[i]],function(y) factor(y,levels=pepe[[i]]$valor,labels=pepe[[i]]$etiqueta1))
    
    
  }
  
  
  
  
  dt}
#------------------------------------------------------------------#


















####   FORMULA MILLORADA --------------------------
#
# Te en compte l'Ordre que està posada en el conductor taulavariables
#
#
formula_compare=function(x="taula1",y="grup",elimina=c("IDP"),taulavariables="variables_R.xls") {
  
  # x="T1_GSK"
  # y="."
  # taulavariables ="VARIABLES.xls"
  # elimina=c("IDP")
  
  
  # 1. Llegir conductor analisis 
  
  variables <- readxl::read_excel(taulavariables)
  variables[is.na(variables)]<- 0
  
  # 2. DATA table filtrar ordenar llista de camps
  polio<-data.table::data.table(variables)
  
  mua<-polio[camp!=elimina] %>% 
    dplyr::filter_(paste0(x,">0")) %>% 
    dplyr::arrange_(x) %>% 
    dplyr::select(camp) %>% as.vector()
  
  # 3. Generar formula
  
  # y<-as.formula(paste(y, paste(llista$camp, collapse=" + "), sep=" ~ "))
  
  y<-as.formula(paste(y, paste(mua$camp, collapse=" + "), sep=" ~ "))
  
  y
  
}

