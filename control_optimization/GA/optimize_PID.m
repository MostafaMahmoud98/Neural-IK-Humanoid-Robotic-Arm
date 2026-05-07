function cost = optimize_PID(k)
assignin('base', 'k', k);
sim('n.slx');

if ~exist('ITAE', 'var')
    if evalin('base', 'exist(''ITAE'', ''var'')')
        ITAE = evalin('base', 'ITAE');
    else
        error('optimize_PID:MissingITAE', 'The Simulink model did not return an ITAE signal.');
    end
end

cost = lastSignalValue(ITAE);
if ~isfinite(cost)
    cost = inf;
end
end

function value = lastSignalValue(signal)
if isa(signal, 'timeseries')
    data = signal.Data;
elseif isstruct(signal) && isfield(signal, 'signals')
    data = signal.signals.values;
else
    data = signal;
end

value = data(end);
end
