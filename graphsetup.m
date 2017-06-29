function graphsetup( title,location,state )
%graphsetup initalizes a new graph to reduce redundant code
%    state: a test condition for whether a new graph is being initialized
%    or if the current graph is being updated

% state 1: new graph
if state == 1
figure('Name',title,'Menubar', 'none','position',location)
xlabel('Normalized Area')
ylabel('Mach Number')

hold on

% state 0: current graph
elseif state ==0
    legend('CO_2 Subsonic','CO_2 Supersonic','Air Subsonic','Air Supersonic'...
    ,'Noble gas Subsonic','Noble gas Supersonic','Location','northwest')

end

