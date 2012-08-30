function AB = plus(A,B)
%+,plus: Add two associative arrays.
%Associative array user function.
%  Usage:
%    AB = A + B
%    AB = plus(A,B)
%  Inputs:
%    A = associative array
%    B = associative array
%  Outputs:
%    AB = associative array that is the union of the of the keys of A and B

  % deal with DB table.
  if IsClass(A,'DBtable')
     AB = put(A,B);
     return;
  end
  if IsClass(B,'DBtable')
     AB = put(B,A);
     return;
  end

  % Deal with value type mismatches.
  if ( not(isempty(A.val)) && not(isempty(B.val)) )
    AB = or(A,B);
  else
    if (not(isempty(A.val)) && nnz(B))
       A = double(logical(A));
    end
    if (nnz(A) && not(isempty(B.val)))
       B = double(logical(B));
    end
    AB = Pluslike(A,B,@sum);   
  end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% D4M: Dynamic Distributed Dimensional Data Model
% Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
% Software Engineer: Dr. Jeremy Kepner (kepner@ll.mit.edu)
% MIT Lincoln Laboratory
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) <2010> Massachusetts Institute of Technology
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

