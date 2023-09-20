summary(glmmTMB(fruit_set~(relpos_fl+relpos_rac)*tot_fr_init_in_plant+
                  (1|id/shoot_id/raceme_id),
                subset(data_id_flowers,year==1988),family="binomial"))
plot(ggpredict(glmmTMB(fruit_set~(relpos_fl+relpos_rac)*tot_fr_init_in_plant+
                         (1|id/shoot_id/raceme_id),
                       subset(data_id_flowers,year==1988),family="binomial"),
               terms=c("relpos_fl[all]","tot_fr_init_in_plant")))
plot(ggpredict(glmmTMB(fruit_set~(relpos_fl+relpos_rac)*tot_fr_init_in_plant+
                         (1|id/shoot_id/raceme_id),
                       subset(data_id_flowers,year==1988),family="binomial"),
               terms=c("tot_fr_init_in_plant")))

summary(glmmTMB(fruit_set~(relpos_fl+relpos_rac)*tot_fr_init_in_plant+
                  (1|id/shoot_id/raceme_id),
                data_id_flowers,family="binomial"))
plot(ggpredict(glmmTMB(fruit_set~(relpos_fl+relpos_rac)*tot_fr_init_in_plant+
                         (1|id/shoot_id/raceme_id),
                       data_id_flowers,family="binomial"),
               terms=c("relpos_fl[all]","tot_fr_init_in_plant")))

summary(glmmTMB(fruit_set~((relpos_fl+relpos_rac)*tot_fr_init_in_plant)*year+
                  (1|id/shoot_id/raceme_id),
                data_id_flowers,family="binomial"))
plot(ggpredict(glmmTMB(fruit_set~((relpos_fl+relpos_rac)*tot_fr_init_in_plant)*year+
                         (1|id/shoot_id/raceme_id),
                       data_id_flowers,family="binomial"),
               terms=c("relpos_fl[all]","tot_fr_init_in_plant","year")))

summary(glmmTMB(fruit_set~(relpos_fl+relpos_rac)*range_opening_date+
                  (1|id/shoot_id/raceme_id),
                subset(data_id_flowers,year==1988),family="binomial"))
plot(ggpredict(glmmTMB(fruit_set~(relpos_fl+relpos_rac)*range_opening_date+
                  (1|id/shoot_id/raceme_id),
                  subset(data_id_flowers,year==1988),family="binomial"),
          terms=c("relpos_fl[all]","range_opening_date")))
plot(ggpredict(glmmTMB(fruit_set~(relpos_fl+relpos_rac)*range_opening_date+
                         (1|id/shoot_id/raceme_id),
                       subset(data_id_flowers,year==1988),family="binomial"),
               terms=c("relpos_rac[all]","range_opening_date")))



