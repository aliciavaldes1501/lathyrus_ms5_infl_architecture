path_frset_87_glmer<-psem(
  glmer(fruit_set~relpos_fl*relpos_rac+opening_date_v+
            (1|id/shoot_id/raceme_id),
          subset(data_id_flowers,year==1987),family="binomial"),
  glmer(opening_date_v~relpos_fl*relpos_rac+
            (1|id/shoot_id/raceme_id),
          subset(data_id_flowers,year==1987))
)

path_frset_87_eff<-semEff(bootEff(path_frset_87_glmer,R=100,seed=13,
                                  ran.eff="id",parallel = "snow"))

