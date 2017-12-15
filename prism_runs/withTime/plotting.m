close all
load data.mat;
hold off;
figure(1);
plot(VA(:,1), VA(:,2));
title('#sites vs. states');

figure(2);
plot(VA(:,1), VA(:,3))
title('#sites vs. model construction time')

figure(3);
plot(VA(:,1), VA(:,4))
title('#sites vs. model checking time')


figure(4)
plot(VA(:,1), VA(:,5))
title('#sites vs. states (Stochastic Movement)');
hold on

plot(VA(:,1), VA(:,6))
title('#sites vs. states (Upper Bound)');
