id_shoot_rac<-lmer(opening_date_v~1+(1|id/shoot_id/raceme_id),
                   data=subset(data_id_flowers,year==1987))
id<-lmer(opening_date_v~1+(1|id),
                   data=subset(data_id_flowers,year==1987))
shoot<-lmer(opening_date_v~1+(1|shoot_id),
                   data=subset(data_id_flowers,year==1987))
rac<-lmer(opening_date_v~1+(1|raceme_id),
                   data=subset(data_id_flowers,year==1987))
id_shoot<-lmer(opening_date_v~1+(1|id/shoot_id),
                   data=subset(data_id_flowers,year==1987))
id_rac<-lmer(opening_date_v~1+(1|id/raceme_id),
                   data=subset(data_id_flowers,year==1987))
shoot_rac<-lmer(opening_date_v~1+(1|shoot_id/raceme_id),
                   data=subset(data_id_flowers,year==1987))

R2_id_shoot_rac<-r2_nakagawa(id_shoot_rac)$R2_conditional
R2_id<-r2_nakagawa(id)$R2_conditional
R2_shoot<-r2_nakagawa(shoot)$R2_conditional
R2_rac<-r2_nakagawa(rac)$R2_conditional
R2_id_shoot<-r2_nakagawa(id_shoot)$R2_conditional
R2_id_rac<-r2_nakagawa(id_rac)$R2_conditional
R2_shoot_rac<-r2_nakagawa(shoot_rac)$R2_conditional

ID<-R2_id_shoot_rac-R2_shoot_rac
SHOOT<-R2_id_shoot_rac-R2_id_rac
RAC<-R2_id_shoot_rac-R2_id_shoot
ID_SHOOT<-R2_id_shoot_rac-R2_rac-ID-SHOOT
ID_RAC<-R2_id_shoot_rac-R2_shoot-ID-RAC
SHOOT_RAC<-R2_id_shoot_rac-R2_id-SHOOT-RAC
ID_SHOOT_RAC<-R2_id_shoot_rac-ID-SHOOT-RAC-ID_SHOOT-ID_RAC-SHOOT_RAC

(ID/R2_id_shoot_rac)*100
(SHOOT/R2_id_shoot_rac)*100
(RAC/R2_id_shoot_rac)*100
(ID_SHOOT/R2_id_shoot_rac)*100
(ID_RAC/R2_id_shoot_rac)*100
(SHOOT_RAC/R2_id_shoot_rac)*100
(ID_SHOOT_RAC/R2_id_shoot_rac)*100

ID+SHOOT+RAC+ID_SHOOT+ID_RAC+SHOOT_RAC+ID_SHOOT_RAC

