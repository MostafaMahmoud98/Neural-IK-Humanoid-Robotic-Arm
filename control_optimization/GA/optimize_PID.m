
function cost = optimize_PID(k)
assignin('base','k',k);
sim('n.slx');
cost = ITAE(length(ITAE));
end