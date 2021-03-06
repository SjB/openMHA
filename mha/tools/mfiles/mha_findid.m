function [cfg,csBase] = mha_findid( mhah, csIds )
% MHA_FINDID - find first entry matching an ID or a list of IDs.
%
% Usage:
% cfg = mha_findid( mhah, csIds )
%
% - mhah : MHA handle
% - csIds : string or cell string array of IDs to be searched (optional)
%
% - cfg : structure with fieldsnames equal to IDs, values are
% configuration paths
% - csBase : list of all plugins with IDs
%
% Author: Giso Grimm
% Date: 7/2007
  ;
  if nargin < 1
    mhah = struct('host','localhost','port',33337);
  end
  csBase = mha_listid(mhah);
  if nargin < 2
    csIds = csBase(:,2)';
  end
  if ischar(csIds)
    csIds = {csIds};
  end
  if isempty(csIds) 
    csIds = {}; % else matlab 2012 and later would iterate over empty array
  end
  csIds = unique(csIds);
  cfg = struct;
  for cId=csIds
    idx = strmatch(cId{:},csBase(:,2)','exact');
    if length(idx) == 1
      cfg.(csBase{idx(1),2}) = csBase{idx(1),1};
    end
  end
