data_id_flowers_test<-data_id_flowers%>%
  group_by(unique_raceme_id)%>%
  summarise(fruit_set_raceme=sum(fruit_set)/tot_flowers_in_raceme,
            seed_predation_raceme=sum(as.numeric(as.character(seed_predation)),
                                      na.rm=T)/tot_flowers_in_raceme)

data_id_flowers_test_test<-left_join(data_id_flowers,data_id_flowers_test)

summary(glmmTMB(fruit_set~fruit_set_raceme+
                  (1|id/shoot_id/raceme_id),
                subset(data_id_flowers_test_test,year==1987),family="binomial"))
summary(glmmTMB(fruit_set~fruit_set_raceme+
                  (1|id/shoot_id/raceme_id),
                subset(data_id_flowers_test_test,year==1988),family="binomial"))
summary(glmmTMB(fruit_set~fruit_set_raceme+
                  (1|id/shoot_id/raceme_id),
                subset(data_id_flowers_test_test,year==1989),family="binomial"))
# Fruit set is higher when fruit set of the raceme is higher

summary(glmmTMB(fruit_set~relpos_fl*fruit_set_raceme+fruit_set_raceme*relpos_rac+
          (1|id/shoot_id/raceme_id),
        subset(data_id_flowers_test_test,year==1987),family="binomial"))
plot(ggpredict(glmmTMB(fruit_set~relpos_fl*fruit_set_raceme+fruit_set_raceme*relpos_rac+
                  (1|id/shoot_id/raceme_id),
                subset(data_id_flowers_test_test,year==1987),family="binomial"),
          terms=c("relpos_fl[all]","fruit_set_raceme[0:1,by=0.25]")))
plot(ggpredict(glmmTMB(fruit_set~relpos_fl*fruit_set_raceme+fruit_set_raceme*relpos_rac+
                         (1|id/shoot_id/raceme_id),
                       subset(data_id_flowers_test_test,year==1987),family="binomial"),
               terms=c("relpos_rac[all]","fruit_set_raceme[0:1,by=0.25]")))

summary(glmmTMB(fruit_set~relpos_fl*fruit_set_raceme+fruit_set_raceme*relpos_rac+
                  (1|id/shoot_id/raceme_id),
                subset(data_id_flowers_test_test,year==1988),family="binomial"))

summary(glmmTMB(fruit_set~relpos_fl*fruit_set_raceme+fruit_set_raceme*relpos_rac+
                  (1|id/shoot_id),
                subset(data_id_flowers_test_test,year==1989),family="binomial"))

summary(glmmTMB(cbind(n_seeds,n_ovules-n_seeds)~seed_predation_raceme+
                  (1|id/shoot_id/raceme_id),
                subset(data_id_flowers_test_test,year==1987),family="binomial"))
summary(glmmTMB(cbind(n_seeds,n_ovules-n_seeds)~seed_predation_raceme+
                  (1|id/shoot_id/raceme_id),
                subset(data_id_flowers_test_test,year==1988),family="binomial"))
summary(glmmTMB(cbind(n_seeds,n_ovules-n_seeds)~seed_predation_raceme+
                  (1|id/shoot_id/raceme_id),
                subset(data_id_flowers_test_test,year==1989),family="binomial"))


