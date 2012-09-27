%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Query adjacency matrix in a database table.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
echo('on'); more('off')                    % Turn off echoing.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

DB = DBsetupD4Muser;                        % Create binding to database.

Tadj = DB('TgraphAdj','TgraphAdjT');        % Bind to adjacency matrix table.
TadjDeg = DB('TgraphAdjDeg');               % Bind to degree table.

Nv0 = 100;
v0 = ceil(10000.*rand(Nv0,1));              % Create a starting set of vertices.

myV = 1:numel(v0);
%myV = global_ind(zeros(numel(v0),1,map([Np 1],{},0:Np-1)));    % PARALLEL.

v0str = sprintf('%d,',v0(myV));             % Convert to string list.

Adeg = str2num(TadjDeg(v0str,:));           % Get degrees of vertices.

degMin = 5;  degMax = 10;                  % Select vertices in an out degree range.
v1str = Row( (Adeg(:,'OutDeg,') > degMin) < degMax );

A = dblLogi( Tadj(v1str,:) );               % Get vertex neighbors.

%A = gagg(A);                               % PARALLEL.

echo('off'); figure; spy(A);                % Show.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% D4M: Dynamic Distributed Dimensional Data Model
% Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
% Software Engineer: Dr. Jeremy Kepner (kepner@ll.mit.edu)
% MIT Lincoln Laboratory
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) <2010> Massachusetts Institute of Technology
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

