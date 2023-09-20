library(piecewiseSEM)
path1<-psem(glmmTMB(initiated_fr~relpos_fl*relpos_rac+opening_date_v+
                      (1|id/shoot_id/raceme_id),
                    subset(data_id_flowers,year==1987),family="binomial"),
            glmmTMB(opening_date_v~relpos_fl*relpos_rac+
                      (1|id/shoot_id/raceme_id),
                    subset(data_id_flowers,year==1987)))
summary(path1)
                    