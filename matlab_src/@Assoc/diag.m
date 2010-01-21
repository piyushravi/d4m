function d = diag(A);
%DIAG reuturns diagonal of associative array.

  % Create default values.
  val = diag(A.A);
  row = (1:numel(val)).';
  row = row(val > 0);
  col = row;
  val = full(val(val > 0));

  if not(isempty(A.row))
    rowMat = Str2mat(A.row);
    row = Mat2str(rowMat(row,:));
  end  

  if not(isempty(A.col))
    colMat = Str2mat(A.col);
    col = Mat2str(colMat(col,:));
  end  

  if not(isempty(A.val))
    valMat = Str2mat(A.val);
    val = Mat2str(valMat(val,:));
  end  

  d = Assoc(row,col,val);

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% D4M: Dynamic Distributed Dimensional Data Model
% Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
% Software Engineer: Mr. William Smith (william.smith@ll.mit.edu)
% MIT Lincoln Laboratory
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%