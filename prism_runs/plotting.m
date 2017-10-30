
load data.mat;
figure(1);
plot(VA(:,1), VA(:,2));
title('#sites vs. states');

figure(2);
plot(VA(:,1), VA(:,3))
title('#sites vs. model construction time')

figure(3);
plot(VA(:,1), VA(:,4))
title('#sites vs. model checking time')