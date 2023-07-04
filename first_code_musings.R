library(ggeffects)
library(lme4)
library(lmerTest)

hist(data_id_flowers$opening_date_v)

summary(lm(opening_date_v~relpos_fl,data_id_flowers))
plot(ggpredict(lm(opening_date_v~relpos_fl,data_id_flowers)))
summary(lm(opening_date_v~relpos_rac,data_id_flowers))
plot(ggpredict(lm(opening_date_v~relpos_rac,data_id_flowers)))
summary(lm(opening_date_v~relpos_fl+relpos_rac,data_id_flowers))
plot(ggpredict(lm(opening_date_v~relpos_fl+relpos_rac,data_id_flowers)))
# Lower relative position = lower opening date

summary(lm(opening_date_v~(relpos_fl+relpos_rac)*year,data_id_flowers))
plot(ggpredict(lm(opening_date_v~(relpos_fl+relpos_rac)*year,data_id_flowers),
               terms=c("relpos_fl","year")))
plot(ggpredict(lm(opening_date_v~(relpos_fl+relpos_rac)*year,data_id_flowers),
               terms=c("relpos_rac","year")))

summary(lmer(opening_date_v~(relpos_fl+relpos_rac)*year+(1|id),data_id_flowers))
plot(ggpredict(lmer(opening_date_v~(relpos_fl+relpos_rac)*year+(1|id),data_id_flowers),
               terms=c("relpos_fl","year")))
plot(ggpredict(lmer(opening_date_v~(relpos_fl+relpos_rac)*year+(1|id),data_id_flowers),
               terms=c("relpos_rac","year")))

